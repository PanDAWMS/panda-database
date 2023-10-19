-- patches to be used to upgrade from version 0.0.14

ALTER TABLE doma_panda.jedi_events ALTER COLUMN error_diag TYPE varchar(500);


UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=15 WHERE component = 'SERVER';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=15 WHERE component = 'JEDI';
COMMIT;
