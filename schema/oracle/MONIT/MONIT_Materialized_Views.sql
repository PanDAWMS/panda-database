-- Description: Materialized views for MONIT
-- Author:      Edward Karavakis <edward.karavakis@cern.ch>
-- Created:     September 2025

-- Materialized view for submitted jobs
CREATE MATERIALIZED VIEW atlas_panda.mv_monit_jobs_submitted
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
select jm.*, prodsys.simulation_type as "simulation_type"
from (
    select pandaid as "pandaid", jobname as "jobname", taskid as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus",
        to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime", to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime,
        cpuconsumptionunit, transexitcode, piloterrorcode, piloterrordiag,
        exeerrorcode, exeerrordiag, ddmerrorcode, ddmerrordiag,
        jobdispatchererrorcode, jobdispatchererrordiag, taskbuffererrorcode,
        taskbuffererrordiag, computingsite, computingelement, proddblock,
        destinationdblock, destinationse, nevents, cpuconversion,
        processingtype, produsername, ninputdatafiles, inputfiletype,
        inputfileproject, inputfilebytes, workinggroup, cloud, jobsetid,
        sourcesite, maxattempt, pilottiming, specialhandling,
        noutputdatafiles, outputfilebytes, jobmetrics, corecount,
        batchid, transfertype, eventservice, gshare, hs06,
        to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, corecount, 1) as "actualcorecount",
        assignedpriority, avgpss, avgrss, avgswap, avgvmem, cmtconfig,
        commandtopilot, countrygroup, currentpriority, dispatchdblock,
        failedattempt, hs06sec, homepackage, maxcpucount, maxdiskcount,
        maxpss, maxrss, maxswap, maxvmem, maxwalltime, minramcount,
        nucleus, raterbytes, raterchar, ratewbytes, ratewchar,
        reqid, totrbytes, totrchar, totwchar, totwbytes, workqueue_id,
        jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type"
    from atlas_panda.jobsactive4
    where creationtime >= sys_extract_utc(SYSTIMESTAMP) - INTERVAL '2' HOUR
        and jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled', 'running', 'holding', 'transferring', 'merging')
        and cloud != 'OSG'
        and not (creationtime <= sys_extract_utc(SYSTIMESTAMP) AND modificationtime > sys_extract_utc(SYSTIMESTAMP))
    union all
    select pandaid as "pandaid", jobname as "jobname", taskid as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus", to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime, cpuconsumptionunit,
        transexitcode, piloterrorcode, piloterrordiag, exeerrorcode,
        exeerrordiag, ddmerrorcode, ddmerrordiag,
        jobdispatchererrorcode, jobdispatchererrordiag, taskbuffererrorcode,
        taskbuffererrordiag, computingsite, computingelement, proddblock,
        destinationdblock, destinationse, nevents, cpuconversion, processingtype,
        produsername, ninputdatafiles, inputfiletype, inputfileproject,
        inputfilebytes, workinggroup, cloud, jobsetid, sourcesite, maxattempt,
        pilottiming, specialhandling, noutputdatafiles, outputfilebytes, jobmetrics,
        corecount, batchid, transfertype, eventservice, gshare, hs06,
        to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, corecount, 1) as "actualcorecount", assignedpriority,
        avgpss, avgrss, avgswap, avgvmem, cmtconfig, commandtopilot,
        countrygroup, currentpriority, dispatchdblock, failedattempt, hs06sec,
        homepackage, maxcpucount, maxdiskcount, maxpss, maxrss, maxswap,
        maxvmem, maxwalltime, minramcount, nucleus, raterbytes, raterchar,
        ratewbytes, ratewchar, reqid, totrbytes, totrchar, totwchar, totwbytes,
        workqueue_id, jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type"
    from atlas_panda.jobsdefined4
    where creationtime >= sys_extract_utc(SYSTIMESTAMP) - interval '2' hour
        and jobstatus is not null
        and cloud != 'OSG'
        and not (creationtime <= sys_extract_utc(SYSTIMESTAMP) AND modificationtime > sys_extract_utc(SYSTIMESTAMP))
    union all
    select pandaid as "pandaid", jobname as "jobname", taskid as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus", to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime, cpuconsumptionunit,
        transexitcode, piloterrorcode, piloterrordiag, exeerrorcode,
        exeerrordiag, ddmerrorcode, ddmerrordiag, jobdispatchererrorcode,
        jobdispatchererrordiag, taskbuffererrorcode, taskbuffererrordiag,
        computingsite, computingelement, proddblock, destinationdblock,
        destinationse, nevents, cpuconversion, processingtype,
        produsername, ninputdatafiles, inputfiletype, inputfileproject,
        inputfilebytes, workinggroup, cloud, jobsetid, sourcesite, maxattempt,
        pilottiming, specialhandling, noutputdatafiles, outputfilebytes,
        jobmetrics, corecount, batchid, transfertype, eventservice, gshare,
        hs06, to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, corecount, 1) as "actualcorecount",
        assignedpriority, avgpss, avgrss, avgswap, avgvmem, cmtconfig,
        commandtopilot, countrygroup, currentpriority, dispatchdblock,
        failedattempt, hs06sec, homepackage, maxcpucount, maxdiskcount, maxpss,
        maxrss, maxswap, maxvmem, maxwalltime, minramcount, nucleus,
        raterbytes, raterchar, ratewbytes, ratewchar, reqid, totrbytes,
        totrchar, totwchar, totwbytes, workqueue_id, jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type"
    from atlas_panda.jobsarchived4
    where creationtime >= sys_extract_utc(SYSTIMESTAMP) - interval '2' hour
        and cloud != 'OSG'
        and not (creationtime <= sys_extract_utc(SYSTIMESTAMP) AND modificationtime > sys_extract_utc(SYSTIMESTAMP))
) jm
left join atlas_deft.t_production_task prodsys on prodsys.taskid = jm."taskid"
where "atlasjobstatus" not in ('pending', 'defined', 'waiting');


