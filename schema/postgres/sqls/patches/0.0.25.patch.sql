-- patch to be used to upgrade from version 0.0.24

-- ========== TABLES ==========

CREATE TABLE doma_panda.worker_node (
    "site" VARCHAR(128),
    "host_name" VARCHAR(128),
    "cpu_model" VARCHAR(128),
    "n_logical_cpus" INTEGER,
    "n_sockets" INTEGER,
    "cores_per_socket" INTEGER,
    "threads_per_core" INTEGER,
    "cpu_architecture" VARCHAR(20),
    "cpu_architecture_level" VARCHAR(20),
    "clock_speed" NUMERIC(9,2),
    "total_memory" BIGINT,
    "last_seen" TIMESTAMP,
    PRIMARY KEY ("site", "host_name", "cpu_model")
);

CREATE INDEX idx_worker_node_last_seen ON doma_panda.worker_node ("last_seen");

COMMENT ON TABLE doma_panda.worker_node IS 'Stores information about worker nodes seen by PanDA pilots';
COMMENT ON COLUMN doma_panda.worker_node."site" IS 'The name of the site (not PanDA queue) where the worker node is located.';
COMMENT ON COLUMN doma_panda.worker_node."host_name" IS 'The hostname of the worker node.';
COMMENT ON COLUMN doma_panda.worker_node."cpu_model" IS 'The specific model of the CPU.';
COMMENT ON COLUMN doma_panda.worker_node."n_logical_cpus" IS 'Total number of logical CPUs (calculated as sockets * cores per socket * threads per core).';
COMMENT ON COLUMN doma_panda.worker_node."n_sockets" IS 'Number of physical CPU sockets.';
COMMENT ON COLUMN doma_panda.worker_node."cores_per_socket" IS 'Number of CPU cores per physical socket.';
COMMENT ON COLUMN doma_panda.worker_node."threads_per_core" IS 'Number of threads per CPU core.';
COMMENT ON COLUMN doma_panda.worker_node."cpu_architecture" IS 'The CPU architecture (e.g., x86_64, ARM).';
COMMENT ON COLUMN doma_panda.worker_node."cpu_architecture_level" IS 'The specific level/version of the CPU architecture.';
COMMENT ON COLUMN doma_panda.worker_node."clock_speed" IS 'Clock speed of the CPU in GHz.';
COMMENT ON COLUMN doma_panda.worker_node."total_memory" IS 'Total amount of RAM in MB.';
COMMENT ON COLUMN doma_panda.worker_node."last_seen" IS 'Timestamp of the last time the worker node was active.';

ALTER TABLE doma_panda.worker_node OWNER TO panda;


CREATE TABLE doma_panda.cpu_benchmarks (
    "cpu_type" VARCHAR(128),
    "smt_enabled" SMALLINT,
    "sockets" SMALLINT,
    "cores_per_socket" INTEGER,
    "ncores" INTEGER,
    "site" VARCHAR(128),
    "score_per_core" NUMERIC(10,2),
    "timestamp" TIMESTAMP,
    "source" VARCHAR(256)
);
ALTER TABLE doma_panda.cpu_benchmarks OWNER TO panda;

CREATE TABLE doma_panda.worker_node_map (
    "atlas_site" VARCHAR(128),
    "worker_node" VARCHAR(128),
    "cpu_type" VARCHAR(128),
    "last_seen" TIMESTAMP,
    "cores" INTEGER,
    "architecture_level" VARCHAR(20),
    PRIMARY KEY ("atlas_site", "worker_node")
);
ALTER TABLE doma_panda.worker_node_map OWNER TO panda;


CREATE TABLE doma_panda.worker_node_metrics (
    "site" VARCHAR(128),
    "host_name" VARCHAR(128),
    "timestamp" TIMESTAMP DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    "key" VARCHAR(20),
    "statistics" JSONB,
    PRIMARY KEY ("site", "host_name", "timestamp")
) PARTITION BY RANGE ("timestamp");

COMMENT ON TABLE doma_panda.worker_node_metrics IS 'Metrics related to a worker node';
COMMENT ON COLUMN doma_panda.worker_node_metrics."site" IS 'The name of the site (not PanDA queue) where the worker node is located.';
COMMENT ON COLUMN doma_panda.worker_node_metrics."host_name" IS 'The hostname of the worker node.';
COMMENT ON COLUMN doma_panda.worker_node_metrics."timestamp" IS 'Timestamp the metrics were collected.';
COMMENT ON COLUMN doma_panda.worker_node_metrics."key" IS 'Key of the metrics entry.';
COMMENT ON COLUMN doma_panda.worker_node_metrics."statistics" IS 'Metrics in json format.';

