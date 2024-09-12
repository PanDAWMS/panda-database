-- patch to be used to upgrade from version 0.0.18
ALTER TABLE doma_panda.mv_jobsactive4_stats ADD COLUMN num_of_cores bigint;
COMMENT ON COLUMN doma_panda.mv_jobsactive4_stats.num_of_cores IS E'Number of cores computed by grouping all set of attributes(columns) listed in that column';

CREATE OR REPLACE PROCEDURE doma_panda.update_jobsactive_stats () AS $body$
BEGIN

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
  NUM_OF_CORES
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
  FROM doma_panda.jobsActive4
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
    WORKQUEUE_ID;
--COMMIT;

--DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
--DBMS_APPLICATION_INFO.SET_CLIENT_INFO( client_info => null);

end;
$body$
LANGUAGE PLPGSQL
SECURITY DEFINER
;
ALTER PROCEDURE update_jobsactive_stats () OWNER TO panda;


CREATE SEQUENCE rating_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE rating_seq OWNER TO panda;

CREATE TABLE rating (
	ratingid bigint NOT NULL,
    rating bigint,
    userid smallint,
    jeditaskid bigint,
    feedback varchar(4000),
    added timestamp DEFAULT CURRENT_TIMESTAMP
) ;
ALTER TABLE rating OWNER TO panda;
CREATE INDEX rating_added_idx ON rating (added);
CREATE INDEX rating_jeditaskid_idx ON rating (jeditaskid);
ALTER TABLE visits ADD PRIMARY KEY (ratingid);

DROP TRIGGER IF EXISTS rating_trigger ON rating CASCADE;
CREATE OR REPLACE FUNCTION trigger_fct_rating_trigger() RETURNS trigger AS $BODY$
BEGIN
  SELECT nextval('rating_seq')
  INTO STRICT   NEW.RATINGID
;
RETURN NEW;
END
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION trigger_fct_rating_trigger() OWNER TO panda;

CREATE TRIGGER rating_trigger
	BEFORE INSERT ON rating FOR EACH ROW
	EXECUTE PROCEDURE trigger_fct_rating_trigger();

-- Update versions
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=19 where component='JEDI';
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=19 where component='SERVER';
COMMIT;