-- Materialized view for current jobs
CREATE MATERIALIZED VIEW atlas_panda.mv_monit_jobs_current
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
select jm.*, prodsys.simulation_type as "simulation_type"
from (
    select pandaid as "pandaid", jobname as "jobname", taskid as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus",
        to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime", to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime,
        cpuconsumptionunit, transexitcode, piloterrorcode, piloterrordiag,
        exeerrorcode, exeerrordiag, ddmerrorcode, ddmerrordiag,
        jobdispatchererrorcode, jobdispatchererrordiag, taskbuffererrorcode,
        taskbuffererrordiag, computingsite, computingelement, proddblock,
        destinationdblock, destinationse, nevents, cpuconversion,
        processingtype, produsername, ninputdatafiles, inputfiletype,
        inputfileproject, inputfilebytes, workinggroup, cloud, jobsetid,
        sourcesite, maxattempt, pilottiming, specialhandling,
        noutputdatafiles, outputfilebytes, jobmetrics, corecount,
        batchid, transfertype, eventservice, gshare, hs06,
        to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, corecount, 1) as "actualcorecount",
        assignedpriority, avgpss, avgrss, avgswap, avgvmem, cmtconfig,
        commandtopilot, countrygroup, currentpriority, dispatchdblock,
        failedattempt, hs06sec, homepackage, maxcpucount, maxdiskcount,
        maxpss, maxrss, maxswap, maxvmem, maxwalltime, minramcount,
        nucleus, raterbytes, raterchar, ratewbytes, ratewchar,
        reqid, totrbytes, totrchar, totwchar, totwbytes, workqueue_id,
        jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type"
    from atlas_panda.jobsactive4
    where ((statechangetime >= sys_extract_utc(SYSTIMESTAMP))
        or jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled', 'running', 'holding', 'transferring', 'merging')
        and cloud != 'OSG') and jobstatus not in ('failed')
    union all
    select pandaid as "pandaid", jobname as "jobname", taskid as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus", to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime, cpuconsumptionunit,
        transexitcode, piloterrorcode, piloterrordiag, exeerrorcode,
        exeerrordiag, ddmerrorcode, ddmerrordiag,
        jobdispatchererrorcode, jobdispatchererrordiag, taskbuffererrorcode,
        taskbuffererrordiag, computingsite, computingelement, proddblock,
        destinationdblock, destinationse, nevents, cpuconversion, processingtype,
        produsername, ninputdatafiles, inputfiletype, inputfileproject,
        inputfilebytes, workinggroup, cloud, jobsetid, sourcesite, maxattempt,
        pilottiming, specialhandling, noutputdatafiles, outputfilebytes, jobmetrics,
        corecount, batchid, transfertype, eventservice, gshare, hs06,
        to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, corecount, 1) as "actualcorecount", assignedpriority,
        avgpss, avgrss, avgswap, avgvmem, cmtconfig, commandtopilot,
        countrygroup, currentpriority, dispatchdblock, failedattempt, hs06sec,
        homepackage, maxcpucount, maxdiskcount, maxpss, maxrss, maxswap,
        maxvmem, maxwalltime, minramcount, nucleus, raterbytes, raterchar,
        ratewbytes, ratewchar, reqid, totrbytes, totrchar, totwchar, totwbytes,
        workqueue_id, jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type"
    from atlas_panda.jobsdefined4
    where jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled', 'running', 'holding', 'transferring', 'merging')
        and cloud != 'OSG'
    union all
    select pandaid as "pandaid", jobname as "jobname", taskid as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus", to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime, cpuconsumptionunit,
        transexitcode, piloterrorcode, piloterrordiag, exeerrorcode,
        exeerrordiag, ddmerrorcode, ddmerrordiag,
        jobdispatchererrorcode, jobdispatchererrordiag, taskbuffererrorcode,
        taskbuffererrordiag, computingsite, computingelement, proddblock,
        destinationdblock, destinationse, nevents, cpuconversion, processingtype,
        produsername, ninputdatafiles, inputfiletype, inputfileproject,
        inputfilebytes, workinggroup, cloud, jobsetid, sourcesite, maxattempt,
        pilottiming, specialhandling, noutputdatafiles, outputfilebytes, jobmetrics,
        corecount, batchid, transfertype, eventservice, gshare, hs06,
        to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, corecount, 1) as "actualcorecount", assignedpriority,
        avgpss, avgrss, avgswap, avgvmem, cmtconfig, commandtopilot, countrygroup,
        currentpriority, dispatchdblock, failedattempt, hs06sec, homepackage,
        maxcpucount, maxdiskcount, maxpss, maxrss, maxswap, maxvmem,
        maxwalltime, minramcount, nucleus, raterbytes, raterchar,
        ratewbytes, ratewchar, reqid, totrbytes, totrchar, totwchar,
        totwbytes, workqueue_id, jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type"
    from atlas_panda.jobswaiting4
    where jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled', 'running', 'holding', 'transferring', 'merging')
        and cloud != 'OSG'
    union all
    select pandaid as "pandaid", jobname as "jobname", taskid as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus", to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime, cpuconsumptionunit,
        transexitcode, piloterrorcode, piloterrordiag, exeerrorcode,
        exeerrordiag, ddmerrorcode, ddmerrordiag, jobdispatchererrorcode,
        jobdispatchererrordiag, taskbuffererrorcode, taskbuffererrordiag,
        computingsite, computingelement, proddblock, destinationdblock,
        destinationse, nevents, cpuconversion, processingtype,
        produsername, ninputdatafiles, inputfiletype, inputfileproject,
        inputfilebytes, workinggroup, cloud, jobsetid, sourcesite, maxattempt,
        pilottiming, specialhandling, noutputdatafiles, outputfilebytes,
        jobmetrics, corecount, batchid, transfertype, eventservice, gshare,
        hs06, to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, corecount, 1) as "actualcorecount",
        assignedpriority, avgpss, avgrss, avgswap, avgvmem, cmtconfig,
        commandtopilot, countrygroup, currentpriority, dispatchdblock,
        failedattempt, hs06sec, homepackage, maxcpucount, maxdiskcount, maxpss,
        maxrss, maxswap, maxvmem, maxwalltime, minramcount, nucleus,
        raterbytes, raterchar, ratewbytes, ratewchar, reqid, totrbytes,
        totrchar, totwchar, totwbytes, workqueue_id, jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type"
    from atlas_panda.jobsarchived4
    where statechangetime >= sys_extract_utc(SYSTIMESTAMP)
        and jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled', 'running', 'holding', 'transferring', 'merging')
        and cloud != 'OSG'
) jm
left join atlas_deft.t_production_task prodsys on prodsys.taskid = jm."taskid"
order by "statechangetime";

