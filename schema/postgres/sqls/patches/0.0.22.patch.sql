-- patch to be used to upgrade from version 0.0.21
CREATE TABLE doma_panda.error_classification (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 1000000 INCREMENT BY 1) NOT NULL,
    "error_source" VARCHAR(30) NOT NULL,
    "error_code" bigint NOT NULL,
    "error_diag" VARCHAR(256) NOT NULL,
    "description" VARCHAR(250),
    "error_class" VARCHAR(30) NOT NULL,
    "active" CHAR(1) NOT NULL,
    "reg_date" TIMESTAMP DEFAULT ((CURRENT_TIMESTAMP(0) AT TIME ZONE 'UTC'))
);
COMMENT ON TABLE doma_panda.error_classification IS E'Classification of job error codes+messages to system, user or others';
COMMENT ON COLUMN doma_panda.error_classification.id IS E'Sequential ID of the request. 1M offset to avoid overlapping IDs with retry module';
COMMENT ON COLUMN doma_panda.error_classification.error_source IS E'Source of the error: pilotErrorCode, exeErrorCode, ddmErrorCode...';
COMMENT ON COLUMN doma_panda.error_classification.error_code IS E'Error code number';
COMMENT ON COLUMN doma_panda.error_classification.error_diag IS E'Error message';
COMMENT ON COLUMN doma_panda.error_classification.description IS E'Any description or comment on the entry';
COMMENT ON COLUMN doma_panda.error_classification.error_class IS E'Error class: system, user,...';
COMMENT ON COLUMN doma_panda.error_classification.active IS E'Y or N. Depending on whether the entry is confirmed';
COMMENT ON COLUMN doma_panda.error_classification.reg_date IS E'Registration date, defaults to current timestamp';ALTER TABLE error_classification OWNER TO panda;
ALTER TABLE doma_panda.error_classification OWNER TO panda;
ALTER TABLE doma_panda.error_classification ADD PRIMARY KEY ("id");

-- Update versions
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=22 where component='JEDI';
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=22 where component='SERVER';
COMMIT;
