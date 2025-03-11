-- patch to be used to upgrade from version 0.0.23
ALTER TABLE doma_panda.data_carousel_requests
ADD COLUMN "source_tape" VARCHAR(64),
ADD COLUMN "parameters" JSONB NOT NULL;

COMMENT ON COLUMN doma_panda.data_carousel_requests.source_tape IS E'Physical tape behind source RSE';
COMMENT ON COLUMN doma_panda.data_carousel_requests.parameters IS E'Extra parameters of staging in JSON';

UPDATE doma_panda.pandadb_version
SET major=0, minor=0, patch=24
WHERE component='JEDI';

UPDATE doma_panda.pandadb_version
SET major=0, minor=0, patch=24
WHERE component='SERVER';

COMMIT;
