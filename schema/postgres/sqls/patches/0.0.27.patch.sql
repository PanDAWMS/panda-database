-- patch to be used to upgrade from version 0.0.26
-- ========== TABLES ==========
ALTER TABLE doma_panda.jobsdefined_share_stats
ADD COLUMN nucleus varchar(52);

COMMENT ON COLUMN doma_panda.jobsdefined_share_stats.nucleus IS E'Name of the site where the task is assigned in WORLD cloud';

ALTER TABLE doma_panda.jobs_share_stats
ADD COLUMN nucleus varchar(52);

COMMENT ON COLUMN doma_panda.jobs_share_stats.nucleus IS E'Name of the site where the task is assigned in WORLD cloud';

-- ========== PROCEDURES ==========
CREATE OR REPLACE PROCEDURE doma_panda.update_jobsact_stats_by_gshare () AS $body$
BEGIN
-- 14th Nov 2023 , ver 1.5
-- 27th Nov 2020 , ver 1.4
-- 29th Jan 2018 , ver 1.3
-- to easily identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
--DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Aggregates data by global share for the active jobs!');
--DBMS_APPLICATION_INFO.SET_CLIENT_INFO( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

DELETE from doma_panda.JOBS_SHARE_STATS;

INSERT INTO doma_panda.JOBS_SHARE_STATS(TS, GSHARE, WORKQUEUE_ID, RESOURCE_TYPE,
                                          COMPUTINGSITE, JOBSTATUS,
                                          MAXPRIORITY, PRORATED_DISKIO_AVG, PRORATED_MEM_AVG, NJOBS, HS, VO, NUCLEUS)
WITH
    sc_slimmed AS (
    SELECT sc.panda_queue AS pq, sc.data->>'corepower' AS cp
    FROM doma_panda.schedconfig_json sc
    )
SELECT clock_timestamp(), gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus,
      MAX(currentPriority) AS maxPriority, AVG(diskIO/coalesce(ja4.coreCount, 1)) AS proratedDiskioAvg, AVG(minRamCount/coalesce(ja4.coreCount, 1)) AS proratedMemAvg,
      COUNT(*) AS num_of_jobs, COUNT(*) * coalesce(ja4.coreCount, 1) * CAST(sc_s.cp as DOUBLE PRECISION) AS HS, VO, NUCLEUS
FROM doma_panda.jobsActive4 ja4, sc_slimmed sc_s
WHERE ja4.computingsite = sc_s.pq
GROUP BY clock_timestamp(), gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus, ja4.coreCount, sc_s.cp, VO, NUCLEUS;


--COMMIT;

--DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
--DBMS_APPLICATION_INFO.SET_CLIENT_INFO( client_info => null);

end;
$body$
LANGUAGE PLPGSQL
SECURITY DEFINER
;
ALTER PROCEDURE update_jobsact_stats_by_gshare () OWNER TO panda;



CREATE OR REPLACE PROCEDURE doma_panda.update_jobsdef_stats_by_gshare () AS $body$
BEGIN
-- 14th Nov 2023 , ver 1.1
-- 27th Nov 2020 , ver 1.0
-- Based on UPDATE_JOBSACT_STATS_BY_GSHARE
-- to easily identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
--DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Aggregates data by global share for the active jobs!');
--DBMS_APPLICATION_INFO.SET_CLIENT_INFO( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );


DELETE from doma_panda.JOBSDEFINED_SHARE_STATS;

INSERT INTO doma_panda.JOBSDEFINED_SHARE_STATS(TS, GSHARE, WORKQUEUE_ID, RESOURCE_TYPE,
                                          COMPUTINGSITE, JOBSTATUS,
                                          MAXPRIORITY, PRORATED_DISKIO_AVG, PRORATED_MEM_AVG, NJOBS, HS, VO, NUCLEUS)
WITH
    sc_slimmed AS (
    SELECT sc.panda_queue AS pq, sc.data->>'corepower' AS cp
    FROM doma_panda.schedconfig_json sc
    )
SELECT clock_timestamp(), gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus,
      MAX(currentPriority) AS maxPriority, AVG(diskIO/coalesce(ja4.coreCount, 1)) AS proratedDiskioAvg, AVG(minRamCount/coalesce(ja4.coreCount, 1)) AS proratedMemAvg,
      COUNT(*) AS num_of_jobs, COUNT(*) * coalesce(ja4.coreCount, 1) * CAST(sc_s.cp as DOUBLE PRECISION) AS HS, VO, NUCLEUS
FROM doma_panda.jobsDefined4 ja4, sc_slimmed sc_s
WHERE ja4.computingsite = sc_s.pq
GROUP BY clock_timestamp(), gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus, ja4.coreCount, sc_s.cp, VO, NUCLEUS;


--COMMIT;

--DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
--DBMS_APPLICATION_INFO.SET_CLIENT_INFO( client_info => null);

end;
$body$
LANGUAGE PLPGSQL
SECURITY DEFINER
;
ALTER PROCEDURE update_jobsdef_stats_by_gshare () OWNER TO panda;

-- ========== VERSION UPDATE ==========
UPDATE doma_panda.pandadb_version
SET major=0, minor=0, patch=27
WHERE component='JEDI';

UPDATE doma_panda.pandadb_version
SET major=0, minor=0, patch=27
WHERE component='SERVER';

COMMIT;
