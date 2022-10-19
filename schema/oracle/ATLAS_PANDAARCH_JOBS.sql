BEGIN
dbms_scheduler.create_job(
	job_name => 'CACHE_JOBARCHIVED_DATA_BLOCKS',
	job_type => 'PLSQL_BLOCK',
	job_action => '"	DECLARE
			res DATE;
			BEGIN

			/*important setting for instructing Oracle to avoid direct serial read from the disks*/
			execute immediate ''alter session set "_serial_direct_read"=never'';

			/*recreate the view right after midnight*/
			IF current_date BETWEEN TRUNC(current_date) AND TRUNC(current_date) +10/(24*60) THEN
				ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 30, ''JOBSARCHVIEW_30DAYS'');
			END IF;

			/*cache the whole ATLAS_PANDA.JOBSARCHIVED4 table - about 5.4 GB*/
			SELECT MIN(creationtime) INTO res FROM ATLAS_PANDA.JOBSARCHIVED4 ;

			/*cache the data of the most recent 30 days from ATLAS_PANDAARCH.JOBSARCHIVED table*/
			SELECT MIN(creationtime) INTO res FROM ATLAS_PANDAARCH.JOBSARCHVIEW_30DAYS;
			END;"',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=7;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Job for reading the last 30 days data from ATLAS_PANDAARCH.JOBSARCHIVED table via a view object');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'CACHE_JOBARCHIVED_DATA_BLOCKS2',
	job_type => 'PLSQL_BLOCK',
	job_action => '"	DECLARE
			res DATE;
			BEGIN

			/*important setting for instructing Oracle to avoid direct serial read from the disks*/
			execute immediate ''alter session set "_serial_direct_read"=never'';

			/*recreate the view right after midnight*/
			IF current_date BETWEEN TRUNC(current_date) AND TRUNC(current_date) + 15/(24*60) THEN
				ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 60, ''JOBSARCHVIEW_60DAYS'');
			END IF;

			/* the older 30 days from the 60 days view */
			SELECT MIN(creationtime) INTO res FROM ATLAS_PANDAARCH.JOBSARCHVIEW_60DAYS WHERE modificationtime < (sysdate -30);
			END;"',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=10;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Job for reading 30 days data interval from ATLAS_PANDAARCH.JOBSARCHIVED table with offset of 30 days from now via a view object on the most recent 60 days');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'CACHE_JOBARCHIVED_DATA_BLOCKS3',
	job_type => 'PLSQL_BLOCK',
	job_action => '"	DECLARE
			res DATE;
			BEGIN

			/*important setting for instructing Oracle to avoid direct serial read from the disks*/
			execute immediate ''alter session set "_serial_direct_read"=never'';

			/*recreate the view right after midnight*/
			IF current_date BETWEEN TRUNC(current_date) AND TRUNC(current_date) +15/(24*60) THEN
				ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 90, ''JOBSARCHVIEW_90DAYS'');
			END IF;

			/* the older 30 days from the 90 days view */
			SELECT MIN(creationtime) INTO res FROM ATLAS_PANDAARCH.JOBSARCHVIEW_90DAYS WHERE modificationtime < (sysdate -60);
			END;"',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=10;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Job for reading 30 days data interval from ATLAS_PANDAARCH.JOBSARCHIVED table with offset of 30 days from now via a view object on the most recent 90 days');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'CACHE_JOBARCHIVED_DATA_BLOCKS4',
	job_type => 'PLSQL_BLOCK',
	job_action => '"	DECLARE
			res DATE;
			res2 DATE;
			BEGIN

			/*important setting for instructing Oracle to avoid direct serial read from the disks*/
			execute immediate ''alter session set "_serial_direct_read"=never'';

			/*recreate the view right after midnight*/
			IF current_date BETWEEN TRUNC(current_date) AND TRUNC(current_date) +20/(24*60) THEN
				ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 120, ''JOBSARCHVIEW_120DAYS'');
			END IF;

			/* the older 30 days from the 120 days view */
			SELECT MIN(creationtime) INTO res FROM ATLAS_PANDAARCH.JOBSARCHVIEW_120DAYS WHERE modificationtime < (sysdate -90);

			/* the JEDI_JOB_RETRY_HISTORY data has to be cached as well */
			select MIN(INS_UTC_TSTAMP),MAX(INS_UTC_TSTAMP) INTO res, res2 from ATLAS_PANDA.JEDI_JOB_RETRY_HISTORY;

			END;"',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=18;',
	auto_drop => FALSE,
	enabled => FALSE,
	comments =>  'Job for reading 30 days data interval from ATLAS_PANDAARCH.JOBSARCHIVED table with offset of 30 days from now via a view object on the most recent 120 days');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'CACHE_JOBARCHIVED_INDEX1',
	job_type => 'PLSQL_BLOCK',
	job_action => '"	DECLARE
			res NUMBER;
			BEGIN
			/*important setting for instructing Oracle to avoid direct serial read from the disks*/
			execute immediate ''alter session set "_serial_direct_read"=never'';

			SELECT /*+ INDEX_FFS(tab JOBS_UPPER_PRODUSERNAME_IDX) */ count(UPPER(PRODUSERNAME)) INTO res
			from ATLAS_PANDAARCH.JOBSARCHIVED tab WHERE UPPER(PRODUSERNAME) is not null ;

			SELECT /*+ INDEX_FFS(tab JOBS_JEDITASKID_PANDAID_IDX) */ count(JEDITASKID)  INTO res
			from ATLAS_PANDAARCH.JOBSARCHIVED tab WHERE JEDITASKID is not null ;

			END;"',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=15;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Job for traversing the JOBS_UPPER_PRODUSERNAME_IDX and JOBS_JEDITASKID_PANDAID_IDX leaf blocks in order to keep them in the cache');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'REDEFINE_VIEWS',
	job_type => 'PLSQL_BLOCK',
	job_action => '"BEGIN ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 7, ''JOBSARCHVIEW_7DAYS'');
			ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 15, ''JOBSARCHVIEW_15DAYS'');
			ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 30, ''JOBSARCHVIEW_30DAYS'');
			ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 60, ''JOBSARCHVIEW_60DAYS'');
			ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 90, ''JOBSARCHVIEW_90DAYS'');
			ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 180, ''JOBSARCHVIEW_180DAYS'');
			ATLAS_PANDAARCH.GENERATE_TIMERANGE_VIEWS(''JOBSARCHIVED'', 365, ''JOBSARCHVIEW_365DAYS'');
		  END;"',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=1;',
	auto_drop => FALSE,
	enabled => FALSE,
	comments =>  '');
END;