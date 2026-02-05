-- patch to be used to upgrade from version 0.0.31
ALTER TABLE doma_panda.jedi_tasks
  ADD COLUMN actiontime TIMESTAMP;

COMMENT ON COLUMN doma_panda.jedi_tasks.actiontime
  IS 'Timestamp when a periodic action is executed on the task';

-- Update schema version
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 32
WHERE component = 'PanDA';
commit;