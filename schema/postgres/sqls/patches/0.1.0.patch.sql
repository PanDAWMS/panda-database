-- patch to be used to upgrade from version 0.0.32
-- Optional (only if the schema doesn't already exist)
-- CREATE SCHEMA IF NOT EXISTS doma_panda;

-- =========================
-- Sequences
-- =========================
CREATE SEQUENCE IF NOT EXISTS doma_panda.workflow_id_seq
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START WITH 1
  NO CYCLE;

ALTER SEQUENCE doma_panda.workflow_id_seq OWNER TO panda;


CREATE SEQUENCE IF NOT EXISTS doma_panda.workflow_step_id_seq
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START WITH 1
  NO CYCLE;

ALTER SEQUENCE doma_panda.workflow_step_id_seq OWNER TO panda;


CREATE SEQUENCE IF NOT EXISTS doma_panda.workflow_data_id_seq
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START WITH 1
  NO CYCLE;

ALTER SEQUENCE doma_panda.workflow_data_id_seq OWNER TO panda;


-- =========================
-- Tables
-- =========================

CREATE TABLE IF NOT EXISTS doma_panda.workflows (
  workflow_id        BIGINT NOT NULL,
  name               VARCHAR(256),
  parent_id          BIGINT,
  loop_count         BIGINT,
  status             VARCHAR(32),
  prodsourcelabel    VARCHAR(32),
  username           VARCHAR(128),
  creation_time      TIMESTAMP,
  start_time         TIMESTAMP,
  end_time           TIMESTAMP,
  modification_time  TIMESTAMP,
  check_time         TIMESTAMP,
  locked_by          VARCHAR(64),
  lock_time          TIMESTAMP,
  raw_request_json   JSONB,
  definition_json    JSONB,
  parameters         JSONB,

  CONSTRAINT workflow_id_pk PRIMARY KEY (workflow_id)
);

COMMENT ON TABLE  doma_panda.workflows IS 'Table for PanDA workflow definitions and status tracking';
COMMENT ON COLUMN doma_panda.workflows.workflow_id       IS 'Unique workflow identifier, generated from workflow_id_seq sequence';
COMMENT ON COLUMN doma_panda.workflows.name              IS 'Name of the workflow';
COMMENT ON COLUMN doma_panda.workflows.parent_id         IS 'ID of parent workflow for nested/hierarchical workflows';
COMMENT ON COLUMN doma_panda.workflows.loop_count        IS 'Counter for loop iterations in loop-type workflows';
COMMENT ON COLUMN doma_panda.workflows.status            IS 'Workflow status: registered, parsed, checking, checked, starting, running, done, failed, cancelled';
COMMENT ON COLUMN doma_panda.workflows.prodsourcelabel   IS 'Production source label (e.g., managed, user)';
COMMENT ON COLUMN doma_panda.workflows.username          IS 'User who submitted the workflow';
COMMENT ON COLUMN doma_panda.workflows.creation_time     IS 'Timestamp when workflow was created';
COMMENT ON COLUMN doma_panda.workflows.start_time        IS 'Timestamp when workflow started';
COMMENT ON COLUMN doma_panda.workflows.end_time          IS 'Timestamp when workflow ended';
COMMENT ON COLUMN doma_panda.workflows.modification_time IS 'Timestamp of last modification';
COMMENT ON COLUMN doma_panda.workflows.check_time        IS 'Timestamp of last workflow status check';
COMMENT ON COLUMN doma_panda.workflows.locked_by         IS 'Agent/process currently holding lock on this workflow';
COMMENT ON COLUMN doma_panda.workflows.lock_time         IS 'Timestamp when lock was acquired';
COMMENT ON COLUMN doma_panda.workflows.raw_request_json  IS 'Original workflow request JSON from user submission';
COMMENT ON COLUMN doma_panda.workflows.definition_json   IS 'Parsed workflow definition JSON with steps, data, and conditions';
COMMENT ON COLUMN doma_panda.workflows.parameters        IS 'Additional workflow-level parameters in JSON format';

ALTER TABLE doma_panda.workflows OWNER TO panda;


CREATE TABLE IF NOT EXISTS doma_panda.workflow_steps (
  step_id            BIGINT NOT NULL,
  name               VARCHAR(256),
  workflow_id        BIGINT NOT NULL,
  member_id          BIGINT NOT NULL,
  type               VARCHAR(32),
  status             VARCHAR(32),
  flavor             VARCHAR(32),
  target_id          VARCHAR(128),
  creation_time      TIMESTAMP,
  start_time         TIMESTAMP,
  end_time           TIMESTAMP,
  modification_time  TIMESTAMP,
  check_time         TIMESTAMP,
  locked_by          VARCHAR(64),
  lock_time          TIMESTAMP,
  definition_json    JSONB,
  parameters         JSONB,

  CONSTRAINT workflow_step_pk PRIMARY KEY (step_id)
);

COMMENT ON TABLE  doma_panda.workflow_steps IS 'Table for workflow steps representing individual tasks or processing units within workflows';
COMMENT ON COLUMN doma_panda.workflow_steps.step_id           IS 'Unique step identifier, generated from workflow_step_id_seq sequence';
COMMENT ON COLUMN doma_panda.workflow_steps.name              IS 'Name of the workflow step';
COMMENT ON COLUMN doma_panda.workflow_steps.workflow_id       IS 'Foreign key reference to parent workflow';
COMMENT ON COLUMN doma_panda.workflow_steps.member_id         IS 'Member or sub-step identifier for hierarchical steps';
COMMENT ON COLUMN doma_panda.workflow_steps.type              IS 'Type of step: ordinary, conditional, loop, scatter, or other type';
COMMENT ON COLUMN doma_panda.workflow_steps.status            IS 'Step status: registered, checking, checked_true, checked_false, pending, ready, starting, running, done, failed, cancelled, or closed';
COMMENT ON COLUMN doma_panda.workflow_steps.flavor            IS 'Flavor or vaiant type of the step handler';
COMMENT ON COLUMN doma_panda.workflow_steps.target_id         IS 'Target task ID or reference to associated processing unit';
COMMENT ON COLUMN doma_panda.workflow_steps.creation_time     IS 'Timestamp when step was created';
COMMENT ON COLUMN doma_panda.workflow_steps.start_time        IS 'Timestamp when step started';
COMMENT ON COLUMN doma_panda.workflow_steps.end_time          IS 'Timestamp when step ended';
COMMENT ON COLUMN doma_panda.workflow_steps.modification_time IS 'Timestamp of last modification';
COMMENT ON COLUMN doma_panda.workflow_steps.check_time        IS 'Timestamp of last status check';
COMMENT ON COLUMN doma_panda.workflow_steps.locked_by         IS 'Agent/process currently holding lock on this step';
COMMENT ON COLUMN doma_panda.workflow_steps.lock_time         IS 'Timestamp when lock was acquired';
COMMENT ON COLUMN doma_panda.workflow_steps.definition_json   IS 'Step definition JSON containing inputs, outputs, conditions, parents, and task parameters';
COMMENT ON COLUMN doma_panda.workflow_steps.parameters        IS 'Additional step-level parameters in JSON format';

ALTER TABLE doma_panda.workflow_steps OWNER TO panda;


CREATE TABLE IF NOT EXISTS doma_panda.workflow_data (
  data_id            BIGINT NOT NULL,
  name               VARCHAR(256),
  workflow_id        BIGINT NOT NULL,
  source_step_id     BIGINT,
  type               VARCHAR(32),
  status             VARCHAR(32),
  flavor             VARCHAR(32),
  target_id          VARCHAR(256),
  creation_time      TIMESTAMP,
  start_time         TIMESTAMP,
  end_time           TIMESTAMP,
  modification_time  TIMESTAMP,
  check_time         TIMESTAMP,
  locked_by          VARCHAR(64),
  lock_time          TIMESTAMP,

  metadata           JSONB,
  parameters         JSONB,

  CONSTRAINT workflow_data_pk PRIMARY KEY (data_id)
);

COMMENT ON TABLE  doma_panda.workflow_data IS 'Table for workflow data objects representing datasets/containers or intermediate data products within workflows which determine dependencies between steps';
COMMENT ON COLUMN doma_panda.workflow_data.data_id           IS 'Unique data identifier, generated from workflow_data_id_seq sequence';
COMMENT ON COLUMN doma_panda.workflow_data.name              IS 'Name or prefix of the data object (dataset, container, or file)';
COMMENT ON COLUMN doma_panda.workflow_data.workflow_id       IS 'Foreign key reference to parent workflow';
COMMENT ON COLUMN doma_panda.workflow_data.source_step_id    IS 'ID of the step that generates this data; NULL for input data';
COMMENT ON COLUMN doma_panda.workflow_data.type              IS 'Type of data: input, output, cond_out (conditional output), or mid (intermediate)';
COMMENT ON COLUMN doma_panda.workflow_data.status            IS 'Data status: registered, checking, checked_nonexist, binding, generating_bound, generating_insuffi, generating_suffice, done_generated, checked_insuffi, waiting_insuffi, checked_partial, waiting_suffice, done_waited, checked_complete, done_skipped, cancelled, or retired';
COMMENT ON COLUMN doma_panda.workflow_data.flavor            IS 'Flavor or variant type of the data handler';
COMMENT ON COLUMN doma_panda.workflow_data.target_id         IS 'Reference to associated DDM DID or other identifier';
COMMENT ON COLUMN doma_panda.workflow_data.creation_time     IS 'Timestamp when data object was created';
COMMENT ON COLUMN doma_panda.workflow_data.start_time        IS 'Timestamp when data generation started';
COMMENT ON COLUMN doma_panda.workflow_data.end_time          IS 'Timestamp when data generation or processing ended';
COMMENT ON COLUMN doma_panda.workflow_data.modification_time IS 'Timestamp of last modification';
COMMENT ON COLUMN doma_panda.workflow_data.check_time        IS 'Timestamp of last data status check';
COMMENT ON COLUMN doma_panda.workflow_data.locked_by         IS 'Agent/process currently holding lock on this data object';
COMMENT ON COLUMN doma_panda.workflow_data.lock_time         IS 'Timestamp when lock was acquired';
COMMENT ON COLUMN doma_panda.workflow_data.metadata          IS 'Data metadata in JSON format including size, file count, output types, etc.';
COMMENT ON COLUMN doma_panda.workflow_data.parameters        IS 'Additional data-level parameters in JSON format';

ALTER TABLE doma_panda.workflow_data OWNER TO panda;

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 0
WHERE component = 'PanDA';

