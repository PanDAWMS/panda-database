--------------------------------------------------------
--  File created - Wednesday-March-18-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CERTIFICATES_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."CERTIFICATES_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DSLIST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."DSLIST_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GROUPS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."GROUPS_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence HISTORY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."HISTORY_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JOBCLASS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."JOBCLASS_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PASSWORDS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."PASSWORDS_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROXYKEY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."PROXYKEY_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1116973681 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SERVICELIST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."SERVICELIST_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SITEACCESS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."SITEACCESS_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1585 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TAGS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."TAGS_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USAGEREPORT_ENTRY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."USAGEREPORT_ENTRY_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USERS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDAMETA"."USERS_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 32435 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Table CLOUDCONFIG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" 
   (	"NAME" VARCHAR2(20 CHAR), 
	"DESCRIPTION" VARCHAR2(50 CHAR), 
	"TIER1" VARCHAR2(20 CHAR), 
	"TIER1SE" VARCHAR2(400 CHAR), 
	"RELOCATION" VARCHAR2(10 CHAR), 
	"WEIGHT" NUMBER(10,0) DEFAULT '0', 
	"SERVER" VARCHAR2(100 CHAR), 
	"STATUS" VARCHAR2(20 CHAR), 
	"TRANSTIMELO" NUMBER(10,0) DEFAULT '0', 
	"TRANSTIMEHI" NUMBER(10,0) DEFAULT '0', 
	"WAITTIME" NUMBER(10,0) DEFAULT '0', 
	"COMMENT_" VARCHAR2(200 CHAR), 
	"SPACE" NUMBER(10,0) DEFAULT '0', 
	"MODUSER" VARCHAR2(30 CHAR), 
	"MODTIME" DATE DEFAULT SYSDATE, 
	"VALIDATION" VARCHAR2(20 CHAR), 
	"MCSHARE" NUMBER(10,0) DEFAULT '0', 
	"COUNTRIES" VARCHAR2(80 CHAR), 
	"FASTTRACK" VARCHAR2(20 CHAR), 
	"NPRESTAGE" NUMBER DEFAULT 0, 
	"PILOTOWNERS" VARCHAR2(300 BYTE), 
	"DN" VARCHAR2(100 CHAR), 
	"EMAIL" VARCHAR2(60 CHAR), 
	"FAIRSHARE" VARCHAR2(256 BYTE), 
	"AUTO_MCU" NUMBER(1,0) DEFAULT 0
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDAMETA"."CLOUDCONFIG"."COMMENT_" IS 'ORIGINAL NAME:comment';

--------------------------------------------------------
--  DDL for Table INCIDENTS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."INCIDENTS" 
   (	"AT_TIME" DATE, 
	"TYPEKEY" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) ;

--------------------------------------------------------
--  DDL for Table JDLLIST
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."JDLLIST" 
   (	"NAME" VARCHAR2(60 CHAR), 
	"HOST" VARCHAR2(60 CHAR), 
	"SYSTEM" VARCHAR2(20 CHAR), 
	"JDL" VARCHAR2(4000 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table JOBCLASS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."JOBCLASS" 
   (	"ID" NUMBER(7,0), 
	"NAME" VARCHAR2(30 CHAR), 
	"DESCRIPTION" VARCHAR2(30 CHAR), 
	"RIGHTS" VARCHAR2(30 CHAR), 
	"PRIORITY" NUMBER(7,0), 
	"QUOTA1" NUMBER(19,0), 
	"QUOTA7" NUMBER(19,0), 
	"QUOTA30" NUMBER(19,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTABLE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."LOGSTABLE" 
   (	"PANDAID" NUMBER(10,0) DEFAULT '0', 
	"LOG1" CLOB, 
	"LOG2" CLOB, 
	"LOG3" CLOB, 
	"LOG4" CLOB
   ) ;

--------------------------------------------------------
--  DDL for Table MULTICLOUD_HISTORY
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."MULTICLOUD_HISTORY" 
   (	"SITE" VARCHAR2(60 BYTE), 
	"MULTICLOUD" VARCHAR2(64 BYTE), 
	"LAST_UPDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table PANDACONFIG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."PANDACONFIG" 
   (	"NAME" VARCHAR2(60 CHAR), 
	"CONTROLLER" VARCHAR2(20 CHAR), 
	"PATHENA" VARCHAR2(20 CHAR)
   ) ;

--------------------------------------------------------
--  DDL for Table PROXYKEY
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."PROXYKEY" 
   (	"ID" NUMBER(10,0), 
	"DN" VARCHAR2(100 CHAR), 
	"CREDNAME" VARCHAR2(40 CHAR), 
	"CREATED" DATE DEFAULT SYSDATE, 
	"EXPIRES" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"ORIGIN" VARCHAR2(80 CHAR), 
	"MYPROXY" VARCHAR2(80 CHAR)
   ) ;


--------------------------------------------------------
--  DDL for Table SCHEDINSTANCE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" 
   (	"NAME" VARCHAR2(60 CHAR) DEFAULT 'default', 
	"NICKNAME" VARCHAR2(60 CHAR), 
	"PANDASITE" VARCHAR2(60 CHAR), 
	"NQUEUE" NUMBER(10,0) DEFAULT '5', 
	"NQUEUED" NUMBER(10,0) DEFAULT '0', 
	"NRUNNING" NUMBER(10,0) DEFAULT '0', 
	"NFINISHED" NUMBER(10,0) DEFAULT '0', 
	"NFAILED" NUMBER(10,0) DEFAULT '0', 
	"NABORTED" NUMBER(10,0) DEFAULT '0', 
	"NJOBS" NUMBER(10,0) DEFAULT '0', 
	"TVALID" DATE DEFAULT SYSDATE, 
	"LASTMOD" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"ERRINFO" VARCHAR2(150 CHAR), 
	"NDONE" NUMBER(10,0) DEFAULT '0', 
	"TOTRUNT" NUMBER(10,0) DEFAULT '0', 
	"COMMENT_" VARCHAR2(500 CHAR)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDINSTANCE"."COMMENT_" IS 'ORIGINAL NAME:comment';

--------------------------------------------------------
--  DDL for Table SITEACCESS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."SITEACCESS" 
   (	"ID" NUMBER, 
	"DN" VARCHAR2(100 BYTE) DEFAULT null, 
	"PANDASITE" VARCHAR2(100 BYTE) DEFAULT null, 
	"POFFSET" NUMBER DEFAULT 0, 
	"RIGHTS" VARCHAR2(30 BYTE) DEFAULT null, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT null, 
	"WORKINGGROUPS" VARCHAR2(100 CHAR), 
	"CREATED" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table SITEDATA
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."SITEDATA" 
   (	"SITE" VARCHAR2(60 BYTE), 
	"FLAG" VARCHAR2(30 CHAR),
	"HOURS" NUMBER(7,0) DEFAULT '0', 
	"NWN" NUMBER(7,0), 
	"MEMMIN" NUMBER(7,0), 
	"MEMMAX" NUMBER(7,0), 
	"SI2000MIN" NUMBER(7,0), 
	"SI2000MAX" NUMBER(7,0), 
	"OS" VARCHAR2(30 CHAR), 
	"SPACE" VARCHAR2(30 CHAR), 
	"MINJOBS" NUMBER(7,0), 
	"MAXJOBS" NUMBER(7,0), 
	"LASTSTART" DATE, 
	"LASTEND" DATE, 
	"LASTFAIL" DATE, 
	"LASTPILOT" DATE, 
	"LASTPID" NUMBER(7,0), 
	"NSTART" NUMBER(7,0) DEFAULT '0', 
	"FINISHED" NUMBER(7,0) DEFAULT '0', 
	"FAILED" NUMBER(7,0) DEFAULT '0', 
	"DEFINED" NUMBER(7,0) DEFAULT '0', 
	"ASSIGNED" NUMBER(7,0) DEFAULT '0', 
	"WAITING" NUMBER(7,0) DEFAULT '0', 
	"ACTIVATED" NUMBER(7,0) DEFAULT '0', 
	"HOLDING" NUMBER(7,0) DEFAULT '0', 
	"RUNNING" NUMBER(7,0) DEFAULT '0', 
	"TRANSFERRING" NUMBER(7,0) DEFAULT '0', 
	"GETJOB" NUMBER(7,0) DEFAULT '0', 
	"UPDATEJOB" NUMBER(7,0) DEFAULT '0', 
	"LASTMOD" DATE DEFAULT SYSDATE, 
	"NCPU" NUMBER(5,0), 
	"NSLOT" NUMBER(5,0), 
	"NOJOB" NUMBER(7,0), 
	"GETJOBABS" NUMBER(10,0), 
	"UPDATEJOBABS" NUMBER(10,0), 
	"NOJOBABS" NUMBER(10,0)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SITEDATA"."NOJOB" IS 'Number of getJobs requests that did not get a Job';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SITEDATA"."GETJOBABS" IS 'Absolute number of getJobs requests';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SITEDATA"."UPDATEJOBABS" IS 'Absolute number of updateJobs';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SITEDATA"."NOJOBABS" IS 'Absolute number of getJobs requests that did not get a Job';

--------------------------------------------------------
--  DDL for Table SITES_MATRIX_DATA
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."SITES_MATRIX_DATA" 
   (	"SOURCE" VARCHAR2(256 BYTE), 
	"DESTINATION" VARCHAR2(256 BYTE), 
	"MEAS_DATE" DATE, 
	"SONARSMLVAL" NUMBER, 
	"SONARSMLDEV" NUMBER, 
	"SONARMEDVAL" NUMBER, 
	"SONARMEDDEV" NUMBER, 
	"SONARLRGVAL" NUMBER, 
	"SONARLRGDEV" NUMBER, 
	"PERFSONARAVGVAL" NUMBER, 
	"XRDCPVAL" NUMBER, 
	"SONARSML_LAST_UPDATE" DATE, 
	"SONARMED_LAST_UPDATE" DATE, 
	"SONARLRG_LAST_UPDATE" DATE, 
	"PERFSONARAVG_LAST_UPDATE" DATE, 
	"XRDCP_LAST_UPDATE" DATE
   ) ;

--------------------------------------------------------
--  DDL for Table TAGINFO
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."TAGINFO" 
   (	"TAG" VARCHAR2(30 CHAR), 
	"DESCRIPTION" VARCHAR2(100 CHAR), 
	"NQUEUES" NUMBER(10,0) DEFAULT '0', 
	"QUEUES" VARCHAR2(4000 CHAR)
   ) ;

--------------------------------------------------------
--  DDL for Table USERCACHEUSAGE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."USERCACHEUSAGE" 
   (	"USERNAME" VARCHAR2(128 BYTE), 
	"FILENAME" VARCHAR2(256 BYTE), 
	"HOSTNAME" VARCHAR2(64 BYTE), 
	"CREATIONTIME" DATE, 
	"MODIFICATIONTIME" DATE, 
	"FILESIZE" NUMBER(11,0), 
	"CHECKSUM" VARCHAR2(36 BYTE), 
	"ALIASNAME" VARCHAR2(256 BYTE)
   ) 
  PARTITION BY RANGE ("CREATIONTIME") INTERVAL (NUMTOYMINTERVAL(1,'MONTH')) 
 (PARTITION "DATA_BEFORE_01062012"  VALUES LESS THAN (TO_DATE(' 2012-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) )  ENABLE ROW MOVEMENT ;

   COMMENT ON TABLE "ATLAS_PANDAMETA"."USERCACHEUSAGE"  IS 'This table is required to keep track on the disk usage per user, so that can be seen who unfairly occupies too much disk space and eventually ban the user';
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."USERS" 
   (	"ID" NUMBER(7,0), 
	"NAME" VARCHAR2(60 CHAR), 
	"DN" VARCHAR2(150 BYTE), 
	"EMAIL" VARCHAR2(60 CHAR), 
	"URL" VARCHAR2(100 CHAR), 
	"LOCATION" VARCHAR2(60 CHAR), 
	"CLASSA" VARCHAR2(30 CHAR), 
	"CLASSP" VARCHAR2(30 CHAR), 
	"CLASSXP" VARCHAR2(30 CHAR), 
	"SITEPREF" VARCHAR2(60 CHAR), 
	"GRIDPREF" VARCHAR2(20 CHAR), 
	"QUEUEPREF" VARCHAR2(60 CHAR), 
	"SCRIPTCACHE" VARCHAR2(100 CHAR), 
	"TYPES" VARCHAR2(60 CHAR), 
	"SITES" VARCHAR2(250 CHAR), 
	"NJOBSA" NUMBER(10,0), 
	"NJOBSP" NUMBER(10,0), 
	"NJOBS1" NUMBER(10,0), 
	"NJOBS7" NUMBER(10,0), 
	"NJOBS30" NUMBER(10,0), 
	"CPUA1" NUMBER(19,0), 
	"CPUA7" NUMBER(19,0), 
	"CPUA30" NUMBER(19,0), 
	"CPUP1" NUMBER(19,0), 
	"CPUP7" NUMBER(19,0), 
	"CPUP30" NUMBER(19,0), 
	"CPUXP1" NUMBER(19,0), 
	"CPUXP7" NUMBER(19,0), 
	"CPUXP30" NUMBER(19,0), 
	"QUOTAA1" NUMBER(19,0), 
	"QUOTAA7" NUMBER(19,0), 
	"QUOTAA30" NUMBER(19,0), 
	"QUOTAP1" NUMBER(19,0), 
	"QUOTAP7" NUMBER(19,0), 
	"QUOTAP30" NUMBER(19,0), 
	"QUOTAXP1" NUMBER(19,0), 
	"QUOTAXP7" NUMBER(19,0), 
	"QUOTAXP30" NUMBER(19,0), 
	"SPACE1" NUMBER(10,0), 
	"SPACE7" NUMBER(10,0), 
	"SPACE30" NUMBER(10,0), 
	"LASTMOD" DATE DEFAULT SYSDATE, 
	"FIRSTJOB" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"LATESTJOB" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"PAGECACHE" CLOB, 
	"CACHETIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"NCURRENT" NUMBER(10,0) DEFAULT '0', 
	"JOBID" NUMBER(10,0) DEFAULT '0', 
	"STATUS" VARCHAR2(20 CHAR), 
	"VO" VARCHAR2(20 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table USERSUBS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."USERSUBS" 
   (	"DATASETNAME" VARCHAR2(255 BYTE), 
	"SITE" VARCHAR2(64 BYTE), 
	"CREATIONDATE" DATE, 
	"MODIFICATIONDATE" DATE, 
	"NUSED" NUMBER(5,0), 
	"STATE" VARCHAR2(30 BYTE) DEFAULT 'subscribed', 
	 CONSTRAINT "USERSUBS_PK" PRIMARY KEY ("DATASETNAME", "SITE") ENABLE
   ) ORGANIZATION INDEX COMPRESS 1 ;


--------------------------------------------------------
--  DDL for Index INSTALLEDSW_SITERELCACHECMT_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."INSTALLEDSW_SITERELCACHECMT_UK" ON "ATLAS_PANDAMETA"."INSTALLEDSW" ("SITEID", "RELEASE", "CACHE", "CMTCONFIG") 
  ;
--------------------------------------------------------
--  DDL for Index PRIMARY_JOBCLASS
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_JOBCLASS" ON "ATLAS_PANDAMETA"."JOBCLASS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERSUBS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."USERSUBS_PK" ON "ATLAS_PANDAMETA"."USERSUBS" ("DATASETNAME", "SITE") 
  ;
--------------------------------------------------------
--  DDL for Index PRIMARY_PROXYKEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_PROXYKEY" ON "ATLAS_PANDAMETA"."PROXYKEY" ("ID") 
  ;

--------------------------------------------------------
--  DDL for Index PRIMARY_LOGSTABLE
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_LOGSTABLE" ON "ATLAS_PANDAMETA"."LOGSTABLE" ("PANDAID") 
  ;

--------------------------------------------------------
--  DDL for Index USERCACHEUSAGE_USR_CRDATE_INDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAMETA"."USERCACHEUSAGE_USR_CRDATE_INDX" ON "ATLAS_PANDAMETA"."USERCACHEUSAGE" ("USERNAME", "CREATIONTIME") 
   LOCAL
 (PARTITION "DATA_BEFORE_01062012" ) COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index INSTALLEDSW_RELID_SITE_INDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAMETA"."INSTALLEDSW_RELID_SITE_INDX" ON "ATLAS_PANDAMETA"."INSTALLEDSW" ("RELEASE", "SITEID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_NAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAMETA"."USERS_NAME_IDX" ON "ATLAS_PANDAMETA"."USERS" ("NAME", "VO") 
  ;

--------------------------------------------------------
--  DDL for Index PRIMARY_SITEDATA
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_SITEDATA" ON "ATLAS_PANDAMETA"."SITEDATA" ("SITE", "FLAG", "HOURS") 
  ;

--------------------------------------------------------
--  DDL for Index JOBCLASS_NAME_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."JOBCLASS_NAME_IDX" ON "ATLAS_PANDAMETA"."JOBCLASS" ("NAME") 
  ;

--------------------------------------------------------
--  DDL for Index PRIMARY_CLOUDCFG
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_CLOUDCFG" ON "ATLAS_PANDAMETA"."CLOUDCONFIG" ("NAME") 
  ;

--------------------------------------------------------
--  DDL for Index CACHE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."CACHE_PK" ON "ATLAS_PANDAMETA"."CACHE" ("TYPE", "VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index PRIMARY_SCHEDINST
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_SCHEDINST" ON "ATLAS_PANDAMETA"."SCHEDINSTANCE" ("NICKNAME", "PANDASITE") 
  ;


--------------------------------------------------------
--  DDL for Index PRIMARY_TAGINFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_TAGINFO" ON "ATLAS_PANDAMETA"."TAGINFO" ("TAG") 
  ;

--------------------------------------------------------
--  DDL for Index SITEACCESS_ID_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."SITEACCESS_ID_PRIMARY" ON "ATLAS_PANDAMETA"."SITEACCESS" ("ID") 
  ;

--------------------------------------------------------
--  DDL for Index SITES_MATRIX_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."SITES_MATRIX_DATA_PK" ON "ATLAS_PANDAMETA"."SITES_MATRIX_DATA" ("SOURCE", "DESTINATION") 
  ;
--------------------------------------------------------
--  DDL for Index MULTICLOUD_HISTORY_SITE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAMETA"."MULTICLOUD_HISTORY_SITE_IDX" ON "ATLAS_PANDAMETA"."MULTICLOUD_HISTORY" ("SITE") 
  ;
--------------------------------------------------------
--  DDL for Index PRIMARY_JDLLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_JDLLIST" ON "ATLAS_PANDAMETA"."JDLLIST" ("NAME") 
  ;

--------------------------------------------------------
--  DDL for Index PRIMARY_USERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_USERS" ON "ATLAS_PANDAMETA"."USERS" ("ID") 
  ;

--------------------------------------------------------
--  DDL for Index USERCACHEUSAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."USERCACHEUSAGE_PK" ON "ATLAS_PANDAMETA"."USERCACHEUSAGE" ("FILENAME", "HOSTNAME", "CREATIONTIME") 
   LOCAL
 (PARTITION "DATA_BEFORE_01062012" ) COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index PRIMARY_PANDACFG
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_PANDACFG" ON "ATLAS_PANDAMETA"."PANDACONFIG" ("NAME") 
  ;

--------------------------------------------------------
--  DDL for Index SITEACCESS_DNSITE_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."SITEACCESS_DNSITE_IDX" ON "ATLAS_PANDAMETA"."SITEACCESS" ("DN", "PANDASITE") 
  ;

--------------------------------------------------------
--  DDL for Index SCHEDINSTANCE_NICKNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDAMETA"."SCHEDINSTANCE_NICKNAME_IDX" ON "ATLAS_PANDAMETA"."SCHEDINSTANCE" ("NICKNAME") 
  ;
--------------------------------------------------------
--  DDL for Index PRIMARY_GROUPS
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_GROUPS" ON "ATLAS_PANDAMETA"."GROUPS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRIMARY_SCHEDCFG
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDAMETA"."PRIMARY_SCHEDCFG" ON "ATLAS_PANDAMETA"."SCHEDCONFIG" ("NICKNAME") 
  ;

--------------------------------------------------------
--  DDL for Trigger CLOUDCONFIG_MODTIME_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."CLOUDCONFIG_MODTIME_TRG" BEFORE insert or UPDATE ON cloudconfig
FOR EACH ROW
DECLARE
BEGIN
  :new.modtime := sysdate;
END;

/
ALTER TRIGGER "ATLAS_PANDAMETA"."CLOUDCONFIG_MODTIME_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger FIFO_5ROWS_PERSITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."FIFO_5ROWS_PERSITE" BEFORE INSERT on atlas_pandameta.MULTICLOUD_HISTORY
  FOR EACH ROW
DECLARE
    num number := 0;
BEGIN

	SELECT count(site) INTO num FROM atlas_pandameta.MULTICLOUD_HISTORY where SITE=:NEW.site ;
 	IF (num >= 5) THEN
		DELETE FROM atlas_pandameta.MULTICLOUD_HISTORY where SITE=:NEW.site AND last_update <= (SELECT MIN(last_update) FROM atlas_pandameta.MULTICLOUD_HISTORY where SITE=:NEW.site );
         END IF;

EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
END;
/
ALTER TRIGGER "ATLAS_PANDAMETA"."FIFO_5ROWS_PERSITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GRANTS_UPDATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."GRANTS_UPDATE" AFTER CREATE on ATLAS_PANDAMETA.schema
 WHEN (ora_dict_obj_type NOT IN ('SYNONYM', 'INDEX', 'SNAPSHOT', 'TRIGGER','DATABASE LINK') ) DECLARE
      PRAGMA AUTONOMOUS_TRANSACTION;
      jobid number:=0;
      stat varchar2(2000);
     BEGIN
       	 stat:='ATLAS_PANDAMETA.do_grants( '''||ora_dict_obj_type||''' , '''|| ora_dict_obj_name||''' ,''ATLAS_PANDAMETA'');';
         dbms_job.submit(jobid,stat);
	 commit;
     END;
/
ALTER TRIGGER "ATLAS_PANDAMETA"."GRANTS_UPDATE" ENABLE;

--------------------------------------------------------
--  DDL for Trigger JOBCLASS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."JOBCLASS_ID_TRG" BEFORE INSERT OR UPDATE ON jobclass
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  jobclass_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT max(id) INTO v_newVal FROM jobclass;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT jobclass_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    -- save this to emulate @@identity
   mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;


/
ALTER TRIGGER "ATLAS_PANDAMETA"."JOBCLASS_ID_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger PROXYKEY_CREATED_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."PROXYKEY_CREATED_TRG" BEFORE insert or UPDATE ON proxykey
FOR EACH ROW
DECLARE
BEGIN
  :new.created := sysdate;
END;

/
ALTER TRIGGER "ATLAS_PANDAMETA"."PROXYKEY_CREATED_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger SCHEDINSTANCE_TVALID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."SCHEDINSTANCE_TVALID_TRG" BEFORE insert or UPDATE ON schedinstance
FOR EACH ROW
DECLARE
BEGIN
  :new.tvalid := sysdate;
END;

/
ALTER TRIGGER "ATLAS_PANDAMETA"."SCHEDINSTANCE_TVALID_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger USERS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."USERS_ID_TRG" BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  users_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT max(id) INTO v_newVal FROM users;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT users_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    -- save this to emulate @@identity
   mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;


/
ALTER TRIGGER "ATLAS_PANDAMETA"."USERS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_LASTMOD_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDAMETA"."USERS_LASTMOD_TRG" BEFORE insert or UPDATE ON users
FOR EACH ROW
DECLARE
BEGIN
  :new.lastmod := sys_extract_utc(systimestamp);
END;

/
ALTER TRIGGER "ATLAS_PANDAMETA"."USERS_LASTMOD_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Procedure CREATE_SYN4EXIST_OBJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDAMETA"."CREATE_SYN4EXIST_OBJ" (owner_name varchar2 ) AUTHID DEFINER
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN

	-- IMPORTANT - GRANT OBJECT PRIVILEGES FIRST TO THE TABLES
	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDAMETA' AND object_type = 'TABLE' AND substr(object_name,1,4)<>'BIN$' ) LOOP
       	 	execute immediate 'GRANT SELECT,INSERT,UPDATE,DELETE on "'||rec.obj_name||'" to ATLAS_PANDAMETA_W';
	        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDAMETA_R';

		-- calls the 'create_syn' procedure in the WRITER and READER account
		ATLAS_PANDAMETA_W.create_syn(rec.obj_name,owner_name);
		ATLAS_PANDAMETA_R.create_syn(rec.obj_name,owner_name);
	END LOOP;

	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDAMETA' AND object_type IN
	('VIEW','SEQUENCE','PROCEDURE', 'PACKAGE', 'FUNCTION', 'MATERIALIZED VIEW', 'TYPE' ) ORDER BY object_type DESC ) LOOP
	IF rec.obj_name NOT IN ('DO_GRANTS','GRANTS_UPDATE','CREATE_SYN4EXIST_OBJ') THEN
		IF rec.obj_type IN ('VIEW', 'MATERIALIZED VIEW' ) THEN
			privs := ' SELECT,INSERT,UPDATE,DELETE ' ;
			FOR i IN 1..2 LOOP /*if fails on the first loop with error 01720, then goes to the EXEPTION and changes the statement */
				BEGIN
		        	 	--SAVEPOINT before_grant_all;
					execute immediate 'GRANT '|| privs ||' on "'||rec.obj_name||'" to ATLAS_PANDAMETA_W';
				        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDAMETA_R';
					--insert into hist_object_creation values ( rec.obj_name || privs, systimestamp);
					EXIT;
				EXCEPTION
					WHEN grant_on_view_failed THEN
						--ROLLBACK TO before_grant_all;
						privs := ' SELECT ' ;
						--insert into hist_object_creation values ( rec.obj_name || privs, systimestamp);
				END;
			END LOOP;
		elsif rec.obj_type = 'SEQUENCE' THEN
	        	execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDAMETA_W';
		        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDAMETA_R';
		elsif rec.obj_type IN ('PROCEDURE', 'PACKAGE','FUNCTION', 'TYPE') AND rec.obj_name <> 'CREATE_SYN' THEN
	         	execute immediate 'GRANT EXECUTE on "'||rec.obj_name||'" to ATLAS_PANDAMETA_W';
		        execute immediate 'GRANT EXECUTE on "'||rec.obj_name||'" to ATLAS_PANDAMETA_R';
			--insert into hist_object_creation values ( rec.obj_name || ' - EXECUTE ' , systimestamp);
		END IF;

		IF rec.obj_type  <> 'SYNONYM' THEN
			-- calls the 'create_syn' procedure in the WRITER and READER accounts
			ATLAS_PANDAMETA_W.create_syn(rec.obj_name,owner_name);
			ATLAS_PANDAMETA_R.create_syn(rec.obj_name,owner_name);
		END IF;
	END IF;
	END LOOP;

	--commit;
END;
 

/
--------------------------------------------------------
--  DDL for Procedure DO_GRANTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDAMETA"."DO_GRANTS" (obj_type varchar2, obj_name varchar2,owner_name varchar2)
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
--  DDL for Procedure GRANT_PRIVS4EXIST_OBJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDAMETA"."GRANT_PRIVS4EXIST_OBJ" (owner_name varchar2 ) AUTHID DEFINER
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN
 -- need to put " " around the object names, because some users create the objects with preserved character case.
	-- IMPORTANT - GRANT OBJECT PRIVILEGES FIRST TO THE TABLES
	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDAMETA' AND object_type = 'TABLE' AND substr(object_name,1,4)<>'BIN$' AND  substr(object_name,1,12)<>'SYS_IOT_OVER') LOOP
       	 	execute immediate 'GRANT SELECT,INSERT,UPDATE,DELETE on "'||rec.obj_name||'" to ATLAS_PANDA_WRITEROLE';
	        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDA_READROLE';
	END LOOP;

	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDAMETA' AND object_type IN
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
--  DDL for Package MYSQL_UTILITIES
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "ATLAS_PANDAMETA"."MYSQL_UTILITIES" AS
identity NUMBER(10);
END mysql_utilities;
 

/

--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."USERS" ADD CONSTRAINT "PRIMARY_USERS" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("JOBID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("NCURRENT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("CACHETIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("LATESTJOB" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("FIRSTJOB" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("LASTMOD" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERS" MODIFY ("ID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table CLOUDCONFIG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" ADD CONSTRAINT "CLOUDCONFIG_AUTO_MCU_NN" CHECK (auto_mcu IS NOT NULL) ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" ADD CONSTRAINT "CLOUDCONFIG_AUTO_MCU_CHECK" CHECK (auto_mcu IN (0,1)) ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" ADD CONSTRAINT "PRIMARY_CLOUDCFG" PRIMARY KEY ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("NPRESTAGE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("MCSHARE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("MODTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("SPACE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("WAITTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("TRANSTIMEHI" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("TRANSTIMELO" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("SERVER" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("WEIGHT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("TIER1SE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("TIER1" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."CLOUDCONFIG" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITEACCESS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."SITEACCESS" ADD CONSTRAINT "SITEACCESS_ID_PRIMARY" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SITEACCESS" MODIFY ("POFFSET" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEACCESS" MODIFY ("ID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table LOGSTABLE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."LOGSTABLE" ADD CONSTRAINT "PRIMARY_LOGSTABLE" PRIMARY KEY ("PANDAID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."LOGSTABLE" MODIFY ("LOG4" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."LOGSTABLE" MODIFY ("LOG3" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."LOGSTABLE" MODIFY ("LOG2" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."LOGSTABLE" MODIFY ("LOG1" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."LOGSTABLE" MODIFY ("PANDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCHEDCONFIG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" ADD CONSTRAINT "DIRECT_ACCESS_WAN_CHK" CHECK (DIRECT_ACCESS_WAN IN ('True','False')) ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" ADD CONSTRAINT "DIRECT_ACCESS_LAN_CHK" CHECK (DIRECT_ACCESS_LAN IN ('True','False')) ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" ADD CONSTRAINT "USE_NEWMOVER_CHK" CHECK (USE_NEWMOVER IN ('True','False')) ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" ADD CONSTRAINT "SCHEDCONFIG_AUTO_MCU_NN" CHECK (auto_mcu IS NOT NULL) ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" ADD CONSTRAINT "SCHEDCONFIG_AUTO_MCU_CHECK" CHECK (auto_mcu IN (0,1)) ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" ADD CONSTRAINT "PRIMARY_SCHEDCFG" PRIMARY KEY ("NICKNAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("TSPACE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("SPACE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("MAXTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("MEMORY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("QUEUEHOURS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("NODES" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("NQUEUE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("LASTMOD" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("SITE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("SYSTEM" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TAGINFO
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."TAGINFO" ADD CONSTRAINT "PRIMARY_TAGINFO" PRIMARY KEY ("TAG")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."TAGINFO" MODIFY ("NQUEUES" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."TAGINFO" MODIFY ("DESCRIPTION" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table PANDACONFIG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."PANDACONFIG" ADD CONSTRAINT "PRIMARY_PANDACFG" PRIMARY KEY ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."PANDACONFIG" MODIFY ("CONTROLLER" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."PANDACONFIG" MODIFY ("NAME" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table MULTICLOUD_HISTORY
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."MULTICLOUD_HISTORY" MODIFY ("LAST_UPDATE" CONSTRAINT "LAST_UPDATE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."MULTICLOUD_HISTORY" MODIFY ("SITE" CONSTRAINT "SITE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERCACHEUSAGE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."USERCACHEUSAGE" ADD CONSTRAINT "USERCACHEUSAGE_PK" PRIMARY KEY ("FILENAME", "HOSTNAME", "CREATIONTIME")
  USING INDEX  LOCAL
 (PARTITION "DATA_BEFORE_01062012" ) COMPRESS 1  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."USERCACHEUSAGE" MODIFY ("CREATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERCACHEUSAGE" MODIFY ("HOSTNAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERCACHEUSAGE" MODIFY ("FILENAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERCACHEUSAGE" MODIFY ("USERNAME" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table SCHEDINSTANCE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" ADD CONSTRAINT "PRIMARY_SCHEDINST" PRIMARY KEY ("NICKNAME", "PANDASITE")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("TOTRUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NDONE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("LASTMOD" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("TVALID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NJOBS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NABORTED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NFAILED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NFINISHED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NRUNNING" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NQUEUED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NQUEUE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SCHEDINSTANCE" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOBCLASS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."JOBCLASS" ADD CONSTRAINT "PRIMARY_JOBCLASS" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."JOBCLASS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."JOBCLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."JOBCLASS" MODIFY ("ID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table SITEDATA
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" ADD CONSTRAINT "PRIMARY_SITEDATA" PRIMARY KEY ("SITE", "FLAG", "HOURS")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("LASTMOD" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("UPDATEJOB" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("GETJOB" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("TRANSFERRING" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("RUNNING" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("HOLDING" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("ACTIVATED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("WAITING" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("ASSIGNED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("DEFINED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("FAILED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("FINISHED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("NSTART" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("HOURS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("FLAG" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITEDATA" MODIFY ("SITE" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table USERSUBS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."USERSUBS" ADD CONSTRAINT "USERSUBS_PK" PRIMARY KEY ("DATASETNAME", "SITE")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."USERSUBS" MODIFY ("SITE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."USERSUBS" MODIFY ("DATASETNAME" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table SITES_MATRIX_DATA
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."SITES_MATRIX_DATA" ADD CONSTRAINT "SITES_MATRIX_DATA_PK" PRIMARY KEY ("SOURCE", "DESTINATION")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."SITES_MATRIX_DATA" MODIFY ("MEAS_DATE" CONSTRAINT "SITES_MATRIX_MEAS_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITES_MATRIX_DATA" MODIFY ("DESTINATION" CONSTRAINT "SITE_DESTINATION_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."SITES_MATRIX_DATA" MODIFY ("SOURCE" CONSTRAINT "SITE_SOURCE_NN" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table PROXYKEY
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" ADD CONSTRAINT "PRIMARY_PROXYKEY" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" MODIFY ("MYPROXY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" MODIFY ("ORIGIN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" MODIFY ("EXPIRES" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" MODIFY ("CREDNAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" MODIFY ("DN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."PROXYKEY" MODIFY ("ID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table JDLLIST
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."JDLLIST" ADD CONSTRAINT "PRIMARY_JDLLIST" PRIMARY KEY ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDAMETA"."JDLLIST" MODIFY ("SYSTEM" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDAMETA"."JDLLIST" MODIFY ("NAME" NOT NULL ENABLE);