CREATE INDEX wn_metrics_idx ON doma_panda.worker_node_metrics ("site", "host_name", "timestamp");
ALTER TABLE doma_panda.worker_node_metrics OWNER TO panda;

-- Partman setup
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

-- ========== PROCEDURES ==========

-- Update Worker Node Map
CREATE OR REPLACE PROCEDURE doma_panda.update_worker_node_map()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'PanDA scheduler job: update_worker_node_map started';

    MERGE INTO doma_panda.worker_node_map AS wnm
    USING (
        WITH sc_slimmed AS (
            SELECT
                scj."data" ->> 'atlas_site' AS "atlas_site",
                scj."panda_queue"
            FROM doma_panda."schedconfig_json" scj
        )
        SELECT DISTINCT
            sc_slimmed."atlas_site",
            CASE
                WHEN POSITION('@' IN j."modificationhost") > 0 THEN SUBSTRING(j."modificationhost" FROM '@(.+)' FOR '#')
                ELSE j."modificationhost"
            END AS "worker_node",
            SUBSTRING(j."cpuconsumptionunit" FROM 's?\+?(.+?)\s\d+-Core') AS "cpu_type",
            MAX(
                CASE
                    WHEN j."cpuconsumptionunit" IS NULL OR TRIM(j."cpuconsumptionunit") = '' THEN 0
                    WHEN j."cpuconsumptionunit" NOT LIKE '%-Core%' THEN 0
                    ELSE COALESCE((SUBSTRING(j."cpuconsumptionunit" FROM '(\d+)-Core'))::INTEGER, -1)
                END
            ) AS "cores",
            j."cpu_architecture_level"
        FROM doma_panda."jobsarchived4" j
        JOIN sc_slimmed ON j."computingsite" = sc_slimmed."panda_queue"
        WHERE j."endtime" > NOW() - INTERVAL '1 day'
          AND j."jobstatus" IN ('finished', 'failed')
          AND j."modificationhost" NOT LIKE 'aipanda%'
          AND j."cpu_architecture_level" IS NOT NULL
          AND j."cpuconsumptionunit" ~ 's?\+?(.+?)\s\d+-Core'
        GROUP BY
            sc_slimmed."atlas_site",
            CASE
                WHEN POSITION('@' IN j."modificationhost") > 0 THEN SUBSTRING(j."modificationhost" FROM '@(.+)' FOR '#')
                ELSE j."modificationhost"
            END,
            SUBSTRING(j."cpuconsumptionunit" FROM 's?\+?(.+?)\s\d+-Core'),
            j."cpu_architecture_level"
    ) AS src
    ON (
        src."atlas_site" = wnm."atlas_site"
        AND src.worker_node = wnm.worker_node
        AND src."cpu_type" = wnm."cpu_type"
    )
    WHEN MATCHED THEN
        UPDATE SET "last_seen" = NOW()
    WHEN NOT MATCHED THEN
        INSERT ("atlas_site", "worker_node", "cpu_type", "cores", "architecture_level", "last_seen")
        VALUES (src."atlas_site", src.worker_node, src."cpu_type", src."cores", src."cpu_architecture_level", NOW());

    COMMIT;

    RAISE NOTICE 'PanDA scheduler job: update_worker_node_map completed';
END;
$$;

ALTER PROCEDURE doma_panda.update_worker_node_map() OWNER TO panda;

-- Update Worker Node Metrics
CREATE OR REPLACE PROCEDURE doma_panda.update_worker_node_metrics()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'PanDA scheduler job: update_worker_node_metrics started';

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
                WHEN POSITION('@' IN j."modificationhost") > 0 THEN SUBSTRING(j."modificationhost" FROM '@(.+)' FOR '#')
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
        GROUP BY sc_slimmed."atlas_site", "worker_node"
    ),
    harvester_stats AS (
        SELECT
            sc_slimmed."atlas_site",
            CASE
                WHEN POSITION('@' IN h."nodeid") > 0 THEN SUBSTRING(h."nodeid" FROM '@(.+)' FOR '#')
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

-- ========== pg_cron JOBS ==========

SELECT cron.schedule ('0 8 * * *', 'CALL doma_panda.update_worker_node_map()');
SELECT cron.schedule ('0 8 * * *', 'CALL doma_panda.update_worker_node_metrics()');

UPDATE cron.job
SET database = 'panda_db',
    nodename = ''
WHERE command LIKE '%update_worker_node_map%' OR command LIKE '%update_worker_node_metrics%';

-- ========== VERSION UPDATE ==========

UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 25
WHERE component = 'JEDI';

UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 25
WHERE component = 'SERVER';

COMMIT;
