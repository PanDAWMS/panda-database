-- Description: Materialized views for MONIT
-- Author:      Edward Karavakis <edward.karavakis@cern.ch>
-- Created:     September 2025

-- Materialized view for submitted jobs
CREATE MATERIALIZED VIEW atlas_panda.mv_monit_jobs_submitted
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT
  jm.*,
  prodsys.simulation_type AS "simulation_type",
  jeditasks.framework     AS "framework"
FROM (
    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        taskid AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, corecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        reqid,
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type"
    FROM atlas_panda.jobsactive4
    WHERE creationtime >= (CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) - 1)
      AND jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled','running','holding','transferring','merging')
      AND cloud <> 'OSG'
      AND NOT (
            creationtime    <= CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE)
        AND modificationtime >  CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE)
      )

    UNION ALL

    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        taskid AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, corecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        reqid,
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type"
    FROM atlas_panda.jobsdefined4
    WHERE creationtime >= (CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) - 1)
      AND jobstatus IS NOT NULL
      AND cloud <> 'OSG'
      AND NOT (
            creationtime    <= CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE)
        AND modificationtime >  CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE)
      )

    UNION ALL

    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        taskid AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, corecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        reqid,
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type"
    FROM atlas_panda.jobsarchived4
    WHERE creationtime >= (CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) - 1)
      AND cloud <> 'OSG'
      AND NOT (
            creationtime    <= CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE)
        AND modificationtime >  CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE)
      )
) jm
LEFT JOIN atlas_panda.jedi_tasks jeditasks
  ON jeditasks.jeditaskid = jm.jeditaskid
LEFT JOIN atlas_deft.t_production_task prodsys
  ON prodsys.taskid = jm."taskid"
WHERE "atlasjobstatus" NOT IN ('pending','defined','waiting');
/

CREATE MATERIALIZED VIEW atlas_panda.mv_monit_jobs_current
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT
  jm.*,
  prodsys.simulation_type AS "simulation_type",
  jeditasks.framework     AS "framework"
FROM (
    /* -------- jobsactive4 -------- */
    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        taskid AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, corecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        reqid,
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type"
    FROM atlas_panda.jobsactive4
    WHERE (
            statechangetime >= (CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) - (2/24))
         OR jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled','running','holding','transferring','merging')
          )
      AND cloud <> 'OSG'
      AND jobstatus <> 'failed'

    UNION ALL

    /* -------- jobsdefined4 -------- */
    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        taskid AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, corecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        reqid,
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type"
    FROM atlas_panda.jobsdefined4
    WHERE jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled','running','holding','transferring','merging')
      AND cloud <> 'OSG'

    UNION ALL

    /* -------- jobswaiting4 -------- */
    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        taskid AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, corecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        reqid,
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type"
    FROM atlas_panda.jobswaiting4
    WHERE jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled','running','holding','transferring','merging')
      AND cloud <> 'OSG'

    UNION ALL

    /* -------- jobsarchived4 -------- */
    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        taskid AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, corecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        reqid,
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type"
    FROM atlas_panda.jobsarchived4
    WHERE statechangetime >= (CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) - (2/24))
      AND jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled','running','holding','transferring','merging')
      AND cloud <> 'OSG'
) jm
LEFT JOIN atlas_panda.jedi_tasks jeditasks
  ON jeditasks.jeditaskid = jm.jeditaskid
LEFT JOIN atlas_deft.t_production_task prodsys
  ON prodsys.taskid = jm."taskid";
/

CREATE MATERIALIZED VIEW atlas_panda.mv_monit_jobs_completed
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT
  jm.*,
  prodsys.simulation_type AS "simulation_type",
  jeditasks.framework     AS "framework"
