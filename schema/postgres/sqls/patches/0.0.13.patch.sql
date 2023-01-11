ALTER TABLE doma_pandaarch.jobsarchived
    ADD COLUMN nucleus varchar(52),
    ADD COLUMN eventservice smallint,
    ADD COLUMN failedattempt smallint,
    ADD COLUMN hs06sec bigint,
    ADD COLUMN gshare varchar(32),
    ADD COLUMN totrchar bigint,
    ADD COLUMN totwchar bigint,
    ADD COLUMN totrbytes bigint,
    ADD COLUMN totwbytes bigint,
    ADD COLUMN raterchar bigint,
    ADD COLUMN ratewchar bigint,
    ADD COLUMN raterbytes bigint,
    ADD COLUMN ratewbytes bigint,
    ADD COLUMN resource_type varchar(56),
    ADD COLUMN diskio integer,
    ADD COLUMN memory_leak bigint,
    ADD COLUMN memory_leak_x2 decimal(11,2),
    ADD COLUMN container_name varchar(200),
    ADD COLUMN job_label varchar(20)
;

UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=13 WHERE component = 'SCHEMA';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=13 WHERE component = 'SERVER';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=13 WHERE component = 'JEDI';