-- Materialized view for completed jobs
CREATE MATERIALIZED VIEW atlas_panda.mv_monit_jobs_completed
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
select jm.*, prodsys.simulation_type as "simulation_type"
from (
    select pandaid as "pandaid", jobname as "jobname", coalesce(taskid, -1) as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus",
        to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime", to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime,
        cpuconsumptionunit, transexitcode, piloterrorcode, piloterrordiag,
        exeerrorcode, exeerrordiag, ddmerrorcode, ddmerrordiag,
        jobdispatchererrorcode, jobdispatchererrordiag, taskbuffererrorcode,
        taskbuffererrordiag, computingsite, computingelement, proddblock,
        destinationdblock, destinationse, nevents, cpuconversion,
        processingtype, produsername, ninputdatafiles, inputfiletype,
        inputfileproject, inputfilebytes, workinggroup, cloud, jobsetid,
        sourcesite, maxattempt, pilottiming, specialhandling,
        noutputdatafiles, outputfilebytes, jobmetrics, corecount,
        batchid, transfertype, eventservice, gshare, hs06,
        to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, 1) as "actualcorecount",
        assignedpriority, avgpss, avgrss, avgswap, avgvmem, cmtconfig,
        commandtopilot, countrygroup, currentpriority, dispatchdblock,
        failedattempt, hs06sec, homepackage, maxcpucount, maxdiskcount,
        maxpss, maxrss, maxswap, maxvmem, maxwalltime, minramcount,
        nucleus, raterbytes, raterchar, ratewbytes, ratewchar,
        coalesce(reqid, -1) as "reqid", totrbytes, totrchar, totwchar, totwbytes, workqueue_id,
        jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type", gco2_global, gco2_regional
    from atlas_panda.jobsactive4
    where (statechangetime >= sys_extract_utc(SYSTIMESTAMP) - interval '10' minute)
        and jobstatus not in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled', 'running', 'holding', 'transferring', 'merging')
        and cloud != 'OSG'
    union all
    select pandaid as "pandaid", jobname as "jobname", coalesce(taskid, -1) as "taskid", parentid as "parentid", prodsourcelabel as "prodsourcelabel",
        to_char(modificationtime, 'YYYY-MM-DD HH24:MI:SS') "modificationtime", jobdefinitionid as "jobdefinitionid", schedulerid as "schedulerid",
        to_char(creationtime, 'YYYY-MM-DD HH24:MI:SS') "creationtime", creationhost as "creationhost", modificationhost as "modificationhost",
        atlasrelease as "atlasrelease", transformation as "transformation", produserid as "produserid", attemptnr as "attemptnr", jobstatus as "atlasjobstatus",
        case when jobstatus in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled') then 'pending'
            when jobstatus in ('holding', 'transferring', 'merging') then 'finalising'
            else jobstatus
            end as "jobstatus", to_char(starttime, 'YYYY-MM-DD HH24:MI:SS') "starttime",
        to_char(endtime, 'YYYY-MM-DD HH24:MI:SS') "endtime", cpuconsumptiontime, cpuconsumptionunit,
        transexitcode, piloterrorcode, piloterrordiag, exeerrorcode,
        exeerrordiag, ddmerrorcode, ddmerrordiag, jobdispatchererrorcode,
        jobdispatchererrordiag, taskbuffererrorcode, taskbuffererrordiag,
        computingsite, computingelement, proddblock, destinationdblock,
        destinationse, nevents, cpuconversion, processingtype,
        produsername, ninputdatafiles, inputfiletype, inputfileproject,
        inputfilebytes, workinggroup, cloud, jobsetid, sourcesite, maxattempt,
        pilottiming, specialhandling, noutputdatafiles, outputfilebytes,
        jobmetrics, corecount, batchid, transfertype, eventservice, gshare,
        hs06, to_char(statechangetime, 'YYYY-MM-DD HH24:MI:SS') "statechangetime", coalesce(actualcorecount, 1) as "actualcorecount",
        assignedpriority, avgpss, avgrss, avgswap, avgvmem, cmtconfig,
        commandtopilot, countrygroup, currentpriority, dispatchdblock,
        failedattempt, hs06sec, homepackage, maxcpucount, maxdiskcount, maxpss,
        maxrss, maxswap, maxvmem, maxwalltime, minramcount, nucleus,
        raterbytes, raterchar, ratewbytes, ratewchar, coalesce(reqid, -1) as "reqid", totrbytes,
        totrchar, totwchar, totwbytes, workqueue_id, jeditaskid, pilotid,
        to_char(trunc(sys_extract_utc(systimestamp),'mi') - numtodsinterval(mod(extract(minute from cast(sysdate as timestamp)), 10), 'minute'), 'YYYY-MM-DD HH24:MI:SS') as "currenttime",
        container_name, resource_type as "job_resource_type", gco2_global, gco2_regional
    from atlas_panda.jobsarchived4
    where statechangetime >= sys_extract_utc(SYSTIMESTAMP) - interval '10' minute
        and jobstatus not in ('pending', 'defined', 'waiting', 'assigned', 'activated', 'sent', 'starting', 'throttled', 'running', 'holding', 'transferring', 'merging')
        and cloud != 'OSG'
) jm
left join atlas_deft.t_production_task prodsys on prodsys.taskid = jm."taskid"
order by "statechangetime";


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

-- Grant read access to atlas_panda_reader user
GRANT SELECT ON atlas_panda.mv_monit_jobs_submitted TO atlas_panda_reader;
GRANT SELECT ON atlas_panda.mv_monit_jobs_current   TO atlas_panda_reader;
GRANT SELECT ON atlas_panda.mv_monit_jobs_completed TO atlas_panda_reader;