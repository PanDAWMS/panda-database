-- patch to be used to upgrade from version 0.0.29
BEGIN;

DROP VIEW doma_pandabigmon.jedi_tasks_ordered;

ALTER TABLE doma_panda.jedi_tasks
  ALTER COLUMN errordialog TYPE VARCHAR(510);

CREATE VIEW doma_pandabigmon.jedi_tasks_ordered AS
SELECT
    jedi_tasks.jeditaskid, jedi_tasks.taskname, jedi_tasks.status, jedi_tasks.username, jedi_tasks.creationdate, jedi_tasks.modificationtime, jedi_tasks.reqid, jedi_tasks.oldstatus, jedi_tasks.cloud, jedi_tasks.site, jedi_tasks.starttime,
    jedi_tasks.endtime, jedi_tasks.frozentime, jedi_tasks.prodsourcelabel, jedi_tasks.workinggroup, jedi_tasks.vo, jedi_tasks.corecount, jedi_tasks.tasktype, jedi_tasks.processingtype, jedi_tasks.taskpriority, jedi_tasks.currentpriority,
    jedi_tasks.architecture, jedi_tasks.transuses, jedi_tasks.transhome, jedi_tasks.transpath, jedi_tasks.lockedby, jedi_tasks.lockedtime, jedi_tasks.termcondition, jedi_tasks.splitrule, jedi_tasks.walltime, jedi_tasks.walltimeunit,
    jedi_tasks.outdiskcount, jedi_tasks.outdiskunit, jedi_tasks.workdiskcount, jedi_tasks.workdiskunit, jedi_tasks.ramcount, jedi_tasks.ramunit, jedi_tasks.iointensity, jedi_tasks.iointensityunit, jedi_tasks.workqueue_id,
    jedi_tasks.progress, jedi_tasks.failurerate, jedi_tasks.errordialog, jedi_tasks.countrygroup, jedi_tasks.parent_tid, jedi_tasks.eventservice, jedi_tasks.ticketid, jedi_tasks.ticketsystemtype, jedi_tasks.statechangetime,
    jedi_tasks.superstatus, jedi_tasks.campaign, jedi_tasks.mergeramcount, jedi_tasks.mergeramunit, jedi_tasks.mergewalltime, jedi_tasks.mergewalltimeunit, jedi_tasks.throttledtime, jedi_tasks.numthrottled, jedi_tasks.mergecorecount,
    jedi_tasks.goal, jedi_tasks.assessmenttime, jedi_tasks.cputime, jedi_tasks.cputimeunit, jedi_tasks.cpuefficiency, jedi_tasks.basewalltime, jedi_tasks.amiflag_old, jedi_tasks.amiflag, jedi_tasks.nucleus, jedi_tasks.baseramcount,
    jedi_tasks.ttcrequested, jedi_tasks.ttcpredicted, jedi_tasks.ttcpredictiondate, jedi_tasks.rescuetime, jedi_tasks.requesttype, jedi_tasks.gshare, jedi_tasks.resource_type, jedi_tasks.usejumbo, jedi_tasks.diskio,
    jedi_tasks.diskiounit, jedi_tasks.container_name, jedi_tasks.attemptnr
FROM doma_panda.jedi_tasks
ORDER BY jedi_tasks.jeditaskid DESC;

COMMIT;

CREATE OR REPLACE PROCEDURE doma_panda.delete_jedi_events_proc () AS $body$
DECLARE

  rows_cnt bigint;
  taskid_cnt bigint;
  --row_sum bigint := 0;
  --part_cnt bigint := 1;
  p RECORD;

BEGIN
  EXECUTE 'alter session set ddl_lock_timeout=30';

  for p in (select PARTITION_NAME from user_tab_partitions where table_name = 'JEDI_EVENTS') loop

    EXECUTE 'SELECT COUNT(*) FROM doma_panda.JEDI_Events PARTITION ('||p.PARTITION_NAME||')' into STRICT rows_cnt;

    EXECUTE 'SELECT COUNT(*)
                      FROM doma_panda.JEDI_Tasks t
                      JOIN doma_panda.JEDI_Events PARTITION ('||p.PARTITION_NAME||') e
                      ON (t.JEDITASKID = e.JEDITASKID)
                      WHERE t.STATUS IN (''done'', ''finished'', ''aborted'', ''failed'', ''broken'')
                      AND t.MODIFICATIONTIME < sysdate - 30' into STRICT taskid_cnt;

    if (rows_cnt = taskid_cnt and rows_cnt <> 0) then
      --dbms_output.put_line('ALTER TABLE doma_panda.JEDI_Events DROP PARTITION '||p.PARTITION_NAME||' update global indexes;');
      EXECUTE 'ALTER TABLE doma_panda.JEDI_Events DROP PARTITION '||p.PARTITION_NAME;
      --dbms_output.put_line(part_cnt||' '||p.PARTITION_NAME||' >>> '||rows_cnt);
      --row_sum := row_sum + taskid_cnt;
      --part_cnt := part_cnt + 1;
    end if;

  end loop;
  --dbms_output.put_line(row_sum);
END;
$body$
LANGUAGE PLPGSQL
SECURITY DEFINER
;
ALTER PROCEDURE doma_panda.delete_jedi_events_proc () OWNER TO panda;

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


-- Add columns
ALTER TABLE doma_panda.worker_node
  ADD COLUMN cpu_model_normalized VARCHAR(128);

ALTER TABLE doma_panda.cpu_benchmarks
  ADD COLUMN cpu_type_normalized VARCHAR(128);

-- Indices
CREATE INDEX idx_worker_node_cpu_model_norm
  ON doma_panda.worker_node (cpu_model_normalized);

CREATE INDEX idx_worker_node_cpu_type_norm
  ON doma_panda.cpu_benchmarks (cpu_type_normalized);

-- Update schema version
-- first delete server and jedi entries
TRUNCATE TABLE doma_panda.pandadb_version;

INSERT INTO doma_panda.pandadb_version (component, major, minor, patch)
VALUES ('PanDA', 0, 0, 30);
commit;