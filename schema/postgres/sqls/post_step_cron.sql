SELECT cron.schedule ('* * * * *', 'call doma_panda.jedi_refr_mintaskids_bystatus()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_jobsdef_stats_by_gshare()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_jobsact_stats_by_gshare()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_jobsactive_stats()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_num_input_data_files()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_total_walltime()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_job_stats_hp()');
UPDATE cron.job SET database='panda_db',username='panda',nodename='' WHERE command like '%doma_panda.%';
SELECT cron.schedule ('@daily', $$DELETE FROM cron.job_run_details WHERE end_time < now() – interval '3 days'$$);
SELECT cron.schedule ('@daily', 'call partman.run_maintenance_proc()');
UPDATE cron.job SET database='panda_db',nodename='' WHERE command like '%partman.run_maintenance_proc%';
SELECT cron.schedule ('0 8 * * *', 'CALL doma_panda.update_worker_node_metrics()');
UPDATE cron.job SET database = 'panda_db',nodename = '' WHERE command LIKE '%update_worker_node_map%' OR command LIKE '%update_worker_node_metrics%';

