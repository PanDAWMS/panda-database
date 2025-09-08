-- patch to be used to upgrade from version 0.0.28
CREATE INDEX wn_metrics_timestamp_idx ON doma_panda.worker_node_metrics ("timestamp");

ALTER TABLE doma_panda.ddm_endpoint
  ADD COLUMN IF NOT EXISTS detailed_status JSONB;

COMMENT ON COLUMN doma_panda.ddm_endpoint.detailed_status
  IS 'Endpoint-specific detailed status (JSON)';


-- Update schema version
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 29
WHERE component = 'JEDI';

UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 29
WHERE component = 'SERVER';

commit;