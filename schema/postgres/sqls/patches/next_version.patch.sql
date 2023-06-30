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

ALTER TABLE doma_panda.jedi_events
    error_diag varchar(500)
;


UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=15 WHERE component = 'SERVER';
UPDATE doma_panda.pandadb_version set major=0, minor=0, patch=15 WHERE component = 'JEDI';
COMMIT;
