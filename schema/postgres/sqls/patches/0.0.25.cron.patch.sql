-- Cron job updates for patch 0.0.25
-- This file contains cron-specific updates and must be run against the database where pg_cron is installed.
-- IMPORTANT: pg_cron may be installed in 'postgres' or in 'panda_db'.
-- To check: SELECT extname FROM pg_extension WHERE extname = 'pg_cron';

SELECT cron.schedule ('0 8 * * *', 'CALL doma_panda.update_worker_node_map()');
SELECT cron.schedule ('0 8 * * *', 'CALL doma_panda.update_worker_node_metrics()');

UPDATE cron.job
SET database = 'panda_db',
    nodename = ''
WHERE command LIKE '%update_worker_node_map%' OR command LIKE '%update_worker_node_metrics%';
