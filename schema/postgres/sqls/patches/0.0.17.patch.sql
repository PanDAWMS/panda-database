-- patch to be used to upgrade from version 0.0.16
ALTER TABLE doma_panda.jobsactive4 ADD COLUMN outputfiletype varchar(32);
ALTER TABLE doma_panda.jobsarchived4 ADD COLUMN outputfiletype varchar(32);
ALTER TABLE doma_panda.jobsdefined4 ADD COLUMN outputfiletype varchar(32);
ALTER TABLE doma_panda.jobswaiting4 ADD COLUMN outputfiletype varchar(32);

ALTER TABLE doma_pandaarch.jobsarchived ADD COLUMN outputfiletype varchar(32);

ALTER TABLE doma_panda.jedi_process_lock ALTER COLUMN lockedby TYPE varchar(56);
-- Update versions
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=17 where component='JEDI';
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=17 where component='SERVER';
COMMIT;