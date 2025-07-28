-- patch to be used to upgrade from version 0.0.28
CREATE INDEX wn_metrics_timestamp_idx ON doma_panda.worker_node_metrics ("timestamp");

-- Update schema version
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 29
WHERE component = 'JEDI';

UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 29
WHERE component = 'SERVER';

commit;