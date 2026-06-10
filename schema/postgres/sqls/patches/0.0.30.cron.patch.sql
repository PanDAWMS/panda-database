-- Cron job updates for patch 0.0.30
-- This file contains cron-specific updates and must be run against the database where pg_cron is installed.
-- IMPORTANT: pg_cron may be installed in 'postgres' or in 'panda_db'.
-- To check: SELECT extname FROM pg_extension WHERE extname = 'pg_cron';

-- NOTE: The original purpose of this file was to unschedule the obsolete
-- update_worker_node_map procedure. This is now handled automatically by
-- post_step_cron.sql, which deletes all PanDA-managed cron jobs (including
-- any obsolete ones) before recreating the current set from scratch.
-- Run post_step_cron.sql to apply all cron jobs idempotently (ATLASPANDA-1632):
--
--   psql -U postgres -d postgres -f ../post_step_cron.sql   -- if pg_cron in 'postgres'
--   psql -U postgres -d panda_db -f ../post_step_cron.sql   -- if pg_cron in 'panda_db'
\i ../post_step_cron.sql
