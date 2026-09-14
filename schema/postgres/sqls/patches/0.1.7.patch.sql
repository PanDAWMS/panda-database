-- patch to be used to upgrade from version 0.1.6

SET search_path = doma_panda,public;

-- ===============================================
-- Add table for WN metrics by queue and job to update it (ATLASPANDA-1833)
-- ===============================================

CREATE TABLE IF NOT EXISTS doma_panda.worker_node_metrics_by_queue (
    "site" VARCHAR(128),
    "panda_queue" VARCHAR(128),
    "host_name" VARCHAR(128),
    "timestamp" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    "key" VARCHAR(20),
    "statistics" JSONB,
    PRIMARY KEY ("site", "panda_queue", "host_name", "timestamp")
) PARTITION BY RANGE ("timestamp");

COMMENT ON TABLE doma_panda.worker_node_metrics_by_queue IS 'Metrics related to a worker node';
COMMENT ON COLUMN doma_panda.worker_node_metrics_by_queue."site" IS 'The name of the site (not PanDA queue) where the worker node is located.';
COMMENT ON COLUMN doma_panda.worker_node_metrics_by_queue."panda_queue" IS 'The name of the PanDA queue where the worker node is located.';
COMMENT ON COLUMN doma_panda.worker_node_metrics_by_queue."host_name" IS 'The hostname of the worker node.';
COMMENT ON COLUMN doma_panda.worker_node_metrics_by_queue."timestamp" IS 'Timestamp the metrics were collected.';
COMMENT ON COLUMN doma_panda.worker_node_metrics_by_queue."key" IS 'Key of the metrics entry.';
COMMENT ON COLUMN doma_panda.worker_node_metrics_by_queue."statistics" IS 'Metrics in json format.';

CREATE INDEX IF NOT EXISTS wn_metrics_q_idx ON doma_panda.worker_node_metrics_by_queue ("panda_queue", "host_name", "timestamp");
CREATE INDEX IF NOT EXISTS wn_metrics_q_timestamp_idx ON doma_panda.worker_node_metrics_by_queue ("timestamp");

ALTER TABLE doma_panda.worker_node_metrics_by_queue OWNER TO panda;

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.worker_node_metrics_by_queue',
    p_control => 'timestamp',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '12 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.worker_node_metrics_by_queue';

CREATE OR REPLACE PROCEDURE doma_panda.update_worker_node_metrics_queue()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'PanDA scheduler job: Updates worker node statistics with last days job and worker data by queue (started)';

    INSERT INTO doma_panda.worker_node_metrics_by_queue ("site", "panda_queue", "host_name", "key", "statistics")
    WITH sc_slimmed AS (
        SELECT
            scj."panda_queue",
            scj."data" ->> 'atlas_site' AS "atlas_site"
        FROM doma_panda."schedconfig_json" scj
    ),
    pilot_stats AS (
        SELECT
            sc_slimmed."atlas_site",
            sc_slimmed."panda_queue",
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
        GROUP BY sc_slimmed."atlas_site", sc_slimmed."panda_queue", "worker_node"
    ),
    harvester_stats AS (
        SELECT
            sc_slimmed."atlas_site",
            sc_slimmed."panda_queue",
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
        GROUP BY sc_slimmed."atlas_site", sc_slimmed."panda_queue", "worker_node"
    )
    SELECT "atlas_site", "panda_queue", "worker_node", "key", "stats" FROM pilot_stats
    UNION ALL
    SELECT "atlas_site", "panda_queue", "worker_node", "key", "stats" FROM harvester_stats;

    COMMIT;

    RAISE NOTICE 'PanDA scheduler job: update_worker_node_metrics_queue completed';
END;
$$;

ALTER PROCEDURE doma_panda.update_worker_node_metrics_queue() OWNER TO panda;

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 7
WHERE component = 'PanDA';
