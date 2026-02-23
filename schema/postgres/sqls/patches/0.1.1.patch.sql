-- patch to be used to upgrade from version 0.1.0

ALTER TABLE doma_panda.mv_jobsactive4_stats
  ADD COLUMN resource_type varchar(56);

COMMENT ON COLUMN mv_jobsactive4_stats.vo IS E'Virtual organization ';
COMMENT ON COLUMN mv_jobsactive4_stats.workqueue_id IS E'Work queue identifier';
COMMENT ON COLUMN mv_jobsactive4_stats.resource_type IS E'Resource type (SCORE, MCORE...)';

CREATE OR REPLACE PROCEDURE doma_panda.update_jobsactive_stats () AS $body$
BEGIN

-- 2026 02 23, ver 1.4 , added RESOURCE_TYPE column
-- ver 1.3 , last modified on 2nd September 2024
-- added NUM_OF_CORES columns
-- ver 1.2 , last modified on 2th July 2013
-- added VO and WORKQUEUE_ID columns
-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
--DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Aggregates data for the active jobs!');
--DBMS_APPLICATION_INFO.SET_CLIENT_INFO( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );


DELETE from doma_panda.mv_jobsactive4_stats;

INSERT INTO doma_panda.mv_jobsactive4_stats(CUR_DATE,
  CLOUD,
  COMPUTINGSITE,
  COUNTRYGROUP,
  WORKINGGROUP,
  RELOCATIONFLAG,
  JOBSTATUS,
  PROCESSINGTYPE,
  PRODSOURCELABEL,
  CURRENTPRIORITY,
  VO,
  WORKQUEUE_ID,
  NUM_OF_JOBS,
  NUM_OF_CORES,
  RESOURCE_TYPE
  )
  SELECT
    clock_timestamp(),
    cloud,
    computingSite,
    countrygroup,
    workinggroup,
    relocationflag,
    jobStatus,
    processingType,
    prodSourceLabel,
    TRUNC(currentPriority, -1) AS currentPriority,
    VO,
    WORKQUEUE_ID,
    COUNT(*)  AS num_of_jobs,
    SUM(COALESCE(actualcorecount, corecount)) AS num_of_cores
  FROM jobsActive4
  GROUP BY
    clock_timestamp(),
    cloud,
    computingSite,
    countrygroup,
    workinggroup,
    relocationflag,
    jobStatus,
    processingType,
    prodSourceLabel,
    TRUNC(currentPriority, -1),
    VO,
    WORKQUEUE_ID,
    RESOURCE_TYPE;
--COMMIT;

--DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
--DBMS_APPLICATION_INFO.SET_CLIENT_INFO( client_info => null);

end;
$body$
LANGUAGE PLPGSQL
SECURITY DEFINER
;
ALTER PROCEDURE doma_panda.update_jobsactive_stats () OWNER TO panda;
-- REVOKE ALL ON PROCEDURE doma_panda.update_jobsactive_stats () FROM PUBLIC;

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 1
WHERE component = 'PanDA';

