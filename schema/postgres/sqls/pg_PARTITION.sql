-- PANDA tables with sliding windows

SELECT partman.create_parent(
p_parent_table => 'doma_panda.datasets',
p_control => 'modificationdate',
p_type => 'range',
p_interval=> '1 month',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '12 months',
retention_keep_table = false
WHERE parent_table = 'doma_panda.datasets'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jobs_statuslog',
p_control => 'modificationtime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '90 days',
retention_keep_table = false
WHERE parent_table = 'doma_panda.jobs_statuslog'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.tasks_statuslog',
p_control => 'modificationtime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '90 days',
retention_keep_table = false
WHERE parent_table = 'doma_panda.tasks_statuslog'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.harvester_dialogs',
p_control => 'creationtime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '7 days',
retention_keep_table = false
WHERE parent_table = 'doma_panda.harvester_dialogs'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.harvester_metrics',
p_control => 'creation_time',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '7 days',
retention_keep_table = false
WHERE parent_table = 'doma_panda.harvester_metrics'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.harvester_workers',
p_control => 'lastupdate',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '3 months',
retention_keep_table = false
WHERE parent_table = 'doma_panda.harvester_workers'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_job_retry_history',
p_control => 'ins_utc_tstamp',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '3 months',
retention_keep_table = false
WHERE parent_table = 'doma_panda.jedi_job_retry_history'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.task_attempts',
p_control => 'starttime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '3 months',
retention_keep_table = false
WHERE parent_table = 'doma_panda.task_attempts'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.pandalog',
p_control => 'bintime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '7 days',
retention_keep_table = false
WHERE parent_table = 'doma_panda.pandalog'
;

-- PANDA tables with backup

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jobsarchived4',
p_control => 'modificationtime',
p_type => 'range',
p_interval=> '1 month',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '365 days',
retention_schema = 'doma_pandaarch'
WHERE parent_table = 'doma_panda.jobsarchived4'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.filestable4',
p_control => 'modificationtime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '30 days',
retention_schema = 'doma_pandaarch'
WHERE parent_table = 'doma_panda.filestable4'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.metatable',
p_control => 'modificationtime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '30 days',
retention_schema = 'doma_pandaarch'
WHERE parent_table = 'doma_panda.metatable'
;

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jobparamstable',
p_control => 'modificationtime',
p_type => 'range',
p_interval=> '1 day',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '30 days',
retention_schema = 'doma_pandaarch'
WHERE parent_table = 'doma_panda.jobparamstable'
;

-- PANDA tables with partitions

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_tasks',
p_control => 'jeditaskid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_datasets',
p_control => 'jeditaskid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_dataset_contents',
p_control => 'jeditaskid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_events',
p_control => 'jeditaskid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_jobparams_template',
p_control => 'jeditaskid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_output_template',
p_control => 'jeditaskid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

SELECT partman.create_parent(
p_parent_table => 'doma_panda.jedi_taskparams',
p_control => 'jeditaskid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

SELECT partman.create_parent(
p_parent_table => 'doma_panda.harvester_rel_jobs_workers',
p_control => 'pandaid',
p_type => 'range',
p_interval=> '1000000',
p_premake => 3
);

-- PANDAMETA tables with sliding windows

SELECT partman.create_parent(
p_parent_table => 'doma_pandameta.usercacheusage',
p_control => 'creationtime',
p_type => 'range',
p_interval=> '1 month',
p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
retention = '3 months',
retention_keep_table = false
WHERE parent_table = 'doma_pandameta.usercacheusage'
;

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.job_metrics',
    p_control => 'modificationtime',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '12 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.job_metrics';

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.task_metrics',
    p_control => 'modificationtime',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '12 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.task_metrics';

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.worker_node_metrics',
    p_control => 'timestamp',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '12 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.worker_node_metrics';
