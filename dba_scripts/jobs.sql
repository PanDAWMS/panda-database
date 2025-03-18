-- Retrieve details of existing job schedules with names starting with 'ADD_DAILYPART_PANDA'
SELECT * FROM user_scheduler_jobs
WHERE job_name LIKE 'ADD_DAILYPART_PANDA%';

-- Retrieve execution log, excluding 'UPDATE_TOTAL_WALLTIME_JOB'
SELECT * FROM USER_SCHEDULER_JOB_LOG
WHERE job_name != 'UPDATE_TOTAL_WALLTIME_JOB'
ORDER BY LOG_DATE DESC;

-- Retrieve execution details, excluding 'UPDATE_TOTAL_WALLTIME_JOB'
SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS
WHERE job_name != 'UPDATE_TOTAL_WALLTIME_JOB'
ORDER BY LOG_DATE DESC;

