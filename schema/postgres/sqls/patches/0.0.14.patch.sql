ALTER TABLE doma_pandabigmon.auth_user ADD COLUMN is_expert boolean;

UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=14 WHERE component = 'SCHEMA';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=14 WHERE component = 'SERVER';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=14 WHERE component = 'JEDI';
