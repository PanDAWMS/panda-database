-- patch to be used to upgrade from version 0.0.22
CREATE TABLE doma_panda.job_metrics (
    "pandaid" BIGINT NOT NULL,
    "jeditaskid" BIGINT,
    "creationtime" TIMESTAMP,
    "modificationtime" TIMESTAMP,
    "data" TEXT
) PARTITION BY RANGE (modificationtime);
COMMENT ON TABLE doma_panda.job_metrics IS E'System metrics per job';
COMMENT ON COLUMN doma_panda.job_metrics.pandaid IS E'PandaID for the job';
COMMENT ON COLUMN doma_panda.job_metrics.jeditaskid IS E'JEDI task ID for the job';
COMMENT ON COLUMN doma_panda.job_metrics.creationtime IS E'Time of data creation';
COMMENT ON COLUMN doma_panda.job_metrics.modificationtime IS E'Time of last update';
COMMENT ON COLUMN doma_panda.job_metrics.data IS E'Serialized dictionary of job metrics';
ALTER TABLE doma_panda.job_metrics OWNER TO panda;
ALTER TABLE doma_panda.job_metrics ADD PRIMARY KEY (pandaid, modificationtime);

CREATE TABLE doma_panda.task_metrics (
    "jeditaskid" BIGINT NOT NULL,
    "creationtime" TIMESTAMP,
    "modificationtime" TIMESTAMP,
    "data" TEXT
) PARTITION BY RANGE (modificationtime);
COMMENT ON TABLE doma_panda.task_metrics IS E'System metrics per task';
COMMENT ON COLUMN doma_panda.task_metrics.jeditaskid IS E'JEDI task ID for the task';
COMMENT ON COLUMN doma_panda.task_metrics.creationtime IS E'Time of data creation';
COMMENT ON COLUMN doma_panda.task_metrics.modificationtime IS E'Time of last update';
COMMENT ON COLUMN doma_panda.task_metrics.data IS E'Serialized dictionary of task metrics';
ALTER TABLE doma_panda.task_metrics OWNER TO panda;
ALTER TABLE doma_panda.task_metrics ADD PRIMARY KEY (jeditaskid, modificationtime);


ALTER TABLE doma_panda.jedi_tasks
ADD COLUMN "activatedtime" TIMESTAMP,
ADD COLUMN "queuedtime" TIMESTAMP;
COMMENT ON COLUMN doma_panda.jedi_tasks.activatedtime IS E'Time of activation processing workload';
COMMENT ON COLUMN doma_panda.jedi_tasks.queuedtime IS E'Start time of queuing period ready to generate jobs';

ALTER TABLE doma_panda.config
ADD COLUMN "value_json" JSONB;

-- Remove the constraint if it exists (PostgreSQL doesn't allow dropping unknown constraints without explicitly naming them)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_name = 'config_value_nn'
        AND table_name = 'config'
    ) THEN
        ALTER TABLE doma_panda.config
        DROP CONSTRAINT config_value_nn;
    END IF;
END $$;

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.job_metrics',
    p_control => 'modificationtime',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '12 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.job_metrics';

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.task_metrics',
    p_control => 'modificationtime',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '12 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.task_metrics';

-- Update versions
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=23 where component='JEDI';
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=23 where component='SERVER';
COMMIT;
