-- patch to be used to upgrade from version 0.0.29
-- Drop the old procedure
    DROP PROCEDURE IF EXISTS doma_panda.update_worker_node_map();

-- Drop the old table
DROP TABLE IF EXISTS doma_panda.worker_node_map;

-- Create the updated procedure
CREATE OR REPLACE PROCEDURE doma_panda.update_worker_node_metrics()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'PanDA scheduler job: Updates worker node statistics with last days job and worker data (started)';

    INSERT INTO doma_panda.worker_node_metrics ("site", "host_name", "key", "statistics")
    WITH sc_slimmed AS (
        SELECT
            scj."panda_queue",
            scj."data" ->> 'atlas_site' AS "atlas_site"
        FROM doma_panda."schedconfig_json" scj
    ),
    pilot_stats AS (
        SELECT
            sc_slimmed."atlas_site",
            CASE
                WHEN j."modificationhost" ~ '^[^@]+@atlprd[0-9]+-[^-]+-[^.]+\.cern\.ch$'
                  THEN regexp_replace(j."modificationhost",
                       '^.*@atlprd[0-9]+-[^-]+-([^.]+\.cern\.ch)$', '\1')
                WHEN j."modificationhost" LIKE '%@%'
                  THEN regexp_replace(j."modificationhost", '^.*@(.+)$', '\1')
                ELSE j."modificationhost"
            END AS "worker_node",
            'jobs' AS "key",
            jsonb_build_object(
                'jobs_failed', COUNT(*) FILTER (WHERE j."jobstatus" = 'failed'),
                'jobs_finished', COUNT(*) FILTER (WHERE j."jobstatus" = 'finished'),
                'hc_failed', COUNT(*) FILTER (WHERE j."jobstatus" = 'failed' AND j."produsername" = 'gangarbt'),
                'hc_finished', COUNT(*) FILTER (WHERE j."jobstatus" = 'finished' AND j."produsername" = 'gangarbt'),
                'hssec_failed', COALESCE(SUM(j."hs06sec") FILTER (WHERE j."jobstatus" = 'failed'), 0),
                'hssec_finished', COALESCE(SUM(j."hs06sec") FILTER (WHERE j."jobstatus" = 'finished'), 0)
            ) AS "stats"
        FROM doma_panda."jobsarchived4" j
        JOIN sc_slimmed ON j."computingsite" = sc_slimmed."panda_queue"
        WHERE j."endtime" > NOW() - INTERVAL '1 day'
          AND j."jobstatus" IN ('finished', 'failed')
          AND j."modificationhost" NOT LIKE 'aipanda%'
          AND j."modificationhost" NOT LIKE 'grid-job-%'
        GROUP BY sc_slimmed."atlas_site", "worker_node"
    ),
    harvester_stats AS (
        SELECT
            sc_slimmed."atlas_site",
            CASE
                WHEN h."nodeid" ~ '^[^@]+@atlprd[0-9]+-[^-]+-[^.]+\.cern\.ch$'
                  THEN regexp_replace(h."nodeid",
                       '^.*@atlprd[0-9]+-[^-]+-([^.]+\.cern\.ch)$', '\1')
                WHEN h."nodeid" LIKE '%@%'
                  THEN regexp_replace(h."nodeid", '^.*@(.+)$', '\1')
                ELSE h."nodeid"
            END AS "worker_node",
            'workers' AS "key",
            jsonb_build_object(
                'worker_failed', COUNT(*) FILTER (WHERE h."status" = 'failed'),
                'worker_finished', COUNT(*) FILTER (WHERE h."status" = 'finished'),
                'worker_cancelled', COUNT(*) FILTER (WHERE h."status" = 'cancelled')
            ) AS "stats"
        FROM doma_panda."harvester_workers" h
        JOIN sc_slimmed ON h."computingsite" = sc_slimmed."panda_queue"
        WHERE h."endtime" > NOW() - INTERVAL '1 day'
          AND h."status" IN ('finished', 'failed', 'cancelled')
          AND h."nodeid" NOT LIKE 'grid-job-%'
        GROUP BY sc_slimmed."atlas_site", "worker_node"
    )
    SELECT "atlas_site", "worker_node", "key", "stats" FROM pilot_stats
    UNION ALL
    SELECT "atlas_site", "worker_node", "key", "stats" FROM harvester_stats;

    COMMIT;

    RAISE NOTICE 'PanDA scheduler job: update_worker_node_metrics completed';
END;
$$;

ALTER PROCEDURE doma_panda.update_worker_node_metrics() OWNER TO panda;

-- Drop the old cron schedule
SELECT cron.unschedule(
    (SELECT jobid FROM cron.job WHERE command = 'CALL doma_panda.update_worker_node_map()')
);
