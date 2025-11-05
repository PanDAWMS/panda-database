-- Cron job updates for patch 0.0.30
-- This file contains cron-specific updates and must be run against the database where pg_cron is installed
--
-- IMPORTANT: pg_cron location varies by installation:
-- Some installations have it in 'postgres' database, others may be in the 'panda_db' database
--
-- To check where pg_cron is installed:
--   SELECT extname FROM pg_extension WHERE extname = 'pg_cron';
--
-- Run this file against the correct database:
--   psql -U postgres -d postgres -f 0.0.30.cron.patch.sql    (if pg_cron is in postgres)
--   psql -U postgres -d panda_db -f 0.0.30.cron.patch.sql    (if pg_cron is in panda_db)
--
-- Regular database updates are in 0.0.30.patch.sql

-- Drop the old cron schedule for the obsolete update_worker_node_map procedure
-- This procedure has been replaced by update_worker_node_metrics
SELECT cron.unschedule(
    (SELECT jobid FROM cron.job WHERE command = 'CALL doma_panda.update_worker_node_map()')
);
