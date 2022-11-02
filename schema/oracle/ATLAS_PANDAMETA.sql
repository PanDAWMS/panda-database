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
--  DDL for Table INSTALLEDSW
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."INSTALLEDSW" 
   (	"SITEID" VARCHAR2(60 BYTE), 
	"CLOUD" VARCHAR2(10 BYTE), 
	"RELEASE" VARCHAR2(10 BYTE), 
	"CACHE" VARCHAR2(40 BYTE), 
	"VALIDATION" VARCHAR2(10 BYTE), 
	"CMTCONFIG" VARCHAR2(40 BYTE)
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
--  DDL for Table SCHEDCONFIG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDAMETA"."SCHEDCONFIG" 
   (	"NAME" VARCHAR2(60 CHAR) DEFAULT 'default', 
	"NICKNAME" VARCHAR2(60 CHAR), 
	"QUEUE" VARCHAR2(60 CHAR), 
	"LOCALQUEUE" VARCHAR2(50 BYTE), 
	"SYSTEM" VARCHAR2(60 CHAR), 
	"SYSCONFIG" VARCHAR2(20 CHAR), 
	"ENVIRON" VARCHAR2(250 CHAR), 
	"GATEKEEPER" VARCHAR2(120 BYTE), 
	"JOBMANAGER" VARCHAR2(80 CHAR), 
	"SE" VARCHAR2(400 BYTE), 
	"DDM" VARCHAR2(120 CHAR), 
	"JDLADD" VARCHAR2(500 BYTE), 
	"GLOBUSADD" VARCHAR2(100 CHAR), 
	"JDL" VARCHAR2(60 CHAR), 
	"JDLTXT" VARCHAR2(500 BYTE), 
	"VERSION" VARCHAR2(60 CHAR), 
	"SITE" VARCHAR2(60 CHAR), 
	"REGION" VARCHAR2(60 CHAR), 
	"GSTAT" VARCHAR2(60 CHAR), 
	"TAGS" VARCHAR2(200 CHAR), 
	"CMD" VARCHAR2(200 CHAR), 
	"LASTMOD" DATE DEFAULT SYSDATE, 
	"ERRINFO" VARCHAR2(80 CHAR), 
	"NQUEUE" NUMBER(10,0) DEFAULT '0', 
	"COMMENT_" VARCHAR2(500 CHAR), 
	"APPDIR" VARCHAR2(500 BYTE), 
	"DATADIR" VARCHAR2(80 CHAR), 
	"TMPDIR" VARCHAR2(80 CHAR), 
	"WNTMPDIR" VARCHAR2(80 CHAR), 
	"DQ2URL" VARCHAR2(80 CHAR), 
	"SPECIAL_PAR" VARCHAR2(80 CHAR), 
	"PYTHON_PATH" VARCHAR2(80 CHAR), 
	"NODES" NUMBER(10,0) DEFAULT '0', 
	"STATUS" VARCHAR2(10 CHAR) DEFAULT 'offline', 
	"COPYTOOL" VARCHAR2(80 CHAR), 
	"COPYSETUP" VARCHAR2(200 CHAR), 
	"RELEASES" VARCHAR2(500 CHAR), 
	"SEPATH" VARCHAR2(400 BYTE), 
	"ENVSETUP" VARCHAR2(200 CHAR), 
	"COPYPREFIX" VARCHAR2(500 CHAR), 
	"LFCPATH" VARCHAR2(80 CHAR), 
	"SEOPT" VARCHAR2(400 BYTE), 
	"SEIN" VARCHAR2(400 BYTE), 
	"SEINOPT" VARCHAR2(400 BYTE), 
	"LFCHOST" VARCHAR2(80 CHAR), 
	"CLOUD" VARCHAR2(60 CHAR), 
	"SITEID" VARCHAR2(60 CHAR), 
	"PROXY" VARCHAR2(80 CHAR), 
	"RETRY" VARCHAR2(10 CHAR), 
	"QUEUEHOURS" NUMBER(7,0) DEFAULT '0', 
	"ENVSETUPIN" VARCHAR2(200 CHAR), 
	"COPYTOOLIN" VARCHAR2(180 CHAR), 
	"COPYSETUPIN" VARCHAR2(200 CHAR), 
	"SEPRODPATH" VARCHAR2(400 BYTE), 
	"LFCPRODPATH" VARCHAR2(80 CHAR), 
	"COPYPREFIXIN" VARCHAR2(360 CHAR), 
	"RECOVERDIR" VARCHAR2(80 CHAR), 
	"MEMORY" NUMBER(10,0) DEFAULT '0', 
	"MAXTIME" NUMBER(10,0) DEFAULT '0', 
	"SPACE" NUMBER(10,0) DEFAULT '0', 
	"TSPACE" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"CMTCONFIG" VARCHAR2(250 CHAR), 
	"SETOKENS" VARCHAR2(80 CHAR), 
	"GLEXEC" VARCHAR2(10 CHAR), 
	"PRIORITYOFFSET" VARCHAR2(60 CHAR), 
	"ALLOWEDGROUPS" VARCHAR2(100 CHAR), 
	"DEFAULTTOKEN" VARCHAR2(100 CHAR), 
	"PCACHE" VARCHAR2(100 CHAR), 
	"VALIDATEDRELEASES" VARCHAR2(500 BYTE) DEFAULT null, 
	"ACCESSCONTROL" VARCHAR2(20 BYTE) DEFAULT null, 
	"DN" VARCHAR2(100 CHAR), 
	"EMAIL" VARCHAR2(60 CHAR), 
	"ALLOWEDNODE" VARCHAR2(80 CHAR), 
	"MAXINPUTSIZE" NUMBER(10,0), 
	"TIMEFLOOR" NUMBER(5,0), 
	"DEPTHBOOST" NUMBER(10,0), 
	"IDLEPILOTSUPRESSION" NUMBER(10,0), 
	"PILOTLIMIT" NUMBER(10,0), 
	"TRANSFERRINGLIMIT" NUMBER(10,0), 
	"CACHEDSE" NUMBER(1,0), 
	"CORECOUNT" NUMBER(3,0), 
	"COUNTRYGROUP" VARCHAR2(64 BYTE), 
	"AVAILABLECPU" VARCHAR2(64 BYTE), 
	"AVAILABLESTORAGE" VARCHAR2(64 BYTE), 
	"PLEDGEDCPU" VARCHAR2(64 BYTE), 
	"PLEDGEDSTORAGE" VARCHAR2(64 BYTE), 
	"STATUSOVERRIDE" VARCHAR2(256 BYTE) DEFAULT 'offline', 
	"ALLOWDIRECTACCESS" VARCHAR2(10 BYTE) DEFAULT 'False', 
	"GOCNAME" VARCHAR2(64 BYTE) DEFAULT 'site', 
	"TIER" VARCHAR2(15 BYTE), 
	"MULTICLOUD" VARCHAR2(64 BYTE), 
	"LFCREGISTER" VARCHAR2(10 BYTE), 
	"STAGEINRETRY" NUMBER(10,0) DEFAULT 2, 
	"STAGEOUTRETRY" NUMBER(10,0) DEFAULT 2, 
	"FAIRSHAREPOLICY" VARCHAR2(512 BYTE), 
	"ALLOWFAX" VARCHAR2(64 BYTE), 
	"FAXREDIRECTOR" VARCHAR2(256 BYTE), 
	"MAXWDIR" NUMBER(10,0), 
	"CELIST" VARCHAR2(4000 BYTE), 
	"MINMEMORY" NUMBER(10,0), 
	"MAXMEMORY" NUMBER(10,0), 
	"MINTIME" NUMBER(10,0), 
	"ALLOWJEM" VARCHAR2(64 BYTE), 
	"CATCHALL" VARCHAR2(512 BYTE), 
	"FAXDOOR" VARCHAR2(128 BYTE), 
	"WANSOURCELIMIT" NUMBER(5,0), 
	"WANSINKLIMIT" NUMBER(5,0), 
	"AUTO_MCU" NUMBER(1,0) DEFAULT 0, 
	"OBJECTSTORE" VARCHAR2(512 BYTE), 
	"ALLOWHTTP" VARCHAR2(64 BYTE), 
	"HTTPREDIRECTOR" VARCHAR2(256 BYTE), 
	"MULTICLOUD_APPEND" VARCHAR2(64 BYTE), 
	"COREPOWER" NUMBER, 
	"WNCONNECTIVITY" VARCHAR2(256 BYTE), 
	"CLOUDRSHARE" VARCHAR2(256 BYTE), 
	"SITERSHARE" VARCHAR2(256 BYTE), 
	"AUTOSETUP_POST" VARCHAR2(512 BYTE), 
	"AUTOSETUP_PRE" VARCHAR2(512 BYTE), 
	"DIRECT_ACCESS_LAN" VARCHAR2(32 BYTE) DEFAULT 'False', 
	"DIRECT_ACCESS_WAN" VARCHAR2(32 BYTE) DEFAULT 'False', 
	"MAXRSS" NUMBER(6,0) DEFAULT 0, 
	"MINRSS" NUMBER(6,0) DEFAULT 0, 
	"USE_NEWMOVER" VARCHAR2(32 BYTE) DEFAULT 'False', 
	"PILOTVERSION" VARCHAR2(32 BYTE) DEFAULT 'current', 
	"OBJECTSTORES" VARCHAR2(4000 BYTE), 
	"CONTAINER_OPTIONS" VARCHAR2(1024 BYTE), 
	"CONTAINER_TYPE" VARCHAR2(256 BYTE), 
	"JOBSEED" VARCHAR2(16 BYTE), 
	"PILOT_MANAGER" VARCHAR2(16 BYTE), 
	"CAPABILITY" VARCHAR2(16 BYTE), 
	"RESOURCE_TYPE" VARCHAR2(16 BYTE), 
	"WORKFLOW" VARCHAR2(16 BYTE), 
	"MAXDISKIO" NUMBER(10,0)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."NAME" IS 'Unused. Set to default.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."NICKNAME" IS 'The unique PRIMARY KEY of the table. The queue is named by this parameter. Should match the config file name.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."QUEUE" IS 'GATEKEEPER/JOBMANAGER';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."LOCALQUEUE" IS 'local queue name to use in the queue''s batch SYSTEM. IF unset, this IS NOT specified.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SYSTEM" IS 'Same as JOBMANAGER';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SYSCONFIG" IS '(None or manual) IS Prevent BDII updating OF PARAMETERS';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ENVIRON" IS 'List of environment variables to be set. Example: APP=/home/osgstore/app TMP=/home/osgstore/tmp DATA=/home/osgstore/data';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."GATEKEEPER" IS 'The physical hostname of the headnode for the queue. For virtual queues, it is to be set';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."JOBMANAGER" IS 'condor, lsf, cream, arc, pbs, etc. For virtual queues, it is to.be.set.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SE" IS 'space token and full endpoint of default output destination. The path is extracted from the matching token in seprodpath If output files do not have spacetoken set, then the token in this entry is used. This applies to direct storage from T1 jobs, but not to subscriptions from T2(see setokens).';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DDM" IS 'A comma-separated list of DDM endpoints used for input data. For a T1 the order should match the setoken order, because this is used to translate the output file space token into the final ddm destination. It is ok for the ddm list to be longer than setokens, e.g. to have an extra input location. For a T2 this is typically just local PRODDISK. The first value in the list has some special meanings. 1) The free space in this endpoint ends up in schedconfig.space(updated via curl). 2) If the site is a T1, then it also ends up in the cloud table space, which is used for task assignment, 3) Bamboo may choose to subscribe EVNT input between clouds, to aid brokerage - the destination space token is this one.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."JDLADD" IS 'Any additional JDL needed for the queue. Must end with Queue, on its own line.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."GLOBUSADD" IS ' A part of the JDL for some circumstances. ??';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."JDL" IS 'The NAME of the entry in the jdllist table that provides the basic JDL for the jobs being submitted';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."JDLTXT" IS '??';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."VERSION" IS 'Unused';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SITE" IS 'Site name';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."REGION" IS 'Region. Example: us';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."GSTAT" IS ' Derived from AGIS atlas_site variable Derived FROM BDII GSTAT variable. Site IDENTITY.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."TAGS" IS 'Obsolete';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."CMD" IS 'Batch queue submit command for the queue. Examples: condor_submit -verbose %s, qsub -q panda %s';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."LASTMOD" IS 'Timestamp of last modification. Not stored in SVN.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ERRINFO" IS 'Not used.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."NQUEUE" IS 'Baseline number of pilots to queue. Not stored in SVN.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COMMENT_" IS 'Any comment necessary to the queue. This is NOT stored in the SVN.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."APPDIR" IS 'Directory in which the ATLAS Athena software releases are installed';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DATADIR" IS 'Directory in which data are stored';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."TMPDIR" IS 'Temp directory';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."WNTMPDIR" IS 'Worker node temp DIRECTORY ';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DQ2URL" IS 'DQ2 Access URL';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SPECIAL_PAR" IS 'Additional JDL to add to job';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."PYTHON_PATH" IS 'Sets the PYTHONPATH variable at run start';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."NODES" IS 'Number of compute elements in the queue''s possession.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."STATUS" IS 'Site online/offline/test/brokeroff status. Not stored in SVN.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COPYTOOL" IS 'The (inbound) outbound copy tool for (in)output files. Examples: cp, lcg-cp, storm, xcp. If COPYTOOLIN is None, this covers all copies in and out of the queue.
        lcg-cp ( lcgcp ): pilots use lcg-cr for upload to SE and registration to LFC
        lcg-cp2 ( lcgcp2 ): pilots use lcg-cp for upload to SE and no registration to LFC by pilot. To make the registration done the panda server, the other parameter needs to be set (LFCREGISTER=''server'')';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COPYSETUP" IS 'Commands to be run before (inbound) outbound copies; may be a script, or a set of commands like /somepath/setup.sh^srm://lcg-se0.ifh.de/^dcap://lcg-dc0.ifh.de:22125/^False^True. If COPYSETUPIN is None, this covers all copies in and out of the queue. For more info see https://twiki.cern.ch/twiki/bin/viewauth/Atlas/PandaPilot#Direct_access_vs_stage_in_mode';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."RELEASES" IS 'Becoming obsolete. List of releases available, separated by pipes. Autogenerated for BDII sites. Example: 0.1.31|0.1.32|0.1.33|0.1.34|14.2.21|14.2.25|15.0.0|15.3.1|15.5.4|15.6.1|15.6.10|15.6.11|15.6.3|15.6.5|15.6.6|15.6.7|15.6.8|15.6.9|15.8.0';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SEPATH" IS 'Same as SEPRODPATH but for analysis sites';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ENVSETUP" IS 'Command that is run (can be variable setting or script) to set up copy for (in)out transfers. If ENVSETUPIN is None, this covers all copies in and out of the queue.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COPYPREFIX" IS 'Prefix for SRM copies out from the queue. Example: ^srm://gk03.atlas-swt2.org. If COPYPREFIXIN is None, this covers all copies in and out of the queue.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."LFCPATH" IS 'LFC path on LFCHOST to use with this queue.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SEOPT" IS 'Comma separated list. seopt is used in combination with SETOKENS to select the proper SE corresponding to a given space token descriptor. The order of SE''s listed IN SEOPT has TO match THE ORDER OF tokens IN SETOKENS';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SEIN" IS 'Comma separated list of SEs, same length as DDM and SEPATH/SEPRODPATH for input transfers';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SEINOPT" IS 'Currently not used by the pilot';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."LFCHOST" IS 'LFC (LHC File Catalog) to use with this queue.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."CLOUD" IS 'The home cloud, possibly at the start of a comma-separated list of clouds. The site can contribute to any cloud in the list(Multi-cloud) If disabled, the config file will be found in "Disabled"';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SITEID" IS 'Name of similar queues in site (shared gatekeepers)';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."PROXY" IS 'donothide or noimport. Currently not used by the pilot';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."RETRY" IS '(TRUE or FALSE) Turns on or off job recovery';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."QUEUEHOURS" IS 'Max job lifetime in hours';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ENVSETUPIN" IS 'Command that is run (can be variable setting or script) to set up copy for out transfers.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COPYTOOLIN" IS 'The inbound copy tool for input files. Examples: cp, lcg-cp, storm, xcp. If set to None, COPYTOOL will be used for both stage-in and stage-out';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COPYSETUPIN" IS 'Commands to be run before inbound copies; essentially the same as COPYSETUP but can be used to specify a different stage-in setup than for stage-out';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SEPRODPATH" IS 'list of destination paths, to append to endpoint in ''se''. Compressed notation is supported /blah/[tok1,tok2]/more/. Must be the same length as setokens.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."LFCPRODPATH" IS 'LFC path on LFCHOST to use with this queue for PROD jobs.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COPYPREFIXIN" IS 'Prefix for SRM copies into the queue. Example: ^srm://gk03.atlas-swt2.org';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."RECOVERDIR" IS 'Local env. variable for recovery data. Example: $ATLAS_RECOVERDIR';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."MEMORY" IS 'Memory available, MB. Zero means infinite. The pilot wrapper will set this as a virtual memory limit for athena to cause a clean malloc() failure.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."MAXTIME" IS 'Wall time. Zero means infinite.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SPACE" IS 'Available disk space on the site. Refers to first token in ddm.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."TSPACE" IS '?';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."CMTCONFIG" IS 'Set to the appropriate CMTCONFIG for a queue. Mostly i686-slc5-gcc43-opt';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."SETOKENS" IS 'List of destination space tokens. The first token is the default destination(for subscription from T2) if an output file does not have spacetoken set. Must match length of SEPRODPATH';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."GLEXEC" IS 'Is GLEXEC set? (No, for the most part)';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."PRIORITYOFFSET" IS '??';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ALLOWEDGROUPS" IS 'Sets allowed VOMS groups for the queue. Example: /atlas/.+/Role=production';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DEFAULTTOKEN" IS '??';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."PCACHE" IS 'pCache enabled ( None or 1)';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."VALIDATEDRELEASES" IS 'Reprocessing jobs are brokered only to the queues with this value set to ''True''';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ACCESSCONTROL" IS 'Allows access to specific groups of people. Set to grouplist if desired';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DN" IS 'Grid DN of the most recent modifier';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."EMAIL" IS 'The site admin contact email(s)';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ALLOWEDNODE" IS 'Determines allowed worker node names within the queue. Example: (brndt3head|wrk[0-9]+prv)\.hep\.brandeis\.edu';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."MAXINPUTSIZE" IS '14336 is the default (14 GB), but can be higher. Maximum copy-to-scratch input data total. To be obsolete after MAXWDIR being set properly.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."TIMEFLOOR" IS 'The pilot will keep downloading jobs during the limit set by timefloor (minutes). If at the end of a job, more time has passed than that of timefloor since the beginning of the first job, the pilot will end';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DEPTHBOOST" IS 'Maximum number of pilotDepth block submissions when a site has enough jobs';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."IDLEPILOTSUPRESSION" IS 'O nly send an idling pilot every N cycles';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."PILOTLIMIT" IS 'Maximum number of pilots to have (in any state) at a site';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."TRANSFERRINGLIMIT" IS 'Maximum number of transferring jobs to allow at a site';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."CACHEDSE" IS 'Enable PD2P by setting to 1. Only relevant for ANALY sites.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."CORECOUNT" IS 'Number of cores per machine for AthenaMP use';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."COUNTRYGROUP" IS 'Allows for national federations';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."AVAILABLECPU" IS 'Amount of the real CPU capacity of the site as seen by ATLAS in HS06 (cf. PLEDGEDCPU). It could be the entire capacity of the site for an ATLAS-only site, the capacity of the ATLAS share, or the capacity of the ATLAS share plus an average capacity increment from opportunistic ATLAS use of non-ATLAS resources at the site.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."AVAILABLESTORAGE" IS 'Amount of real storage compared to pledged PLEDGEDSTORAGE';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."PLEDGEDSTORAGE" IS 'Storage Pledges (MoU), contributes to ration with AVAILABLESTORAGE';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."STATUSOVERRIDE" IS '(offline, notonline, None) to manage changing of site status through cloud curl commands. Default IS ''offline'', site will not change status. notonline IS ''site cannot be set online. None IS ''all changes are possible''';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ALLOWDIRECTACCESS" IS 'Jobs with transferType=direct will be matched by brokerage to sites with allowdirectaccess=True, allowdirectaccess=True for all sites which have copysetup true for direct access. Default False';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."GOCNAME" IS ' Set from AGIS rc_name';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."TIER" IS '?';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."LFCREGISTER" IS 'LFC registration is done by the pilot ( ''NONE'' ) or by the panda server ( ''server'' ). should be used with COPYTOOL=lcgcp2 . All the queues in the panda siteid MUST have the same value.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."ALLOWFAX" IS 'Is FAX allowed or not? (True/False)';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."FAXREDIRECTOR" IS 'The FAX redirector (e.g. root://glrd.usatlas.org/)';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."MAXWDIR" IS 'Maximum available workdir space per job. The initial value has been set as MAXINPUTSIZE + 2GB';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."CELIST" IS 'A JSON representation of the list of CEs that a virtual queue (often seen in ANALY queues) may address. To populate, work by analogy from other queues where celist is set. This is ONLY for AGIS compatibility, to allow changes to schedconfig to auto-populate AGIS.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."AUTOSETUP_POST" IS 'Path to local setup files, or blank when not needed.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."AUTOSETUP_PRE" IS 'Path to local setup files, or blank when not needed.';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DIRECT_ACCESS_LAN" IS 'To manage direct access (LAN) configuration, replacing the copysetup fields. We will still keep the copysetup[in] fields, but they will not be used in the same complex way';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."DIRECT_ACCESS_WAN" IS 'To manage direct access (WAN) configuration, replacing the copysetup fields. We will still keep the copysetup[in] fields, but they will not be used in the same complex way';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."MAXRSS" IS 'Limit on the RSS memory available to the process being run by the pilot';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."MINRSS" IS 'Minimum RSS memory available to the process being run by the pilot';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."PILOTVERSION" IS 'Allows specification of a pilot version that should run on the queue. Default is "current"';
   COMMENT ON COLUMN "ATLAS_PANDAMETA"."SCHEDCONFIG"."OBJECTSTORES" IS 'Stores the objectstore characteristics of a queue';
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
	"FLAG" VARCHAR2(20 CHAR), 
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
  :new.lastmod := sysdate;
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
--  Constraints for Table INSTALLEDSW
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDAMETA"."INSTALLEDSW" ADD CONSTRAINT "INSTALLEDSW_SITERELCACHECMT_UK" UNIQUE ("SITEID", "RELEASE", "CACHE", "CMTCONFIG")
  USING INDEX  ENABLE;
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