FROM (
    /* -------- jobsactive4 -------- */
    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        COALESCE(taskid, -1) AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        COALESCE(reqid, -1) AS "reqid",
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type",
        gco2_global,
        gco2_regional
    FROM atlas_panda.jobsactive4
    WHERE statechangetime >= (CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) - 1)
      AND jobstatus NOT IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled','running','holding','transferring','merging')
      AND cloud <> 'OSG'

    UNION ALL

    /* -------- jobsarchived4 -------- */
    SELECT
        pandaid AS "pandaid",
        jobname AS "jobname",
        COALESCE(taskid, -1) AS "taskid",
        parentid AS "parentid",
        prodsourcelabel AS "prodsourcelabel",
        TO_CHAR(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime",
        jobdefinitionid AS "jobdefinitionid",
        schedulerid AS "schedulerid",
        TO_CHAR(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime",
        creationhost AS "creationhost",
        modificationhost AS "modificationhost",
        atlasrelease AS "atlasrelease",
        transformation AS "transformation",
        produserid AS "produserid",
        attemptnr AS "attemptnr",
        jobstatus AS "atlasjobstatus",
        CASE
            WHEN jobstatus IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled') THEN 'pending'
            WHEN jobstatus IN ('holding','transferring','merging') THEN 'finalising'
            ELSE jobstatus
        END AS "jobstatus",
        TO_CHAR(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        TO_CHAR(endtime,   'YYYY-MM-DD HH24:MI:SS') "endtime",
        cpuconsumptiontime,
        cpuconsumptionunit,
        transexitcode,
        piloterrorcode,
        piloterrordiag,
        exeerrorcode,
        exeerrordiag,
        ddmerrorcode,
        ddmerrordiag,
        jobdispatchererrorcode,
        jobdispatchererrordiag,
        taskbuffererrorcode,
        taskbuffererrordiag,
        computingsite,
        computingelement,
        proddblock,
        destinationdblock,
        destinationse,
        nevents,
        cpuconversion,
        processingtype,
        produsername,
        ninputdatafiles,
        inputfiletype,
        inputfileproject,
        inputfilebytes,
        workinggroup,
        cloud,
        jobsetid,
        sourcesite,
        maxattempt,
        pilottiming,
        specialhandling,
        noutputdatafiles,
        outputfilebytes,
        jobmetrics,
        corecount,
        batchid,
        transfertype,
        eventservice,
        gshare,
        hs06,
        CAST(statechangetime AS TIMESTAMP) "statechangetime",
        COALESCE(actualcorecount, 1) AS "actualcorecount",
        assignedpriority,
        avgpss,
        avgrss,
        avgswap,
        avgvmem,
        cmtconfig,
        commandtopilot,
        countrygroup,
        currentpriority,
        dispatchdblock,
        failedattempt,
        hs06sec,
        homepackage,
        maxcpucount,
        maxdiskcount,
        maxpss,
        maxrss,
        maxswap,
        maxvmem,
        maxwalltime,
        minramcount,
        nucleus,
        raterbytes,
        raterchar,
        ratewbytes,
        ratewchar,
        COALESCE(reqid, -1) AS "reqid",
        totrbytes,
        totrchar,
        totwchar,
        totwbytes,
        workqueue_id,
        jeditaskid,
        pilotid,
        TO_CHAR(
            TRUNC(SYS_EXTRACT_UTC(SYSTIMESTAMP),'MI')
            - NUMTODSINTERVAL(MOD(EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)), 10), 'MINUTE'),
            'YYYY-MM-DD HH24:MI:SS'
        ) AS "currenttime",
        container_name,
        resource_type AS "job_resource_type",
        gco2_global,
        gco2_regional
    FROM atlas_panda.jobsarchived4
    WHERE statechangetime >= (CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE) - 1)
      AND jobstatus NOT IN ('pending','defined','waiting','assigned','activated','sent','starting','throttled','running','holding','transferring','merging')
      AND cloud <> 'OSG'
) jm
LEFT JOIN atlas_panda.jedi_tasks jeditasks
  ON jeditasks.jeditaskid = jm.jeditaskid
LEFT JOIN atlas_deft.t_production_task prodsys
  ON prodsys.taskid = jm."taskid";
/

GRANT SELECT ON atlas_panda.mv_monit_jobs_submitted TO atlas_panda_reader;
GRANT SELECT ON atlas_panda.mv_monit_jobs_current   TO atlas_panda_reader;
GRANT SELECT ON atlas_panda.mv_monit_jobs_completed TO atlas_panda_reader;


-- Scheduler job to refresh the MONIT materialized views every 10 minutes
BEGIN
  DBMS_SCHEDULER.CREATE_JOB(
    job_name        => 'ATLAS_PANDA.MONIT_MV_REFRESH_10MIN',
    job_type        => 'PLSQL_BLOCK',
    job_action      => q'[
      BEGIN
        -- Build new contents elsewhere, then atomically swap (no "empty MV" window):
        DBMS_MVIEW.REFRESH(
          list             => 'ATLAS_PANDA.MV_MONIT_JOBS_SUBMITTED,ATLAS_PANDA.MV_MONIT_JOBS_CURRENT,ATLAS_PANDA.MV_MONIT_JOBS_COMPLETED',
          method           => 'C',       -- COMPLETE refresh
          atomic_refresh   => FALSE,     -- required with out_of_place
          out_of_place     => TRUE,      -- keep MV readable during refresh
          parallelism      => 0          -- set >0 to allow parallel DML
        );
      END;
    ]',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=MINUTELY;INTERVAL=10;BYSECOND=0',
    auto_drop       => FALSE,
    enabled         => TRUE,
    comments        => 'Out-of-place COMPLETE refresh of MONIT MVs every 10 minutes'
  );
END;
/

-- Start exactly on the next :00/:10/:20…
DECLARE
  v_start TIMESTAMP WITH TIME ZONE;
BEGIN
  v_start :=
    CAST(TRUNC(SYSTIMESTAMP, 'MI') AS TIMESTAMP WITH TIME ZONE)
    + NUMTODSINTERVAL(10 - MOD(EXTRACT(MINUTE FROM SYSTIMESTAMP), 10), 'MINUTE');

  DBMS_SCHEDULER.SET_ATTRIBUTE(
    name      => 'ATLAS_PANDA.MONIT_MV_REFRESH_10MIN',
    attribute => 'start_date',
    value     => v_start
  );
END;
/

# Move it to ADCR NODE4
BEGIN
  DBMS_SCHEDULER.SET_ATTRIBUTE(
    name      => 'ATLAS_PANDA.MONIT_MV_REFRESH_10MIN',
    attribute => 'JOB_CLASS',
    value     => 'PANDAMON_JOB_CLASS'
  );
END;
/

-- Grant read access to atlas_panda_reader user
GRANT SELECT ON atlas_panda.mv_monit_jobs_submitted TO atlas_panda_reader;
GRANT SELECT ON atlas_panda.mv_monit_jobs_current   TO atlas_panda_reader;
GRANT SELECT ON atlas_panda.mv_monit_jobs_completed TO atlas_panda_reader;