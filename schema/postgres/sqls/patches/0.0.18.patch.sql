-- patch to be used to upgrade from version 0.0.17
ALTER TABLE doma_panda.harvester_workers ADD COLUMN minramcount integer;
COMMENT ON COLUMN doma_panda.harvester_workers.minramcount IS E'Worker memory requirements';

-- Update versions
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=18 where component='JEDI';
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=18 where component='SERVER';
COMMIT;