-- Cron job updates for patch 0.0.31
-- This file contains cron-specific updates and must be run against the database where pg_cron is installed.
-- IMPORTANT: pg_cron may be installed in 'postgres' or in 'panda_db'.
-- To check: SELECT extname FROM pg_extension WHERE extname = 'pg_cron';

-- NOTE: Instead of adding inline cron.schedule() calls here, the new jobs for this patch
-- (mv_worker_node_summary and mv_worker_node_gpu_summary hourly refreshes) have been added
-- to post_step_cron.sql. Run that file to apply all cron jobs from scratch (idempotent):
--
--   psql -U postgres -d postgres -f ../post_step_cron.sql   -- if pg_cron in 'postgres'
--   psql -U postgres -d panda_db -f ../post_step_cron.sql   -- if pg_cron in 'panda_db'
--
-- post_step_cron.sql deletes all existing PanDA-managed cron jobs before recreating them,
-- preventing duplicates if the script is run more than once (ATLASPANDA-1632).
\i ../post_step_cron.sql
