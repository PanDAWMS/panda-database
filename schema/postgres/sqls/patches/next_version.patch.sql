-- patches to be included in the next version

SELECT partman.create_parent(
p_parent_table => 'doma_panda.pandalog',
p_control => 'bintime',
p_type => 'native',
p_interval=> 'daily',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '7 days',
retention_keep_table = false
WHERE parent_table = 'doma_panda.pandalog'
;

ALTER TABLE doma_pandaarch.jobsarchived
    ADD COLUMN gco2_regional decimal(10,2),
    ADD COLUMN gco2_global decimal(10,2)
;

ALTER TABLE doma_panda.jobsactive4
    ADD COLUMN gco2_regional decimal(10,2),
    ADD COLUMN gco2_global decimal(10,2)
;

ALTER TABLE doma_panda.jobsarchived4
    ADD COLUMN gco2_regional decimal(10,2),
    ADD COLUMN gco2_global decimal(10,2)
;

ALTER TABLE doma_panda.jobsdefined4
    ADD COLUMN gco2_regional decimal(10,2),
    ADD COLUMN gco2_global decimal(10,2)
;

ALTER TABLE doma_panda.jobswaiting4
    ADD COLUMN gco2_regional decimal(10,2),
    ADD COLUMN gco2_global decimal(10,2)
;
