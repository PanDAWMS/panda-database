--------------------------------------------------------
--  File created - Wednesday-March-18-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FILESTABLE_ARCH
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAARCH"."FILESTABLE_ARCH" 
   (	"ROW_ID" NUMBER(11,0), 
	"PANDAID" NUMBER(11,0) DEFAULT 0, 
	"MODIFICATIONTIME" DATE DEFAULT sysdate, 
	"CREATIONTIME" DATE, 
	"GUID" VARCHAR2(64 CHAR), 
	"LFN" VARCHAR2(256 CHAR), 
	"TYPE" VARCHAR2(20 BYTE), 
	"FSIZE" NUMBER(19,0) DEFAULT 0, 
	"DATASET" VARCHAR2(255 CHAR), 
	"STATUS" VARCHAR2(64 CHAR), 
	"MD5SUM" VARCHAR2(40 BYTE), 
	"CHECKSUM" VARCHAR2(40 BYTE), 
	"PRODDBLOCK" VARCHAR2(255 CHAR), 
	"PRODDBLOCKTOKEN" VARCHAR2(250 CHAR), 
	"DISPATCHDBLOCK" VARCHAR2(255 CHAR), 
	"DISPATCHDBLOCKTOKEN" VARCHAR2(250 CHAR), 
	"DESTINATIONDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONDBLOCKTOKEN" VARCHAR2(250 CHAR), 
	"DESTINATIONSE" VARCHAR2(250 CHAR), 
	"SCOPE" VARCHAR2(30 BYTE), 
	"JEDITASKID" NUMBER(11,0), 
	"DATASETID" NUMBER(11,0), 
	"FILEID" NUMBER(11,0), 
	"ATTEMPTNR" NUMBER(3,0)
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "FILESTABLE_ARCH_DEC_2020"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))
 ENABLE ROW MOVEMENT ;
