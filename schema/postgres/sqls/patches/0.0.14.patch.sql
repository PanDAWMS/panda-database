-- patches to be used to upgrade from version 0.0.13

ALTER TABLE doma_pandaarch.jobsarchived ADD COLUMN cpu_architecture_level varchar(20);

ALTER TABLE doma_panda.jobsactive4 ADD COLUMN cpu_architecture_level varchar(20);
ALTER TABLE doma_panda.jobsarchived4 ADD COLUMN cpu_architecture_level varchar(20);
ALTER TABLE doma_panda.jobsdefined4 ADD COLUMN cpu_architecture_level varchar(20);
ALTER TABLE doma_panda.jobswaiting4 ADD COLUMN cpu_architecture_level varchar(20);


UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=14 WHERE component = 'PANDABIGMON';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=14 WHERE component = 'SERVER';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=14 WHERE component = 'JEDI';
COMMIT;
