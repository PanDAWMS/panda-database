BEGIN
dbms_scheduler.create_job(
	job_name => 'ADD_DAILYPART_PANDA',
	job_type => 'PLSQL_BLOCK',
	job_action => '"BEGIN ADD_DAILYPART(7, ''JOBSARCHIVED4', ''DOMA_PANDA_DATA02'');
			ADD_DAILYPART(7, ''FILESTABLE4'', ''DOMA_PANDA_DATA02'');
			ADD_DAILYPART(7, ''JOBPARAMSTABLE'', ''DOMA_PANDA_DATA02'');
			ADD_DAILYPART(7, ''METATABLE'', ''DOMA_PANDA_DATA02'');
		  END; "',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY;INTERVAL=1',
	auto_drop => FALSE,
	enabled => TRUE;
    comments =>  '');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'BULKCOPY_PANDAPART_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN BULKCOPY_PANDA_PARTITIONS(''DOMA_PANDAARCH''); END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=DAILY;INTERVAL=1',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  '');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'DROP_PART_JEDI_EVENTS_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN DOMA_PANDA.DELETE_JEDI_EVENTS_PROC;	END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY; BYDAY=MON; BYHOUR=10; BYMINUTE=0; BYSECOND=0;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Every Monday drops all partiotions older than 90 days, where all tasks have statuses in (done, finished, aborted, failed, broken)');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'JEDI_REFR_MINTASKIDS_JOB',
	job_type => 'STORED_PROCEDURE',
	job_action => 'JEDI_REFR_MINTASKIDS_BYSTATUS',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Job for regular update on the MIN task IDs for the operational task statuses in an auxiliary table');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'SL_WINDOW_TASK_ATTEMPTS_1YEAR',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN ATLAS_PANDA.PANDA_TABLE_SL_WINDOW(''TASK_ATTEMPTS'',''STARTTIME'', 365); END; ',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY; BYDAY=TUE; BYHOUR=11; BYMINUTE=0; BYSECOND=0;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Sustains 365 days of data sliding window on the TASK_ATTEMPTS table! The table is partitioned daily using the automatic INTERVAL approach');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'PANDA_DATASETS_90DAYS_SLWINDOW',
	job_type => 'STORED_PROCEDURE',
	job_action => 'DOMA_PANDA.DATASETS_90DAYS_SL_WINDOW',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MONTHLY;INTERVAL=1',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Sustains at least 90 days of data sliding window on the DATASETS table! The table is monthly partitioned using the automatic INTERVAL approach');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'PANDA_HARVEST_DIALOGS_SLWINDOW',
	job_type => 'PLSQL_BLOCK',
	job_action => '"BEGIN
			DOMA_PANDA.PANDA_TABLE_SL_WINDOW(''HARVESTER_DIALOGS'',''CREATIONTIME'', 10);
			END; "',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY; BYDAY=TUE; BYHOUR=11; BYMINUTE=0; BYSECOND=0;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Sustains at least 7 days of data sliding window on the DOMA_PANDA.HARVERSTER_DIALOGS table. The table is daily partitioned using the automatic INTERVAL approach.');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'PANDA_HARVEST_WORKERS_SLWINDOW',
	job_type => 'PLSQL_BLOCK',
	job_action => '"BEGIN
			DOMA_PANDA.HARVESTER_WORKERS_sl_window(60);
			END; "',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY; BYDAY=MON; BYHOUR=10; BYMINUTE=0; BYSECOND=0;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Sustains at least 60 days of data sliding window on the HARVESTER_WORKERS table. The table is monthly partitioned using the automatic INTERVAL approach');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'PANDA_JOBS_STATUSLOG_SLWINDOW',
	job_type => 'PLSQL_BLOCK',
	job_action => '"BEGIN
			DOMA_PANDA.JOBS_STATUSLOG_SL_WINDOW(93);
			END; "',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY; BYDAY=MON; BYHOUR=09; BYMINUTE=0; BYSECOND=0;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Sustains at least 90 days of data sliding window on the JOBS_DATASETS table! The table is daily partitioned using the automatic INTERVAL approach');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'PANDA_PANDALOG_SLWINDOW',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN DOMA_PANDA.PANDALOG_SL_WINDOW('PANDALOG', 10); END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=DAILY;INTERVAL=1',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Sustains at least 3 days of data sliding window on the PANDALOG table! The table is daily partitioned using the automatic INTERVAL approach');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'PANDA_TAB_INDICES_REBUILD',
	job_type => 'PLSQL_BLOCK',
	job_action => '"BEGIN
			REBUILD_TABLE_INDICES(''DOMA_PANDA'', ''JOBSACTIVE4'', ''DOMA_PANDA_DATA02'');
			REBUILD_TABLE_INDICES(''DOMA_PANDA'', ''JOBSDEFINED4'', ''DOMA_PANDA_DATA02'');
			REBUILD_TABLE_INDICES(''DOMA_PANDA'', ''JOBSWAITING4'', ''DOMA_PANDA_DATA02'');
			END; "',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY; BYDAY=MON',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Rebuilds the indices of the JOBSACTIVE4, JOBSDEFINED4 and JOBSWAITING4 tables once a week (on Mondays) as their content is quite dynamic');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'PANDA_TASKS_STATUSLOG_SLWINDOW',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN TASKS_STATUSLOG_SL_WINDOW(); END; ',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=WEEKLY; BYDAY=MON; BYHOUR=10; BYMINUTE=0; BYSECOND=0;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'job for removing old partitions on the tasks_statuslog table');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'UPDATE_JOBSACTIVE_STATS_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN UPDATE_JOBSACTIVE_STATS(); END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=2;',
	auto_drop => TRUE,
	enabled => TRUE,
	comments =>  '');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'UPDATE_RUN_JUMBO_COUNT_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN UPDATE_RUN_JUMBO_COUNT(); END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=2;',
	auto_drop => TRUE,
	enabled => TRUE,
	comments =>  '');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'UPDATE_JOBS_BY_GSHARE_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => '"BEGIN DOMA_PANDA.UPDATE_JOBSACT_STATS_BY_GSHARE;	END;"',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=1;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Every minute refreshes the data in JOBS_SHARE_STATS table.');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'UPDT_JOBSDEF_STATS_BY_GSH_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN ATLAS_PANDA.UPDATE_JOBSDEF_STATS_BY_GSHARE;	END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=1;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Every minute refreshes the data in JOBS_SHARE_STATS table.');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'UPDATE_JOB_STATS_HP_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN ATLAS_PANDA.UPDATE_JOB_STATS_HP;	END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=1;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Every minute refreshes the data in JOBS_SHARE_STATS table.');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'UPDATE_TOTAL_WALLTIME_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN UPDATE_TOTAL_WALLTIME(); END; ',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=5;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Job for calculation of queued walltime.');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'UPD_NUM_INPUT_DATA_FILES_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN UPDATE_NUM_INPUT_DATA_FILES(); END; ',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=MINUTELY;INTERVAL=30;',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  'Job for regular calculation of number of input files.');
END;

BEGIN
dbms_scheduler.create_job(
	job_name => 'VERIF_AND_DROP_PANDAPART_JOB',
	job_type => 'PLSQL_BLOCK',
	job_action => 'BEGIN VERIF_DROP_COPIEDPANDAPART(''DOMA_PANDAARCH'', 2); END;',
	start_date => SYSTIMESTAMP,
	repeat_interval => 'FREQ=DAILY;INTERVAL=1',
	auto_drop => FALSE,
	enabled => TRUE,
	comments =>  '');
END;