--------------------------------------------------------
--  DDL for Table JOBPARAMSTABLE_ARCH
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAARCH"."JOBPARAMSTABLE_ARCH" 
   (	"PANDAID" NUMBER(11,0), 
	"MODIFICATIONTIME" DATE DEFAULT sysdate, 
	"JOBPARAMETERS" CLOB
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "JOBPARAMS_ARCH_JAN_2017"  VALUES LESS THAN (TO_DATE(' 2017-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))
   ENABLE ROW MOVEMENT ;
--------------------------------------------------------
--  DDL for Table JOBSARCHIVED
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" 
   (	"PANDAID" NUMBER(11,0) DEFAULT '0', 
	"JOBDEFINITIONID" NUMBER(11,0) DEFAULT '0', 
	"SCHEDULERID" VARCHAR2(128 CHAR), 
	"PILOTID" VARCHAR2(200 BYTE), 
	"CREATIONTIME" DATE DEFAULT sysdate, 
	"CREATIONHOST" VARCHAR2(128 CHAR), 
	"MODIFICATIONTIME" DATE DEFAULT sysdate, 
	"MODIFICATIONHOST" VARCHAR2(128 CHAR), 
	"ATLASRELEASE" VARCHAR2(64 CHAR), 
	"TRANSFORMATION" VARCHAR2(250 CHAR), 
	"HOMEPACKAGE" VARCHAR2(80 CHAR), 
	"PRODSERIESLABEL" VARCHAR2(20 BYTE), 
	"PRODSOURCELABEL" VARCHAR2(20 CHAR), 
	"PRODUSERID" VARCHAR2(250 CHAR), 
	"ASSIGNEDPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"CURRENTPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"ATTEMPTNR" NUMBER(3,0) DEFAULT '0', 
	"MAXATTEMPT" NUMBER(3,0) DEFAULT '0', 
	"JOBSTATUS" VARCHAR2(15 CHAR) DEFAULT 'unknown', 
	"JOBNAME" VARCHAR2(256 BYTE), 
	"MAXCPUCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MAXCPUUNIT" VARCHAR2(32 CHAR), 
	"MAXDISKCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MAXDISKUNIT" CHAR(4 CHAR), 
	"IPCONNECTIVITY" CHAR(5 CHAR), 
	"MINRAMCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MINRAMUNIT" CHAR(4 CHAR), 
	"STARTTIME" DATE DEFAULT sysdate, 
	"ENDTIME" DATE DEFAULT sysdate, 
	"CPUCONSUMPTIONTIME" NUMBER(20,0), 
	"CPUCONSUMPTIONUNIT" VARCHAR2(128 CHAR), 
	"COMMANDTOPILOT" VARCHAR2(250 CHAR), 
	"TRANSEXITCODE" VARCHAR2(128 CHAR), 
	"PILOTERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"PILOTERRORDIAG" VARCHAR2(500 CHAR), 
	"EXEERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"EXEERRORDIAG" VARCHAR2(500 CHAR), 
	"SUPERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"SUPERRORDIAG" VARCHAR2(250 CHAR), 
	"DDMERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"DDMERRORDIAG" VARCHAR2(700 BYTE), 
	"BROKERAGEERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"BROKERAGEERRORDIAG" VARCHAR2(250 CHAR), 
	"JOBDISPATCHERERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"JOBDISPATCHERERRORDIAG" VARCHAR2(250 CHAR), 
	"TASKBUFFERERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"TASKBUFFERERRORDIAG" VARCHAR2(300 CHAR), 
	"COMPUTINGSITE" VARCHAR2(128 CHAR), 
	"COMPUTINGELEMENT" VARCHAR2(128 CHAR), 
	"PRODDBLOCK" VARCHAR2(255 CHAR), 
	"DISPATCHDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONSE" VARCHAR2(250 CHAR), 
	"NEVENTS" NUMBER(10,0), 
	"GRID" VARCHAR2(50 CHAR), 
	"CLOUD" VARCHAR2(50 CHAR), 
	"CPUCONVERSION" NUMBER(9,4), 
	"SOURCESITE" VARCHAR2(36 CHAR), 
	"DESTINATIONSITE" VARCHAR2(36 CHAR), 
	"TRANSFERTYPE" VARCHAR2(10 CHAR), 
	"TASKID" NUMBER(9,0), 
	"CMTCONFIG" VARCHAR2(250 CHAR), 
	"STATECHANGETIME" DATE DEFAULT sysdate, 
	"PRODDBUPDATETIME" DATE DEFAULT sysdate, 
	"LOCKEDBY" VARCHAR2(128 CHAR), 
	"RELOCATIONFLAG" NUMBER(1,0) DEFAULT '0', 
	"JOBEXECUTIONID" NUMBER(11,0) DEFAULT '0', 
	"VO" VARCHAR2(16 CHAR), 
	"PILOTTIMING" VARCHAR2(100 CHAR), 
	"WORKINGGROUP" VARCHAR2(20 CHAR), 
	"PROCESSINGTYPE" VARCHAR2(64 CHAR), 
	"JOBPARAMETERS" CLOB, 
	"METADATA" CLOB, 
	"PRODUSERNAME" VARCHAR2(60 BYTE), 
	"NINPUTFILES" NUMBER(5,0), 
	"COUNTRYGROUP" VARCHAR2(20 BYTE), 
	"BATCHID" VARCHAR2(80 BYTE), 
	"PARENTID" NUMBER(11,0), 
	"SPECIALHANDLING" VARCHAR2(80 BYTE), 
	"JOBSETID" NUMBER(11,0), 
	"CORECOUNT" NUMBER(3,0), 
	"NINPUTDATAFILES" NUMBER(5,0), 
	"INPUTFILETYPE" VARCHAR2(32 BYTE), 
	"INPUTFILEPROJECT" VARCHAR2(64 BYTE), 
	"INPUTFILEBYTES" NUMBER(11,0), 
	"NOUTPUTDATAFILES" NUMBER(5,0), 
	"OUTPUTFILEBYTES" NUMBER(11,0), 
	"JOBMETRICS" VARCHAR2(500 BYTE), 
	"WORKQUEUE_ID" NUMBER(5,0), 
	"JEDITASKID" NUMBER(11,0), 
	"JOBSUBSTATUS" VARCHAR2(80 BYTE), 
	"ACTUALCORECOUNT" NUMBER(6,0), 
	"REQID" NUMBER(9,0), 
	"MAXRSS" NUMBER(10,0), 
	"MAXVMEM" NUMBER(10,0), 
	"MAXSWAP" NUMBER(10,0), 
	"MAXPSS" NUMBER(10,0), 
	"AVGRSS" NUMBER(10,0), 
	"AVGVMEM" NUMBER(10,0), 
	"AVGSWAP" NUMBER(10,0), 
	"AVGPSS" NUMBER(10,0), 
	"MAXWALLTIME" NUMBER(10,0), 
	"NUCLEUS" VARCHAR2(52 BYTE), 
	"EVENTSERVICE" NUMBER(1,0), 
	"FAILEDATTEMPT" NUMBER(3,0), 
	"HS06SEC" NUMBER(11,0), 
	"GSHARE" VARCHAR2(32 BYTE), 
	"HS06" NUMBER(11,0), 
	"TOTRCHAR" NUMBER(10,0), 
	"TOTWCHAR" NUMBER(10,0), 
	"TOTRBYTES" NUMBER(10,0), 
	"TOTWBYTES" NUMBER(10,0), 
	"RATERCHAR" NUMBER(10,0), 
	"RATEWCHAR" NUMBER(10,0), 
	"RATERBYTES" NUMBER(10,0), 
	"RATEWBYTES" NUMBER(10,0), 
	"RESOURCE_TYPE" VARCHAR2(56 BYTE), 
	"DISKIO" NUMBER(9,0), 
	"MEMORY_LEAK" NUMBER(11,0), 
	"MEMORY_LEAK_X2" NUMBER(14,3),
	"CONTAINER_NAME" VARCHAR2(200 BYTE),
	"JOB_LABEL" VARCHAR2(20 BYTE),
    "MEANCORECOUNT" NUMBER(8,2)
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "JOBSARCHIVED_JAN_2017_1"  VALUES LESS THAN (TO_DATE(' 2017-01-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))) ;

   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."MAXRSS" IS 'Maximum RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."MAXVMEM" IS 'Maximum VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."MAXSWAP" IS 'Maximum SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."MAXPSS" IS 'Maximum PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."AVGRSS" IS 'AverageÂ RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."AVGVMEM" IS 'Average VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."AVGSWAP" IS 'Average SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."AVGPSS" IS 'Average PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."MAXWALLTIME" IS 'Estimated walltime limit for the job';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."NUCLEUS" IS 'Name of the site where the job is assigned in WORLD cloud';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."EVENTSERVICE" IS 'The job uses Event Service';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."FAILEDATTEMPT" IS 'How many times the input files were failed so far. The maximum number is used if there are multiple input files';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."HS06SEC" IS 'The product of HS06 score and CPU consumption time';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."HS06" IS 'Core count x core power';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."TOTRCHAR" IS 'Total read chars';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."TOTWCHAR" IS 'Total write chars';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."TOTRBYTES" IS 'Total read bytes';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."TOTWBYTES" IS 'Total write bytes';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."RATERCHAR" IS 'Read chars rate';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."RATEWCHAR" IS 'Write chars rate';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."RATERBYTES" IS 'Read bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."RATEWBYTES" IS 'Write bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."DISKIO" IS 'Local disk access in kBPerSec. Required to limit the number of running jobs based on total IO for each queue.';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."MEMORY_LEAK" IS 'Memory leak in KB/s';
   COMMENT ON COLUMN "ATLAS_PANDAARCH"."JOBSARCHIVED"."MEMORY_LEAK_X2" IS 'Memory leak square statistic';
--------------------------------------------------------
--  DDL for Table METATABLE_ARCH
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAARCH"."METATABLE_ARCH" 
   (	"PANDAID" NUMBER(11,0) DEFAULT '0', 
	"MODIFICATIONTIME" DATE DEFAULT sysdate, 
	"METADATA" CLOB
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "METATABLE_ARCH_JAN_2017"  VALUES LESS THAN (TO_DATE(' 2017-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))
   ENABLE ROW MOVEMENT ;
--------------------------------------------------------
--  DDL for Table PANDAIDS_MODIFTIME_ERRLOG_OLD
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAARCH"."PANDAIDS_MODIFTIME_ERRLOG_OLD" 
   (	"ORA_ERR_NUMBER$" NUMBER, 
	"ORA_ERR_MESG$" VARCHAR2(2000 BYTE), 
	"ORA_ERR_ROWID$" UROWID (4000), 
	"ORA_ERR_OPTYP$" VARCHAR2(2 BYTE), 
	"ORA_ERR_TAG$" VARCHAR2(2000 BYTE), 
	"PANDAID" VARCHAR2(4000 BYTE), 
	"MODIFTIME" VARCHAR2(4000 BYTE)
   ) ;

   COMMENT ON TABLE "ATLAS_PANDAARCH"."PANDAIDS_MODIFTIME_ERRLOG_OLD"  IS 'DML Error Logging table for "ATLAS_PANDAARCH"."PANDAIDS_MODIFTIME"';
--------------------------------------------------------
--  DDL for Table PANDAIDS_MODIFTIME_OLD
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAARCH"."PANDAIDS_MODIFTIME_OLD" 
   (	"PANDAID" NUMBER(11,0), 
	"MODIFTIME" DATE, 
	 CONSTRAINT "PANDAIDS_MODIFTIME_PK" PRIMARY KEY ("PANDAID", "MODIFTIME") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS 
  PARTITION BY RANGE ("PANDAID") 
 (PARTITION "PANDAIDS_10"  VALUES LESS THAN (1000000000)) ;
--------------------------------------------------------
--  DDL for Table TABLE_PART_BOUNDARIES
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAARCH"."TABLE_PART_BOUNDARIES" 
   (	"TAB_NAME" VARCHAR2(30 BYTE), 
	"PART_NAME" VARCHAR2(30 BYTE), 
	"PART_POSITION" NUMBER(10,0), 
	"PART_BOUNDARY_DICTIONARY" CLOB, 
	"PART_BOUNDARY" DATE, 
	"LAST_CREATED_VIEW" VARCHAR2(30 BYTE)
   ) ;

--------------------------------------------------------
--  DDL for Index JOBS_PRODDBLOCK_IDX
--------------------------------------------------------

  CREATE BITMAP INDEX "ATLAS_PANDAARCH"."JOBS_PRODDBLOCK_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("PRODDBLOCK") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") ;

--------------------------------------------------------
--  DDL for Index JOBS_JOBNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_JOBNAME_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("JOBNAME") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBS_DESTINATIONDBLOCK_IDX
--------------------------------------------------------

  CREATE BITMAP INDEX "ATLAS_PANDAARCH"."JOBS_DESTINATIONDBLOCK_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("DESTINATIONDBLOCK") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") ;
--------------------------------------------------------
--  DDL for Index JOBS_BATCHID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_BATCHID_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("BATCHID") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBS_TASKID_3ATTR_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_TASKID_3ATTR_PANDAID_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("TASKID", "PRODSOURCELABEL", "JOBSTATUS", "PROCESSINGTYPE", "PANDAID") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 3 ;

--------------------------------------------------------
--  DDL for Index JOBS_EXEERRORCODE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_EXEERRORCODE_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("EXEERRORCODE") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index META_ARCH_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."META_ARCH_PANDAID_IDX" ON "ATLAS_PANDAARCH"."METATABLE_ARCH" ("PANDAID") 
   LOCAL
 (PARTITION "METATABLE_ARCH_JAN_2017") ;

--------------------------------------------------------
--  DDL for Index FILES_ARCH_LFN_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."FILES_ARCH_LFN_IDX" ON "ATLAS_PANDAARCH"."FILESTABLE_ARCH" ("LFN") 
   LOCAL
 (PARTITION "FILESTABLE_ARCH_JAN_2017") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBS_SPECIALHANDLING_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_SPECIALHANDLING_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("SPECIALHANDLING") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index FILES_ARCH_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."FILES_ARCH_PANDAID_IDX" ON "ATLAS_PANDAARCH"."FILESTABLE_ARCH" ("PANDAID") 
   LOCAL
 (PARTITION "FILESTABLE_ARCH_JAN_2017") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOBS_UPPER_PRODUSERNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_UPPER_PRODUSERNAME_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" (UPPER("PRODUSERNAME")) 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index FILE_ARCH_TASK_DSET_FILEID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."FILE_ARCH_TASK_DSET_FILEID_IDX" ON "ATLAS_PANDAARCH"."FILESTABLE_ARCH" ("JEDITASKID", "DATASETID", "FILEID", "PANDAID") 
   LOCAL
 (PARTITION "FILESTABLE_ARCH_JAN_2017") COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index TABLE_PART_BOUNDARIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAARCH"."TABLE_PART_BOUNDARIES_PK" ON "ATLAS_PANDAARCH"."TABLE_PART_BOUNDARIES" ("TAB_NAME", "PART_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index JOBS_COMSITE_3ATTR_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_COMSITE_3ATTR_PANDAID_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("COMPUTINGSITE", "JOBSTATUS", "PRODSOURCELABEL", "PROCESSINGTYPE", "PANDAID") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 3 ;

--------------------------------------------------------
--  DDL for Index FILES_ARCH_ROWID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."FILES_ARCH_ROWID_IDX" ON "ATLAS_PANDAARCH"."FILESTABLE_ARCH" ("ROW_ID") 
   LOCAL
 (PARTITION "FILESTABLE_ARCH_JAN_2017") ;

--------------------------------------------------------
--  DDL for Index JOBS_STATECHANGETIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_STATECHANGETIME_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("STATECHANGETIME") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOB_PRODLABEL_STATUS_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOB_PRODLABEL_STATUS_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("PRODSOURCELABEL", "JOBSTATUS") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 2 ;

--------------------------------------------------------
--  DDL for Index JOBS_PRODUSERNAME_4ATTR_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_PRODUSERNAME_4ATTR_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("PRODUSERNAME", "JOBSTATUS", "PRODSOURCELABEL", "JOBSETID", "JOBDEFINITIONID") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") COMPRESS 3 ;

--------------------------------------------------------
--  DDL for Index PANDAIDS_MODIFTIME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAARCH"."PANDAIDS_MODIFTIME_PK" ON "ATLAS_PANDAARCH"."PANDAIDS_MODIFTIME_OLD" ("PANDAID", "MODIFTIME") 
   LOCAL
 (PARTITION "PANDAIDS_10") ;
--------------------------------------------------------
--  DDL for Index JOBS_JOBSETID_PRODUSERNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_JOBSETID_PRODUSERNAME_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("JOBSETID", "PRODUSERNAME") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1")
      COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index JOBS_JOBDEFID_PRODUSERNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_JOBDEFID_PRODUSERNAME_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("JOBDEFINITIONID", "PRODUSERNAME") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1")
      COMPRESS 2 ;

--------------------------------------------------------
--  DDL for Index JOBS_JEDITASKID_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_JEDITASKID_PANDAID_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("JEDITASKID", "PANDAID") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1")
      COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBS_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBS_PANDAID_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("PANDAID") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1") ;

--------------------------------------------------------
--  DDL for Index JOBPARAMS_ARCH_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBPARAMS_ARCH_PANDAID_IDX" ON "ATLAS_PANDAARCH"."JOBPARAMSTABLE_ARCH" ("PANDAID") 
   LOCAL
 (PARTITION "JOBPARAMS_ARCH_JAN_2017") ;
--------------------------------------------------------
--  DDL for Index JOBSARCHIVED_REQID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAARCH"."JOBSARCHIVED_REQID_IDX" ON "ATLAS_PANDAARCH"."JOBSARCHIVED" ("REQID") 
   LOCAL
 (PARTITION "JOBSARCHIVED_JAN_2017_1")
      COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Trigger GRANTS_UPDATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAARCH"."GRANTS_UPDATE" AFTER CREATE on ATLAS_PANDAARCH.schema
 WHEN (ora_dict_obj_type NOT IN ('SYNONYM', 'INDEX', 'SNAPSHOT', 'TRIGGER','DATABASE LINK') ) DECLARE
      PRAGMA AUTONOMOUS_TRANSACTION;
      jobid number:=0;
      stat varchar2(2000);
     BEGIN
       	 stat:='ATLAS_PANDAARCH.do_grants( '''||ora_dict_obj_type||''' , '''|| ora_dict_obj_name||''' ,''ATLAS_PANDAARCH'');';
         dbms_job.submit(jobid,stat);
	 commit;
     END;
/
ALTER TRIGGER "ATLAS_PANDAARCH"."GRANTS_UPDATE" ENABLE;

--------------------------------------------------------
--  DDL for Procedure DO_GRANTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDAARCH"."DO_GRANTS" (obj_type varchar2, obj_name varchar2,owner_name varchar2)
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN

	 -- need to put " " around the object names, because some users create the objects with preserved character case.
	IF (obj_name NOT IN ('DO_GRANTS','GRANTS_UPDATE','CREATE_SYN4EXIST_OBJ') AND substr(obj_name,1,4)<>'BIN$') THEN

		IF obj_type IN ('TABLE') THEN
        	 	execute immediate 'GRANT SELECT,INSERT,UPDATE,DELETE on "'||obj_name||'" to ATLAS_PANDA_WRITEROLE';
		        execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDA_READROLE';
		elsif obj_type = 'SEQUENCE' THEN
	        	execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDA_WRITEROLE';
		        execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDA_READROLE';
		elsif obj_type IN ('VIEW', 'MATERIALIZED VIEW') THEN
			privs := ' SELECT,INSERT,UPDATE,DELETE ' ;
			FOR i IN 1..2 LOOP /*if fails on the first loop with error 01720, then goes to the EXEPTION and changes the statement */
				BEGIN
					execute immediate 'GRANT '|| privs ||' on "'|| obj_name||'" to ATLAS_PANDA_WRITEROLE';
				        execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDA_READROLE';
					EXIT;
				EXCEPTION
					WHEN grant_on_view_failed THEN
						privs := ' SELECT ' ;
				END;
			END LOOP;
		elsif obj_type IN ('PROCEDURE', 'PACKAGE','FUNCTION', 'TYPE') AND obj_name <> 'CREATE_SYN' THEN
	         	execute immediate 'GRANT EXECUTE on "'||obj_name||'" to ATLAS_PANDA_WRITEROLE';
		        execute immediate 'GRANT EXECUTE on "'||obj_name||'" to ATLAS_PANDA_READROLE';
		END IF;
	END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure GENERATE_TIMERANGE_VIEWS
--  THIS PROCEDURE IS CURRENTLY NOT USED IN PANDA ANYMORE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDAARCH"."GENERATE_TIMERANGE_VIEWS"                 ( name_table VARCHAR2, period_days NUMBER, name_view VARCHAR2)
AS

j NUMBER;
m_table VARCHAR2(30);
name_part VARCHAR2(30);
stmt VARCHAR2(32000);
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_parts part_names;

BEGIN

  -- m_table := DBMS_ASSERT.QUALIFIED_SQL_NAME(name_table);
  -- The DBMS_ASSERT.SIMPLE_SQL_NAME function checks the input string conforms to the basic characteristics of a simple SQL name.
  m_table := DBMS_ASSERT.SIMPLE_SQL_NAME(name_table);

  DELETE FROM ATLAS_PANDAARCH.table_part_boundaries WHERE tab_name = UPPER(m_table);

  INSERT INTO ATLAS_PANDAARCH.table_part_boundaries
  (tab_name, part_name, part_position, part_boundary_dictionary )
  SELECT table_name, partition_name, partition_position , TO_LOB(high_value)
  FROM USER_tab_partitions
  WHERE table_name = UPPER(m_table)
  ORDER BY partition_position;

  UPDATE ATLAS_PANDAARCH.table_part_boundaries SET part_boundary = TO_DATE(DBMS_LOB.SUBSTR(part_boundary_dictionary, 19, 11), 'YYYY-MM-DD HH24:MI:SS');

	-- get the partition names for a given time range. The OR clause is needed in order to catch the partition of the current day
	SELECT part_name BULK COLLECT INTO coll_parts
	FROM ATLAS_PANDAARCH.table_part_boundaries
	WHERE tab_name = UPPER(m_table) AND
	(
	    (SYSDATE >= part_boundary AND SYSDATE - period_days <= part_boundary )
	    OR
	(part_boundary = ( SELECT MIN(part_boundary) FROM ATLAS_PANDAARCH.table_part_boundaries WHERE part_boundary > sysdate ) )
	)
	ORDER BY PART_POSITION;

	-- The DBMS_ASSERT.ENQUOTE_NAME function encloses the input string (the view name) within double quotes, unless they are already present
	stmt := 'CREATE OR REPLACE VIEW ATLAS_PANDAARCH.' || DBMS_ASSERT.ENQUOTE_NAME(name_view, capitalize=> TRUE) || ' AS ( '  ;

	IF coll_parts.COUNT > 0 THEN
		FOR j in 1..coll_parts.LAST-1 LOOP
			-- DBMS_OUTPUT.put_line(coll_parts(j));
			stmt := stmt || 'SELECT * FROM ATLAS_PANDAARCH.' ||UPPER(m_table)|| ' partition (' || coll_parts(j) || ') UNION ALL ' ;

			UPDATE ATLAS_PANDAARCH.table_part_boundaries SET last_created_view = name_view
				WHERE tab_name = UPPER(m_table) AND part_name = coll_parts(j);
		END LOOP;

		-- for the last partition in the collection:
		stmt := stmt || ' SELECT * FROM ATLAS_PANDAARCH.' ||UPPER(m_table)|| ' partition (' || coll_parts(coll_parts.LAST) || ')  ) WITH READ ONLY ';

		name_part := coll_parts(coll_parts.LAST);
		UPDATE ATLAS_PANDAARCH.table_part_boundaries SET last_created_view = name_view
			WHERE tab_name = UPPER(m_table) AND part_name = name_part;

		-- DBMS_OUTPUT.put_line(stmt);

		-- execute the create view statement
		EXECUTE IMMEDIATE stmt;
	END IF;
	COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure GRANT_PRIVS4EXIST_OBJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDAARCH"."GRANT_PRIVS4EXIST_OBJ" (owner_name varchar2 ) AUTHID DEFINER
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN
 -- need to put " " around the object names, because some users create the objects with preserved character case.
	-- IMPORTANT - GRANT OBJECT PRIVILEGES FIRST TO THE TABLES
	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDAARCH' AND object_type = 'TABLE' AND substr(object_name,1,4)<>'BIN$' AND  substr(object_name,1,12)<>'SYS_IOT_OVER') LOOP
       	 	execute immediate 'GRANT SELECT,INSERT,UPDATE,DELETE on "'||rec.obj_name||'" to ATLAS_PANDA_WRITEROLE';
	        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDA_READROLE';
	END LOOP;

	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDAARCH' AND object_type IN
	('VIEW','SEQUENCE','PROCEDURE', 'PACKAGE', 'FUNCTION', 'MATERIALIZED VIEW', 'TYPE' ) ORDER BY object_type DESC ) LOOP

		IF rec.obj_name NOT IN ('DO_GRANTS','GRANTS_UPDATE','GRANT_PRIVS4EXIST_OBJ') THEN
			IF rec.obj_type IN ('VIEW', 'MATERIALIZED VIEW' ) THEN
				privs := ' SELECT,INSERT,UPDATE,DELETE ' ;
				FOR i IN 1..2 LOOP /*if fails on the first loop with error 01720, then goes to the EXEPTION and changes the statement */
					BEGIN
						execute immediate 'GRANT '|| privs ||' on "'||rec.obj_name||'" to ATLAS_PANDA_WRITEROLE';
					        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDA_READROLE';
						EXIT;
					EXCEPTION
						WHEN grant_on_view_failed THEN
						privs := ' SELECT ' ;
					END;
				END LOOP;
			elsif rec.obj_type = 'SEQUENCE' THEN
	        		execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDA_WRITEROLE';
			        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDA_READROLE';
			elsif rec.obj_type IN ('PROCEDURE', 'PACKAGE','FUNCTION', 'TYPE') AND rec.obj_name <> 'CREATE_SYN' THEN
		         	execute immediate 'GRANT EXECUTE on "'||rec.obj_name||'" to ATLAS_PANDA_WRITEROLE';
			        execute immediate 'GRANT EXECUTE on "'||rec.obj_name||'" to ATLAS_PANDA_READROLE';
			END IF;
		END IF;
	END LOOP;
END;

/
--------------------------------------------------------
--  Constraints for Table TABLE_PART_BOUNDARIES
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAARCH"."TABLE_PART_BOUNDARIES" ADD CONSTRAINT "TABLE_PART_BOUNDARIES_PK" PRIMARY KEY ("TAB_NAME", "PART_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOBPARAMSTABLE_ARCH
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAARCH"."JOBPARAMSTABLE_ARCH" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBPARAMSTABLE_ARCH" MODIFY ("PANDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOBSARCHIVED
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("TASKBUFFERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("JOBDISPATCHERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("BROKERAGEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("DDMERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("SUPERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("EXEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("PILOTERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("MINRAMCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("MAXDISKCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("MAXCPUCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("JOBSTATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("MAXATTEMPT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("ATTEMPTNR" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("CURRENTPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("ASSIGNEDPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("CREATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("JOBDEFINITIONID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."JOBSARCHIVED" MODIFY ("PANDAID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table PANDAIDS_MODIFTIME_OLD
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAARCH"."PANDAIDS_MODIFTIME_OLD" ADD CONSTRAINT "PANDAIDS_MODIFTIME_PK" PRIMARY KEY ("PANDAID", "MODIFTIME")
  USING INDEX  LOCAL
 (PARTITION "PANDAIDS_10")  ENABLE;
--------------------------------------------------------
--  Constraints for Table METATABLE_ARCH
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAARCH"."METATABLE_ARCH" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."METATABLE_ARCH" MODIFY ("PANDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILESTABLE_ARCH
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAARCH"."FILESTABLE_ARCH" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."FILESTABLE_ARCH" MODIFY ("PANDAID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAARCH"."FILESTABLE_ARCH" MODIFY ("ROW_ID" NOT NULL ENABLE);
