-- Cron job updates for patch 0.0.31
-- This file contains cron-specific updates and must be run against the database where pg_cron is installed.
-- IMPORTANT: pg_cron may be installed in 'postgres' or in 'panda_db'.
-- To check: SELECT extname FROM pg_extension WHERE extname = 'pg_cron';

-- Examples:
--   psql -U postgres -d postgres -f 0.0.31.cron.patch.sql   -- if pg_cron in 'postgres'
--   psql -U postgres -d panda_db -f 0.0.31.cron.patch.sql   -- if pg_cron in 'panda_db'

-- =========================
-- Hourly MV refresh jobs
-- =========================
-- Create top-of-hour schedules for MV refreshes
SELECT cron.schedule ('0 * * * *', 'REFRESH MATERIALIZED VIEW CONCURRENTLY doma_panda.mv_worker_node_summary;');
SELECT cron.schedule ('0 * * * *', 'REFRESH MATERIALIZED VIEW CONCURRENTLY doma_panda.mv_worker_node_gpu_summary;');

-- Point the jobs at the correct database/user/node
UPDATE cron.job SET database = 'panda_db', nodename = '' WHERE command LIKE '%doma_panda.mv_worker_node_summary%';
UPDATE cron.job SET database = 'panda_db', nodename = '' WHERE command LIKE '%doma_panda.mv_worker_node_gpu_summary%';
