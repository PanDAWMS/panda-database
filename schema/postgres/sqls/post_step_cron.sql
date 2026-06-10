-- Remove all existing PanDA-managed cron jobs before recreating them.
-- This makes the script idempotent: re-running after a failed patch will not
-- produce duplicate entries in cron.job (ATLASPANDA-1632).
DELETE FROM cron.job WHERE
    command LIKE '%doma_panda.%'
    OR command LIKE '%partman.run_maintenance_proc%'
    OR command LIKE '%cron.job_run_details%'
    OR command LIKE '%mv_worker_node%';

SELECT cron.schedule ('* * * * *', 'call doma_panda.jedi_refr_mintaskids_bystatus()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_jobsdef_stats_by_gshare()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_jobsact_stats_by_gshare()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_jobsactive_stats()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_num_input_data_files()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_total_walltime()');
SELECT cron.schedule ('* * * * *', 'call doma_panda.update_job_stats_hp()');
UPDATE cron.job SET database='panda_db',username='panda',nodename='' WHERE command like '%doma_panda.%';
SELECT cron.schedule ('@daily', $$DELETE FROM cron.job_run_details WHERE end_time < now() - interval '3 days'$$);
SELECT cron.schedule ('@daily', 'call partman.run_maintenance_proc()');
UPDATE cron.job SET database='panda_db',nodename='' WHERE command like '%partman.run_maintenance_proc%';
SELECT cron.schedule ('0 8 * * *', 'CALL doma_panda.update_worker_node_metrics()');
SELECT cron.schedule ('0 * * * *', 'REFRESH MATERIALIZED VIEW CONCURRENTLY doma_panda.mv_worker_node_summary;');
SELECT cron.schedule ('0 * * * *', 'REFRESH MATERIALIZED VIEW CONCURRENTLY doma_panda.mv_worker_node_gpu_summary;');

UPDATE cron.job SET database = 'panda_db',nodename = '' WHERE command LIKE '%update_worker_node_metrics%';
UPDATE cron.job SET database = 'panda_db', nodename = '' WHERE command LIKE '%mv_worker_node_summary%';
UPDATE cron.job SET database = 'panda_db', nodename = '' WHERE command LIKE '%mv_worker_node_gpu_summary%';
