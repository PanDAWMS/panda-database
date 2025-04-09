-- patch to be used to upgrade from version 0.0.25
ALTER TABLE doma_panda.worker_node
ADD COLUMN total_local_disk BIGINT;

COMMENT ON COLUMN doma_panda.worker_node.clock_speed IS E'Clock speed of the CPU in MHz.';
COMMENT ON COLUMN doma_panda.worker_node.total_local_disk IS E'Total local disk in GB.';

UPDATE doma_panda.pandadb_version
SET major=0, minor=0, patch=26
WHERE component='JEDI';

UPDATE doma_panda.pandadb_version
SET major=0, minor=0, patch=26
WHERE component='SERVER';

COMMIT;
