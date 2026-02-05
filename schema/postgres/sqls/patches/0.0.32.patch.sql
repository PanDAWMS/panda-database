-- patch to be used to upgrade from version 0.0.31
ALTER TABLE doma_panda.jedi_tasks
  ADD COLUMN actiontime TIMESTAMP;

COMMENT ON COLUMN doma_panda.jedi_tasks.actiontime
  IS 'Timestamp when a periodic action is executed on the task';
