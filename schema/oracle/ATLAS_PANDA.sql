--------------------------------------------------------
--  File created - Wednesday-October-19-2022   
--  Schema version: 0.0.17
--  IMPORTANT: Please always update version below 
--  to match the current DB schema
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PANDADB_VERSION
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."PANDADB_VERSION" 
   (	"COMPONENT" VARCHAR2(100 BYTE) NOT NULL, 
	"MAJOR" NUMBER(6,0) NOT NULL, 
	"MINOR" NUMBER(6,0) NOT NULL, 
	"PATCH" NUMBER(6,0) NOT NULL
   ) ;

--------------------------------------------------------
--  DDL for Index PANDADB_VERSION_COMPONENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PANDADB_VERSION_COMPONENT_PK" ON "ATLAS_PANDA"."PANDADB_VERSION" ("COMPONENT") 
  ;

--------------------------------------------------------
--  Constraints for Table PANDADB_VERSION
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."PANDADB_VERSION" ADD CONSTRAINT "PANDADB_VERSION_COMPONENT_PK" PRIMARY KEY ("COMPONENT")
  USING INDEX  ENABLE;

--------------------------------------------------------
--  Schema version for Table PANDADB_VERSION
--  IMPORTANT: Please always update to up2date version
--------------------------------------------------------
  
  INSERT INTO "ATLAS_PANDA"."PANDADB_VERSION" VALUES ('SERVER', 0, 0, 23);
  INSERT INTO "ATLAS_PANDA"."PANDADB_VERSION" VALUES ('JEDI', 0, 0, 23);

 --------------------------------------------------------
--  DDL for Sequence FILESTABLE4_ROW_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."FILESTABLE4_ROW_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

 --------------------------------------------------------
--  DDL for Sequence GROUP_JOBID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."GROUP_JOBID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence HARVESTER_COMMAND_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."HARVESTER_COMMAND_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence JEDI_DATASETS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."JEDI_DATASETS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence JEDI_DATASET_CONT_FILEID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."JEDI_DATASET_CONT_FILEID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence JEDI_OUTPUT_TEMPLATE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence JEDI_WORK_QUEUE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."JEDI_WORK_QUEUE_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence JOBSDEFINED4_PANDAID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."JOBSDEFINED4_PANDAID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence RETRYACTIONS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."RETRYACTIONS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence RETRYERRORS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."RETRYERRORS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SUBCOUNTER_SUBID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."SUBCOUNTER_SUBID_SEQ"  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  CYCLE ;

--------------------------------------------------------
--  DDL for Sequence JEDI_DATA_CAROUSEL_REQUEST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ATLAS_PANDA"."JEDI_DATA_CAROUSEL_REQUEST_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER NOCYCLE;

--------------------------------------------------------
--  DDL for Table CONFIG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."CONFIG" 
   (	"APP" VARCHAR2(64 BYTE), 
	"COMPONENT" VARCHAR2(64 BYTE), 
	"KEY" VARCHAR2(64 BYTE), 
	"VALUE" VARCHAR2(256 BYTE), 
	"TYPE" VARCHAR2(64 BYTE), 
	"VO" VARCHAR2(16 BYTE), 
	"DESCR" VARCHAR2(256 BYTE), 
	 CONSTRAINT "CONFIG_DATA_PK" PRIMARY KEY ("APP", "COMPONENT", "KEY", "VO") ENABLE
   ) ORGANIZATION INDEX COMPRESS 2 ;

   COMMENT ON COLUMN "ATLAS_PANDA"."CONFIG"."APP" IS 'Application. E.g. jedi or pandaserver';
   COMMENT ON COLUMN "ATLAS_PANDA"."CONFIG"."COMPONENT" IS 'Component. E.g. prodjobbrokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."CONFIG"."KEY" IS 'Key for config entry. E.g. iointensitylimit';
   COMMENT ON COLUMN "ATLAS_PANDA"."CONFIG"."VALUE" IS 'Value for config entry. E.g. 500';
   COMMENT ON COLUMN "ATLAS_PANDA"."CONFIG"."TYPE" IS 'Python type, e.g. bool, int...';
   COMMENT ON COLUMN "ATLAS_PANDA"."CONFIG"."VO" IS 'VO/Experiment, e.g. atlas, ams, compass...';
   COMMENT ON COLUMN "ATLAS_PANDA"."CONFIG"."DESCR" IS 'Description what the entry is used for';
   COMMENT ON TABLE "ATLAS_PANDA"."CONFIG"  IS 'Central configuration table for jedi and panda server';

--------------------------------------------------------
--  DDL for Table CONFIG
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."JEDI_DATASET_LOCALITY"
(
    "JEDITASKID" NUMBER(11) NOT NULL,
    "DATASETID" NUMBER(11) NOT NULL,
    "RSE" VARCHAR2(64) NOT NULL,
    "TIMESTAMP" DATE NOT NULL,
    CONSTRAINT "JEDI_DATASET_LOCALITY_PK" PRIMARY KEY("JEDITASKID", "DATASETID", "RSE")
);


--------------------------------------------------------
--  DDL for Table DATASETS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."DATASETS" 
   (	"VUID" VARCHAR2(40 BYTE), 
	"NAME" VARCHAR2(255 CHAR), 
	"VERSION" VARCHAR2(10 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"STATUS" VARCHAR2(10 BYTE), 
	"NUMBERFILES" NUMBER(9,0), 
	"CURRENTFILES" NUMBER(9,0), 
	"CREATIONDATE" DATE, 
	"MODIFICATIONDATE" DATE, 
	"MOVERID" NUMBER(11,0) DEFAULT 0, 
	"TRANSFERSTATUS" NUMBER(1,0) DEFAULT 0, 
	"SUBTYPE" VARCHAR2(5 BYTE)
   ) 
  PARTITION BY RANGE ("MODIFICATIONDATE") INTERVAL (NUMTOYMINTERVAL(1,'MONTH')) 
 (PARTITION "DATASETS_BEFORE_01122011"  VALUES LESS THAN (TO_DATE(' 2011-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."VUID" IS 'vuid of the dataset';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."NAME" IS 'Dataset name. The _sub+number comes from auto-incremented value of the SUBCOUNTER_SUBID_SEQ sequence. It is used to have a unique number in each panda internal dataset name. The Sequence is defined to be cycling from values 1 to 9999999 in order to restrict the number of digits to maximum 7';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."VERSION" IS 'version number';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."TYPE" IS 'type of the dataset, such as input, output, and log';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."STATUS" IS 'dataset status';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."NUMBERFILES" IS 'the total number of files in the dataset';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."CURRENTFILES" IS 'current number of files in the dataset';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."CREATIONDATE" IS 'set when the dataset is used in panda at the first time';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."MODIFICATIONDATE" IS 'updated when contents and/or status of the dataset is changed (in UTC)';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."MOVERID" IS 'PandaID of the pandamover which transfers files in the dataset';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."TRANSFERSTATUS" IS 'used when the dataset is transferred to multiple destinations';
   COMMENT ON COLUMN "ATLAS_PANDA"."DATASETS"."SUBTYPE" IS 'sub-type of the dataset';
   COMMENT ON TABLE "ATLAS_PANDA"."DATASETS"  IS 'Datasets with which the PanDA jobs work with for a certain period. Data retention is defined to be 3 months (can be changed if necessary)';


--------------------------------------------------------
--  DDL for Table DDM_ENDPOINT
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."DDM_ENDPOINT" 
   (	"DDM_ENDPOINT_NAME" VARCHAR2(52 BYTE), 
	"SITE_NAME" VARCHAR2(52 BYTE), 
	"DDM_SPACETOKEN_NAME" VARCHAR2(52 BYTE), 
	"SPACE_TOTAL" NUMBER(11,0), 
	"SPACE_FREE" NUMBER(11,0), 
	"SPACE_USED" NUMBER(11,0), 
	"IS_TAPE" VARCHAR2(1 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"BLACKLISTED" CHAR(1 BYTE),
	"BLACKLISTED_READ" CHAR(1 BYTE),
	"BLACKLISTED_WRITE" CHAR(1 BYTE),
	"SPACE_EXPIRED" NUMBER(11,0), 
	"SPACE_TIMESTAMP" TIMESTAMP (0)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."DDM_ENDPOINT_NAME" IS 'DDM endpoint name';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."SITE_NAME" IS 'Site name';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."DDM_SPACETOKEN_NAME" IS 'Spacetoken name';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."SPACE_TOTAL" IS 'Total space of a DDM endpoint as reported by Rucio. Value in GB';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."SPACE_FREE" IS 'Free space of a DDM endpoint as reported by Rucio. Value in GB';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."SPACE_USED" IS 'Used space of a DDM endpoint as reported by Rucio. Value in GB';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."IS_TAPE" IS 'Defines whether the DDM endpoint is a tape storageY/N';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."TYPE" IS 'Type of spacetoken, e.g. DATADISK, LOCALGROUPDISK...';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."BLACKLISTED" IS 'Defines whether a DDM endpoint is blacklisted or not (Y/N)';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."BLACKLISTED_READ" IS 'Defines whether a DDM endpoint is blacklisted for read (Y/N)';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."BLACKLISTED_WRITE" IS 'Defines whether a DDM endpoint is blacklisted for write (Y/N)';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."SPACE_EXPIRED" IS 'Expired, used space in GB';
   COMMENT ON COLUMN "ATLAS_PANDA"."DDM_ENDPOINT"."SPACE_TIMESTAMP" IS 'Timestamp reported by Rucio for the SRM space values';
   COMMENT ON TABLE "ATLAS_PANDA"."DDM_ENDPOINT"  IS 'DDM/Rucio storage endpoint.Table needed for the "Configurator" agent. The table consolidate information from other sources (AGIS and Rucio ) and caches it so that Panda can easily retrieve it and use it for brokerage.';


--------------------------------------------------------
--  DDL for Table FILESTABLE4
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."FILESTABLE4" 
   (	"ROW_ID" NUMBER(11,0), 
	"PANDAID" NUMBER(11,0) DEFAULT '0', 
	"MODIFICATIONTIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"GUID" VARCHAR2(64 BYTE), 
	"LFN" VARCHAR2(256 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"DATASET" VARCHAR2(255 CHAR), 
	"STATUS" VARCHAR2(64 BYTE), 
	"PRODDBLOCK" VARCHAR2(255 CHAR), 
	"PRODDBLOCKTOKEN" VARCHAR2(250 BYTE), 
	"DISPATCHDBLOCK" VARCHAR2(255 CHAR), 
	"DISPATCHDBLOCKTOKEN" VARCHAR2(250 BYTE), 
	"DESTINATIONDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONDBLOCKTOKEN" VARCHAR2(250 BYTE), 
	"DESTINATIONSE" VARCHAR2(250 BYTE), 
	"FSIZE" NUMBER(11,0) DEFAULT '0', 
	"MD5SUM" VARCHAR2(36 BYTE), 
	"CHECKSUM" VARCHAR2(36 BYTE), 
	"SCOPE" VARCHAR2(30 BYTE), 
	"JEDITASKID" NUMBER(11,0), 
	"DATASETID" NUMBER(11,0), 
	"FILEID" NUMBER(11,0), 
	"ATTEMPTNR" NUMBER(3,0)
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "PART_INITIAL_01011970"  VALUES LESS THAN (TO_DATE(' 1970-01-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."ROW_ID" IS 'auto-increment ID of the row generated from the FILESTABLE4_ROW_ID_SEQ sequence';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."PANDAID" IS 'PandaID of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."MODIFICATIONTIME" IS 'modification time of the job (in UTC)';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."GUID" IS 'GUID of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."LFN" IS 'logical file name of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."TYPE" IS 'type of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."DATASET" IS 'dataset name where input/output files belong to';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."STATUS" IS 'status of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."PRODDBLOCK" IS 'name of datablock where input files of the job is part of';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."PRODDBLOCKTOKEN" IS 'token of PRODDBLOCK';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."DISPATCHDBLOCK" IS 'name of dispatch datablock; a prodDBlock may be broken down into smaller blocks for dispatch to sites';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."DISPATCHDBLOCKTOKEN" IS 'token of DISPATCHDBLOCK';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."DESTINATIONDBLOCK" IS 'name of destination datablock is used to register the outputs of an associated set of jobs as belonging to one block to be saved at an archival destination';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."DESTINATIONDBLOCKTOKEN" IS 'token of DESTINATIONDBLOCK';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."DESTINATIONSE" IS 'destination storage element (archival destination) of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."FSIZE" IS 'file size in bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."MD5SUM" IS 'md5sum of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."CHECKSUM" IS 'any checksum of the file (either adler32 or md5sum)';
   COMMENT ON COLUMN "ATLAS_PANDA"."FILESTABLE4"."SCOPE" IS 'Scope (user, group, project) of the file provided by the DDM system';
   COMMENT ON TABLE "ATLAS_PANDA"."FILESTABLE4"  IS 'Table for hosting the files each PanDA job deals with (input, output, log). When a PanDA job is in a defined or running state, relevant rows reside in the INITIAL partition of the table. When it is finished or aborted the "modificationtime" is set to the real current time and as the table has "row movement" enabled, Oracle moves the rows from the INITIAL partition to the partitions of the current day. Data is regularly copied to an archive table in ATLAS_PANDAARCH schema. Data retention of the FILESTABLE4 table is defined to be 30 days (can be changed if necessary)';

--------------------------------------------------------
--  DDL for Table GLOBAL_SHARES
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."GLOBAL_SHARES" 
   (	"NAME" VARCHAR2(32 BYTE), 
	"VALUE" NUMBER(3,0), 
	"PARENT" VARCHAR2(32 BYTE), 
	"PRODSOURCELABEL" VARCHAR2(100 BYTE), 
	"WORKINGGROUP" VARCHAR2(100 BYTE), 
	"CAMPAIGN" VARCHAR2(100 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(100 BYTE), 
	"VO" VARCHAR2(32 BYTE), 
	"QUEUE_ID" NUMBER(5,0), 
	"THROTTLED" CHAR(1 BYTE), 
	"TRANSPATH" VARCHAR2(128 BYTE), 
	"RTYPE" VARCHAR2(16 BYTE)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."NAME" IS 'Global share name';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."VALUE" IS 'Percentage of resources assigned to share. E.g. 20';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."PARENT" IS 'Name of the parent of the global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."PRODSOURCELABEL" IS 'Prod source label (user, managed, etc), as in the jedi_tasks table. Can be python regexp';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."WORKINGGROUP" IS 'Working group as in the jedi_tasks table. Can be python regexp';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."CAMPAIGN" IS 'Campaign as in the jedi_tasks table. Can be python regexp';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."PROCESSINGTYPE" IS 'Processing type as in the jedi_tasks table. Can be python regexp';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."VO" IS 'Virtual Organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."QUEUE_ID" IS 'Queue ID for compatibility reasons. Define the 9000 range as gs range, in order not to conflict with jedi_work_queue IDs';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."THROTTLED" IS 'Global share is throttled or not';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."TRANSPATH" IS 'The name of the transformation';
   COMMENT ON COLUMN "ATLAS_PANDA"."GLOBAL_SHARES"."RTYPE" IS 'Type of the resources, for example grid, cloud or hpc';
   COMMENT ON TABLE "ATLAS_PANDA"."GLOBAL_SHARES"  IS 'Global share definitions';

--------------------------------------------------------
--  DDL for Table GLOBAL_SHARES. This table is optional
--  if you want to track changes in the global shares
--  and filled by the trigger GLOBAL_SHARES_AUDIT_TRIGGER
--------------------------------------------------------
CREATE TABLE "ATLAS_PANDA"."GLOBAL_SHARES_AUDIT"
(
    "AUDIT_ID" NUMBER GENERATED ALWAYS AS IDENTITY,
    "OPERATION" VARCHAR2(10 BYTE),
    "TIMESTAMP" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "USERNAME" VARCHAR2(100 BYTE),
    "CURRENT_USER" VARCHAR2(100 BYTE),
    "HOST" VARCHAR2(256 BYTE),
    "IP_ADDRESS" VARCHAR2(45 BYTE),
    "OS_USER" VARCHAR2(256 BYTE),
    "MODULE" VARCHAR2(64 BYTE),
    "CLIENT_PROGRAM_NAME" VARCHAR2(256 BYTE),
    "SESSIONID" VARCHAR2(128 BYTE),
    "SID" NUMBER,
    "NAME" VARCHAR2(32 BYTE),
    "VALUE" NUMBER(3,0),
    "PARENT" VARCHAR2(32 BYTE),
    "PRODSOURCELABEL" VARCHAR2(100 BYTE),
    "WORKINGGROUP" VARCHAR2(100 BYTE),
    "CAMPAIGN" VARCHAR2(100 BYTE),
    "PROCESSINGTYPE" VARCHAR2(100 BYTE),
    "VO" VARCHAR2(32 BYTE),
    "QUEUE_ID" NUMBER(5,0),
    "THROTTLED" CHAR(1 BYTE),
    "TRANSPATH" VARCHAR2(128 BYTE),
    "RTYPE" VARCHAR2(16 BYTE)
);

--------------------------------------------------------
--  DDL for Table HARVESTER_COMMANDS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_COMMANDS" 
   (	"COMMAND_ID" NUMBER(10,0), 
	"COMMAND" VARCHAR2(200 BYTE), 
	"HARVESTER_ID" VARCHAR2(50 BYTE), 
	"ACK_REQUESTED" NUMBER(1,0), 
	"CREATION_DATE" DATE, 
	"STATUS" VARCHAR2(32 BYTE), 
	"STATUS_DATE" DATE, 
	"PARAMS" CLOB
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMANDS"."COMMAND_ID" IS 'Command ID for primary key';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMANDS"."ACK_REQUESTED" IS '0/1, depending on whether panda server expects and acknowledgement';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMANDS"."CREATION_DATE" IS 'Timestamp when the command was generated';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMANDS"."STATUS" IS 'Status of the call: new, retrieved, acknowledged...';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMANDS"."STATUS_DATE" IS 'Timestamp when the status last changed';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMANDS"."PARAMS" IS 'Parameters for the call';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_COMMANDS"  IS 'Command queue for harvester';

--------------------------------------------------------
--  DDL for Table HARVESTER_COMMAND_LOCK
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" 
   (	"HARVESTER_ID" VARCHAR2(50 BYTE), 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"RESOURCETYPE" VARCHAR2(56 BYTE), 
	"COMMAND" VARCHAR2(200 BYTE), 
	"LOCKEDTIME" DATE, 
	"LOCKEDBY" VARCHAR2(40 BYTE), 
	 CONSTRAINT "HARVESTER_COMMAND_LOCK_PK" PRIMARY KEY ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "COMMAND") ENABLE
   ) ORGANIZATION INDEX COMPRESS 1 ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK"."HARVESTER_ID" IS 'Identifier of the target harvester instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK"."COMPUTINGSITE" IS 'Panda Queue name';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK"."RESOURCETYPE" IS 'Resource type';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK"."COMMAND" IS 'Command string';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK"."LOCKEDTIME" IS 'Timestamp when the command is locked';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK"."LOCKEDBY" IS 'Process name which locks the command';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK"  IS 'Exclusive locks to send commands to harvester';

--------------------------------------------------------
--  DDL for Table HARVESTER_DIALOGS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_DIALOGS" 
   (	"HARVESTER_ID" VARCHAR2(50 BYTE), 
	"DIAGID" NUMBER(11,0), 
	"MODULENAME" VARCHAR2(100 BYTE), 
	"IDENTIFIER" VARCHAR2(100 BYTE), 
	"CREATIONTIME" DATE, 
	"MESSAGELEVEL" VARCHAR2(10 BYTE), 
	"DIAGMESSAGE" VARCHAR2(500 BYTE)
   ) 
  PARTITION BY RANGE ("CREATIONTIME") INTERVAL (NUMTODSINTERVAL(1,'DAY')) 
 (PARTITION "DATA_BEFORE_01032018"  VALUES LESS THAN (TO_DATE(' 2018-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_DIALOGS"."HARVESTER_ID" IS 'Identifier of the harvester instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_DIALOGS"."DIAGID" IS 'Serial number of the message';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_DIALOGS"."MODULENAME" IS 'The module name which sent the message';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_DIALOGS"."IDENTIFIER" IS 'Identifier of the message if any';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_DIALOGS"."CREATIONTIME" IS 'Timestamp when the message is sent';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_DIALOGS"."MESSAGELEVEL" IS 'Message level';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_DIALOGS"."DIAGMESSAGE" IS 'Dialog message';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_DIALOGS"  IS 'Table for publishing diagnostic information of harvester instances in PandaMon';

--------------------------------------------------------
--  DDL for Table HARVESTER_INSTANCES
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_INSTANCES" 
   (	"HARVESTER_ID" VARCHAR2(50 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE), 
	"STARTTIME" DATE, 
	"OWNER" VARCHAR2(100 BYTE), 
	"HOSTNAME" VARCHAR2(100 BYTE), 
	"LASTUPDATE" DATE, 
	"SW_VERSION" VARCHAR2(50 BYTE), 
	"COMMIT_STAMP" VARCHAR2(100 BYTE), 
	 CONSTRAINT "HARVESTER_INSTANCES_PK" PRIMARY KEY ("HARVESTER_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."HARVESTER_ID" IS 'Name of the harvester instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."DESCRIPTION" IS 'Harvester instance description';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."STARTTIME" IS 'Start time';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."OWNER" IS 'Owner of the instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."HOSTNAME" IS 'Hostname where the instance is running';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."LASTUPDATE" IS 'Data and time set when the record is updated';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."SW_VERSION" IS 'Software version';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_INSTANCES"."COMMIT_STAMP" IS 'Commit stamp in the repository';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_INSTANCES"  IS 'Harvester instance registry';

--------------------------------------------------------
--  DDL for Table HARVESTER_METRICS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_METRICS" 
   (	"HARVESTER_ID" VARCHAR2(50 BYTE), 
	"CREATION_TIME" DATE DEFAULT sysdate, 
	"HARVESTER_HOST" VARCHAR2(100 BYTE), 
	"METRICS" VARCHAR2(4000 BYTE)
   ) 
  PARTITION BY RANGE ("CREATION_TIME") INTERVAL (NUMTODSINTERVAL(1,'DAY')) 
 (PARTITION "DATA_BEFORE_01112018"  VALUES LESS THAN (TO_DATE(' 2018-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_METRICS"."METRICS" IS 'The harvester service metrics are in JSON structure which is in the order of tens key-value pairs (memory, CPU, etc.)';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_METRICS"  IS 'Table to store harvester service metrics. The metrics are in JSON dictionary, not very big (O(10) values like memory, CPU, etc.). Enforce data sliding window of N days (e.g. 30 days)';

--------------------------------------------------------
--  DDL for Table HARVESTER_REL_JOBS_WORKERS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" 
   (	"HARVESTERID" VARCHAR2(50 BYTE), 
	"WORKERID" NUMBER(11,0), 
	"PANDAID" NUMBER(11,0), 
	"LASTUPDATE" DATE
   ) 
  PARTITION BY RANGE ("PANDAID") INTERVAL (1E8) 
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1E8) )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS"."HARVESTERID" IS 'Identifier of the harvester instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS"."WORKERID" IS 'Identifier of the worker';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS"."PANDAID" IS 'Job ID in PanDA';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS"."LASTUPDATE" IS 'Set when the record is updated';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS"  IS 'The table for relationship between jobs and workers. Combination of INSTANCEID, WORKERID, and PANDAID is unique. Deletion policy is to delete all records with LASTUPDATE<NOW-N_days';

--------------------------------------------------------
--  DDL for Table HARVESTER_SLOTS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_SLOTS" 
   (	"PANDAQUEUENAME" VARCHAR2(128 BYTE), 
	"GSHARE" VARCHAR2(32 BYTE), 
	"RESOURCETYPE" VARCHAR2(56 BYTE), 
	"NUMSLOTS" NUMBER(11,0), 
	"MODIFICATIONTIME" DATE, 
	"EXPIRATIONTIME" DATE
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_SLOTS"."PANDAQUEUENAME" IS 'PanDA queue name';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_SLOTS"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_SLOTS"."RESOURCETYPE" IS 'Resource type';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_SLOTS"."NUMSLOTS" IS 'The number of slots';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_SLOTS"."MODIFICATIONTIME" IS 'The time when the record was updated';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_SLOTS"."EXPIRATIONTIME" IS 'The time when the record expires';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_SLOTS"  IS 'Table for workload provisioning. It is required for some special resources like Sim@P1 where PanDa needs to assign jobs before the resource becomes available. The number of records would be less than 100. The combination ofÂ PANDAQUEUENAME,Â GSHARE, andÂ RESOURCETYPE is unique. The table has to have UNIQUE key in order DB to allow NULL values for GSHARE, andÂ RESOURCETYPE';

--------------------------------------------------------
--  DDL for Table HARVESTER_WORKERS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_WORKERS" 
   (	"HARVESTERID" VARCHAR2(50 BYTE), 
	"WORKERID" NUMBER(11,0), 
	"LASTUPDATE" DATE, 
	"STATUS" VARCHAR2(80 BYTE), 
	"BATCHID" VARCHAR2(80 BYTE), 
	"NODEID" VARCHAR2(80 BYTE), 
	"QUEUENAME" VARCHAR2(80 BYTE), 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"SUBMITTIME" DATE, 
	"STARTTIME" DATE, 
	"ENDTIME" DATE, 
	"NCORE" NUMBER(6,0), 
	"ERRORCODE" NUMBER(7,0), 
	"STDOUT" VARCHAR2(250 BYTE), 
	"STDERR" VARCHAR2(250 BYTE), 
	"BATCHLOG" VARCHAR2(250 BYTE), 
	"RESOURCETYPE" VARCHAR2(56 BYTE), 
	"NATIVEEXITCODE" NUMBER(7,0), 
	"NATIVESTATUS" VARCHAR2(80 BYTE), 
	"DIAGMESSAGE" VARCHAR2(500 BYTE), 
	"COMPUTINGELEMENT" VARCHAR2(128 BYTE), 
	"NJOBS" NUMBER(6,0), 
	"SUBMISSIONHOST" VARCHAR2(128 BYTE), 
	"HARVESTERHOST" VARCHAR2(128 BYTE), 
	"JDL" VARCHAR2(250 BYTE), 
	"JOBTYPE" VARCHAR2(52 BYTE),
	"PILOTSTARTTIME" DATE,
	"PILOTENDTIME" DATE,
	"PILOTSTATUS" VARCHAR2(80 BYTE),
	"PILOTSTATUSSYNCTIME" DATE,
    "MINRAMCOUNT" NUMBER(11,0)
   ) 
  PARTITION BY RANGE ("LASTUPDATE") INTERVAL (NUMTOYMINTERVAL(1,'MONTH')) 
 (PARTITION "DATA_BEFORE_01032017"  VALUES LESS THAN (TO_DATE(' 2017-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."HARVESTERID" IS 'Identifier of the harvester instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."WORKERID" IS 'Identifier of the worker';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."LASTUPDATE" IS 'Set when the record is updated';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."STATUS" IS 'Worker status';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."BATCHID" IS 'Unique ID in the batch system';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."NODEID" IS 'Identifier of the node, such as hostname, IP, etc';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."QUEUENAME" IS 'Name of the batch queue';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."COMPUTINGSITE" IS 'Panda Queue name';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."SUBMITTIME" IS 'Set when the worker is submitted';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."STARTTIME" IS 'Set when the worker gets CPUs';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."ENDTIME" IS 'Set when the worker is terminated';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."NCORE" IS 'The number of cores the worker use';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."ERRORCODE" IS 'Error code in any';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."STDOUT" IS 'URL for stdout';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."STDERR" IS 'URL for stderr';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."BATCHLOG" IS 'URL for batch log';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."RESOURCETYPE" IS 'Resource type';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."NATIVEEXITCODE" IS 'Exit code in the underlying system';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."NATIVESTATUS" IS 'Status in the underlying system';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."DIAGMESSAGE" IS 'Error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."COMPUTINGELEMENT" IS 'Gateway of the batch system';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."NJOBS" IS 'The number of associated jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."SUBMISSIONHOST" IS 'The host name of the submission node';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."HARVESTERHOST" IS 'The host name of the harvester node that generated the worker';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."JDL" IS 'Job definition sent to the CE';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."JOBTYPE" IS 'Type of job (prodSourceLabel) used for grand queue unification';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."PILOTSTARTTIME" IS 'When the pilot started running on this worker';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."PILOTENDTIME" IS 'When the pilot ended on this worker';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."PILOTSTATUS" IS 'Status of the worker according to the pilot';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."PILOTSTATUSSYNCTIME" IS 'Last time the pilot status was synced to harvester';
   COMMENT ON COLUMN "ATLAS_PANDA"."HARVESTER_WORKERS"."MINRAMCOUNT" IS 'Worker memory requirements';
   COMMENT ON TABLE "ATLAS_PANDA"."HARVESTER_WORKERS"  IS 'for workers submitted by harvesters. Combination of INSTANCEID and WORKERID is unique. Deletion policy is to delete all records with LASTUPDATE<NOW-N_days. To be enforced a data sliding window by partition removal although the PK has a global index (The ALTER TABLE ... DROP PARTITION ... UPDATE GLOBAL INDEXES)  to be used. ';

--------------------------------------------------------
--  DDL for Table HARVESTER_WORKER_STATS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" 
   (	"HARVESTER_ID" VARCHAR2(50 BYTE), 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"RESOURCETYPE" VARCHAR2(56 BYTE), 
	"STATUS" VARCHAR2(80 BYTE), 
	"JOBTYPE" VARCHAR2(52 BYTE), 
	"N_WORKERS" NUMBER(7,0), 
	"LASTUPDATE" DATE, 
	 CONSTRAINT "HARV_WORKER_STATS_PK" PRIMARY KEY ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "STATUS", "JOBTYPE") ENABLE
   ) ORGANIZATION INDEX COMPRESS 2 ;

--------------------------------------------------------
--  DDL for Table JEDI_AUX_STATUS_MINTASKID
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_AUX_STATUS_MINTASKID" 
   (	"STATUS" VARCHAR2(64 BYTE), 
	"MIN_JEDITASKID" NUMBER(11,0), 
	 CONSTRAINT "JEDI_AUX_STATUS_MINTASKID_PK" PRIMARY KEY ("STATUS") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

--------------------------------------------------------
--  DDL for Table JEDI_DATASETS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_DATASETS" 
   (	"JEDITASKID" NUMBER(11,0), 
	"DATASETID" NUMBER(11,0), 
	"DATASETNAME" VARCHAR2(255 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"CREATIONTIME" DATE, 
	"MODIFICATIONTIME" DATE, 
	"VO" VARCHAR2(16 BYTE), 
	"CLOUD" VARCHAR2(10 BYTE), 
	"SITE" VARCHAR2(60 BYTE), 
	"MASTERID" NUMBER(11,0), 
	"PROVENANCEID" NUMBER(11,0), 
	"CONTAINERNAME" VARCHAR2(255 BYTE), 
	"STATUS" VARCHAR2(20 BYTE), 
	"STATE" VARCHAR2(20 BYTE), 
	"STATECHECKTIME" DATE, 
	"STATECHECKEXPIRATION" DATE, 
	"FROZENTIME" DATE, 
	"NFILES" NUMBER(10,0), 
	"NFILESTOBEUSED" NUMBER(10,0), 
	"NFILESUSED" NUMBER(10,0), 
	"NFILESONHOLD" NUMBER(10,0), 
	"NEVENTS" NUMBER(15,0),
	"NEVENTSTOBEUSED" NUMBER(15,0),
	"NEVENTSUSED" NUMBER(15,0),
	"LOCKEDBY" VARCHAR2(40 BYTE), 
	"LOCKEDTIME" DATE, 
	"NFILESFINISHED" NUMBER(10,0), 
	"NFILESFAILED" NUMBER(10,0), 
	"ATTRIBUTES" VARCHAR2(100 BYTE), 
	"STREAMNAME" VARCHAR2(20 BYTE), 
	"STORAGETOKEN" VARCHAR2(100 BYTE), 
	"DESTINATION" VARCHAR2(60 BYTE), 
	"TEMPLATEID" NUMBER(11,0), 
	"NFILESWAITING" NUMBER(10,0),
	"NFILESMISSING" NUMBER(10,0)
   ) 
  PARTITION BY RANGE ("JEDITASKID") INTERVAL (500000) 
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1)) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."JEDITASKID" IS 'The task identifier coming from the task table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."DATASETID" IS 'Auto-incremented ID of the dataset generated by the JEDI_DATASETS_ID_SEQ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."DATASETNAME" IS 'The dataset name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."TYPE" IS 'The type of the dataset';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."CREATIONTIME" IS 'Set when the record is inserted at the first time';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."MODIFICATIONTIME" IS 'Set when the record is updated';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."VO" IS 'The name of virtual organization which owns the dataset';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."CLOUD" IS 'The replica in the cloud is used. Set manually or by the task brokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."SITE" IS 'The replica at the site is used. Set NULL to use the normal brokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."MASTERID" IS 'Set the DATASETID of the master dataset if the dataset is used as a secondary dataset of the master. Otherwise, set NULL';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."PROVENANCEID" IS 'The DATASETID of the input dataset to which the output dataset is associated. Set NULL for input datasets';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."CONTAINERNAME" IS 'The name of the container to which the dataset belongs. Set NULL when the dataset is not used as a part of a container';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."STATUS" IS 'Show how the dataset is currently being used in Panda';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."STATE" IS 'The dataset state of the dataset when it was checked with DDM';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."STATECHECKTIME" IS 'Set when the dataset state is checked with DDM';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."STATECHECKEXPIRATION" IS 'The date when the dataset state check is over. Set NULL if the state check is not required any more';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."FROZENTIME" IS 'Set when the record is frozen';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILES" IS 'The total number of files in the dataset';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILESTOBEUSED" IS 'The number of files to be used';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILESUSED" IS 'The number of files used so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILESONHOLD" IS 'The number of files on hold';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NEVENTS" IS 'The total number of events in the dataset. Set NULL unless this info is required';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NEVENTSTOBEUSED" IS 'The number of events to be use. Set NULL unless this info is required';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NEVENTSUSED" IS 'The number of events used so far. Set NULL unless this info is required';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."LOCKEDBY" IS 'The name of process/thread which is taking care of the record';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."LOCKEDTIME" IS 'Set when the record is locked';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILESFINISHED" IS 'The number of files successfully finished so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILESFAILED" IS 'The number of files failed so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."ATTRIBUTES" IS 'describes how the dataset is split. e,g, the ratio to the number of master files, no-split, repeat, etc';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."STREAMNAME" IS 'The name of stream for input files which is used as a placeholder in jobParamsTemplate. For output, STREAMNAME in JEDI_Output_Template is used';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."STORAGETOKEN" IS 'The token in the storage element where input files are available or output files are put during the task is running';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."DESTINATION" IS 'The final destination where the dataset is transferred once the task is finished';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."TEMPLATEID" IS 'The DATASETID of the template dataset from which the dataset inherits';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILESWAITING" IS 'The number of files waiting for real co-jumbo jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASETS"."NFILESMISSING" IS 'The number of missing files for datasets';
--------------------------------------------------------
--  DDL for Table JEDI_DATASET_CONTENTS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" 
   (	"JEDITASKID" NUMBER(11,0), 
	"DATASETID" NUMBER(11,0), 
	"FILEID" NUMBER(11,0), 
	"CREATIONDATE" DATE, 
	"LASTATTEMPTTIME" DATE, 
	"LFN" VARCHAR2(256 BYTE), 
	"GUID" VARCHAR2(64 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"STATUS" VARCHAR2(64 BYTE), 
	"FSIZE" NUMBER(11,0), 
	"CHECKSUM" VARCHAR2(36 BYTE), 
	"SCOPE" VARCHAR2(30 BYTE), 
	"ATTEMPTNR" NUMBER(3,0), 
	"MAXATTEMPT" NUMBER(3,0), 
	"NEVENTS" NUMBER(10,0), 
	"KEEPTRACK" NUMBER(1,0), 
	"STARTEVENT" NUMBER(10,0), 
	"ENDEVENT" NUMBER(10,0), 
	"FIRSTEVENT" NUMBER(10,0), 
	"BOUNDARYID" NUMBER(11,0), 
	"PANDAID" NUMBER(11,0), 
	"FAILEDATTEMPT" NUMBER(3,0), 
	"LUMIBLOCKNR" NUMBER(10,0), 
	"OUTPANDAID" NUMBER(11,0), 
	"MAXFAILURE" NUMBER(3,0), 
	"RAMCOUNT" NUMBER(10,0) DEFAULT 0, 
	"IS_WAITING" CHAR(1 BYTE), 
	"JOBSETID" NUMBER(11,0), 
	"PROC_STATUS" VARCHAR2(64 BYTE)
   ) 
  PARTITION BY RANGE ("JEDITASKID") INTERVAL (500000) 
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1)) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."JEDITASKID" IS 'The task identifier coming from the task table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."DATASETID" IS 'The dataset identifier coming from the dataset table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."FILEID" IS 'Auto-incremented ID of the file generated by the JEDI_DATASET_CONT_FILEID_SEQ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."CREATIONDATE" IS 'Set when the record is inserted at the first time';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."LASTATTEMPTTIME" IS 'Set when the file is tried';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."LFN" IS 'The logical filename';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."GUID" IS 'The GUID of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."TYPE" IS 'The type of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."STATUS" IS 'The status of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."FSIZE" IS 'The size of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."CHECKSUM" IS 'The checksum of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."SCOPE" IS 'The scope of the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."ATTEMPTNR" IS 'How many times the file has been tried so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."MAXATTEMPT" IS 'How many times the file can be failed at most';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."NEVENTS" IS 'The number of events in the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."KEEPTRACK" IS 'Set 1 when keeping track of the file usage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."STARTEVENT" IS 'The starting event number used in the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."ENDEVENT" IS 'The ending event number used in the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."FIRSTEVENT" IS 'The event number which is assigned to the first processed event';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."BOUNDARYID" IS 'Splitting Input to respect this identifier if not NULL. e.g., used to specify lumi block boundaries';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."PANDAID" IS 'PandaID of the job which uses the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."FAILEDATTEMPT" IS 'How many times the file failed so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."LUMIBLOCKNR" IS 'Lumiblock Number in the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."OUTPANDAID" IS 'PandaID of the job which produced the file.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."MAXFAILURE" IS 'How many times the file can be failed at most';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."RAMCOUNT" IS 'Increase the RAM requirements at job level (before it was at task level)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."IS_WAITING" IS 'Set Y if waiting for real co-jumbo jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."JOBSETID" IS 'JobSetID of the job which uses the file';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_DATASET_CONTENTS"."PROC_STATUS" IS 'Processing status of the file';

--------------------------------------------------------
--  DDL for Table JEDI_EVENTS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_EVENTS" 
   (	"JEDITASKID" NUMBER(11,0), 
	"PANDAID" NUMBER(11,0), 
	"FILEID" NUMBER(11,0), 
	"JOB_PROCESSID" NUMBER(11,0), 
	"DATASETID" NUMBER(11,0), 
	"STATUS" NUMBER(2,0), 
	"DEF_MIN_EVENTID" NUMBER(10,0), 
	"DEF_MAX_EVENTID" NUMBER(10,0), 
	"PROCESSED_UPTO_EVENTID" NUMBER(10,0), 
	"ATTEMPTNR" NUMBER(3,0), 
	"OBJSTORE_ID" NUMBER(11,0), 
	"EVENT_OFFSET" NUMBER(11,0), 
	"IS_JUMBO" NUMBER(1,0), 
	"ZIPROW_ID" NUMBER(11,0), 
	"FILE_NOT_DELETED" CHAR(1 BYTE), 
	"ERROR_CODE" NUMBER(5,0), 
	"PATH_CONVENTION" NUMBER(2,0),
	"ERROR_DIAG" VARCHAR2(500 BYTE),
	 CONSTRAINT "JEDI_EVENTS_PK" PRIMARY KEY ("JEDITASKID", "PANDAID", "FILEID", "JOB_PROCESSID") ENABLE
   ) ORGANIZATION INDEX COMPRESS 1 
  PARTITION BY RANGE ("JEDITASKID") 
 (PARTITION "JEDI_EVENTS_TASKSIDS_7400000"  VALUES LESS THAN (7400000)) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."PANDAID" IS 'PandaID of the job in which the events are processed';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."FILEID" IS 'FileID of the file which contains the events';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."JOB_PROCESSID" IS 'identifier of the slave process';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."DATASETID" IS 'DatasetID of the file which contains the events';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."STATUS" IS 'The status of the event range';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."DEF_MIN_EVENTID" IS 'The minimum event number which is assigned to the slave process';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."DEF_MAX_EVENTID" IS 'The maximum event number which is assigned to the slave process';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."PROCESSED_UPTO_EVENTID" IS 'The event number which the slave process completed so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."ATTEMPTNR" IS 'How many times the events have been retried so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."OBJSTORE_ID" IS 'Identifier of the objectstore endpoint where pre-merged file is stored';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."EVENT_OFFSET" IS 'The total offset of positional event numbers';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."IS_JUMBO" IS 'Set 1 if events are processed by a jumbo job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."ZIPROW_ID" IS 'ROW_ID of the zip file in the file table (FILESTABLE4). NULL if not zipped';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."FILE_NOT_DELETED" IS 'Flag whether the file has been deleted by Rucio. The flag is set to ''Y'' by the PanDA server for "status IN (4,5,7,8) AND objstore_id IS NOT NULL" condition. Rucio sets it back to NULL after handling it.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."ERROR_CODE" IS 'Error code for the event range';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."PATH_CONVENTION" IS 'Convention ID of file path. This is required to use various conventions for file paths in object stores.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_EVENTS"."ERROR_DIAG" IS 'To track the error message for Vera Rubin jobs.';

--------------------------------------------------------
--  DDL for Table JEDI_JOBPARAMS_TEMPLATE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_JOBPARAMS_TEMPLATE" 
   (	"JEDITASKID" NUMBER(11,0), 
	"JOBPARAMSTEMPLATE" CLOB
   ) 
  PARTITION BY RANGE ("JEDITASKID") INTERVAL (500000) 
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1)) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_JOBPARAMS_TEMPLATE"."JEDITASKID" IS 'The task identifier coming from the task table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_JOBPARAMS_TEMPLATE"."JOBPARAMSTEMPLATE" IS 'The template to generate job parameters';

--------------------------------------------------------
--  DDL for Table JEDI_JOB_RETRY_HISTORY
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" 
   (	"JEDITASKID" NUMBER(11,0), 
	"OLDPANDAID" NUMBER(11,0), 
	"NEWPANDAID" NUMBER(11,0), 
	"INS_UTC_TSTAMP" TIMESTAMP (0) DEFAULT SYS_EXTRACT_UTC(systimestamp(0)), 
	"RELATIONTYPE" VARCHAR2(16 BYTE), 
	"ORIGINPANDAID" NUMBER(11,0)
   ) 
  PARTITION BY RANGE ("INS_UTC_TSTAMP") INTERVAL (NUMTODSINTERVAL(1,'DAY')) 
 (PARTITION "DATA_BEFORE_30012014"  VALUES LESS THAN (TIMESTAMP' 2014-01-30 00:00:00') ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY"."JEDITASKID" IS 'JediTaskID of the jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY"."OLDPANDAID" IS 'PandaID of the old job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY"."NEWPANDAID" IS 'PandaID of the new job';

--------------------------------------------------------
--  DDL for Table JEDI_OUTPUT_TEMPLATE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" 
   (	"JEDITASKID" NUMBER(11,0), 
	"DATASETID" NUMBER(11,0), 
	"OUTTEMPID" NUMBER(11,0), 
	"FILENAMETEMPLATE" VARCHAR2(256 BYTE), 
	"MAXSERIALNR" NUMBER(7,0), 
	"SERIALNR" NUMBER(7,0), 
	"SOURCENAME" VARCHAR2(256 BYTE), 
	"STREAMNAME" VARCHAR2(20 BYTE), 
	"OUTTYPE" VARCHAR2(20 BYTE)
   ) 
  PARTITION BY RANGE ("JEDITASKID") INTERVAL (500000) 
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1)) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."JEDITASKID" IS 'The task identifier coming from the task table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."DATASETID" IS 'The dataset identifier coming from the dataset table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."OUTTEMPID" IS 'Auto-incremented ID of the template generated by the JEDI_OUTPUT_TEMPLATE_ID_SEQ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."FILENAMETEMPLATE" IS 'The template to generate output filenames';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."MAXSERIALNR" IS 'The maximum serial number which can be used to generate files using the template';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."SERIALNR" IS 'The serial number to generate files using the template. When a new file is produced it would have SERIALNR+1 and this field is incremented';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."SOURCENAME" IS 'source filename to be renamed, if any. Set NULL if renaming is unnecessary';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."STREAMNAME" IS 'The name of the stream which is used as a placeholder in jobParamsTemplate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE"."OUTTYPE" IS 'The type of the file';

--------------------------------------------------------
--  DDL for Table JEDI_PROCESS_LOCK
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_PROCESS_LOCK" 
   (	"VO" VARCHAR2(16 BYTE), 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE), 
	"WORKQUEUE_ID" NUMBER(5,0), 
	"CLOUD" VARCHAR2(10 BYTE), 
	"LOCKEDBY" VARCHAR2(40 BYTE), 
	"LOCKEDTIME" DATE, 
	"RESOURCE_TYPE" VARCHAR2(56 BYTE),
	"COMPONENT" VARCHAR2(56 BYTE),
	CONSTRAINT "JEDI_PROCESS_LOCK_NEW_PK" PRIMARY KEY ("VO", "PRODSOURCELABEL", "WORKQUEUE_ID", "CLOUD", "RESOURCE_TYPE", "COMPONENT") ENABLE
   ) ORGANIZATION INDEX COMPRESS 2 ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."VO" IS 'The name of virtual organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."PRODSOURCELABEL" IS 'The source label, such as managed, user, prod_test, ...';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."WORKQUEUE_ID" IS 'The work queue identifier';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."CLOUD" IS 'The cloud name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."LOCKEDBY" IS 'The name of process/thread which uses the lock';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."LOCKEDTIME" IS 'Set when the lock is created';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."RESOURCE_TYPE" IS 'Resource type (SCORE, MCORE...) for the lock';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_PROCESS_LOCK"."COMPONENT" IS 'PanDA component (job generator, watchdog...) that wants to set the lock';
   COMMENT ON TABLE "ATLAS_PANDA"."JEDI_PROCESS_LOCK"  IS 'Table for synchronisation of JEDI processes';

--------------------------------------------------------
--  DDL for Table JEDI_TASKPARAMS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_TASKPARAMS" 
   (	"JEDITASKID" NUMBER(11,0), 
	"TASKPARAMS" CLOB
   ) 
  PARTITION BY RANGE ("JEDITASKID") INTERVAL (500000) 
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1)) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKPARAMS"."JEDITASKID" IS 'The task identifier coming from the task table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKPARAMS"."TASKPARAMS" IS 'Special task parameters. Eg, the list of lost files for a lost-file recovery task';

--------------------------------------------------------
--  DDL for Table JEDI_TASKS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_TASKS" 
   (	"JEDITASKID" NUMBER(11,0), 
	"TASKNAME" VARCHAR2(256 BYTE), 
	"STATUS" VARCHAR2(64 BYTE), 
	"USERNAME" VARCHAR2(128 BYTE), 
	"CREATIONDATE" DATE, 
	"MODIFICATIONTIME" DATE, 
	"REQID" NUMBER(9,0), 
	"OLDSTATUS" VARCHAR2(64 BYTE), 
	"CLOUD" VARCHAR2(10 BYTE), 
	"SITE" VARCHAR2(60 BYTE), 
	"STARTTIME" DATE, 
	"ENDTIME" DATE, 
	"FROZENTIME" DATE, 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE), 
	"WORKINGGROUP" VARCHAR2(32 BYTE), 
	"VO" VARCHAR2(16 BYTE), 
	"CORECOUNT" NUMBER(9,0), 
	"TASKTYPE" VARCHAR2(64 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(64 BYTE), 
	"TASKPRIORITY" NUMBER(9,0), 
	"CURRENTPRIORITY" NUMBER(9,0), 
	"ARCHITECTURE" VARCHAR2(256 BYTE), 
	"TRANSUSES" VARCHAR2(64 BYTE), 
	"TRANSHOME" VARCHAR2(128 BYTE), 
	"TRANSPATH" VARCHAR2(128 BYTE), 
	"LOCKEDBY" VARCHAR2(40 BYTE), 
	"LOCKEDTIME" DATE, 
	"TERMCONDITION" VARCHAR2(100 BYTE), 
	"SPLITRULE" VARCHAR2(200 BYTE), 
	"WALLTIME" NUMBER(9,0), 
	"WALLTIMEUNIT" VARCHAR2(32 BYTE), 
	"OUTDISKCOUNT" NUMBER(9,0), 
	"OUTDISKUNIT" VARCHAR2(32 BYTE), 
	"WORKDISKCOUNT" NUMBER(9,0), 
	"WORKDISKUNIT" VARCHAR2(32 BYTE), 
	"RAMCOUNT" NUMBER(9,0), 
	"RAMUNIT" VARCHAR2(32 BYTE), 
	"IOINTENSITY" NUMBER(9,0), 
	"IOINTENSITYUNIT" VARCHAR2(32 BYTE), 
	"WORKQUEUE_ID" NUMBER(5,0), 
	"PROGRESS" NUMBER(3,0), 
	"FAILURERATE" NUMBER(3,0), 
	"ERRORDIALOG" VARCHAR2(255 BYTE), 
	"COUNTRYGROUP" VARCHAR2(20 BYTE), 
	"PARENT_TID" NUMBER(12,0), 
	"EVENTSERVICE" NUMBER(1,0), 
	"TICKETID" VARCHAR2(50 BYTE), 
	"TICKETSYSTEMTYPE" VARCHAR2(16 BYTE), 
	"STATECHANGETIME" DATE, 
	"SUPERSTATUS" VARCHAR2(64 BYTE), 
	"CAMPAIGN" VARCHAR2(32 BYTE), 
	"MERGERAMCOUNT" NUMBER(9,0), 
	"MERGERAMUNIT" VARCHAR2(32 BYTE), 
	"MERGEWALLTIME" NUMBER(9,0), 
	"MERGEWALLTIMEUNIT" VARCHAR2(32 BYTE), 
	"THROTTLEDTIME" DATE, 
	"NUMTHROTTLED" NUMBER(3,0), 
	"MERGECORECOUNT" NUMBER(9,0), 
	"GOAL" NUMBER(4,0), 
	"ASSESSMENTTIME" DATE, 
	"CPUTIME" NUMBER(9,0), 
	"CPUTIMEUNIT" VARCHAR2(32 BYTE), 
	"CPUEFFICIENCY" NUMBER(3,0), 
	"BASEWALLTIME" NUMBER(9,0), 
	"AMIFLAG_OLD" VARCHAR2(10 BYTE), 
	"AMIFLAG" NUMBER(5,0) DEFAULT 1, 
	"NUCLEUS" VARCHAR2(52 BYTE), 
	"BASERAMCOUNT" NUMBER(9,0), 
	"TTCREQUESTED" DATE, 
	"TTCPREDICTED" DATE, 
	"TTCPREDICTIONDATE" DATE, 
	"RESCUETIME" DATE, 
	"REQUESTTYPE" VARCHAR2(32 BYTE), 
	"GSHARE" VARCHAR2(32 BYTE), 
	"USEJUMBO" CHAR(1 BYTE), 
	"RESOURCE_TYPE" VARCHAR2(56 BYTE), 
	"DISKIO" NUMBER(9,0), 
	"DISKIOUNIT" VARCHAR2(32 BYTE), 
	"MEMORY_LEAK_CORE" NUMBER(11,0), 
	"MEMORY_LEAK_X2" NUMBER(14,3),
	"ATTEMPTNR" NUMBER(3,0), 
	"CONTAINER_NAME" VARCHAR2(200 BYTE),
    "JOB_LABEL" VARCHAR2(20 BYTE),
    "REALMODIFICATIONTIME" DATE,
    "FRAMEWORK" VARCHAR2(50),
    "ACTIVATEDTIME" DATE,
    "QUEUEDTIME" DATE
   ) 
  PARTITION BY RANGE ("JEDITASKID") INTERVAL (500000) 
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1)) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."JEDITASKID" IS 'The task identifier coming from ATLAS_DEFT.PRODSYS2_TASK_ID_SEQ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TASKNAME" IS 'The task name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."STATUS" IS 'The task status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."USERNAME" IS 'The name of the user who owns the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CREATIONDATE" IS 'Set when the record is inserted at the first time';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MODIFICATIONTIME" IS 'Set when the record is updated';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."OLDSTATUS" IS 'Old task status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CLOUD" IS 'The cloud where the task is assigned';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."SITE" IS 'The site where the task is assigned. Set NULL to use the normal brokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."STARTTIME" IS 'Set when the task gets started';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."ENDTIME" IS 'Set when the task is finished';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."FROZENTIME" IS 'Set when the record is frozen';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."PRODSOURCELABEL" IS 'The source label, such as managed, user, prod_test, ...';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."WORKINGGROUP" IS 'The name of the working group which owns the task ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."VO" IS 'The name of virtual organization which owns the task ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CORECOUNT" IS 'The number of cores per job. Set 0 if it can vary';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TASKTYPE" IS 'The task type';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."PROCESSINGTYPE" IS 'The type of the process';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TASKPRIORITY" IS 'The assigned priority of the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CURRENTPRIORITY" IS 'The current priority of the task. JEDI could increase/decrease priorities if necessary';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."ARCHITECTURE" IS 'The architecture on which the task runs. Eg, $CMTCONFIG';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TRANSUSES" IS 'The name of the software release';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TRANSHOME" IS 'The name of the software cache in which the transformation is included';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TRANSPATH" IS 'The name of the transformation';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."LOCKEDBY" IS 'The name of process/thread which is taking care of the record';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."LOCKEDTIME" IS 'Set when the record is locked';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TERMCONDITION" IS 'Termination condition of the task. Eg, to terminate task when 90% of files are successfully processed';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."SPLITRULE" IS 'Rules for job splitting. Eg, to use event-level splitting or not, to limit the number of files per job, etc';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."WALLTIME" IS 'average walltime consumption measured by scouts when processing 1MB of input';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."WALLTIMEUNIT" IS 'unit of WALLTIME';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."OUTDISKCOUNT" IS 'average total size of outputs measured by scouts when processing 1MB of input';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."OUTDISKUNIT" IS 'unit of OUTDISKCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."WORKDISKCOUNT" IS 'average size of work directory measured by scouts';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."WORKDISKUNIT" IS 'unit of WORKDISKCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."RAMCOUNT" IS 'average memory consumption measured by scouts';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."RAMUNIT" IS 'unit of RAMCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."IOINTENSITY" IS 'The characteristics of I/O patterns measured by scouts';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."IOINTENSITYUNIT" IS 'unit of IOINTENSITY';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."WORKQUEUE_ID" IS 'The work queue identifier to which the task belongs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."PROGRESS" IS 'Percentage of completion of the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."FAILURERATE" IS 'The frequency of job failures in the task (in %)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."ERRORDIALOG" IS 'Error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."COUNTRYGROUP" IS 'The name of the country group to which the user belongs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."PARENT_TID" IS 'The jediTaskID of the parent task. PARENT_TID=JEDITASKID if no parent';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."EVENTSERVICE" IS 'The task uses Event Service if 1';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TICKETID" IS 'The identifier of the ticket to keep track of the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TICKETSYSTEMTYPE" IS 'The type of the ticket system';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."STATECHANGETIME" IS 'Updated when the task status is changed';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."SUPERSTATUS" IS 'The super status (DEFT status) of the task which is explained in DEFT task status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CAMPAIGN" IS 'Campaign to which the task belongs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MERGERAMCOUNT" IS 'average memory consumption for merge jobs measured by scouts';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MERGERAMUNIT" IS 'unit of MERGERAMCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MERGEWALLTIME" IS 'average walltime consumption for merge jobs measured by scouts when processing 1MB of input';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MERGEWALLTIMEUNIT" IS 'unit of MERGEWALLTIME';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."THROTTLEDTIME" IS 'Updated when the task is throttled';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."NUMTHROTTLED" IS 'How many times the task was throttled so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MERGECORECOUNT" IS 'The number of cores per merge job. Set 0 if it can vary.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."GOAL" IS 'Goal of the task completion in percentage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."ASSESSMENTTIME" IS 'Set when statistics is updated';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CPUTIME" IS 'The product of HS06 score and CPU consumption time per event';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CPUTIMEUNIT" IS 'Unit of CPUTIMECOUNT (HS06sPerEvent)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."CPUEFFICIENCY" IS 'Percentage of single core efficiency';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."BASEWALLTIME" IS 'Offset of walltime in sec';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."AMIFLAG" IS 'It will contain a mask, one bit per AMI task (AMI has two tasks) with default value at insertion for "amiflag" to 3 (0b00000011). A trigger when the field âcampaignâ is modified:	if "amiflag" is NULL then "amiflag" = 2 else "amiflag" = BITOR(AMIFLAG, 2)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."NUCLEUS" IS 'Name of the site where the task is assigned in WORLD cloud';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."BASERAMCOUNT" IS 'Shared memory size in MB. The brokerage requires it to estimate memory usage based on quantities measured by the MemoryMonitor.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TTCREQUESTED" IS 'Time To Completion expected by the task submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TTCPREDICTED" IS 'Time To Completion predicted by the system';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."TTCPREDICTIONDATE" IS 'Timestamp when the TTCPREDICTED was calculated';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."RESCUETIME" IS 'Update when rescue process checks the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."REQUESTTYPE" IS 'Type of the request';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."USEJUMBO" IS 'Set Y when using jumbo jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."RESOURCE_TYPE" IS 'Resource type name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."DISKIO" IS 'Local disk access measured by scouts. (totWBytes+totRBytes)/(endTime-startTime)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."DISKIOUNIT" IS 'Unit of DISKIO';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MEMORY_LEAK_CORE" IS 'Average memory leak (kB/s) per core for the task, as measured by the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."MEMORY_LEAK_X2" IS 'Memory leak chi square statistic';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."REALMODIFICATIONTIME" IS 'Set ALWAYS to last modification time, without any tricks like old timestamps';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."FRAMEWORK" IS 'Submission framework that was used to generate the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."ACTIVATEDTIME" IS 'Time of activation processing workload';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_TASKS"."QUEUEDTIME" IS 'Start time of queuing period ready to generate jobs';

--------------------------------------------------------
--  DDL for Table JEDI_WORK_QUEUE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JEDI_WORK_QUEUE" 
   (	"QUEUE_ID" NUMBER(5,0), 
	"QUEUE_NAME" VARCHAR2(16 BYTE), 
	"QUEUE_TYPE" VARCHAR2(16 BYTE), 
	"VO" VARCHAR2(16 BYTE), 
	"STATUS" VARCHAR2(64 BYTE), 
	"PARTITIONID" NUMBER(5,0), 
	"STRETCHABLE" NUMBER(1,0), 
	"QUEUE_SHARE" NUMBER(3,0), 
	"QUEUE_ORDER" NUMBER(3,0), 
	"CRITERIA" VARCHAR2(256 BYTE), 
	"VARIABLES" VARCHAR2(256 BYTE), 
	"QUEUE_FUNCTION" VARCHAR2(32 BYTE)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."QUEUE_ID" IS 'unique identifier';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."QUEUE_NAME" IS 'The name of the queue';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."QUEUE_TYPE" IS 'The type of the queue which is mapped to prodSourceLabel in JEDI_Tasks and jobs*Table';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."VO" IS 'The name of virtual organization for which the queue is used';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."STATUS" IS 'The queue status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."PARTITIONID" IS 'The QUEUE_ID of the partition to which the queue belong. Set NULL if the queue doesn''t belong to any partition. Set -1 if the record stands for a partition';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."STRETCHABLE" IS 'Set 1 if the queue can use shares of other queues when those queues don''t have tasks/jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."QUEUE_SHARE" IS 'Share for the queue. Set NULL if the queue is not throttled';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."QUEUE_ORDER" IS 'The queue is evaluated before other queues which have higher ORDER values. If a task or a job passes the selection criteria, it is mapped to the queue and no more queues are evaluated';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."CRITERIA" IS 'Selection criteria written in SQL to map tasks/jobs to the queue. It is applied to JEDI_Tasks';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."VARIABLES" IS 'Valid values to replace bind-variables in CRITERIA';
   COMMENT ON COLUMN "ATLAS_PANDA"."JEDI_WORK_QUEUE"."QUEUE_FUNCTION" IS 'Function of workqueue. Special queues should be tagged as Resource';

--------------------------------------------------------
--  DDL for Table JOBPARAMSTABLE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBPARAMSTABLE" 
   (	"PANDAID" NUMBER(11,0), 
	"MODIFICATIONTIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"JOBPARAMETERS" CLOB
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "PART_INITIAL_01011970"  VALUES LESS THAN (TO_DATE(' 1970-01-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBPARAMSTABLE"."PANDAID" IS 'PandaID of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBPARAMSTABLE"."MODIFICATIONTIME" IS 'modificationTime of the job (in UTC)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBPARAMSTABLE"."JOBPARAMETERS" IS 'the parameters of the job. The column type is CLOB';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBPARAMSTABLE"  IS 'Table with information on the job input parameters. When a PanDA job is in a defined or running state, relevant rows reside in the INITIAL partition of the table. When the job is finished or aborted the "modificationtime" is set the to real current time and as the table has "row movement" enabled, Oracle moves the rows from the INITIAL partition to the partitions of the current day. Data is regularly copied to an archive table in ATLAS_PANDAARCH schema. Data retention is defined to be 3 days (can be changed if necessary)';

--------------------------------------------------------
--  DDL for Table JOBSACTIVE4
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBSACTIVE4" 
   (	"PANDAID" NUMBER(11,0) DEFAULT '0', 
	"JOBDEFINITIONID" NUMBER(11,0) DEFAULT '0', 
	"SCHEDULERID" VARCHAR2(128 BYTE), 
	"PILOTID" VARCHAR2(200 BYTE), 
	"CREATIONTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"CREATIONHOST" VARCHAR2(128 BYTE), 
	"MODIFICATIONTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"MODIFICATIONHOST" VARCHAR2(128 BYTE), 
	"ATLASRELEASE" VARCHAR2(64 BYTE), 
	"TRANSFORMATION" VARCHAR2(250 BYTE), 
	"HOMEPACKAGE" VARCHAR2(80 BYTE), 
	"PRODSERIESLABEL" VARCHAR2(20 BYTE) DEFAULT 'Rome', 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE) DEFAULT 'managed', 
	"PRODUSERID" VARCHAR2(250 BYTE), 
	"ASSIGNEDPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"CURRENTPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"ATTEMPTNR" NUMBER(3,0) DEFAULT '0', 
	"MAXATTEMPT" NUMBER(3,0) DEFAULT '0', 
	"JOBSTATUS" VARCHAR2(15 BYTE) DEFAULT 'activated', 
	"JOBNAME" VARCHAR2(256 BYTE), 
	"MAXCPUCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MAXCPUUNIT" VARCHAR2(32 BYTE), 
	"MAXDISKCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MAXDISKUNIT" CHAR(4 BYTE), 
	"IPCONNECTIVITY" CHAR(5 BYTE), 
	"MINRAMCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MINRAMUNIT" CHAR(2 BYTE), 
	"STARTTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"ENDTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"CPUCONSUMPTIONTIME" NUMBER(20,0) DEFAULT '0', 
	"CPUCONSUMPTIONUNIT" VARCHAR2(128 BYTE), 
	"COMMANDTOPILOT" VARCHAR2(250 BYTE), 
	"TRANSEXITCODE" VARCHAR2(128 BYTE), 
	"PILOTERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"PILOTERRORDIAG" VARCHAR2(500 BYTE), 
	"EXEERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"EXEERRORDIAG" VARCHAR2(500 BYTE), 
	"SUPERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"SUPERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"DDMERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"DDMERRORDIAG" VARCHAR2(500 BYTE) DEFAULT NULL, 
	"BROKERAGEERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"BROKERAGEERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"JOBDISPATCHERERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"JOBDISPATCHERERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"TASKBUFFERERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"TASKBUFFERERRORDIAG" VARCHAR2(300 BYTE) DEFAULT NULL, 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"COMPUTINGELEMENT" VARCHAR2(128 BYTE), 
	"JOBPARAMETERS" CLOB, 
	"METADATA" CLOB, 
	"PRODDBLOCK" VARCHAR2(255 CHAR), 
	"DISPATCHDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONSE" VARCHAR2(250 BYTE), 
	"NEVENTS" NUMBER(10,0) DEFAULT '0', 
	"GRID" VARCHAR2(50 BYTE), 
	"CLOUD" VARCHAR2(50 BYTE), 
	"CPUCONVERSION" NUMBER(9,4), 
	"SOURCESITE" VARCHAR2(36 BYTE), 
	"DESTINATIONSITE" VARCHAR2(36 BYTE), 
	"TRANSFERTYPE" VARCHAR2(10 BYTE), 
	"TASKID" NUMBER(9,0) DEFAULT NULL, 
	"CMTCONFIG" VARCHAR2(250 BYTE), 
	"STATECHANGETIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"PRODDBUPDATETIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"LOCKEDBY" VARCHAR2(128 BYTE), 
	"RELOCATIONFLAG" NUMBER(1,0) DEFAULT '0', 
	"JOBEXECUTIONID" NUMBER(11,0) DEFAULT '0', 
	"VO" VARCHAR2(16 BYTE), 
	"PILOTTIMING" VARCHAR2(100 BYTE), 
	"WORKINGGROUP" VARCHAR2(20 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(64 BYTE), 
	"PRODUSERNAME" VARCHAR2(60 CHAR), 
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
	"INPUTFILEBYTES" NUMBER(15,0),
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
    "MEANCORECOUNT" NUMBER(8,2),
    "GCO2_REGIONAL" NUMBER(10, 2),
    "GCO2_GLOBAL" NUMBER(10, 2),
    "CPU_ARCHITECTURE_LEVEL" VARCHAR2(20),
    "OUTPUTFILETYPE" VARCHAR2(32)
   )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PANDAID" IS 'sequential ID generated from Oracle sequence object JOBSDEFINED4_PANDAID_SEQ when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBDEFINITIONID" IS 'comes from ejobdef.jobdefid for managed production jobs, and defines job set IDs for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."SCHEDULERID" IS 'ID identifying the pilot scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PILOTID" IS 'ID assigned to pilot by scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CREATIONTIME" IS 'generated by Oracle''s SYSDATE function when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CREATIONHOST" IS 'the hostname where the job is submitted';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MODIFICATIONTIME" IS 'timestamp in UTC set by Panda server when job state changes or pilot update is received';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MODIFICATIONHOST" IS 'the hostname which updates job status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."ATLASRELEASE" IS 'Release required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TRANSFORMATION" IS 'Payload job script';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."HOMEPACKAGE" IS 'Cache required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PRODSERIESLABEL" IS 'constrained to DC2, Rome, DC3, pandatest';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PRODSOURCELABEL" IS 'activity name of the name such as managed, user, and ddm';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PRODUSERID" IS 'ID of the user defined the job (user''s certificateDN or e-mail address)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."ASSIGNEDPRIORITY" IS 'defined priority value';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CURRENTPRIORITY" IS 'actual priority value which is usually the same as assignedPriority, can be modified by Panda server';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."ATTEMPTNR" IS 'how many times the job was retried so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXATTEMPT" IS 'how many times the job can be retried';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBSTATUS" IS 'status of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBNAME" IS 'the job name defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXCPUCOUNT" IS 'expected execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXCPUUNIT" IS 'unit for MAXCPUCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXDISKCOUNT" IS 'expected disk size used by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXDISKUNIT" IS 'unit for MAXDISKCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."IPCONNECTIVITY" IS 'defined in prodDB (unused in Panda)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MINRAMCOUNT" IS 'expected amount of memory usage of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MINRAMUNIT" IS 'unit for MINRAMCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."STARTTIME" IS 'start time when the job got started on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."ENDTIME" IS 'end time when the job finished on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CPUCONSUMPTIONTIME" IS 'actual execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CPUCONSUMPTIONUNIT" IS 'unit for CPUCONSUMPTIONTIME';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."COMMANDTOPILOT" IS 'used to send commands to pilot from Panda server, to kill the job for instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TRANSEXITCODE" IS 'transformation exit code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PILOTERRORCODE" IS 'pilot error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PILOTERRORDIAG" IS 'pilot error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."EXEERRORCODE" IS 'executor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."EXEERRORDIAG" IS 'executor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."SUPERRORCODE" IS 'supervisor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."SUPERRORDIAG" IS 'supervisor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."DDMERRORCODE" IS 'DDM error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."DDMERRORDIAG" IS 'DDM error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."BROKERAGEERRORCODE" IS 'brokerage error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."BROKERAGEERRORDIAG" IS 'brokerage error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBDISPATCHERERRORCODE" IS 'jobDispatcher error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBDISPATCHERERRORDIAG" IS 'jobDispatcher error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TASKBUFFERERRORCODE" IS 'taskBuffer error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TASKBUFFERERRORDIAG" IS 'taskBuffer error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."COMPUTINGSITE" IS 'site name where the job runs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."COMPUTINGELEMENT" IS 'name of computing element';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBPARAMETERS" IS 'unused. moved to ATLAS_PANDA.JOBPARAMSTABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."METADATA" IS 'unused. moved to ATLAS_PANDA.METATABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PRODDBLOCK" IS 'name of dataset containing job input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."DISPATCHDBLOCK" IS 'name of dispatch dataset for the job ; a prodDBlock may be broken down into smaller blocks for dispatch to sites';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."DESTINATIONDBLOCK" IS 'name of destination dataset for the job; is used to register the outputs of an associated set of jobs as belonging to one block to be saved at an archival destination';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."DESTINATIONSE" IS 'destination storage element of job output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."NEVENTS" IS 'number of events processed by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."GRID" IS 'GRID where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CLOUD" IS 'cloud (associated with Tier 1) where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CPUCONVERSION" IS 'CPU conversion factor';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."SOURCESITE" IS 'source site (usually CE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."DESTINATIONSITE" IS 'destination site (usually SE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TRANSFERTYPE" IS 'type of file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TASKID" IS 'task ID defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CMTCONFIG" IS 'cmt config';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."STATECHANGETIME" IS 'timestamp of the last state change';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PRODDBUPDATETIME" IS 'timestamp of the last update in Oracle ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."LOCKEDBY" IS 'the name of the current writer of the record in ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."RELOCATIONFLAG" IS 'flag for submitting jobs to a single site. I.e. the brokerage is bypassed';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBEXECUTIONID" IS 'job execution ID coming from ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."VO" IS 'Virtual Organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PILOTTIMING" IS 'time consumption of the pilot';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."WORKINGGROUP" IS 'working group name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PROCESSINGTYPE" IS 'type of the job comes from etask.tasktype2';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PRODUSERNAME" IS 'the name of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."NINPUTFILES" IS 'the number of input files which the pilot processed on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."COUNTRYGROUP" IS 'country of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."BATCHID" IS 'ID of the job in the backend batch system';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."PARENTID" IS 'when the job is a retry for another job, PandaID of the retried job is set in this field';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."SPECIALHANDLING" IS 'set when the job is specially handled in PanDA, such as re-brokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBSETID" IS 'jobset ID for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."CORECOUNT" IS 'the number of CPU cores';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."NINPUTDATAFILES" IS 'the number of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."INPUTFILETYPE" IS 'type of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."INPUTFILEPROJECT" IS 'project name of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."INPUTFILEBYTES" IS 'the total size of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."NOUTPUTDATAFILES" IS 'the number of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."OUTPUTFILEBYTES" IS 'the total size of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."JOBMETRICS" IS 'a general-purpose field to record various job metrics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXRSS" IS 'Maximum RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXVMEM" IS 'Maximum VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXSWAP" IS 'Maximum SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXPSS" IS 'Maximum PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."AVGRSS" IS 'AverageÂ RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."AVGVMEM" IS 'Average VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."AVGSWAP" IS 'Average SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."AVGPSS" IS 'Average PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MAXWALLTIME" IS 'Estimated walltime limit for the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."NUCLEUS" IS 'Name of the site where the job is assigned in WORLD cloud';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."EVENTSERVICE" IS 'The job uses Event Service';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."FAILEDATTEMPT" IS 'How many times the input files were failed so far. The maximum number is used if there are multiple input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."HS06SEC" IS 'The product of HS06 score and CPU consumption time';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."HS06" IS 'Core count x core power';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TOTRCHAR" IS 'Total read chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TOTWCHAR" IS 'Total write chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TOTRBYTES" IS 'Total read bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."TOTWBYTES" IS 'Total write bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."RATERCHAR" IS 'Read chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."RATEWCHAR" IS 'Write chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."RATERBYTES" IS 'Read bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."RATEWBYTES" IS 'Write bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."RESOURCE_TYPE" IS 'Resource type name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."DISKIO" IS 'Local disk access in kBPerSec. Required to limit the number of running jobs based on total IO for each queue.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MEMORY_LEAK" IS 'Memory leak in KB/s';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."MEMORY_LEAK_X2" IS 'Memory leak square statistic';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSACTIVE4"."OUTPUTFILETYPE" IS 'Comma-separated list of output file types for the job';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBSACTIVE4"  IS 'Table for hosting all PanDA jobs that are in active running mode. All timestamp and date type columns are in UTC';

--------------------------------------------------------
--  DDL for Table JOBSARCHIVED4
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBSARCHIVED4" 
   (	"PANDAID" NUMBER(11,0) DEFAULT '0', 
	"MODIFICATIONTIME" DATE, 
	"JOBDEFINITIONID" NUMBER(11,0) DEFAULT '0', 
	"SCHEDULERID" VARCHAR2(128 BYTE), 
	"PILOTID" VARCHAR2(200 BYTE), 
	"CREATIONTIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"CREATIONHOST" VARCHAR2(128 BYTE), 
	"MODIFICATIONHOST" VARCHAR2(128 BYTE), 
	"ATLASRELEASE" VARCHAR2(64 BYTE), 
	"TRANSFORMATION" VARCHAR2(250 BYTE), 
	"HOMEPACKAGE" VARCHAR2(80 BYTE), 
	"PRODSERIESLABEL" VARCHAR2(20 BYTE) DEFAULT 'Rome', 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE) DEFAULT 'managed', 
	"PRODUSERID" VARCHAR2(250 BYTE), 
	"ASSIGNEDPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"CURRENTPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"ATTEMPTNR" NUMBER(3,0) DEFAULT '0', 
	"MAXATTEMPT" NUMBER(3,0) DEFAULT '0', 
	"JOBSTATUS" VARCHAR2(15 BYTE) DEFAULT 'activated', 
	"JOBNAME" VARCHAR2(256 BYTE), 
	"MAXCPUCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MAXCPUUNIT" VARCHAR2(32 BYTE), 
	"MAXDISKCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MAXDISKUNIT" CHAR(4 BYTE), 
	"IPCONNECTIVITY" CHAR(5 BYTE), 
	"MINRAMCOUNT" NUMBER(10,0) DEFAULT '0', 
	"MINRAMUNIT" CHAR(2 BYTE), 
	"STARTTIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"ENDTIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"CPUCONSUMPTIONTIME" NUMBER(20,0) DEFAULT '0', 
	"CPUCONSUMPTIONUNIT" VARCHAR2(128 BYTE), 
	"COMMANDTOPILOT" VARCHAR2(250 BYTE), 
	"TRANSEXITCODE" VARCHAR2(128 BYTE), 
	"PILOTERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"PILOTERRORDIAG" VARCHAR2(500 BYTE), 
	"EXEERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"EXEERRORDIAG" VARCHAR2(500 BYTE), 
	"SUPERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"SUPERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"DDMERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"DDMERRORDIAG" VARCHAR2(700 BYTE) DEFAULT NULL, 
	"BROKERAGEERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"BROKERAGEERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"JOBDISPATCHERERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"JOBDISPATCHERERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"TASKBUFFERERRORCODE" NUMBER(7,0) DEFAULT '0', 
	"TASKBUFFERERRORDIAG" VARCHAR2(300 BYTE) DEFAULT NULL, 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"COMPUTINGELEMENT" VARCHAR2(128 BYTE), 
	"PRODDBLOCK" VARCHAR2(255 CHAR), 
	"DISPATCHDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONSE" VARCHAR2(250 BYTE), 
	"NEVENTS" NUMBER(10,0) DEFAULT '0', 
	"GRID" VARCHAR2(50 BYTE), 
	"CLOUD" VARCHAR2(50 BYTE), 
	"CPUCONVERSION" NUMBER(9,4), 
	"SOURCESITE" VARCHAR2(36 BYTE), 
	"DESTINATIONSITE" VARCHAR2(36 BYTE), 
	"TRANSFERTYPE" VARCHAR2(10 BYTE), 
	"TASKID" NUMBER(9,0) DEFAULT NULL, 
	"CMTCONFIG" VARCHAR2(250 BYTE), 
	"STATECHANGETIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"PRODDBUPDATETIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"LOCKEDBY" VARCHAR2(128 BYTE), 
	"RELOCATIONFLAG" NUMBER(1,0) DEFAULT '0', 
	"JOBEXECUTIONID" NUMBER(11,0) DEFAULT '0', 
	"VO" VARCHAR2(16 BYTE), 
	"PILOTTIMING" VARCHAR2(100 BYTE), 
	"WORKINGGROUP" VARCHAR2(20 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(64 BYTE), 
	"PRODUSERNAME" VARCHAR2(60 CHAR), 
	"NINPUTFILES" NUMBER(5,0), 
	"COUNTRYGROUP" VARCHAR2(20 BYTE), 
	"BATCHID" VARCHAR2(80 BYTE), 
	"PARENTID" NUMBER(11,0), 
	"SPECIALHANDLING" VARCHAR2(80 BYTE), 
	"JOBSETID" NUMBER(11,0), 
	"CORECOUNT" NUMBER(3,0), 
	"JOBPARAMETERS" CLOB, 
	"METADATA" CLOB, 
	"NINPUTDATAFILES" NUMBER(5,0), 
	"INPUTFILETYPE" VARCHAR2(32 BYTE), 
	"INPUTFILEPROJECT" VARCHAR2(64 BYTE), 
	"INPUTFILEBYTES" NUMBER(15,0),
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
    "MEANCORECOUNT" NUMBER(8,2),
    "GCO2_REGIONAL" NUMBER(10, 2),
    "GCO2_GLOBAL" NUMBER(10, 2),
    "CPU_ARCHITECTURE_LEVEL" VARCHAR2(20),
    "OUTPUTFILETYPE" VARCHAR2(32)
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "PART_JOBSARCHIVED4_15032020"  VALUES LESS THAN (TO_DATE(' 2020-03-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PANDAID" IS 'sequential ID generated from Oracle sequence object JOBSDEFINED4_PANDAID_SEQ when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MODIFICATIONTIME" IS 'timestamp in UTC set by Panda server when job state changes or pilot update is received';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBDEFINITIONID" IS 'comes from ejobdef.jobdefid for managed production jobs, and defines job set IDs for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."SCHEDULERID" IS 'ID identifying the pilot scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PILOTID" IS 'ID assigned to pilot by scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CREATIONTIME" IS 'generated by Oracle''s SYSDATE function when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CREATIONHOST" IS 'the hostname where the job is submitted';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MODIFICATIONHOST" IS 'the hostname which updates job status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."ATLASRELEASE" IS 'Release required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TRANSFORMATION" IS 'Payload job script';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."HOMEPACKAGE" IS 'Cache required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PRODSERIESLABEL" IS 'constrained to DC2, Rome, DC3, pandatest';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PRODSOURCELABEL" IS 'activity name of the name such as managed, user, and ddm';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PRODUSERID" IS 'ID of the user defined the job (user''s certificateDN or e-mail address)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."ASSIGNEDPRIORITY" IS 'defined priority value';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CURRENTPRIORITY" IS 'actual priority value which is usually the same as assignedPriority, can be modified by Panda server';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."ATTEMPTNR" IS 'how many times the job was retried so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXATTEMPT" IS 'how many times the job can be retried';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBSTATUS" IS 'status of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBNAME" IS 'the job name defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXCPUCOUNT" IS 'expected execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXCPUUNIT" IS 'unit for MAXCPUCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXDISKCOUNT" IS 'expected disk size used by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXDISKUNIT" IS 'unit for MAXDISKCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."IPCONNECTIVITY" IS 'defined in prodDB (unused in Panda)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MINRAMCOUNT" IS 'expected amount of memory usage of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MINRAMUNIT" IS 'unit for MINRAMCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."STARTTIME" IS 'start time when the job got started on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."ENDTIME" IS 'end time when the job finished on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CPUCONSUMPTIONTIME" IS 'actual execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CPUCONSUMPTIONUNIT" IS 'unit for CPUCONSUMPTIONTIME';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."COMMANDTOPILOT" IS 'used to send commands to pilot from Panda server, to kill the job for instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TRANSEXITCODE" IS 'transformation exit code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PILOTERRORCODE" IS 'pilot error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PILOTERRORDIAG" IS 'pilot error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."EXEERRORCODE" IS 'executor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."EXEERRORDIAG" IS 'executor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."SUPERRORCODE" IS 'supervisor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."SUPERRORDIAG" IS 'supervisor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."DDMERRORCODE" IS 'DDM error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."DDMERRORDIAG" IS 'DDM error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."BROKERAGEERRORCODE" IS 'brokerage error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."BROKERAGEERRORDIAG" IS 'brokerage error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBDISPATCHERERRORCODE" IS 'jobDispatcher error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBDISPATCHERERRORDIAG" IS 'jobDispatcher error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TASKBUFFERERRORCODE" IS 'taskBuffer error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TASKBUFFERERRORDIAG" IS 'taskBuffer error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."COMPUTINGSITE" IS 'site name where the job runs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."COMPUTINGELEMENT" IS 'name of computing element';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PRODDBLOCK" IS 'name of dataset containing job input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."DISPATCHDBLOCK" IS 'name of dispatch dataset for the job ; a prodDBlock may be broken down into smaller blocks for dispatch to sites';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."DESTINATIONDBLOCK" IS 'name of destination dataset for the job; is used to register the outputs of an associated set of jobs as belonging to one block to be saved at an archival destination';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."DESTINATIONSE" IS 'destination storage element of job output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."NEVENTS" IS 'number of events processed by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."GRID" IS 'GRID where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CLOUD" IS 'cloud (associated with Tier 1) where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CPUCONVERSION" IS 'CPU conversion factor';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."SOURCESITE" IS 'source site (usually CE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."DESTINATIONSITE" IS 'destination site (usually SE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TRANSFERTYPE" IS 'type of file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TASKID" IS 'task ID defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CMTCONFIG" IS 'cmt config';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."STATECHANGETIME" IS 'timestamp of the last state change';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PRODDBUPDATETIME" IS 'timestamp of the last update in Oracle ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."LOCKEDBY" IS 'the name of the current writer of the record in ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."RELOCATIONFLAG" IS 'flag for submitting jobs to a single site. I.e. the brokerage is bypassed';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBEXECUTIONID" IS 'job execution ID coming from ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."VO" IS 'Virtual Organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PILOTTIMING" IS 'time consumption of the pilot';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."WORKINGGROUP" IS 'working group name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PROCESSINGTYPE" IS 'type of the job comes from etask.tasktype2';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PRODUSERNAME" IS 'the name of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."NINPUTFILES" IS 'the number of input files which the pilot processed on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."COUNTRYGROUP" IS 'country of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."BATCHID" IS 'ID of the job in the backend batch system';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."PARENTID" IS 'when the job is a retry for another job, PandaID of the retried job is set in this field';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."SPECIALHANDLING" IS 'set when the job is specially handled in PanDA, such as re-brokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBSETID" IS 'jobset ID for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."CORECOUNT" IS 'the number of CPU cores';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBPARAMETERS" IS 'unused. moved to ATLAS_PANDA.JOBPARAMSTABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."METADATA" IS 'unused. moved to ATLAS_PANDA.METATABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."NINPUTDATAFILES" IS 'the number of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."INPUTFILETYPE" IS 'type of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."INPUTFILEPROJECT" IS 'project name of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."INPUTFILEBYTES" IS 'the total size of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."NOUTPUTDATAFILES" IS 'the number of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."OUTPUTFILEBYTES" IS 'the total size of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."JOBMETRICS" IS 'a general-purpose field to record various job metrics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXRSS" IS 'Maximum RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXVMEM" IS 'Maximum VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXSWAP" IS 'Maximum SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXPSS" IS 'Maximum PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."AVGRSS" IS 'AverageÂ RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."AVGVMEM" IS 'Average VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."AVGSWAP" IS 'Average SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."AVGPSS" IS 'Average PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MAXWALLTIME" IS 'Estimated walltime limit for the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."NUCLEUS" IS 'Name of the site where the job is assigned in WORLD cloud';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."EVENTSERVICE" IS 'The job uses Event Service';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."FAILEDATTEMPT" IS 'How many times the input files were failed so far. The maximum number is used if there are multiple input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."HS06SEC" IS 'The product of HS06 score and CPU consumption time';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."HS06" IS 'Core count x core power';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TOTRCHAR" IS 'Total read chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TOTWCHAR" IS 'Total write chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TOTRBYTES" IS 'Total read bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."TOTWBYTES" IS 'Total write bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."RATERCHAR" IS 'Read chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."RATEWCHAR" IS 'Write chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."RATERBYTES" IS 'Read bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."RATEWBYTES" IS 'Write bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."RESOURCE_TYPE" IS 'Resource type name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."DISKIO" IS 'Local disk access in kBPerSec. Required to limit the number of running jobs based on total IO for each queue.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MEMORY_LEAK" IS 'Memory leak in KB/s';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."MEMORY_LEAK_X2" IS 'Memory leak square statistic';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSARCHIVED4"."OUTPUTFILETYPE" IS 'Comma-separated list of output file types for the job';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBSARCHIVED4"  IS 'Table for hosting all PanDA jobs that are in finished, failed or cancelled status. Data is regularly copied to an archive table in ATLAS_PANDAARCH schema. Data retention of the JOBSARCHIVED4 table is defined to be 3 days (can be changed if necessary). All timestamp and date type columns are in UTC ';

--------------------------------------------------------
--  DDL for Table JOBSDEBUG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBSDEBUG" 
   (	"PANDAID" NUMBER(11,0), 
	"STDOUT" VARCHAR2(2048 BYTE), 
	 CONSTRAINT "JOBSDEBUG_PANDAID_PK" PRIMARY KEY ("PANDAID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEBUG"."PANDAID" IS 'PandaID of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEBUG"."STDOUT" IS 'snippet of stdout sent by the pilot';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBSDEBUG"  IS 'Table with job stdout which is sent by the pilot on the worker node in order to enable real-time monitoring of job status';

--------------------------------------------------------
--  DDL for Table JOBSDEFINED4
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBSDEFINED4" 
   (	"PANDAID" NUMBER(11,0) DEFAULT '0', 
	"JOBDEFINITIONID" NUMBER(11,0) DEFAULT '0', 
	"SCHEDULERID" VARCHAR2(128 BYTE), 
	"PILOTID" VARCHAR2(200 BYTE), 
	"CREATIONTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"CREATIONHOST" VARCHAR2(128 BYTE), 
	"MODIFICATIONTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"MODIFICATIONHOST" VARCHAR2(128 BYTE), 
	"ATLASRELEASE" VARCHAR2(64 BYTE), 
	"TRANSFORMATION" VARCHAR2(250 BYTE), 
	"HOMEPACKAGE" VARCHAR2(80 BYTE), 
	"PRODSERIESLABEL" VARCHAR2(20 BYTE) DEFAULT 'Rome', 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE) DEFAULT 'managed', 
	"PRODUSERID" VARCHAR2(250 BYTE), 
	"ASSIGNEDPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"CURRENTPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"ATTEMPTNR" NUMBER(3,0) DEFAULT '0', 
	"MAXATTEMPT" NUMBER(3,0) DEFAULT '0', 
	"JOBSTATUS" VARCHAR2(15 BYTE) DEFAULT 'defined', 
	"JOBNAME" VARCHAR2(256 BYTE), 
	"MAXCPUCOUNT" NUMBER(9,0) DEFAULT '0', 
	"MAXCPUUNIT" VARCHAR2(32 BYTE), 
	"MAXDISKCOUNT" NUMBER(9,0) DEFAULT '0', 
	"MAXDISKUNIT" CHAR(4 BYTE), 
	"IPCONNECTIVITY" CHAR(5 BYTE), 
	"MINRAMCOUNT" NUMBER(9,0) DEFAULT '0', 
	"MINRAMUNIT" CHAR(2 BYTE), 
	"STARTTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"ENDTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"CPUCONSUMPTIONTIME" NUMBER(20,0) DEFAULT '0', 
	"CPUCONSUMPTIONUNIT" VARCHAR2(128 BYTE), 
	"COMMANDTOPILOT" VARCHAR2(250 BYTE), 
	"TRANSEXITCODE" VARCHAR2(128 BYTE), 
	"PILOTERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"PILOTERRORDIAG" VARCHAR2(250 BYTE), 
	"EXEERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"EXEERRORDIAG" VARCHAR2(250 BYTE), 
	"SUPERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"SUPERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"DDMERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"DDMERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"BROKERAGEERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"BROKERAGEERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"JOBDISPATCHERERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"JOBDISPATCHERERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"TASKBUFFERERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"TASKBUFFERERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"COMPUTINGELEMENT" VARCHAR2(128 BYTE), 
	"JOBPARAMETERS" CLOB, 
	"METADATA" CLOB, 
	"PRODDBLOCK" VARCHAR2(255 CHAR), 
	"DISPATCHDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONSE" VARCHAR2(250 BYTE), 
	"NEVENTS" NUMBER(9,0) DEFAULT '0', 
	"GRID" VARCHAR2(32 BYTE), 
	"CLOUD" VARCHAR2(32 BYTE), 
	"CPUCONVERSION" NUMBER(9,4), 
	"SOURCESITE" VARCHAR2(36 BYTE), 
	"DESTINATIONSITE" VARCHAR2(36 BYTE), 
	"TRANSFERTYPE" VARCHAR2(10 BYTE), 
	"TASKID" NUMBER(9,0) DEFAULT NULL, 
	"CMTCONFIG" VARCHAR2(250 BYTE), 
	"STATECHANGETIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"PRODDBUPDATETIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"LOCKEDBY" VARCHAR2(128 BYTE), 
	"RELOCATIONFLAG" NUMBER(1,0) DEFAULT '0', 
	"JOBEXECUTIONID" NUMBER(11,0) DEFAULT '0', 
	"VO" VARCHAR2(16 BYTE), 
	"PILOTTIMING" VARCHAR2(100 BYTE), 
	"WORKINGGROUP" VARCHAR2(20 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(64 BYTE), 
	"PRODUSERNAME" VARCHAR2(60 CHAR), 
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
	"INPUTFILEBYTES" NUMBER(15,0),
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
    "MEANCORECOUNT" NUMBER(8,2),
    "GCO2_REGIONAL" NUMBER(10, 2),
    "GCO2_GLOBAL" NUMBER(10, 2),
    "CPU_ARCHITECTURE_LEVEL" VARCHAR2(20),
    "OUTPUTFILETYPE" VARCHAR2(32)
   )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PANDAID" IS 'sequential ID generated from Oracle sequence object JOBSDEFINED4_PANDAID_SEQ when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBDEFINITIONID" IS 'comes from ejobdef.jobdefid for managed production jobs, and defines job set IDs for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."SCHEDULERID" IS 'ID identifying the pilot scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PILOTID" IS 'ID assigned to pilot by scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CREATIONTIME" IS 'generated by Oracle''s SYSDATE function when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CREATIONHOST" IS 'the hostname where the job is submitted';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MODIFICATIONTIME" IS 'timestamp in UTC set by Panda server when job state changes or pilot update is received';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MODIFICATIONHOST" IS 'the hostname which updates job status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."ATLASRELEASE" IS 'Release required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TRANSFORMATION" IS 'Payload job script';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."HOMEPACKAGE" IS 'Cache required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PRODSERIESLABEL" IS 'constrained to DC2, Rome, DC3, pandatest';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PRODSOURCELABEL" IS 'activity name of the name such as managed, user, and ddm';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PRODUSERID" IS 'ID of the user defined the job (user''s certificateDN or e-mail address)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."ASSIGNEDPRIORITY" IS 'defined priority value';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CURRENTPRIORITY" IS 'actual priority value which is usually the same as assignedPriority, can be modified by Panda server';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."ATTEMPTNR" IS 'how many times the job was retried so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXATTEMPT" IS 'how many times the job can be retried';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBSTATUS" IS 'status of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBNAME" IS 'the job name defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXCPUCOUNT" IS 'expected execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXCPUUNIT" IS 'unit for MAXCPUCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXDISKCOUNT" IS 'expected disk size used by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXDISKUNIT" IS 'unit for MAXDISKCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."IPCONNECTIVITY" IS 'defined in prodDB (unused in Panda)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MINRAMCOUNT" IS 'expected amount of memory usage of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MINRAMUNIT" IS 'unit for MINRAMCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."STARTTIME" IS 'start time when the job got started on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."ENDTIME" IS 'end time when the job finished on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CPUCONSUMPTIONTIME" IS 'actual execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CPUCONSUMPTIONUNIT" IS 'unit for CPUCONSUMPTIONTIME';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."COMMANDTOPILOT" IS 'used to send commands to pilot from Panda server, to kill the job for instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TRANSEXITCODE" IS 'transformation exit code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PILOTERRORCODE" IS 'pilot error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PILOTERRORDIAG" IS 'pilot error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."EXEERRORCODE" IS 'executor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."EXEERRORDIAG" IS 'executor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."SUPERRORCODE" IS 'supervisor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."SUPERRORDIAG" IS 'supervisor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."DDMERRORCODE" IS 'DDM error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."DDMERRORDIAG" IS 'DDM error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."BROKERAGEERRORCODE" IS 'brokerage error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."BROKERAGEERRORDIAG" IS 'brokerage error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBDISPATCHERERRORCODE" IS 'jobDispatcher error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBDISPATCHERERRORDIAG" IS 'jobDispatcher error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TASKBUFFERERRORCODE" IS 'taskBuffer error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TASKBUFFERERRORDIAG" IS 'taskBuffer error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."COMPUTINGSITE" IS 'site name where the job runs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."COMPUTINGELEMENT" IS 'name of computing element';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBPARAMETERS" IS 'unused. moved to ATLAS_PANDA.JOBPARAMSTABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."METADATA" IS 'unused. moved to ATLAS_PANDA.METATABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PRODDBLOCK" IS 'name of dataset containing job input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."DISPATCHDBLOCK" IS 'name of dispatch dataset for the job ; a prodDBlock may be broken down into smaller blocks for dispatch to sites';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."DESTINATIONDBLOCK" IS 'name of destination dataset for the job; is used to register the outputs of an associated set of jobs as belonging to one block to be saved at an archival destination';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."DESTINATIONSE" IS 'destination storage element of job output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."NEVENTS" IS 'number of events processed by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."GRID" IS 'GRID where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CLOUD" IS 'cloud (associated with Tier 1) where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CPUCONVERSION" IS 'CPU conversion factor';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."SOURCESITE" IS 'source site (usually CE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."DESTINATIONSITE" IS 'destination site (usually SE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TRANSFERTYPE" IS 'type of file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TASKID" IS 'task ID defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CMTCONFIG" IS 'cmt config';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."STATECHANGETIME" IS 'timestamp of the last state change';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PRODDBUPDATETIME" IS 'timestamp of the last update in Oracle ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."LOCKEDBY" IS 'the name of the current writer of the record in ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."RELOCATIONFLAG" IS 'flag for submitting jobs to a single site. I.e. the brokerage is bypassed';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBEXECUTIONID" IS 'job execution ID coming from ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."VO" IS 'Virtual Organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PILOTTIMING" IS 'time consumption of the pilot';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."WORKINGGROUP" IS 'working group name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PROCESSINGTYPE" IS 'type of the job comes from etask.tasktype2';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PRODUSERNAME" IS 'the name of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."NINPUTFILES" IS 'the number of input files which the pilot processed on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."COUNTRYGROUP" IS 'country of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."BATCHID" IS 'ID of the job in the backend batch system';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."PARENTID" IS 'when the job is a retry for another job, PandaID of the retried job is set in this field';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."SPECIALHANDLING" IS 'set when the job is specially handled in PanDA, such as re-brokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBSETID" IS 'jobset ID for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."CORECOUNT" IS 'the number of CPU cores';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."NINPUTDATAFILES" IS 'the number of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."INPUTFILETYPE" IS 'type of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."INPUTFILEPROJECT" IS 'project name of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."INPUTFILEBYTES" IS 'the total size of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."NOUTPUTDATAFILES" IS 'the number of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."OUTPUTFILEBYTES" IS 'the total size of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."JOBMETRICS" IS 'a general-purpose field to record various job metrics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXRSS" IS 'Maximum RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXVMEM" IS 'Maximum VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXSWAP" IS 'Maximum SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXPSS" IS 'Maximum PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."AVGRSS" IS 'AverageÂ RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."AVGVMEM" IS 'Average VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."AVGSWAP" IS 'Average SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."AVGPSS" IS 'Average PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MAXWALLTIME" IS 'Estimated walltime limit for the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."NUCLEUS" IS 'Name of the site where the job is assigned in WORLD cloud';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."EVENTSERVICE" IS 'The job uses Event Service';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."FAILEDATTEMPT" IS 'How many times the input files were failed so far. The maximum number is used if there are multiple input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."HS06SEC" IS 'The product of HS06 score and CPU consumption time';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."HS06" IS 'Core count x core power';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TOTRCHAR" IS 'Total read chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TOTWCHAR" IS 'Total write chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TOTRBYTES" IS 'Total read bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."TOTWBYTES" IS 'Total write bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."RATERCHAR" IS 'Read chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."RATEWCHAR" IS 'Write chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."RATERBYTES" IS 'Read bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."RATEWBYTES" IS 'Write bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."RESOURCE_TYPE" IS 'Resource type name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."DISKIO" IS 'Local disk access in kBPerSec. Required to limit the number of running jobs based on total IO for each queue.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MEMORY_LEAK" IS 'Memory leak in KB/s';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."MEMORY_LEAK_X2" IS 'Memory leak square statistic';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED4"."OUTPUTFILETYPE" IS 'Comma-separated list of output file types for the job';

--------------------------------------------------------
--  DDL for Table JOBSWAITING4
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBSWAITING4" 
   (	"PANDAID" NUMBER(11,0) DEFAULT '0', 
	"JOBDEFINITIONID" NUMBER(11,0) DEFAULT '0', 
	"SCHEDULERID" VARCHAR2(128 BYTE), 
	"PILOTID" VARCHAR2(200 BYTE), 
	"CREATIONTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"CREATIONHOST" VARCHAR2(128 BYTE), 
	"MODIFICATIONTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"MODIFICATIONHOST" VARCHAR2(128 BYTE), 
	"ATLASRELEASE" VARCHAR2(64 BYTE), 
	"TRANSFORMATION" VARCHAR2(250 BYTE), 
	"HOMEPACKAGE" VARCHAR2(80 BYTE), 
	"PRODSERIESLABEL" VARCHAR2(20 BYTE) DEFAULT 'Rome', 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE) DEFAULT 'managed', 
	"PRODUSERID" VARCHAR2(250 BYTE), 
	"ASSIGNEDPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"CURRENTPRIORITY" NUMBER(9,0) DEFAULT '0', 
	"ATTEMPTNR" NUMBER(3,0) DEFAULT '0', 
	"MAXATTEMPT" NUMBER(3,0) DEFAULT '0', 
	"JOBSTATUS" VARCHAR2(15 BYTE) DEFAULT 'waiting', 
	"JOBNAME" VARCHAR2(256 BYTE), 
	"MAXCPUCOUNT" NUMBER(9,0) DEFAULT '0', 
	"MAXCPUUNIT" VARCHAR2(32 BYTE), 
	"MAXDISKCOUNT" NUMBER(9,0) DEFAULT '0', 
	"MAXDISKUNIT" CHAR(4 BYTE), 
	"IPCONNECTIVITY" CHAR(5 BYTE), 
	"MINRAMCOUNT" NUMBER(9,0) DEFAULT '0', 
	"MINRAMUNIT" CHAR(2 BYTE), 
	"STARTTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"ENDTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"CPUCONSUMPTIONTIME" NUMBER(20,0) DEFAULT '0', 
	"CPUCONSUMPTIONUNIT" VARCHAR2(128 BYTE), 
	"COMMANDTOPILOT" VARCHAR2(250 BYTE), 
	"TRANSEXITCODE" VARCHAR2(128 BYTE), 
	"PILOTERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"PILOTERRORDIAG" VARCHAR2(250 BYTE), 
	"EXEERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"EXEERRORDIAG" VARCHAR2(250 BYTE), 
	"SUPERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"SUPERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"DDMERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"DDMERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"BROKERAGEERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"BROKERAGEERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"JOBDISPATCHERERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"JOBDISPATCHERERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"TASKBUFFERERRORCODE" NUMBER(6,0) DEFAULT '0', 
	"TASKBUFFERERRORDIAG" VARCHAR2(250 BYTE) DEFAULT NULL, 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"COMPUTINGELEMENT" VARCHAR2(128 BYTE), 
	"JOBPARAMETERS" CLOB, 
	"METADATA" CLOB, 
	"PRODDBLOCK" VARCHAR2(255 CHAR), 
	"DISPATCHDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONDBLOCK" VARCHAR2(255 CHAR), 
	"DESTINATIONSE" VARCHAR2(250 BYTE), 
	"NEVENTS" NUMBER(9,0) DEFAULT '0', 
	"GRID" VARCHAR2(32 BYTE), 
	"CLOUD" VARCHAR2(32 BYTE), 
	"CPUCONVERSION" NUMBER(9,4), 
	"SOURCESITE" VARCHAR2(36 BYTE), 
	"DESTINATIONSITE" VARCHAR2(36 BYTE), 
	"TRANSFERTYPE" VARCHAR2(10 BYTE), 
	"TASKID" NUMBER(9,0) DEFAULT NULL, 
	"CMTCONFIG" VARCHAR2(250 BYTE), 
	"STATECHANGETIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"PRODDBUPDATETIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"LOCKEDBY" VARCHAR2(128 BYTE), 
	"RELOCATIONFLAG" NUMBER(1,0) DEFAULT '0', 
	"JOBEXECUTIONID" NUMBER(11,0) DEFAULT '0', 
	"VO" VARCHAR2(16 BYTE), 
	"PILOTTIMING" VARCHAR2(100 BYTE), 
	"WORKINGGROUP" VARCHAR2(20 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(64 BYTE), 
	"PRODUSERNAME" VARCHAR2(60 CHAR), 
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
	"INPUTFILEBYTES" NUMBER(15,0),
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
    "MEANCORECOUNT" NUMBER(8,2),
    "GCO2_REGIONAL" NUMBER(10, 2),
    "GCO2_GLOBAL" NUMBER(10, 2),
    "CPU_ARCHITECTURE_LEVEL" VARCHAR2(20),
    "OUTPUTFILETYPE" VARCHAR2(32)
   )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PANDAID" IS 'sequential ID generated from Oracle sequence object JOBSDEFINED4_PANDAID_SEQ when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBDEFINITIONID" IS 'comes from ejobdef.jobdefid for managed production jobs, and defines job set IDs for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."SCHEDULERID" IS 'ID identifying the pilot scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PILOTID" IS 'ID assigned to pilot by scheduler';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CREATIONTIME" IS 'generated by Oracle''s SYSDATE function when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CREATIONHOST" IS 'the hostname where the job is submitted';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MODIFICATIONTIME" IS 'timestamp in UTC set by Panda server when job state changes or pilot update is received';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MODIFICATIONHOST" IS 'the hostname which updates job status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."ATLASRELEASE" IS 'Release required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TRANSFORMATION" IS 'Payload job script';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."HOMEPACKAGE" IS 'Cache required to run the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PRODSERIESLABEL" IS 'constrained to DC2, Rome, DC3, pandatest';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PRODSOURCELABEL" IS 'activity name of the name such as managed, user, and ddm';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PRODUSERID" IS 'ID of the user defined the job (user''s certificateDN or e-mail address)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."ASSIGNEDPRIORITY" IS 'defined priority value';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CURRENTPRIORITY" IS 'actual priority value which is usually the same as assignedPriority, can be modified by Panda server';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."ATTEMPTNR" IS 'how many times the job was retried so far';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXATTEMPT" IS 'how many times the job can be retried';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBSTATUS" IS 'status of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBNAME" IS 'the job name defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXCPUCOUNT" IS 'expected execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXCPUUNIT" IS 'unit for MAXCPUCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXDISKCOUNT" IS 'expected disk size used by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXDISKUNIT" IS 'unit for MAXDISKCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."IPCONNECTIVITY" IS 'defined in prodDB (unused in Panda)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MINRAMCOUNT" IS 'expected amount of memory usage of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MINRAMUNIT" IS 'unit for MINRAMCOUNT';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."STARTTIME" IS 'start time when the job got started on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."ENDTIME" IS 'end time when the job finished on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CPUCONSUMPTIONTIME" IS 'actual execution time of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CPUCONSUMPTIONUNIT" IS 'unit for CPUCONSUMPTIONTIME';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."COMMANDTOPILOT" IS 'used to send commands to pilot from Panda server, to kill the job for instance';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TRANSEXITCODE" IS 'transformation exit code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PILOTERRORCODE" IS 'pilot error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PILOTERRORDIAG" IS 'pilot error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."EXEERRORCODE" IS 'executor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."EXEERRORDIAG" IS 'executor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."SUPERRORCODE" IS 'supervisor error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."SUPERRORDIAG" IS 'supervisor error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."DDMERRORCODE" IS 'DDM error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."DDMERRORDIAG" IS 'DDM error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."BROKERAGEERRORCODE" IS 'brokerage error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."BROKERAGEERRORDIAG" IS 'brokerage error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBDISPATCHERERRORCODE" IS 'jobDispatcher error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBDISPATCHERERRORDIAG" IS 'jobDispatcher error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TASKBUFFERERRORCODE" IS 'taskBuffer error code';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TASKBUFFERERRORDIAG" IS 'taskBuffer error diagnostics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."COMPUTINGSITE" IS 'site name where the job runs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."COMPUTINGELEMENT" IS 'name of computing element';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBPARAMETERS" IS 'unused. moved to ATLAS_PANDA.JOBPARAMSTABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."METADATA" IS 'unused. moved to ATLAS_PANDA.METATABLE. remains for code compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PRODDBLOCK" IS 'name of dataset containing job input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."DISPATCHDBLOCK" IS 'name of dispatch dataset for the job ; a prodDBlock may be broken down into smaller blocks for dispatch to sites';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."DESTINATIONDBLOCK" IS 'name of destination dataset for the job; is used to register the outputs of an associated set of jobs as belonging to one block to be saved at an archival destination';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."DESTINATIONSE" IS 'destination storage element of job output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."NEVENTS" IS 'number of events processed by the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."GRID" IS 'GRID where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CLOUD" IS 'cloud (associated with Tier 1) where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CPUCONVERSION" IS 'CPU conversion factor';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."SOURCESITE" IS 'source site (usually CE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."DESTINATIONSITE" IS 'destination site (usually SE) for file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TRANSFERTYPE" IS 'type of file transfer';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TASKID" IS 'task ID defined in prodDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CMTCONFIG" IS 'cmt config';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."STATECHANGETIME" IS 'timestamp of the last state change';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PRODDBUPDATETIME" IS 'timestamp of the last update in Oracle ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."LOCKEDBY" IS 'the name of the current writer of the record in ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."RELOCATIONFLAG" IS 'flag for submitting jobs to a single site. I.e. the brokerage is bypassed';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBEXECUTIONID" IS 'job execution ID coming from ProdDB';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."VO" IS 'Virtual Organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PILOTTIMING" IS 'time consumption of the pilot';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."WORKINGGROUP" IS 'working group name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PROCESSINGTYPE" IS 'type of the job comes from etask.tasktype2';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PRODUSERNAME" IS 'the name of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."NINPUTFILES" IS 'the number of input files which the pilot processed on WN';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."COUNTRYGROUP" IS 'country of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."BATCHID" IS 'ID of the job in the backend batch system';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."PARENTID" IS 'when the job is a retry for another job, PandaID of the retried job is set in this field';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."SPECIALHANDLING" IS 'set when the job is specially handled in PanDA, such as re-brokerage';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBSETID" IS 'jobset ID for analysis jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."CORECOUNT" IS 'the number of CPU cores';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."NINPUTDATAFILES" IS 'the number of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."INPUTFILETYPE" IS 'type of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."INPUTFILEPROJECT" IS 'project name of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."INPUTFILEBYTES" IS 'the total size of input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."NOUTPUTDATAFILES" IS 'the number of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."OUTPUTFILEBYTES" IS 'the total size of output files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."JOBMETRICS" IS 'a general-purpose field to record various job metrics';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXRSS" IS 'Maximum RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXVMEM" IS 'Maximum VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXSWAP" IS 'Maximum SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXPSS" IS 'Maximum PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."AVGRSS" IS 'AverageÂ RSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."AVGVMEM" IS 'Average VMEM in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."AVGSWAP" IS 'Average SWAP in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."AVGPSS" IS 'Average PSS in the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MAXWALLTIME" IS 'Estimated walltime limit for the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."NUCLEUS" IS 'Name of the site where the job is assigned in WORLD cloud';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."EVENTSERVICE" IS 'The job uses Event Service';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."FAILEDATTEMPT" IS 'How many times the input files were failed so far. The maximum number is used if there are multiple input files';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."HS06SEC" IS 'The product of HS06 score and CPU consumption time';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."HS06" IS 'Core count x core power';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TOTRCHAR" IS 'Total read chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TOTWCHAR" IS 'Total write chars';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TOTRBYTES" IS 'Total read bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."TOTWBYTES" IS 'Total write bytes';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."RATERCHAR" IS 'Read chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."RATEWCHAR" IS 'Write chars rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."RATERBYTES" IS 'Read bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."RATEWBYTES" IS 'Write bytes rate';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."RESOURCE_TYPE" IS 'Resource type name';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."DISKIO" IS 'Local disk access in kBPerSec. Required to limit the number of running jobs based on total IO for each queue.';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MEMORY_LEAK" IS 'Memory leak in KB/s';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."MEMORY_LEAK_X2" IS 'Memory leak square statistic';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSWAITING4"."OUTPUTFILETYPE" IS 'Comma-separated list of output file types for the job';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBSWAITING4"  IS 'Table for hosting all PanDA jobs that are in waiting state. The columns (and their description) are the same as the ones in JOBSACTIVE4 table. All timestamp and date type columns are in UTC';

--------------------------------------------------------
--  DDL for Table JOBS_SHARE_STATS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBS_SHARE_STATS" 
   (	"TS" DATE, 
	"GSHARE" VARCHAR2(32 BYTE), 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"JOBSTATUS" VARCHAR2(15 BYTE), 
	"MAXPRIORITY" NUMBER,
    "PRORATED_DISKIO_AVG" NUMBER(11,2),
    "PRORATED_MEM_AVG" NUMBER(11,2)
	"NJOBS" NUMBER, 
	"HS" NUMBER, 
	"VO" VARCHAR2(16 BYTE), 
	"WORKQUEUE_ID" NUMBER(5,0), 
	"RESOURCE_TYPE" VARCHAR2(56 BYTE)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."TS" IS 'Timestamp for the entry';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."COMPUTINGSITE" IS 'Panda site';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."JOBSTATUS" IS 'Jobstatus for the aggregation';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."MAXPRIORITY" IS 'Max priority of share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."NJOBS" IS 'Number of jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."HS" IS 'HS06 = core count x core power x njob';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."VO" IS 'Virtual organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."WORKQUEUE_ID" IS 'Work queue';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."RESOURCE_TYPE" IS 'Resource type (SCORE, MCORE...)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."PRORATED_DISKIO_AVG" IS 'avg(diskIO/corecount)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_SHARE_STATS"."PRORATED_MEM_AVG" IS 'avg(minRamCount/corecount)';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBS_SHARE_STATS"  IS 'njobs and HS06 statistics by share';

--------------------------------------------------------
--  DDL for Table JOBSDEFINED_SHARE_STATS
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"
   (	"TS" DATE,
	"GSHARE" VARCHAR2(32 BYTE),
	"COMPUTINGSITE" VARCHAR2(128 BYTE),
	"JOBSTATUS" VARCHAR2(15 BYTE),
	"MAXPRIORITY" NUMBER,
    "PRORATED_DISKIO_AVG" NUMBER(11,2),
    "PRORATED_MEM_AVG" NUMBER(11,2),
	"NJOBS" NUMBER,
	"HS" NUMBER,
	"VO" VARCHAR2(16 BYTE),
	"WORKQUEUE_ID" NUMBER(5,0),
	"RESOURCE_TYPE" VARCHAR2(56 BYTE)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."TS" IS 'Timestamp for the entry';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."GSHARE" IS 'Global share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."COMPUTINGSITE" IS 'Panda site';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."JOBSTATUS" IS 'Jobstatus for the aggregation';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."MAXPRIORITY" IS 'Max priority of share';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."PRORATED_DISKIO_AVG" IS 'Dummy entry, only for compatibility';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."PRORATED_MEM_AVG" IS 'avg(minRamCount/corecount)';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."NJOBS" IS 'Number of jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."HS" IS 'HS06 = core count x core power x njob';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."VO" IS 'Virtual organization';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."WORKQUEUE_ID" IS 'Work queue';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"."RESOURCE_TYPE" IS 'Resource type (SCORE, MCORE...)';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS"  IS 'njobs and HS06 statistics by share for table jobsdefined4';

--------------------------------------------------------
--  DDL for Table JOB_STATS_HP
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."JOB_STATS_HP"
   ("TS" DATE,
    "PRODSOURCELABEL" VARCHAR2(20 BYTE),
    "CLOUD" VARCHAR2(50 BYTE),
    "RESOURCE_TYPE" VARCHAR2(56 BYTE),
    "GSHARE" VARCHAR2(32 BYTE),
    "JOBSTATUS" VARCHAR2(15 BYTE),
    "WORKQUEUE_ID" NUMBER(5,0),
    "VO" VARCHAR2(16 BYTE),
	"MAX_PRIORITY" NUMBER,
    "MAX_PRIORITY_COUNT" NUMBER(10,0)
   );

COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."TS" IS 'Timestamp for the entry';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."GSHARE" IS 'Global share';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."JOBSTATUS" IS 'Jobstatus for the aggregation';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."VO" IS 'Virtual organization';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."WORKQUEUE_ID" IS 'Work queue';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."RESOURCE_TYPE" IS 'Resource type (SCORE, MCORE...)';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."MAX_PRIORITY" IS 'Max priority of share';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_STATS_HP"."MAX_PRIORITY_COUNT" IS 'Number of jobs with max priority';
COMMENT ON TABLE "ATLAS_PANDA"."JOB_STATS_HP"  IS 'highest priority job statistics';

--------------------------------------------------------
--  DDL for Table JOBS_STATUSLOG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."JOBS_STATUSLOG" 
   (	"PANDAID" NUMBER(11,0), 
	"MODIFICATIONTIME" DATE, 
	"JOBSTATUS" VARCHAR2(15 BYTE), 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE), 
	"CLOUD" VARCHAR2(50 BYTE), 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"MODIFICATIONHOST" VARCHAR2(128 BYTE), 
	"MODIFTIME_EXTENDED" TIMESTAMP (6)
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") INTERVAL (NUMTODSINTERVAL(1,'DAY')) 
 (PARTITION "DATA_BEFORE_01082012"  VALUES LESS THAN (TO_DATE(' 2012-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."PANDAID" IS 'sequential ID generated from Oracle sequence object JOBSDEFINED4_PANDAID_SEQ when the job is inserted to jobsDefined4';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."MODIFICATIONTIME" IS 'timestamp (in UTC) set by Panda server when job state changes ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."JOBSTATUS" IS 'status of the job ';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."PRODSOURCELABEL" IS 'activity name of the name such as managed, user, and ddm';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."CLOUD" IS 'cloud (associated with Tier 1) where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."COMPUTINGSITE" IS 'site name where the job runs';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."MODIFICATIONHOST" IS 'the hostname which updates job status';
   COMMENT ON COLUMN "ATLAS_PANDA"."JOBS_STATUSLOG"."MODIFTIME_EXTENDED" IS 'Extended higher precision of the MODIFICATIONTIME column. The MODIFICATIONTIME column itself could not be changed from DATE to TIMESTAMP because of "ORA-14060: data type or length of a table partitioning column may not be changed" ';
   COMMENT ON TABLE "ATLAS_PANDA"."JOBS_STATUSLOG"  IS 'Logging table for hosting important job attributes whenever the job status changes(which are normally overwritten because of the updates in the JOBSACTIVE table. The agreed data retention is 2 months';

--------------------------------------------------------
--  DDL for Table METATABLE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."METATABLE" 
   (	"PANDAID" NUMBER(11,0), 
	"MODIFICATIONTIME" DATE DEFAULT to_date('01-JAN-1970 00:00:00', 'DD-MON-YYYY HH24:MI:SS'), 
	"METADATA" CLOB
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") 
 (PARTITION "PART_INITIAL_01011970"  VALUES LESS THAN (TO_DATE(' 1970-01-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')))  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."METATABLE"."PANDAID" IS 'PandaID of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."METATABLE"."MODIFICATIONTIME" IS 'modificationTime of the job (in UTC)';
   COMMENT ON COLUMN "ATLAS_PANDA"."METATABLE"."METADATA" IS 'Meta data produced by the job in XML format. The column type is CLOB';
   COMMENT ON TABLE "ATLAS_PANDA"."METATABLE"  IS 'Table with information on the job output. When a PanDA job is in a defined or running state, relevant rows reside in the INITIAL partition of the table. When the job is finished or aborted the "modificationtime" is set the to real current time and as the table has "row movement" enabled, Oracle moves the rows from the INITIAL partition to the partitions of the current day. Data is regularly copied to an archive table in ATLAS_PANDAARCH schema. Data retention is defined to be 3 days (can be changed if necessary)';

--------------------------------------------------------
--  DDL for Table MV_JOBSACTIVE4_STATS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS" 
   (	"CUR_DATE" DATE, 
	"CLOUD" VARCHAR2(50 BYTE), 
	"COMPUTINGSITE" VARCHAR2(128 BYTE), 
	"COUNTRYGROUP" VARCHAR2(20 BYTE), 
	"WORKINGGROUP" VARCHAR2(20 BYTE), 
	"RELOCATIONFLAG" NUMBER(1,0), 
	"JOBSTATUS" VARCHAR2(15 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(64 BYTE), 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE), 
	"CURRENTPRIORITY" NUMBER, 
	"NUM_OF_JOBS" NUMBER,
    "NUM_OF_CORES" NUMBER,
	"VO" VARCHAR2(16 BYTE), 
	"WORKQUEUE_ID" NUMBER(5,0)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."CUR_DATE" IS 'The timestamp of the Materialized view refresh ';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."CLOUD" IS 'cloud (associated with Tier 1) where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."COMPUTINGSITE" IS 'site name where the job runs';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."COUNTRYGROUP" IS 'country of the job submitter';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."WORKINGGROUP" IS 'working group name';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."RELOCATIONFLAG" IS 'flag for submitting jobs to a single site. I.e. the brokerage is bypassed';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."JOBSTATUS" IS 'status of the job';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."PROCESSINGTYPE" IS 'type of the job comes from etask.tasktype2';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."PRODSOURCELABEL" IS 'activity name of the name such as managed, user, and ddm';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."CURRENTPRIORITY" IS 'actual priority value which is usually the same as assignedPriority, can be modified by Panda server';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."NUM_OF_JOBS" IS 'Number of jobs computed by grouping all set of attributes(columns) listed in that column,  ';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"."NUM_OF_CORES" IS 'Number of cores computed by grouping all set of attributes(columns) listed in that column,  ';
   COMMENT ON TABLE "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS"  IS 'Table (was from Materialized view before, but was not reliable) which collects aggregated data on set of attributes(columns). The data is read from the JOBSACTIVE4 table by an Oracle scheduler job. The refresh interval is 2 min';


--------------------------------------------------------
--  DDL for Table MV_RUNNING_JUMBO_TASK_COUNT
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"
   (	"CUR_DATE" DATE,
    "VO" VARCHAR2(16 BYTE),
	"CLOUD" VARCHAR2(10 BYTE),
    "PRODSOURCELABEL" VARCHAR2(20 BYTE),
    "USEJUMBO" CHAR(1 BYTE),
    "STATUS" VARCHAR2(64 BYTE),
    "GSHARE" VARCHAR2(32 BYTE),
    "WORKQUEUE_ID" NUMBER(5,0),
    "TASK_COUNT" NUMBER
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."CUR_DATE" IS 'The timestamp of the Materialized view refresh';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."VO" IS 'Virtual organization owning the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."CLOUD" IS 'cloud (associated with Tier 1) where the job is submitted to';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."PRODSOURCELABEL" IS 'activity name of the name such as managed, user, and ddm';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."USEJUMBO" IS 'Internal status for Jumbo jobs';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."STATUS" IS 'Task status. Only active tasks are considered';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."GSHARE" IS 'Global share of the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."WORKQUEUE_ID" IS 'JEDI Workqueue of the task';
   COMMENT ON COLUMN "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"."TASK_COUNT" IS 'Number of tasks';
   COMMENT ON TABLE "ATLAS_PANDA"."MV_RUNNING_JUMBO_TASK_COUNT"  IS 'Table (simulating a Materialized View) which collects count for Jumbo Job tasks.';

--------------------------------------------------------
--  DDL for Table NETWORK_MATRIX_KV
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV" 
   (	"SRC" VARCHAR2(256 BYTE), 
	"DST" VARCHAR2(256 BYTE), 
	"KEY" VARCHAR2(256 BYTE), 
	"VALUE" NUMBER, 
	"TS" DATE, 
	 CONSTRAINT "SITES_MATRIX_KV_DATA_PK" PRIMARY KEY ("SRC", "DST", "KEY") ENABLE
   ) ORGANIZATION INDEX COMPRESS 2 ;

   COMMENT ON COLUMN "ATLAS_PANDA"."NETWORK_MATRIX_KV"."SRC" IS 'Source site';
   COMMENT ON COLUMN "ATLAS_PANDA"."NETWORK_MATRIX_KV"."DST" IS 'Destination site';
   COMMENT ON COLUMN "ATLAS_PANDA"."NETWORK_MATRIX_KV"."KEY" IS 'Metric key';
   COMMENT ON COLUMN "ATLAS_PANDA"."NETWORK_MATRIX_KV"."VALUE" IS 'Metric value';
   COMMENT ON COLUMN "ATLAS_PANDA"."NETWORK_MATRIX_KV"."TS" IS 'Timestamp for the entry';
   COMMENT ON TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV"  IS 'Network matrix based on key-value columns to hold arbitrary metrics';

--------------------------------------------------------
--  DDL for Table NETWORK_MATRIX_KV_TEMP
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV_TEMP" 
   (	"SRC" VARCHAR2(256 BYTE), 
	"DST" VARCHAR2(256 BYTE), 
	"KEY" VARCHAR2(256 BYTE), 
	"VALUE" NUMBER, 
	"TS" DATE
   ) ON COMMIT DELETE ROWS ;

   COMMENT ON TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV_TEMP"  IS 'Table for temporal bulk upload of the changes that need to be merged with the data in NETWORK_MATRIX_KV table.';

--------------------------------------------------------
--  DDL for Table PANDALOG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."PANDALOG" 
   (	"BINTIME" DATE DEFAULT to_date('01-JAN-70 00:00:00', 'dd-MON-yy hh24:mi:ss'), 
	"NAME" VARCHAR2(30 BYTE), 
	"MODULE" VARCHAR2(30 BYTE), 
	"LOGUSER" VARCHAR2(80 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"PID" NUMBER(11,0) DEFAULT '0', 
	"LOGLEVEL" NUMBER(9,0) DEFAULT '0', 
	"LEVELNAME" VARCHAR2(30 BYTE), 
	"TIME" VARCHAR2(30 BYTE), 
	"FILENAME" VARCHAR2(100 BYTE), 
	"LINE" NUMBER(9,0) DEFAULT '0', 
	"MESSAGE" VARCHAR2(4000 BYTE)
   ) 
  PARTITION BY RANGE ("BINTIME") INTERVAL (NUMTODSINTERVAL(1,'DAY')) 
 (PARTITION "DATASETS_BEFORE_24082012"  VALUES LESS THAN (TO_DATE(' 2012-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."BINTIME" IS 'set when the message is inserted';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."NAME" IS 'application name';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."MODULE" IS 'module name in the application';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."LOGUSER" IS 'user name who sends the message';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."TYPE" IS 'message type';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."PID" IS 'process identifier which sends the message';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."LOGLEVEL" IS 'verbosity level of the message';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."LEVELNAME" IS 'name of verbosity level';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."TIME" IS 'set when the message is sent from the application';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."FILENAME" IS 'file name from which the message is sent';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."LINE" IS 'the number of lines in the message';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDALOG"."MESSAGE" IS 'message content';
   COMMENT ON TABLE "ATLAS_PANDA"."PANDALOG"  IS 'Table with job logging information which contains log messages from various applications';

--------------------------------------------------------
--  DDL for Table PANDA_DDM_RELATION
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."PANDA_DDM_RELATION" 
   (	"PANDA_SITE_NAME" VARCHAR2(52 BYTE), 
	"DDM_ENDPOINT_NAME" VARCHAR2(52 BYTE), 
	"IS_LOCAL" CHAR(1 BYTE), 
	"ROLES" VARCHAR2(60 BYTE), 
	"ORDER_READ" NUMBER(5,0), 
	"ORDER_WRITE" NUMBER(5,0), 
	"DEFAULT_READ" CHAR(1 BYTE), 
	"DEFAULT_WRITE" CHAR(1 BYTE), 
	"SCOPE" VARCHAR2(52 BYTE)
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."PANDA_SITE_NAME" IS 'PanDA site name';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."DDM_ENDPOINT_NAME" IS 'DDM endpoint name';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."IS_LOCAL" IS 'Defines whether the CPU is local to the storage. E.g. an HPC center reading from BNL is not local. (Y/N)';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."ROLES" IS 'How the panda site can use the ddm endpoint (read, write,â¦)';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."ORDER_READ" IS 'DDM endpoint order for reading';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."ORDER_WRITE" IS 'DDM endpoint order for writing';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."DEFAULT_READ" IS 'Marks the default DDM endpoint for reading';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_DDM_RELATION"."DEFAULT_WRITE" IS 'Marks the default DDM endpoint for writing';
   COMMENT ON TABLE "ATLAS_PANDA"."PANDA_DDM_RELATION"  IS 'Table to handle the m to n relationships between PanDA sites and DDM endpoints.Table needed for the "Configurator" agent. The table consolidate information from other sources (AGIS and Rucio ) and caches it so that Panda can easily retrieve it and use it for brokerage.';

--------------------------------------------------------
--  DDL for Table PANDA_SITE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."PANDA_SITE" 
   (	"PANDA_SITE_NAME" VARCHAR2(52 BYTE), 
	"SITE_NAME" VARCHAR2(52 BYTE), 
	"STORAGE_SITE_NAME" VARCHAR2(52 BYTE), 
	"DEFAULT_DDM_ENDPOINT" VARCHAR2(52 BYTE), 
	"IS_LOCAL" CHAR(1 BYTE), 
	 CONSTRAINT "PANDA_SITE_NAME_PK" PRIMARY KEY ("PANDA_SITE_NAME") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_SITE"."PANDA_SITE_NAME" IS 'PanDA site name';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_SITE"."SITE_NAME" IS 'Site name';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_SITE"."STORAGE_SITE_NAME" IS 'Defines the site used for storage';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_SITE"."DEFAULT_DDM_ENDPOINT" IS 'Defines the default DDM endpoint';
   COMMENT ON COLUMN "ATLAS_PANDA"."PANDA_SITE"."IS_LOCAL" IS 'Defines whether the panda site is local to the storage. Can be remote in case of HPC, cloud, etc.';
   COMMENT ON TABLE "ATLAS_PANDA"."PANDA_SITE"  IS 'PanDA site/queue. Table needed for the "Configurator" agent. The table consolidate information from other sources (AGIS and Rucio ) and caches it so that Panda can easily retrieve it and use it for brokerage.';

--------------------------------------------------------
--  DDL for Table RESOURCE_TYPES
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."RESOURCE_TYPES" 
   (	"RESOURCE_NAME" VARCHAR2(56 BYTE), 
	"MINCORE" NUMBER(5,0), 
	"MAXCORE" NUMBER(5,0), 
	"MINRAMPERCORE" NUMBER(5,0), 
	"MAXRAMPERCORE" NUMBER(5,0), 
	 CONSTRAINT "RESOURCE_TYPES_PK" PRIMARY KEY ("RESOURCE_NAME") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

   COMMENT ON COLUMN "ATLAS_PANDA"."RESOURCE_TYPES"."RESOURCE_NAME" IS 'Resource type name';
   COMMENT ON COLUMN "ATLAS_PANDA"."RESOURCE_TYPES"."MINCORE" IS 'Minimum number of cores';
   COMMENT ON COLUMN "ATLAS_PANDA"."RESOURCE_TYPES"."MAXCORE" IS 'Maximum number of cores';
   COMMENT ON COLUMN "ATLAS_PANDA"."RESOURCE_TYPES"."MINRAMPERCORE" IS 'Minimum RAM';
   COMMENT ON COLUMN "ATLAS_PANDA"."RESOURCE_TYPES"."MAXRAMPERCORE" IS 'Maximum RAM';
   COMMENT ON TABLE "ATLAS_PANDA"."RESOURCE_TYPES"  IS 'Types of resources, e.g. SCORE, MCORE, SCORE_HIMEM, MCORE_HIMEM';

--------------------------------------------------------
--  DDL for Table RETRYACTIONS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."RETRYACTIONS" 
   (	"RETRYACTION_ID" NUMBER(10,0), 
	"RETRY_ACTION" VARCHAR2(50 BYTE), 
	"ACTIVE" CHAR(1 BYTE) DEFAULT 'Y', 
	"RETRY_DESCRIPTION" VARCHAR2(250 BYTE), 
	 CONSTRAINT "RETRYACTIONS" PRIMARY KEY ("RETRYACTION_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

--------------------------------------------------------
--  DDL for Table RETRYERRORS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."RETRYERRORS" 
   (	"RETRYERROR_ID" NUMBER(10,0), 
	"ERRORSOURCE" VARCHAR2(256 BYTE), 
	"ERRORCODE" NUMBER(10,0), 
	"ACTIVE" CHAR(1 BYTE) DEFAULT 'Y', 
	"RETRYACTION" NUMBER(10,0), 
	"ERRORDIAG" VARCHAR2(256 BYTE), 
	"PARAMETERS" VARCHAR2(256 BYTE), 
	"ARCHITECTURE" VARCHAR2(256 BYTE), 
	"RELEASE" VARCHAR2(64 BYTE), 
	"WORKQUEUE_ID" NUMBER(5,0), 
	"DESCRIPTION" VARCHAR2(250 BYTE), 
	"EXPIRATION_DATE" TIMESTAMP (0)
   ) ;

--------------------------------------------------------
--  DDL for Table ERROR_CLASSIFICATION
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."ERROR_CLASSIFICATION" (
"ID" NUMBER GENERATED ALWAYS AS IDENTITY ( START WITH 1000000 INCREMENT BY 1 NOCACHE NOORDER ) NOT NULL,
"ERROR_SOURCE" VARCHAR2(30 BYTE) NOT NULL,
"ERROR_CODE" NUMBER(10, 0) NOT NULL,
"ERROR_DIAG" VARCHAR2(256 BYTE) NOT NULL,
"DESCRIPTION" VARCHAR2(250 BYTE),
"ERROR_CLASS" VARCHAR2(30 BYTE) NOT NULL,
"ACTIVE" CHAR(1 BYTE) NOT NULL,
"REG_DATE" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT "PK_ERROR_CLASSIFICATION" PRIMARY KEY (ID)
);

COMMENT ON TABLE "ATLAS_PANDA"."ERROR_CLASSIFICATION" IS 'Classification of job error codes+messages to system, user or others';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."ID" IS 'Sequential ID of the request. 1M offset to avoid overlapping IDs with retry module';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."ERROR_SOURCE" IS 'Source of the error: pilotErrorCode, exeErrorCode, ddmErrorCode...';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."ERROR_CODE" IS 'Error code number';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."ERROR_DIAG" IS 'Error message';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."DESCRIPTION" IS 'Any description or comment on the entry';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."ERROR_CLASS" IS 'Error class: system, user,...';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."ACTIVE" IS 'Y or N. Depending on whether the entry is confirmed';
COMMENT ON COLUMN "ATLAS_PANDA"."ERROR_CLASSIFICATION"."REG_DATE" IS 'Registration date, defaults to current timestamp';

--------------------------------------------------------
--  DDL for Table JOB_METRICS
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."JOB_METRICS" (
    "PANDAID" NUMBER(11) NOT NULL,
    "JEDITASKID" NUMBER(11),
    "CREATIONTIME" DATE,
    "MODIFICATIONTIME" DATE,
    "DATA" CLOB,
    CONSTRAINT "PK_JOB_METRICS" PRIMARY KEY ("PANDAID")
)
PARTITION BY RANGE ("MODIFICATIONTIME")
INTERVAL (NUMTOYMINTERVAL(1, 'MONTH')) (
    PARTITION "P_BASE" VALUES LESS THAN (TO_DATE('2024-12-01', 'YYYY-MM-DD'))
);

COMMENT ON TABLE "ATLAS_PANDA"."JOB_METRICS" IS 'System metrics per job';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_METRICS"."PANDAID" IS 'PandaID for the job';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_METRICS"."JEDITASKID" IS 'JEDI task ID for the job';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_METRICS"."CREATIONTIME" IS 'Time of data creation';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_METRICS"."MODIFICATIONTIME" IS 'Time of last update';
COMMENT ON COLUMN "ATLAS_PANDA"."JOB_METRICS"."DATA" IS 'Serialized dictionary of job metrics';

--------------------------------------------------------
--  DDL for Table TASK_METRICS
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."TASK_METRICS" (
    "JEDITASKID" NUMBER(11) NOT NULL,
    "CREATIONTIME" DATE,
    "MODIFICATIONTIME" DATE,
    "DATA" CLOB,
    CONSTRAINT "PK_TASK_METRICS" PRIMARY KEY ("JEDITASKID")
)
PARTITION BY RANGE ("MODIFICATIONTIME")
INTERVAL (NUMTOYMINTERVAL(1, 'MONTH')) (
    PARTITION "P_BASE" VALUES LESS THAN (TO_DATE('2024-12-01', 'YYYY-MM-DD'))
);

COMMENT ON TABLE "ATLAS_PANDA"."TASK_METRICS" IS 'System metrics per task';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_METRICS"."JEDITASKID" IS 'JEDI task ID for the task';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_METRICS"."CREATIONTIME" IS 'Time of data creation';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_METRICS"."MODIFICATIONTIME" IS 'Time of last update';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_METRICS"."DATA" IS 'Serialized dictionary of task metrics';

--------------------------------------------------------
--  DDL for Table SCHEDCONFIG_JSON
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."SCHEDCONFIG_JSON" 
   (	"PANDA_QUEUE" VARCHAR2(50 BYTE), 
	"DATA" CLOB, 
	"LAST_UPDATE" DATE
   ) ;

   COMMENT ON COLUMN "ATLAS_PANDA"."SCHEDCONFIG_JSON"."PANDA_QUEUE" IS 'PanDA queue name';
   COMMENT ON COLUMN "ATLAS_PANDA"."SCHEDCONFIG_JSON"."DATA" IS 'Configuration downloaded from the AGIS/CRIC schedconfig file and stored in JSON block';
   COMMENT ON COLUMN "ATLAS_PANDA"."SCHEDCONFIG_JSON"."LAST_UPDATE" IS 'Last time the PanDA queue was seen/updated';
   COMMENT ON TABLE "ATLAS_PANDA"."SCHEDCONFIG_JSON"  IS 'Table to store the AGIS''s JSON configuration for each panda queue';


--------------------------------------------------------
--  Constraints for Table SCHEDCONFIG_JSON
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."SCHEDCONFIG_JSON" ADD CONSTRAINT "SCHEDCONFIG_JSON_PK" PRIMARY KEY ("PANDA_QUEUE")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."SCHEDCONFIG_JSON" ADD CONSTRAINT schedconfig_data_validation check (data is JSON);

--------------------------------------------------------
--  Initialize schedconfig_json with a placeholder row to allow later procedures to infer part of the json structure and compile properly
--------------------------------------------------------
INSERT INTO "ATLAS_PANDA_TB".schedconfig_json (PANDA_QUEUE, data, last_update)
VALUES ('placeholder', '{"corepower": null}', sysdate);
commit;

--------------------------------------------------------
--  DDL for Table SITE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."SITE" 
   (	"SITE_NAME" VARCHAR2(52 BYTE), 
	"ROLE" VARCHAR2(256 BYTE), 
	"TIER_LEVEL" NUMBER(1,0), 
	"STATE" VARCHAR2(52 BYTE), 
	 CONSTRAINT "SITE_NAME_PK" PRIMARY KEY ("SITE_NAME") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

   COMMENT ON COLUMN "ATLAS_PANDA"."SITE"."SITE_NAME" IS 'Site name';
   COMMENT ON COLUMN "ATLAS_PANDA"."SITE"."ROLE" IS 'Role:nucleus/satelite. Nuclei can get tasks assigned and will be the final destination of the task output. Satelites will provide compute power to the task.';
   COMMENT ON COLUMN "ATLAS_PANDA"."SITE"."TIER_LEVEL" IS 'Tier level (0/1/2/3) of the site';
   COMMENT ON COLUMN "ATLAS_PANDA"."SITE"."STATE" IS 'Defines the state of a site';
   COMMENT ON TABLE "ATLAS_PANDA"."SITE"  IS 'AGIS site, containing DDM endpoints and PanDA sites. Table needed for the "Configurator" agent. The table consolidate information from other sources (AGIS and Rucio ) and caches it so that Panda can easily retrieve it and use it for brokerage.';

--------------------------------------------------------
--  DDL for Table SITE_STATS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."SITE_STATS" 
   (	"SITE_NAME" VARCHAR2(52 BYTE), 
	"KEY" VARCHAR2(52 BYTE), 
	"VALUE" NUMBER(11,0), 
	"TS" DATE, 
	 CONSTRAINT "SITE_STATS_PK" PRIMARY KEY ("SITE_NAME", "KEY") ENABLE
   ) ORGANIZATION INDEX COMPRESS 1 ;

   COMMENT ON COLUMN "ATLAS_PANDA"."SITE_STATS"."SITE_NAME" IS 'Site name';
   COMMENT ON COLUMN "ATLAS_PANDA"."SITE_STATS"."KEY" IS 'Metric key';
   COMMENT ON COLUMN "ATLAS_PANDA"."SITE_STATS"."VALUE" IS 'Metric value';
   COMMENT ON COLUMN "ATLAS_PANDA"."SITE_STATS"."TS" IS 'Timestamp for the entry';
   COMMENT ON TABLE "ATLAS_PANDA"."SITE_STATS"  IS 'Key-value table to hold metrics about a site';

--------------------------------------------------------
--  DDL for Table TABLEPART4COPYING
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."TABLEPART4COPYING" 
   (	"TABLE_NAME" VARCHAR2(30 BYTE), 
	"PARTITION_NAME" VARCHAR2(30 BYTE), 
	"COPIED_TO_ARCH" VARCHAR2(10 BYTE), 
	"COPYING_DONE_ON" DATE, 
	"DELETED_ON" DATE, 
	"DATA_VERIF_PASSED" CHAR(3 BYTE), 
	"DATA_VERIFIED_ON" DATE
   ) 
  PARTITION BY LIST ("COPIED_TO_ARCH") 
 (PARTITION "NOT_COPIED_PART"  VALUES ('N') , 
 PARTITION "COPIED_PART"  VALUES ('Y') , 
 PARTITION "NEVER4COPYING"  VALUES ('MUST NOT') )  ENABLE ROW MOVEMENT ;

   COMMENT ON COLUMN "ATLAS_PANDA"."TABLEPART4COPYING"."TABLE_NAME" IS 'The name of the table which data is considered for copying';
   COMMENT ON COLUMN "ATLAS_PANDA"."TABLEPART4COPYING"."PARTITION_NAME" IS 'The partition name of the table';
   COMMENT ON COLUMN "ATLAS_PANDA"."TABLEPART4COPYING"."COPIED_TO_ARCH" IS 'Flag identifying "Y" or "N" the partition data has been copied to ATLAS_PANDAARCH';
   COMMENT ON COLUMN "ATLAS_PANDA"."TABLEPART4COPYING"."COPYING_DONE_ON" IS 'Timestamp of the copying';
   COMMENT ON COLUMN "ATLAS_PANDA"."TABLEPART4COPYING"."DELETED_ON" IS 'Date of the partition deletion ';
   COMMENT ON COLUMN "ATLAS_PANDA"."TABLEPART4COPYING"."DATA_VERIF_PASSED" IS 'Data verification passed "YES" or "NO" (PANDAIDs comparison) before partition removal';
   COMMENT ON COLUMN "ATLAS_PANDA"."TABLEPART4COPYING"."DATA_VERIFIED_ON" IS 'Timestamp of the verification.';
   COMMENT ON TABLE "ATLAS_PANDA"."TABLEPART4COPYING"  IS 'Table for logging information on the process of data copying from the PANDA to PANDAARCH schema and logging on the partition removal for sustaining certain sliding window in the PANDA schema';

--------------------------------------------------------
--  DDL for Table TASKS_STATUSLOG
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."TASKS_STATUSLOG" 
   (	"JEDITASKID" NUMBER(11,0), 
	"MODIFICATIONTIME" TIMESTAMP (6), 
	"STATUS" VARCHAR2(64 BYTE), 
	"MODIFICATIONHOST" VARCHAR2(128 BYTE), 
	"ATTEMPTNR" NUMBER(3,0),
	"REASON" VARCHAR2(255 BYTE)
   ) 
  PARTITION BY RANGE ("MODIFICATIONTIME") INTERVAL (NUMTODSINTERVAL(1, 'DAY')) 
 (PARTITION "DATA_BEFORE_11032020"  VALUES LESS THAN (TIMESTAMP' 2020-03-11 00:00:00') ) ;

   COMMENT ON TABLE "ATLAS_PANDA"."TASKS_STATUSLOG"  IS 'Table to track status changes for tasks';

--------------------------------------------------------
--  DDL for Table TASK_ATTEMPTS
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."TASK_ATTEMPTS"
  (
    "JEDITASKID" NUMBER(11),
    "ATTEMPTNR" NUMBER(6),
    "STARTTIME" DATE,
    "ENDTIME" DATE,
    "STARTSTATUS" VARCHAR2(32),
    "ENDSTATUS" VARCHAR2(32),
    CONSTRAINT "TASK_ATTEMPTS_PK" PRIMARY KEY ("JEDITASKID", "ATTEMPTNR")
  )
  PARTITION BY RANGE ("STARTTIME") INTERVAL (NUMTODSINTERVAL(1, 'DAY'))
    (PARTITION "DATA_BEFORE_20220524" VALUES LESS THAN (TIMESTAMP '2022-05-24 00:00:00'))
  ;

COMMENT ON TABLE "ATLAS_PANDA"."TASK_ATTEMPTS" IS 'Table to track task resubmission attempts and their timings';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_ATTEMPTS"."JEDITASKID" IS 'JEDI task ID';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_ATTEMPTS"."ATTEMPTNR" IS 'Attempt number';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_ATTEMPTS"."STARTTIME" IS 'When the attempt started';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_ATTEMPTS"."ENDTIME" IS 'When the attempt finished';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_ATTEMPTS"."STARTSTATUS" IS 'Status before the resubmission';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_ATTEMPTS"."ENDSTATUS" IS 'Status at the end of the resubmission';

--------------------------------------------------------
--  DDL for Table JOB_OUTPUT_REPORT
--------------------------------------------------------
CREATE TABLE "ATLAS_PANDA"."JOB_OUTPUT_REPORT"
(
    "PANDAID" NUMBER(11) NOT NULL,
    "PRODSOURCELABEL" VARCHAR2(20),
    "JOBSTATUS" VARCHAR2(15) NOT NULL,
    "ATTEMPTNR" NUMBER(3) NOT NULL,
    "DATA" CLOB,
    "TIMESTAMP" DATE NOT NULL,
    "LOCKEDBY" VARCHAR2(40),
    "LOCKEDTIME" DATE,
    CONSTRAINT "JOB_OUTPUT_REPORT_PK" PRIMARY KEY("PANDAID", "ATTEMPTNR")
);

COMMENT ON TABLE "ATLAS_PANDA"."JOB_OUTPUT_REPORT" IS 'Table for parallel processing of the job output reports in Adder';

--------------------------------------------------------
--  DDL for Table TMP_PANDAIDS_RELATIONS
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."TMP_PANDAIDS_RELATIONS" 
   (	"PANDAID" NUMBER(11,0), 
	"NEWJOBID" NUMBER(11,0)
   ) ;
 --------------------------------------------------------
--  DDL for Table TOTAL_WALLTIME_CACHE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."TOTAL_WALLTIME_CACHE" 
   (	"VO" VARCHAR2(16 BYTE), 
	"AGG_TYPE" VARCHAR2(16 BYTE), 
	"AGG_KEY" VARCHAR2(32 BYTE), 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE), 
	"RESOURCE_TYPE" VARCHAR2(56 BYTE), 
	"TOTAL_WALLTIME" NUMBER(15,0), 
	"N_HAS_VALUE" NUMBER(6,0), 
	"N_NO_VALUE" NUMBER(6,0), 
	 CONSTRAINT "TOTAL_WALLTIME_CACHE_PK" PRIMARY KEY ("VO", "AGG_TYPE", "AGG_KEY", "PRODSOURCELABEL", "RESOURCE_TYPE") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

--------------------------------------------------------
--  DDL for Table TYPICAL_NUM_INPUT
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."TYPICAL_NUM_INPUT" 
   (	"VO" VARCHAR2(16 BYTE), 
	"AGG_TYPE" VARCHAR2(16 BYTE), 
	"AGG_KEY" VARCHAR2(32 BYTE), 
	"PRODSOURCELABEL" VARCHAR2(20 BYTE), 
	"PROCESSINGTYPE" VARCHAR2(64 BYTE), 
	"NINPUTDATAFILES" NUMBER(7,0), 
	 CONSTRAINT "TYPICAL_NUM_INPUT_PK" PRIMARY KEY ("VO", "AGG_TYPE", "AGG_KEY", "PRODSOURCELABEL", "PROCESSINGTYPE") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

   COMMENT ON TABLE "ATLAS_PANDA"."TYPICAL_NUM_INPUT"  IS 'Cache for queued walltime aggregations';


--------------------------------------------------------
--  DDL for Table PANDA_CACHE
--------------------------------------------------------

  CREATE TABLE "ATLAS_PANDA"."CACHE"
   (	"MAIN_KEY" VARCHAR2(56 BYTE),
    "SUB_KEY" VARCHAR2(56 BYTE),
	"DATA" CLOB,
	"LAST_UPDATE" DATE,
	CONSTRAINT "CACHE_PK" PRIMARY KEY ("MAIN_KEY", "SUB_KEY") ENABLE
   ) ORGANIZATION INDEX COMPRESS 1;

   COMMENT ON COLUMN "ATLAS_PANDA"."CACHE"."MAIN_KEY" IS 'Main key';
   COMMENT ON COLUMN "ATLAS_PANDA"."CACHE"."SUB_KEY" IS 'Sub key';
   COMMENT ON COLUMN "ATLAS_PANDA"."CACHE"."DATA" IS 'Information to cache';
   COMMENT ON COLUMN "ATLAS_PANDA"."CACHE"."LAST_UPDATE" IS 'Timestamp value was last updated';
   COMMENT ON TABLE "ATLAS_PANDA"."CACHE"  IS 'Table to store arbitrary CLOBs';

--------------------------------------------------------
--  DDL for Table PANDA_METRICS
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."METRICS"
  (
    "COMPUTINGSITE" VARCHAR2(128),
    "GSHARE" VARCHAR2(32),
    "METRIC" VARCHAR2(128),
    "VALUE_JSON" CLOB,
    "TIMESTAMP" DATE,
    CONSTRAINT ensure_json_metrics CHECK ("VALUE_JSON" IS JSON),
    CONSTRAINT METRICS_SITE_GSHARE_METRIC_UQ UNIQUE ("COMPUTINGSITE", "GSHARE", "METRIC")
  );

--------------------------------------------------------
--  DDL for Table TASK_EVALUATION
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."TASK_EVALUATION"
(
  "JEDITASKID" NUMBER(11) NOT NULL,
  "METRIC" VARCHAR2(128),
  "VALUE_JSON" CLOB,
  "TIMESTAMP" DATE,
  CONSTRAINT ensure_json_task_evaluation CHECK ("VALUE_JSON" IS JSON),
  CONSTRAINT TASK_EVALUATION_PK PRIMARY KEY("JEDITASKID", "METRIC")
);

COMMENT ON TABLE "ATLAS_PANDA"."TASK_EVALUATION"  IS 'Evaluation values for active user tasks used to improve analysis job brokerage';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_EVALUATION"."JEDITASKID" IS 'Task id';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_EVALUATION"."METRIC" IS 'Metric being stored';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_EVALUATION"."VALUE_JSON" IS 'Value in JSON format';
COMMENT ON COLUMN "ATLAS_PANDA"."TASK_EVALUATION"."TIMESTAMP" IS 'Timestamp when metric was generated';


--------------------------------------------------------
--  DDL for Table SECRETS
--------------------------------------------------------
CREATE TABLE "ATLAS_PANDA"."SECRETS"
   ( "OWNER" VARCHAR2(60) NOT NULL ENABLE,
     "UPDATED_AT" TIMESTAMP (6) NOT NULL ENABLE,
     "DATA" CLOB,
     PRIMARY KEY ("OWNER")
  );

--------------------------------------------------------
--  DDL for Table CARBON_REGION_EMISSIONS
--------------------------------------------------------
CREATE TABLE "ATLAS_PANDA"."CARBON_REGION_EMISSIONS"
   (
    "REGION" VARCHAR2(16 BYTE),
	"TIMESTAMP" DATE,
	"VALUE" NUMBER(10,0),
	CONSTRAINT "CARBON_REGION_EMISSIONS_PK" PRIMARY KEY ("REGION", "TIMESTAMP") ENABLE
   ) ORGANIZATION INDEX COMPRESS 1;

COMMENT ON TABLE "ATLAS_PANDA"."CARBON_REGION_EMISSIONS"  IS 'Table to store CO2 emission time series for a region or country';
COMMENT ON COLUMN "ATLAS_PANDA"."CARBON_REGION_EMISSIONS"."REGION" IS 'The name of the region. The region is usually a country, but can be more fine grained in large countries';
COMMENT ON COLUMN "ATLAS_PANDA"."CARBON_REGION_EMISSIONS"."TIMESTAMP" IS 'When the value was taken';
COMMENT ON COLUMN "ATLAS_PANDA"."CARBON_REGION_EMISSIONS"."VALUE" IS 'Emissions value in gCO2/kWh';

--------------------------------------------------------
--  DDL for Table SQL_QUEUE
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."SQL_QUEUE"
   (
    "TOPIC" VARCHAR2(50 BYTE),
    "PANDAID" NUMBER(11,0),
    "EXECUTION_ORDER" NUMBER(5,0),
    "JEDITASKID" NUMBER(11,0),
    "CREATIONTIME" DATE,
    "DATA" VARCHAR2(4000 BYTE),
    CONSTRAINT "SQL_QUEUE_PK" PRIMARY KEY ("TOPIC", "PANDAID", "EXECUTION_ORDER")
   );

CREATE INDEX "ATLAS_PANDA"."SQL_QUEUE_TOPIC_TASK_IDX" ON "ATLAS_PANDA"."SQL_QUEUE" ("TOPIC", "JEDITASKID");
CREATE INDEX "ATLAS_PANDA"."SQL_QUEUE_TOPIC_CREATIONTIME_IDX" ON "ATLAS_PANDA"."SQL_QUEUE" ("TOPIC", "CREATIONTIME");

COMMENT ON TABLE "ATLAS_PANDA"."SQL_QUEUE" IS 'Queue to send messages between agents';
COMMENT ON COLUMN "ATLAS_PANDA"."SQL_QUEUE"."TOPIC" IS 'Topic of the message';
COMMENT ON COLUMN "ATLAS_PANDA"."SQL_QUEUE"."PANDAID" IS 'Job ID';
COMMENT ON COLUMN "ATLAS_PANDA"."SQL_QUEUE"."EXECUTION_ORDER" IS 'In case multiple SQLs need to be executed together';
COMMENT ON COLUMN "ATLAS_PANDA"."SQL_QUEUE"."JEDITASKID" IS 'JEDI Task ID in case the messages want to be batched';
COMMENT ON COLUMN "ATLAS_PANDA"."SQL_QUEUE"."CREATIONTIME" IS 'Timestamp when the message was created';
COMMENT ON COLUMN "ATLAS_PANDA"."SQL_QUEUE"."DATA" IS 'CLOB in JSON format containing the SQL query and variables';


--------------------------------------------------------
--  DDL for Table DATA_CAROUSEL_REQUESTS
--------------------------------------------------------

TABLE "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS" (
    "REQUEST_ID" NUMBER NOT NULL,
    "DATASET" VARCHAR2(256 BYTE) NOT NULL,
    "SOURCE_RSE" VARCHAR2(64 BYTE),
    "DESTINATION_RSE" VARCHAR2(64 BYTE),
    "DDM_RULE_ID" VARCHAR2(64 BYTE),
    "STATUS" VARCHAR2(32 BYTE),
    "TOTAL_FILES" NUMBER(9,0),
    "STAGED_FILES" NUMBER(9,0),
    "DATASET_SIZE" NUMBER(18,0),
    "STAGED_SIZE" NUMBER(18,0),
    "CREATION_TIME" DATE,
    "START_TIME" DATE,
    "END_TIME" DATE,
    "MODIFICATION_TIME" DATE,
    "CHECK_TIME" DATE,
    CONSTRAINT "DATA_CAROU_REQ_PK" PRIMARY KEY ("REQUEST_ID") ENABLE
);

COMMENT ON TABLE "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS" IS 'Table of Data Carousel requests';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."REQUEST_ID" IS 'Sequential ID of the request, generated from Oracle sequence object ATLAS_PANDA.JEDI_DATA_CAROUSEL_REQUEST_ID_SEQ when new request is inserted';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."DATASET" IS 'Dataset to stage';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."SOURCE_RSE" IS 'Source RSE (usually tape) of staging';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."DESTINATION_RSE" IS 'Destination RSE (usually DATADISK) of staging';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."DDM_RULE_ID" IS 'DDM rule ID of the staging rule';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."STATUS" IS 'Status of the request';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."TOTAL_FILES" IS 'Number of total files of the dataset';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."STAGED_FILES" IS 'Number of files already staged';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."DATASET_SIZE" IS 'Size in bytes of the dataset';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."STAGED_SIZE" IS 'Size in bytes of files already staged';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."CREATION_TIME" IS 'Timestamp when the request is created';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."START_TIME" IS 'Timestamp when the request starts staging';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."END_TIME" IS 'Timestamp when the request ended';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."MODIFICATION_TIME" IS 'Timestamp of the last request update';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_REQUESTS"."CHECK_TIME" IS 'Last time when the request was checked';

--------------------------------------------------------
--  DDL for Table DATA_CAROUSEL_RELATIONS
--------------------------------------------------------

CREATE TABLE "ATLAS_PANDA"."DATA_CAROUSEL_RELATIONS" (
    "REQUEST_ID" NUMBER(12,0) NOT NULL,
    "TASK_ID" NUMBER(12,0) NOT NULL,
    CONSTRAINT "DATA_CAROU_REL_UC" UNIQUE ("REQUEST_ID", "TASK_ID") ENABLE
);

COMMENT ON TABLE "ATLAS_PANDA"."DATA_CAROUSEL_RELATIONS" IS 'Table of mapping between Data Carousel requests and tasks';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_RELATIONS"."REQUEST_ID" IS 'ID of the request';
COMMENT ON COLUMN "ATLAS_PANDA"."DATA_CAROUSEL_RELATIONS"."TASK_ID" IS 'ID of the task';


--------------------------------------------------------
--  DDL for Index JEDI_DATASETCONTENT_LFN_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASETCONTENT_LFN_IDX" ON "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ("LFN") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_STAT_LABEL_WGR_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_STAT_LABEL_WGR_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("JOBSTATUS", "PRODSOURCELABEL", "WORKINGGROUP") 
  ;
--------------------------------------------------------
--  DDL for Index PAN_DDM_REL_PANDASITENAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PAN_DDM_REL_PANDASITENAME_IDX" ON "ATLAS_PANDA"."PANDA_DDM_RELATION" ("PANDA_SITE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index FILESTABLE4_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."FILESTABLE4_PANDAID_IDX" ON "ATLAS_PANDA"."FILESTABLE4" ("PANDAID") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") ;
--------------------------------------------------------
--  DDL for Index JOBSWAITING4_PANDAID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JOBSWAITING4_PANDAID_PK" ON "ATLAS_PANDA"."JOBSWAITING4" ("PANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_WORK_QUEUEID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_WORK_QUEUEID_PK" ON "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_JEDITASKID_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JOBSACTIVE4_JEDITASKID_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("JEDITASKID", "PANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index DATASETS_NAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."DATASETS_NAME_IDX" ON "ATLAS_PANDA"."DATASETS" ("NAME") 
   LOCAL
 (PARTITION "DATASETS_BEFORE_01122011" ) ;

--------------------------------------------------------
--  DDL for Index JOBS_STATUSLOG_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBS_STATUSLOG_PANDAID_IDX" ON "ATLAS_PANDA"."JOBS_STATUSLOG" ("PANDAID") 
   LOCAL
 (PARTITION "DATA_BEFORE_01082012") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOBS_STATECHANGETIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBS_STATECHANGETIME_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("STATECHANGETIME") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOBSWAITING4_REQID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSWAITING4_REQID_IDX" ON "ATLAS_PANDA"."JOBSWAITING4" ("REQID") 
  ;
--------------------------------------------------------
--  DDL for Index PANDA_SITE_STORAGE_NAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PANDA_SITE_STORAGE_NAME_IDX" ON "ATLAS_PANDA"."PANDA_SITE" ("STORAGE_SITE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCHIVED4_REQID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCHIVED4_REQID_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("REQID") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSWAITING4_WORKQUEUE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSWAITING4_WORKQUEUE_IDX" ON "ATLAS_PANDA"."JOBSWAITING4" ("WORKQUEUE_ID", "CLOUD", "JOBSTATUS", "PRODSOURCELABEL", "CURRENTPRIORITY") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_PANDAID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JOBSDEFINED4_PANDAID_PK" ON "ATLAS_PANDA"."JOBSDEFINED4" ("PANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASET_CONTENTS_PID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASET_CONTENTS_PID_IDX" ON "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ("PANDAID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index PANDALOG_BINTIME_INDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PANDALOG_BINTIME_INDX" ON "ATLAS_PANDA"."PANDALOG" ("BINTIME", "TYPE") 
   LOCAL
 (PARTITION "DATASETS_BEFORE_24082012" ) COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOBSARC4_JEDITASKID3ATTR_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARC4_JEDITASKID3ATTR_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("JEDITASKID", "JOBSTATUS", "PRODSOURCELABEL", "PANDAID") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 3 ;

--------------------------------------------------------
--  DDL for Index JEDI_EVENTS_FILEID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_EVENTS_FILEID_IDX" ON "ATLAS_PANDA"."JEDI_EVENTS" ("FILEID") 
   LOCAL
 (PARTITION "JEDI_EVENTS_TASKSIDS_7400000" ) COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JEDI_TASKS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_TASKS_PK" ON "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") ;

--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_WORKQUEUE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_WORKQUEUE_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("WORKQUEUE_ID", "CLOUD", "JOBSTATUS", "PRODSOURCELABEL", "CURRENTPRIORITY") 
  ;
--------------------------------------------------------
--  DDL for Index DDM_ENDPOINT_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."DDM_ENDPOINT_NAME_PK" ON "ATLAS_PANDA"."DDM_ENDPOINT" ("DDM_ENDPOINT_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASETS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_DATASETS_PK" ON "ATLAS_PANDA"."JEDI_DATASETS" ("JEDITASKID", "DATASETID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JEDI_WORK_QUEUE_NAMETYPEVO_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_WORK_QUEUE_NAMETYPEVO_UK" ON "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_NAME", "QUEUE_TYPE", "VO") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_TASKS_MODIFTIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_MODIFTIME_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("MODIFICATIONTIME") 
  ;

--------------------------------------------------------
--  DDL for Index JEDI_TASKS_REALMODTIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_REALMODTIME_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("REALMODIFICATIONTIME")
  ;
--------------------------------------------------------
--  DDL for Index JEDI_WORK_QUEUE_QFUNC_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_WORK_QUEUE_QFUNC_IDX" ON "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_FUNCTION", "QUEUE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_TASKS_LOCKEDBY_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_LOCKEDBY_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("LOCKEDBY") 
  ;
--------------------------------------------------------
--  DDL for Index HARVESTER_REL_JOBS_WORKERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS_PK" ON "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" ("HARVESTERID", "WORKERID", "PANDAID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSARCH4_WORKGROUP_STATUS_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCH4_WORKGROUP_STATUS_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("WORKINGGROUP", "JOBSTATUS") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 2 ;

--------------------------------------------------------
--  DDL for Index HARVESTER_WORKERS_COMPSITE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARVESTER_WORKERS_COMPSITE_IDX" ON "ATLAS_PANDA"."HARVESTER_WORKERS" ("COMPUTINGSITE") 
   LOCAL
 (PARTITION "DATA_BEFORE_01032017" ) COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index DDM_ENDPOINT_SITE_NAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."DDM_ENDPOINT_SITE_NAME_IDX" ON "ATLAS_PANDA"."DDM_ENDPOINT" ("SITE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index DATASETS_MOVERID_INDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."DATASETS_MOVERID_INDX" ON "ATLAS_PANDA"."DATASETS" ("MOVERID") 
   LOCAL
 (PARTITION "DATASETS_BEFORE_01122011" ) COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_PRIOR_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_PRIOR_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("CURRENTPRIORITY", "PANDAID")
;
--------------------------------------------------------
--  DDL for Index HARV_WORKERS_SUBMITTIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARV_WORKERS_SUBMITTIME_IDX" ON "ATLAS_PANDA"."HARVESTER_WORKERS" ("SUBMITTIME") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_MODTIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_MODTIME_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("MODIFICATIONTIME") 
  ;
--------------------------------------------------------
--  DDL for Index PAN_DDM_REL_ENDPOINT_REL_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PAN_DDM_REL_ENDPOINT_REL_IDX" ON "ATLAS_PANDA"."PANDA_DDM_RELATION" ("DDM_ENDPOINT_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index JOBS_UPPER_PRODUSERNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBS_UPPER_PRODUSERNAME_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" (UPPER("PRODUSERNAME")) 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index FILESTABLE4_DESTDBLOCK_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."FILESTABLE4_DESTDBLOCK_IDX" ON "ATLAS_PANDA"."FILESTABLE4" ("DESTINATIONDBLOCK") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index HARVESTER_WORKERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARVESTER_WORKERS_PK" ON "ATLAS_PANDA"."HARVESTER_WORKERS" ("HARVESTERID", "WORKERID") 
  ;

--------------------------------------------------------
--  DDL for Index HARVESTER_WORKERS_STATUS_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARVESTER_WORKERS_STATUS_IDX" ON "ATLAS_PANDA"."HARVESTER_WORKERS" ("STATUS", "PILOTSTATUS")
  ;

--------------------------------------------------------
--  DDL for Index RETRYERRORS_RETRYACTION_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."RETRYERRORS_RETRYACTION_IDX" ON "ATLAS_PANDA"."RETRYERRORS" ("RETRYACTION") 
  ;

--------------------------------------------------------
--  DDL for Index TASK_STATUSLOG_JEDITASKID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."TASK_STATUSLOG_JEDITASKID_IDX" ON "ATLAS_PANDA"."TASKS_STATUSLOG" ("JEDITASKID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_JOB_RETRY_HIST_OLDPID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_JOB_RETRY_HIST_OLDPID_IDX" ON "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" ("OLDPANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index HARV_DIALOGS_HARV_DIAGID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARV_DIALOGS_HARV_DIAGID_IDX" ON "ATLAS_PANDA"."HARVESTER_DIALOGS" ("HARVESTER_ID", "DIAGID") 
   LOCAL
 (PARTITION "DATA_BEFORE_01032018" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_JEDITASKIDSTAT_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_JEDITASKIDSTAT_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("JEDITASKID", "JOBSTATUS") 
  ;
--------------------------------------------------------
--  DDL for Index JOBS_DESTINATIONDBLOCK_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBS_DESTINATIONDBLOCK_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("DESTINATIONDBLOCK") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_PRODDBLOCK_ST_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_PRODDBLOCK_ST_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("PRODDBLOCK", "JOBSTATUS") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_EVENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_EVENTS_PK" ON "ATLAS_PANDA"."JEDI_EVENTS" ("JEDITASKID", "PANDAID", "FILEID", "JOB_PROCESSID") 
   LOCAL
 (PARTITION "JEDI_EVENTS_TASKSIDS_7400000") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index HARVESTER_WORKER_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARVESTER_WORKER_STATS_PK" ON "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASET_LOCKEDBY_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASET_LOCKEDBY_IDX" ON "ATLAS_PANDA"."JEDI_DATASETS" ("LOCKEDBY") 
  ;
--------------------------------------------------------
--  DDL for Index SCHEDCONFIG_JSON_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."SCHEDCONFIG_JSON_PK" ON "ATLAS_PANDA"."SCHEDCONFIG_JSON" ("PANDA_QUEUE") 
  ;

--------------------------------------------------------
--  DDL for Index JOBSARCHIVED4_JOBDEFID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCHIVED4_JOBDEFID_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("JOBDEFINITIONID") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASET_DNAMETYPETID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASET_DNAMETYPETID_IDX" ON "ATLAS_PANDA"."JEDI_DATASETS" ("DATASETNAME", "TYPE", "JEDITASKID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index HARVESTER_COMMANDS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARVESTER_COMMANDS_PK" ON "ATLAS_PANDA"."HARVESTER_COMMANDS" ("COMMAND_ID") 
  ;

--------------------------------------------------------
--  DDL for Index JEDI_TASKS_STATUS3ATTR_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_STATUS3ATTR_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("STATUS", "WORKQUEUE_ID", "PRODSOURCELABEL", "JEDITASKID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 3 ;
--------------------------------------------------------
--  DDL for Index JOBSWAITING4_JOBEXECID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSWAITING4_JOBEXECID_IDX" ON "ATLAS_PANDA"."JOBSWAITING4" ("JOBEXECUTIONID") 
  ;
--------------------------------------------------------
--  DDL for Index PANDA_SITE_SITE_NAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PANDA_SITE_SITE_NAME_IDX" ON "ATLAS_PANDA"."PANDA_SITE" ("SITE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_TASKS_CREATION_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_CREATION_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("CREATIONDATE") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASETS_TASKID_TYPE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASETS_TASKID_TYPE_IDX" ON "ATLAS_PANDA"."JEDI_DATASETS" ("JEDITASKID", "TYPE") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_PRODUSERNAMEST_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_PRODUSERNAMEST_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("PRODUSERNAME", "JOBSTATUS") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSDEBUG_PANDAID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JOBSDEBUG_PANDAID_PK" ON "ATLAS_PANDA"."JOBSDEBUG" ("PANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_JOBSETID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEFINED4_JOBSETID_IDX" ON "ATLAS_PANDA"."JOBSDEFINED4" ("JOBSETID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_JOB_RETRY_HIST_ORIGID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_JOB_RETRY_HIST_ORIGID_IDX" ON "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" ("ORIGINPANDAID") 
   LOCAL
 (PARTITION "DATA_BEFORE_30012014" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE_STATECHANGETIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE_STATECHANGETIME_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("STATECHANGETIME") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSWAIT_STATECHANGETIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSWAIT_STATECHANGETIME_IDX" ON "ATLAS_PANDA"."JOBSWAITING4" ("STATECHANGETIME") 
  ;
--------------------------------------------------------
--  DDL for Index HARV_DIALOGS_MODULE_HARV_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARV_DIALOGS_MODULE_HARV_IDX" ON "ATLAS_PANDA"."HARVESTER_DIALOGS" ("MODULENAME", "HARVESTER_ID") 
   LOCAL
 (PARTITION "DATA_BEFORE_01032018" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_REQID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_REQID_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("REQID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASET_STATECHECKEXP_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASET_STATECHECKEXP_IDX" ON "ATLAS_PANDA"."JEDI_DATASETS" ("STATECHECKEXPIRATION") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCHIVED4_CHANGETIME
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCHIVED4_CHANGETIME" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("LOCKEDBY", "PRODSOURCELABEL", CASE  WHEN "STATECHANGETIME">"PRODDBUPDATETIME" THEN 1 ELSE NULL END ) 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index JEDI_UPPER_TASKS_NAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_UPPER_TASKS_NAME_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" (UPPER("TASKNAME")) 
  ;
--------------------------------------------------------
--  DDL for Index DATASETS_MODIFDATE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."DATASETS_MODIFDATE_IDX" ON "ATLAS_PANDA"."DATASETS" ("MODIFICATIONDATE") 
   LOCAL
 (PARTITION "DATASETS_BEFORE_01122011" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index HARV_WORKERS_LASTUPD_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARV_WORKERS_LASTUPD_IDX" ON "ATLAS_PANDA"."HARVESTER_WORKERS" ("LASTUPDATE") 
   LOCAL
 (PARTITION "DATA_BEFORE_01032017" ) ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_PANDAID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JOBSACTIVE4_PANDAID_PK" ON "ATLAS_PANDA"."JOBSACTIVE4" ("PANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_PROCESS_LOCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_PROCESS_LOCK_PK" ON "ATLAS_PANDA"."JEDI_PROCESS_LOCK" ("VO", "PRODSOURCELABEL", "WORKQUEUE_ID", "CLOUD") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_OUTPUTTEMPL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_OUTPUTTEMPL_PK" ON "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" ("JEDITASKID", "DATASETID", "OUTTEMPID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_PRODUSERNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEFINED4_PRODUSERNAME_IDX" ON "ATLAS_PANDA"."JOBSDEFINED4" ("PRODUSERNAME") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_JOB_RETRY_HISTORY_UQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY_UQ" ON "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" ("JEDITASKID", "NEWPANDAID", "OLDPANDAID", "ORIGINPANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index FILESTABLE4_TASKFILEID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."FILESTABLE4_TASKFILEID_IDX" ON "ATLAS_PANDA"."FILESTABLE4" ("JEDITASKID", "DATASETID", "FILEID") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index JOBSDEF_STATECHANGETIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEF_STATECHANGETIME_IDX" ON "ATLAS_PANDA"."JOBSDEFINED4" ("STATECHANGETIME") 
  ;
--------------------------------------------------------
--  DDL for Index HARVREL_JOBWORKERS_PANDAID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARVREL_JOBWORKERS_PANDAID_IDX" ON "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" ("PANDAID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index DATASETS_VUID_MODIFDATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."DATASETS_VUID_MODIFDATE_PK" ON "ATLAS_PANDA"."DATASETS" ("VUID", "MODIFICATIONDATE") 
   LOCAL
 (PARTITION "DATASETS_BEFORE_01122011" ) ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_CSITE_LABEL_PRIOR3
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_CSITE_LABEL_PRIOR3" ON "ATLAS_PANDA"."JOBSACTIVE4" ("COMPUTINGSITE", "PRODSOURCELABEL", "CURRENTPRIORITY", "JOBSTATUS", "MAXDISKCOUNT", "COMMANDTOPILOT") 
  ;
--------------------------------------------------------
--  DDL for Index PART_JOBPARAMSTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PART_JOBPARAMSTABLE_PK" ON "ATLAS_PANDA"."JOBPARAMSTABLE" ("PANDAID", "MODIFICATIONTIME") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") ;
--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_LABEL_CSITE_STAT
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEFINED4_LABEL_CSITE_STAT" ON "ATLAS_PANDA"."JOBSDEFINED4" ("PRODSOURCELABEL", "COMPUTINGSITE", "JOBSTATUS") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_TASKPARAMS_JEDITASKID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_TASKPARAMS_JEDITASKID_PK" ON "ATLAS_PANDA"."JEDI_TASKPARAMS" ("JEDITASKID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") ;

--------------------------------------------------------
--  DDL for Index JOBSARCH4_SPECIALHANDLING_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCH4_SPECIALHANDLING_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("SPECIALHANDLING") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index TYPICAL_NUM_INPUT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."TYPICAL_NUM_INPUT_PK" ON "ATLAS_PANDA"."TYPICAL_NUM_INPUT" ("VO", "AGG_TYPE", "AGG_KEY", "PRODSOURCELABEL", "PROCESSINGTYPE") 
  ;
--------------------------------------------------------
--  DDL for Index FILESTABLE4_DATASETYPE3COL_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."FILESTABLE4_DATASETYPE3COL_IDX" ON "ATLAS_PANDA"."FILESTABLE4" ("DATASET", "TYPE", "DESTINATIONDBLOCK", "STATUS", "PANDAID") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") COMPRESS 4 ;
--------------------------------------------------------
--  DDL for Index DATASETS_STAT_TYPE_MDATE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."DATASETS_STAT_TYPE_MDATE_IDX" ON "ATLAS_PANDA"."DATASETS" ("TYPE", "STATUS", "MODIFICATIONDATE", "SUBTYPE") 
   LOCAL
 (PARTITION "DATASETS_BEFORE_01122011" ) COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index PANDALOG_NAMETYPEBINTIME_INDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PANDALOG_NAMETYPEBINTIME_INDX" ON "ATLAS_PANDA"."PANDALOG" ("TYPE", "NAME", "BINTIME" DESC) 
   LOCAL
 (PARTITION "DATASETS_BEFORE_24082012" ) COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index JEDI_TASKS_PARENT_TID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_PARENT_TID_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("PARENT_TID") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_JOBPARAMSTEMPL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_JOBPARAMSTEMPL_PK" ON "ATLAS_PANDA"."JEDI_JOBPARAMS_TEMPLATE" ("JEDITASKID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") ;
--------------------------------------------------------
--  DDL for Index HARVESTER_COMMAND_LOCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK_PK" ON "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "COMMAND") 
  ;
--------------------------------------------------------
--  DDL for Index FILESTABLE4_LFN_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."FILESTABLE4_LFN_IDX" ON "ATLAS_PANDA"."FILESTABLE4" ("LFN") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") ;
--------------------------------------------------------
--  DDL for Index JOBS_SHARE_STATS_COMPSITE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBS_SHARE_STATS_COMPSITE_IDX" ON "ATLAS_PANDA"."JOBS_SHARE_STATS" ("COMPUTINGSITE") 
  ;

--------------------------------------------------------
--  DDL for Index JOBSDEF_SHARE_STATS_SITE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEF_SHARE_STATS_SITE_IDX" ON "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS" ("COMPUTINGSITE")
  ;

--------------------------------------------------------
--  DDL for Index JEDI_TASKS_NAMETASKID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_NAMETASKID_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("TASKNAME", "JEDITASKID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") ;
--------------------------------------------------------
--  DDL for Index SITE_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."SITE_STATS_PK" ON "ATLAS_PANDA"."SITE_STATS" ("SITE_NAME", "KEY") 
  ;
--------------------------------------------------------
--  DDL for Index PANDALOG_MULTICOLUMN_INDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PANDALOG_MULTICOLUMN_INDX" ON "ATLAS_PANDA"."PANDALOG" ("BINTIME", "NAME", "TYPE", "LEVELNAME") 
   LOCAL
 (PARTITION "DATASETS_BEFORE_24082012" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index PART_JOBSARCHIVED4_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PART_JOBSARCHIVED4_PK" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("PANDAID", "MODIFICATIONTIME") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") ;
--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_REQID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEFINED4_REQID_IDX" ON "ATLAS_PANDA"."JOBSDEFINED4" ("REQID") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCH4_MTIMEPRODSLABEL_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCH4_MTIMEPRODSLABEL_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("MODIFICATIONTIME", "PRODSOURCELABEL") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index HARVESTER_INSTANCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARVESTER_INSTANCES_PK" ON "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSWAITING4_JEDITASKID_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JOBSWAITING4_JEDITASKID_IDX" ON "ATLAS_PANDA"."JOBSWAITING4" ("JEDITASKID", "PANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCHIVED4_WORKQUEUE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCHIVED4_WORKQUEUE_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("WORKQUEUE_ID", "CLOUD", "JOBSTATUS", "PRODSOURCELABEL", "CURRENTPRIORITY") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 4 ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_COMPSITESTATUS_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_COMPSITESTATUS_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("COMPUTINGSITE", "JOBSTATUS") 
  ;
--------------------------------------------------------
--  DDL for Index HARVESTER_METRICS_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARVESTER_METRICS_IDX" ON "ATLAS_PANDA"."HARVESTER_METRICS" ("HARVESTER_ID", "CREATION_TIME", "HARVESTER_HOST") 
   LOCAL
 (PARTITION "DATA_BEFORE_01112018" ) COMPRESS 1 ;


--------------------------------------------------------
--  DDL for Index HARVESTER_METRICS_IHC_IDX
--------------------------------------------------------
CREATE INDEX "ATLAS_PANDA"."HARVESTER_METRICS_IHC_IDX" ON "ATLAS_PANDA"."HARVESTER_METRICS" ("HARVESTER_ID", "HARVESTER_HOST", "CREATION_TIME") LOCAL COMPRESS 1 ;


--------------------------------------------------------
--  DDL for Index JEDI_DATASET_CONTENTS_ID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASET_CONTENTS_ID_IDX" ON "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ("DATASETID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_JOBNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEFINED4_JOBNAME_IDX" ON "ATLAS_PANDA"."JOBSDEFINED4" ("JOBNAME") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCH4_TASKID_3ATTR_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCH4_TASKID_3ATTR_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("TASKID", "PRODSOURCELABEL", "JOBSTATUS", "PROCESSINGTYPE") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 3 ;
--------------------------------------------------------
--  DDL for Index SITE_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."SITE_NAME_PK" ON "ATLAS_PANDA"."SITE" ("SITE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCH4_PRODUSERNAMEST_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCH4_PRODUSERNAMEST_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("PRODUSERNAME", "JOBSTATUS") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASETS_DSETID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASETS_DSETID_IDX" ON "ATLAS_PANDA"."JEDI_DATASETS" ("DATASETID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASET_CONTAINERNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_DATASET_CONTAINERNAME_IDX" ON "ATLAS_PANDA"."JEDI_DATASETS" ("CONTAINERNAME") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index TABLEPART4COPYING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."TABLEPART4COPYING_PK" ON "ATLAS_PANDA"."TABLEPART4COPYING" ("TABLE_NAME", "PARTITION_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index RETRYERRORS_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."RETRYERRORS_ID" ON "ATLAS_PANDA"."RETRYERRORS" ("RETRYERROR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSSHARESTATS_GSHARESTATUSIDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSSHARESTATS_GSHARESTATUSIDX" ON "ATLAS_PANDA"."JOBS_SHARE_STATS" ("GSHARE", "JOBSTATUS") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSDEF_SHARE_STATS_SS_IDX
--------------------------------------------------------

CREATE INDEX "ATLAS_PANDA"."JOBSDEF_SHARE_STATS_SS_IDX" ON "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS" ("GSHARE", "JOBSTATUS") ;

--------------------------------------------------------
--  DDL for Index PANDA_DDM_RELATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PANDA_DDM_RELATION_PK" ON "ATLAS_PANDA"."PANDA_DDM_RELATION" ("PANDA_SITE_NAME", "DDM_ENDPOINT_NAME", "SCOPE") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCH4_PILOTERRCODE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCH4_PILOTERRCODE_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("PILOTERRORCODE") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index JOBSARCHIVED4_BATCHID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCHIVED4_BATCHID_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("BATCHID") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_JEDITASKID_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JOBSDEFINED4_JEDITASKID_IDX" ON "ATLAS_PANDA"."JOBSDEFINED4" ("JEDITASKID", "PANDAID") 
  ;
--------------------------------------------------------
--  DDL for Index RETRYACTIONS
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."RETRYACTIONS" ON "ATLAS_PANDA"."RETRYACTIONS" ("RETRYACTION_ID") 
  ;

--------------------------------------------------------
--  DDL for Index JEDI_TASKS_AMIFLAG_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_TASKS_AMIFLAG_IDX" ON "ATLAS_PANDA"."JEDI_TASKS" ("AMIFLAG") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSARCHIVED4_JOBSETID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCHIVED4_JOBSETID_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("JOBSETID") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index PANDA_SITE_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PANDA_SITE_NAME_PK" ON "ATLAS_PANDA"."PANDA_SITE" ("PANDA_SITE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index HARV_WORKERS_HARV_SUBMTIME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARV_WORKERS_HARV_SUBMTIME_IDX" ON "ATLAS_PANDA"."HARVESTER_WORKERS" ("HARVESTERID", "SUBMITTIME") 
   LOCAL
 (PARTITION "DATA_BEFORE_01032017" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index FILESTABLE4_DISPDBLOCK_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."FILESTABLE4_DISPDBLOCK_IDX" ON "ATLAS_PANDA"."FILESTABLE4" ("DISPATCHDBLOCK") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index RESOURCE_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."RESOURCE_TYPES_PK" ON "ATLAS_PANDA"."RESOURCE_TYPES" ("RESOURCE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index PART_FILESTABLE4_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PART_FILESTABLE4_PK" ON "ATLAS_PANDA"."FILESTABLE4" ("ROW_ID", "MODIFICATIONTIME") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") ;
--------------------------------------------------------
--  DDL for Index HARVERSTER_SLOTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARVERSTER_SLOTS_PK" ON "ATLAS_PANDA"."HARVESTER_SLOTS" ("PANDAQUEUENAME", "GSHARE", "RESOURCETYPE") 
  ;
--------------------------------------------------------
--  DDL for Index PART_METATABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PART_METATABLE_PK" ON "ATLAS_PANDA"."METATABLE" ("PANDAID", "MODIFICATIONTIME") 
   LOCAL
 (PARTITION "PART_INITIAL_01011970") ;

--------------------------------------------------------
--  DDL for Index JOBSARCHIVED4_JOBNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCHIVED4_JOBNAME_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("JOBNAME") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 1 ;

--------------------------------------------------------
--  DDL for Index HARV_WORKER_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."HARV_WORKER_STATS_PK" ON "ATLAS_PANDA"."HARVESTER_WORKER_STATS" ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "STATUS", "JOBTYPE") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_JOBNAME_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_JOBNAME_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("JOBNAME") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_EVENTS_PANDAID_STATUS_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_EVENTS_PANDAID_STATUS_IDX" ON "ATLAS_PANDA"."JEDI_EVENTS" ("PANDAID", "STATUS") 
   LOCAL
 (PARTITION "JEDI_EVENTS_TASKSIDS_7400000") COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index HARV_WORK_RELJOBS_LASTUPD_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."HARV_WORK_RELJOBS_LASTUPD_IDX" ON "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" ("LASTUPDATE") 
   LOCAL
 (PARTITION "INITIAL_PARTITION" ) COMPRESS 1 ;
--------------------------------------------------------
--  DDL for Index JEDI_EVENTS_FILE_NOTDEL_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JEDI_EVENTS_FILE_NOTDEL_IDX" ON "ATLAS_PANDA"."JEDI_EVENTS" ("FILE_NOT_DELETED") 
   LOCAL
 (PARTITION "JEDI_EVENTS_TASKSIDS_7400000") ;

--------------------------------------------------------
--  DDL for Index JOBSARCH4_COMPSITE_5ATTR_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSARCH4_COMPSITE_5ATTR_IDX" ON "ATLAS_PANDA"."JOBSARCHIVED4" ("COMPUTINGSITE", "CLOUD", "JOBSTATUS", "PRODSOURCELABEL", "PROCESSINGTYPE", "MODIFICATIONTIME") 
   LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020") COMPRESS 4 ;

--------------------------------------------------------
--  DDL for Index JOBSDEFINED4_WORKQUEUE_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSDEFINED4_WORKQUEUE_IDX" ON "ATLAS_PANDA"."JOBSDEFINED4" ("WORKQUEUE_ID", "CLOUD", "JOBSTATUS", "PRODSOURCELABEL", "CURRENTPRIORITY") 
  ;
--------------------------------------------------------
--  DDL for Index PANDA_SITE_DEF_ENDPOINT_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."PANDA_SITE_DEF_ENDPOINT_IDX" ON "ATLAS_PANDA"."PANDA_SITE" ("DEFAULT_DDM_ENDPOINT") 
  ;
--------------------------------------------------------
--  DDL for Index JOBSACTIVE4_JOBDEFID_IDX
--------------------------------------------------------

  CREATE INDEX "ATLAS_PANDA"."JOBSACTIVE4_JOBDEFID_IDX" ON "ATLAS_PANDA"."JOBSACTIVE4" ("JOBDEFINITIONID") 
  ;
--------------------------------------------------------
--  DDL for Index GLOBAL_SHARES_QUEUE_ID_UQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."GLOBAL_SHARES_QUEUE_ID_UQ" ON "ATLAS_PANDA"."GLOBAL_SHARES" ("QUEUE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SITES_MATRIX_KV_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."SITES_MATRIX_KV_DATA_PK" ON "ATLAS_PANDA"."NETWORK_MATRIX_KV" ("SRC", "DST", "KEY") 
  ;
--------------------------------------------------------
--  DDL for Index JEDI_DATASET_CONTENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATLAS_PANDA"."JEDI_DATASET_CONTENTS_PK" ON "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ("JEDITASKID", "DATASETID", "FILEID") 
   LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 2 ;
--------------------------------------------------------
--  DDL for Trigger GRANTS_UPDATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."GRANTS_UPDATE" AFTER CREATE on ATLAS_PANDA.schema
 WHEN (ora_dict_obj_type NOT IN ('SYNONYM', 'INDEX', 'SNAPSHOT', 'TRIGGER','DATABASE LINK') ) DECLARE
      PRAGMA AUTONOMOUS_TRANSACTION;
      -- jobid number:=0;
      job_name varchar2(200);
      stat varchar2(2000);
     BEGIN
         job_name:='grants_update_' || ora_dict_obj_name;
       	 stat:='ATLAS_PANDA.do_grants( '''||ora_dict_obj_type||''' , '''|| ora_dict_obj_name||''' ,''ATLAS_PANDA'');';
       	 DBMS_SCHEDULER.CREATE_JOB(
             job_name          => job_name,
             job_type          => 'PLSQL_BLOCK',
             job_action        => stat,
             start_date        => SYSDATE,
             enabled           => TRUE,
             auto_drop         => TRUE);
         -- dbms_job.submit(jobid,stat);
	 commit;
     END;
/
ALTER TRIGGER "ATLAS_PANDA"."GRANTS_UPDATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger JEDITASKID_AVOID_UPDATE_DELETE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."JEDITASKID_AVOID_UPDATE_DELETE" 
BEFORE UPDATE OR DELETE OF JEDITASKID on ATLAS_PANDA.JEDI_TASKS
  FOR EACH ROW
BEGIN
	IF (:OLD.jeditaskid <> :NEW.jeditaskid) THEN
	     raise_application_error(-20101,'Update or delete on the JEDITASKID column values is not allowed!');
	END IF;
END;
/
ALTER TRIGGER "ATLAS_PANDA"."JEDITASKID_AVOID_UPDATE_DELETE" ENABLE;

--------------------------------------------------------
-- Trigger to set JEDI_TASKS.REALMODIFICATIONTIME to current UTC timestamp
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."UPDATE_REALMODIFICATIONTIME"
BEFORE UPDATE OR INSERT OF MODIFICATIONTIME ON "ATLAS_PANDA"."JEDI_TASKS"
FOR EACH ROW
BEGIN
    :NEW."REALMODIFICATIONTIME" := SYS_EXTRACT_UTC(systimestamp);
END;
/
ALTER TRIGGER "ATLAS_PANDA"."UPDATE_REALMODIFICATIONTIME" ENABLE;

--------------------------------------------------------
--  DDL for Trigger JEDIWORKQUEUEID_AVOID_UPD_DEL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."JEDIWORKQUEUEID_AVOID_UPD_DEL" 
BEFORE UPDATE OR DELETE OF QUEUE_ID on ATLAS_PANDA.JEDI_WORK_QUEUE
  FOR EACH ROW
BEGIN
	IF (:OLD.QUEUE_ID <> :NEW.QUEUE_ID) THEN
	     raise_application_error(-20101,'Update or delete on the JEDI WORKQUEUE_ID column values is not allowed!');
	END IF;
END;
/
ALTER TRIGGER "ATLAS_PANDA"."JEDIWORKQUEUEID_AVOID_UPD_DEL" ENABLE;

--------------------------------------------------------
--  DDL for Function BITOR
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ATLAS_PANDA"."BITOR" ( P_BITS1 IN NATURAL, P_BITS2 IN NATURAL )
RETURN NATURAL
IS
BEGIN
        RETURN UTL_RAW.CAST_TO_BINARY_INTEGER(
                UTL_RAW.BIT_OR(
                        UTL_RAW.CAST_FROM_BINARY_INTEGER(P_BITS1),
                        UTL_RAW.CAST_FROM_BINARY_INTEGER(P_BITS2)
                )
        );
END;


/

--------------------------------------------------------
--  DDL for Trigger UPDATE_AMIFLAG_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."UPDATE_AMIFLAG_TRIG" 
BEFORE
UPDATE OF status, campaign, vo, reqid, prodsourcelabel
on
ATLAS_PANDA.JEDI_TASKS
  FOR EACH ROW
BEGIN

    -- 18th June 2018: combined BEFORE UPDATE trigger for five JEDI_TASKS columns
    IF ( :OLD.amiflag  IS NULL ) THEN
         :NEW.AMIFLAG := 1;
    ELSE
         :NEW.AMIFLAG := BITOR(:OLD.AMIFLAG,1);
    END IF;
END;
/
ALTER TRIGGER "ATLAS_PANDA"."UPDATE_AMIFLAG_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_AMIFLAG_ONCAMPAIGNCH_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."UPD_AMIFLAG_ONCAMPAIGNCH_TRIG" 
BEFORE UPDATE OF campaign on ATLAS_PANDA.JEDI_TASKS
FOR EACH ROW
BEGIN

  -- 11th June 2018: dedicated BEFORE UPDATE OF 'campaign'
  -- Not combined with other columns within the same trigger because of seen oddity with trigger not firing from time to time

	IF ( :OLD.amiflag IS NULL ) THEN
		:NEW.AMIFLAG := 1;
	ELSE
		:NEW.AMIFLAG := BITOR(:OLD.AMIFLAG,1);
	END IF;
END;
/
ALTER TRIGGER "ATLAS_PANDA"."UPD_AMIFLAG_ONCAMPAIGNCH_TRIG" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_AMIFLAG_ONSTATUSCH_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."UPD_AMIFLAG_ONSTATUSCH_TRIG" 
BEFORE UPDATE OF status on ATLAS_PANDA.JEDI_TASKS
 FOR EACH ROW
BEGIN

  -- 11th June 2018: dedicated BEFORE UPDATE OF 'status'
  -- Not combined with other columns within the same trigger because of seen oddity with trigger not firing from time to time and thus not updating the AMIFLAG value

   IF ( :OLD.amiflag  IS NULL ) THEN
        :NEW.AMIFLAG := 1;
   ELSE
        :NEW.AMIFLAG := BITOR(:OLD.AMIFLAG,1);
   END IF;
END;
/
ALTER TRIGGER "ATLAS_PANDA"."UPD_AMIFLAG_ONSTATUSCH_TRIG" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_AMIFLAG_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."UPD_AMIFLAG_TRIG" 
BEFORE
UPDATE OF vo
OR
UPDATE OF reqid
OR
UPDATE OF prodsourcelabel
on
ATLAS_PANDA.JEDI_TASKS

 FOR EACH ROW
BEGIN

  -- 11th June 2018: combined BEFORE UPDATE trigger for several columns

   IF ( :OLD.amiflag  IS NULL ) THEN
        :NEW.AMIFLAG := 1;
   ELSE
        :NEW.AMIFLAG := BITOR(:OLD.AMIFLAG,1);
   END IF;
END;
/
ALTER TRIGGER "ATLAS_PANDA"."UPD_AMIFLAG_TRIG" DISABLE;

--------------------------------------------------------
--  DDL for Trigger GLOBAL_SHARES_AUDIT_TRIGGER
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "ATLAS_PANDA"."GLOBAL_SHARES_AUDIT_TRIGGER"
AFTER INSERT OR UPDATE OR DELETE ON "ATLAS_PANDA"."GLOBAL_SHARES"
FOR EACH ROW
DECLARE
  v_operation VARCHAR2(10);
BEGIN
  -- Determine the operation type
  IF INSERTING THEN
    v_operation := 'INSERT';
  ELSIF UPDATING THEN
    v_operation := 'UPDATE';
  ELSIF DELETING THEN
    v_operation := 'DELETE';
  END IF;

  -- Insert a record into the audit table
  INSERT INTO "ATLAS_PANDA"."GLOBAL_SHARES_AUDIT"
  (
    "OPERATION",
    "USERNAME",
    "HOST",
    "IP_ADDRESS",
    "SESSIONID",
    "CLIENT_PROGRAM_NAME",
    "CURRENT_USER",
    "MODULE",
    "OS_USER",
    "SID",
    "NAME",
    "VALUE",
    "PARENT",
    "PRODSOURCELABEL",
    "WORKINGGROUP",
    "CAMPAIGN",
    "PROCESSINGTYPE",
    "VO",
    "QUEUE_ID",
    "THROTTLED",
    "TRANSPATH",
    "RTYPE"
  )
  VALUES
  (
    v_operation,
    SYS_CONTEXT('USERENV', 'SESSION_USER'),
    SYS_CONTEXT('USERENV', 'HOST'),
    SYS_CONTEXT('USERENV', 'IP_ADDRESS'),
    SYS_CONTEXT('USERENV', 'SESSIONID'),
    SYS_CONTEXT('USERENV', 'CLIENT_PROGRAM_NAME'),
    SYS_CONTEXT('USERENV', 'CURRENT_USER'),
    SYS_CONTEXT('USERENV', 'MODULE'),
    SYS_CONTEXT('USERENV', 'OS_USER'),
    SYS_CONTEXT('USERENV', 'SID'),
    NVL(:NEW."NAME", :OLD."NAME"),
    NVL(:NEW."VALUE", :OLD."VALUE"),
    NVL(:NEW."PARENT", :OLD."PARENT"),
    NVL(:NEW."PRODSOURCELABEL", :OLD."PRODSOURCELABEL"),
    NVL(:NEW."WORKINGGROUP", :OLD."WORKINGGROUP"),
    NVL(:NEW."CAMPAIGN", :OLD."CAMPAIGN"),
    NVL(:NEW."PROCESSINGTYPE", :OLD."PROCESSINGTYPE"),
    NVL(:NEW."VO", :OLD."VO"),
    NVL(:NEW."QUEUE_ID", :OLD."QUEUE_ID"),
    NVL(:NEW."THROTTLED", :OLD."THROTTLED"),
    NVL(:NEW."TRANSPATH", :OLD."TRANSPATH"),
    NVL(:NEW."RTYPE", :OLD."RTYPE")
  );
END;
/
ALTER TRIGGER "ATLAS_PANDA"."GLOBAL_SHARES_AUDIT_TRIGGER" ENABLE;


--------------------------------------------------------
--  DDL for Procedure ADD_DAILYPART
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."ADD_DAILYPART" (period_days NUMBER, n_table VARCHAR2, tablespace_name VARCHAR2)
AS
-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);

i NUMBER;
j NUMBER;
days_plus NUMBER;
stmt VARCHAR2(1000);
top_value_long LONG;
top_value_string VARCHAR2(100);
part_boundary VARCHAR2(100);
part_name VARCHAR2(30);
fullq_name VARCHAR2(100);

BEGIN

 -- ver 1.1, last update 2th July 2013

DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Create new partitions');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );


-- the DBMS_ASSERT.SQL_OBJECT_NAME function checks that the input string represents an existing object
-- The "ORA-44002: invalid object name" exception is raised when the input string does not match an existing object name
SELECT DBMS_ASSERT.SQL_OBJECT_NAME( sys_context('USERENV', 'CURRENT_SCHEMA') || '.' || UPPER(n_table) ) into fullq_name FROM DUAL;



  i:= 0;
  days_plus := 0;

	-- get the top partition boundary
	SELECT high_value INTO top_value_long FROM
	(
	SELECT high_value FROM user_tab_partitions WHERE table_name = UPPER(n_table) ORDER BY PARTITION_POSITION desc
	)
	WHERE ROWNUM = 1;

	top_value_string := SUBSTR(top_value_long, 11, 19);

	FOR j in 1..period_days LOOP

 		part_boundary := to_char(TO_TIMESTAMP(top_value_string ,'YYYY-MM-DD HH24:MI:SS') + j, 'YYYY-MM-DD HH24:MI:SS') ;
 		part_boundary := 'TIMESTAMP '' ' || part_boundary || '''';

	      	days_plus := days_plus + 1;
		part_name :=  'PART_'|| n_table ||'_' || to_char(TO_TIMESTAMP(top_value_string ,'YYYY-MM-DD HH24:MI:SS') + days_plus, 'DDMMYYYY');

		stmt:= 'ALTER TABLE '|| n_table ||' ADD PARTITION '|| part_name || ' VALUES LESS THAN ('|| part_boundary ||') TABLESPACE ' || tablespace_name  ;

		--DBMS_OUTPUT.PUT_LINE(stmt);

		-- loop until succeeds
		LOOP
		   BEGIN
			-- create the new partition
			execute immediate stmt;

			-- insert into the logging table , info on the newly created partition.
			INSERT INTO tablepart4copying(table_name, partition_name, copied_to_arch)
			VALUES (n_table, part_name, 'N');

		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN  DBMS_LOCK.sleep(1);
		   END;
		END LOOP;

	END LOOP;

	-- because of the last insert
	commit;


DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

END;

/

 --------------------------------------------------------
--  DDL for Procedure BULKCOPY_PANDA_PARTITIONS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."BULKCOPY_PANDA_PARTITIONS" (dest_schema VARCHAR2) AUTHID CURRENT_USER
AS

stmt VARCHAR2(4000);
part_name VARCHAR2(30);
days_diff NUMBER(3);
n NUMBER(3);
valschema_name VARCHAR2(30);


BEGIN

-- Ver 2.14: 21st May 2024
-- Added column OUTPUTFILETYPE to the JOBS tables

-- Ver 2.13: 28th Mar 2023
-- Added column CPU_ARCHITECTURE_LEVEL to the JOBS tables

-- Ver 2.12: 20th Feb 2023
-- Added column GCO2_REGIONAL and GCO2_GLOBAL to the JOBS tables

-- Ver 2.11: 28th September 2020
-- Added column meanCoreCount to the JOBS tables

-- Ver 2.10: 28th April 2020
-- Added column job_label to the JOBS/TASK tables

-- Ver 2.9: 17th Mar 2019  
-- Added column CONTAINER_NAME to the JOBS tables 

-- Ver 2.8: 25th Nov 2019  
-- Added column MEMORY_LEAK_X2 to the JOBS tables 

-- Ver 2.7: 4th Nov 2019  
-- Removed the insertion in the PANDAIDS_MODIFTIME table command 

-- Ver 2.6: 10th April 2019  
-- Added column MEMORY_LEAK to the JOBS tables 

-- Ver 2.5: 20th March 2018  
-- Added column DISKIO to the JOBS tables 

-- Ver 2.4: 18th April 2017 
-- Added column RESOURCE_TYPE to the JOBS tables 

-- Ver 2.3: 2nd Feb 2017
-- Added columns totRCHAR, totWCHAR, totRBYTES, totWBYTES, rateRCHAR, rateWCHAR, rateRBYTES, rateWBYTES to the JOBS tables

-- Ver 2.2: 1st Nov 2016
-- Added column HS06 to the JOBS tables


-- Ver 2.1: 24th May 2016
-- Added two columns to the JOBS tables: FAILEDATTEMPT and HS06SEC


-- Update: 29th April 2016
-- Moved the insertion into the JOBSARCHIVED table at the end of the transaction because it was causing row lock contention when PanDA server
-- performs updates on the rows

-- Update: 4th Feb 2016
-- Added two columns to the JOBS tables: NUCLEUS and EVENTSERVICE

-- 18th June 2015: added 9 additional columns to the JOB tables (MAXRSS, MAXVMEM, MAXSWAP, MAXPSS, AVGRSS, AVGVMEM, AVGSWAP, AVGPSS, MAXWALLTIME)


-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Copy data from PanDA to PanDAARCH!');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

-- checks that the input string represents an existing schema name
-- "ORA-44001: invalid schema" exception is raised when the input string does not match an existing schema name.
SELECT DBMS_ASSERT.schema_name(UPPER(dest_schema)) INTO valschema_name FROM dual;



SELECT TO_NUMBER(TRUNC(sysdate - MIN(to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY'))) ) INTO days_diff
FROM tablepart4copying WHERE copied_to_arch = 'N';

-- DBMS_OUTPUT.put_line(to_char(days_diff));

-- do NOT copy partitions that are from the current and last day
IF (days_diff < 1) THEN
return;
END IF;


-- for all partitions that have not been copied.
-- Usually it must be only one per day, but there might be cases when the copying has to compensate some lag of days

FOR n IN 1..days_diff LOOP


-- the METATABLE data

SELECT PARTITION_NAME into part_name FROM
tablepart4copying
WHERE table_name = 'METATABLE'
AND
to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY') =
(select MIN(to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY')) FROM tablepart4copying WHERE copied_to_arch = 'N');


stmt:= 'INSERT /*+ append */ INTO '|| dest_schema ||'.metaTable_ARCH
(PANDAID,
MODIFICATIONTIME,
METADATA
)
SELECT
PANDAID,
MODIFICATIONTIME,
METADATA
FROM metaTable PARTITION('|| part_name ||')';

EXECUTE IMMEDIATE stmt;


-- put the logging info
UPDATE tablepart4copying SET copied_to_arch = 'Y' , copying_done_on = sysdate WHERE table_name = 'METATABLE' and partition_name = part_name AND copied_to_arch = 'N';


-- the PARAMSTABLE data

SELECT PARTITION_NAME into part_name
FROM tablepart4copying
WHERE table_name = 'JOBPARAMSTABLE'
AND
to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY') =
(select MIN(to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY')) FROM tablepart4copying WHERE copied_to_arch = 'N');


stmt:= 'INSERT /*+ append */ INTO '|| dest_schema ||'.jobParamsTable_ARCH
(
PANDAID,
MODIFICATIONTIME,
JOBPARAMETERS
)
SELECT
PANDAID,
MODIFICATIONTIME,
JOBPARAMETERS
FROM jobParamsTable PARTITION('|| part_name ||')';

EXECUTE IMMEDIATE stmt;


-- put the logging info
UPDATE tablepart4copying SET copied_to_arch = 'Y' , copying_done_on = sysdate WHERE table_name = 'JOBPARAMSTABLE' and partition_name = part_name AND copied_to_arch = 'N';


-- The FILES table

SELECT PARTITION_NAME into part_name
FROM tablepart4copying
WHERE table_name = 'FILESTABLE4'
AND
to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY') =
(select MIN(to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY')) FROM tablepart4copying WHERE copied_to_arch = 'N');


stmt:= 'INSERT /*+ append */ INTO '|| dest_schema ||'.filesTable_ARCH
(DESTINATIONSE,
FSIZE,
MD5SUM,
CHECKSUM,
ROW_ID,
PANDAID,
MODIFICATIONTIME,
GUID,
LFN,
"TYPE",
DATASET,
STATUS,
PRODDBLOCK,
PRODDBLOCKTOKEN,
DISPATCHDBLOCK,
DISPATCHDBLOCKTOKEN,
DESTINATIONDBLOCK,
DESTINATIONDBLOCKTOKEN,
SCOPE,
JEDITASKID,
DATASETID,
FILEID,
ATTEMPTNR
)
SELECT
DESTINATIONSE,
FSIZE,
MD5SUM,
CHECKSUM,
ROW_ID,
PANDAID,
MODIFICATIONTIME,
GUID,
LFN,
"TYPE",
DATASET,
STATUS,
PRODDBLOCK,
PRODDBLOCKTOKEN,
DISPATCHDBLOCK,
DISPATCHDBLOCKTOKEN,
DESTINATIONDBLOCK,
DESTINATIONDBLOCKTOKEN,
SCOPE,
JEDITASKID,
DATASETID,
FILEID,
ATTEMPTNR
FROM filesTable4 PARTITION('|| part_name ||')';


EXECUTE IMMEDIATE stmt;

-- put the logging info
UPDATE tablepart4copying SET copied_to_arch = 'Y' , copying_done_on = sysdate WHERE table_name = 'FILESTABLE4' and partition_name = part_name AND copied_to_arch = 'N';



-- the JOBSARCHIVED table

SELECT PARTITION_NAME into part_name FROM tablepart4copying
WHERE table_name = 'JOBSARCHIVED4'
AND
to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY') =
(select MIN(to_DATE(SUBSTR(partition_name, -8), 'DDMMYYYY')) FROM tablepart4copying WHERE copied_to_arch = 'N');

	-- DBMS_OUTPUT.put_line(part_name);


stmt := 'INSERT /*+ append*/ INTO ' || dest_schema ||'.jobsArchived
(SPECIALHANDLING,
JOBSETID,
CORECOUNT,
BATCHID,
PARENTID,
MAXCPUCOUNT,
MAXCPUUNIT,
MAXDISKCOUNT,
MAXDISKUNIT,
IPCONNECTIVITY,
MINRAMCOUNT,
MINRAMUNIT,
STARTTIME,
ENDTIME,
CPUCONSUMPTIONTIME,
CPUCONSUMPTIONUNIT,
COMMANDTOPILOT,
TRANSEXITCODE,
PILOTERRORCODE,
PILOTERRORDIAG,
EXEERRORCODE,
EXEERRORDIAG,
SUPERRORCODE,
SUPERRORDIAG,
DDMERRORCODE,
DDMERRORDIAG,
BROKERAGEERRORCODE,
BROKERAGEERRORDIAG,
JOBDISPATCHERERRORCODE,
JOBDISPATCHERERRORDIAG,
TASKBUFFERERRORCODE,
TASKBUFFERERRORDIAG,
COMPUTINGSITE,
COMPUTINGELEMENT,
JOBPARAMETERS,
METADATA,
PRODDBLOCK,
DISPATCHDBLOCK,
DESTINATIONDBLOCK,
DESTINATIONSE,
NEVENTS,
GRID,
CLOUD,
CPUCONVERSION,
SOURCESITE,
DESTINATIONSITE,
TRANSFERTYPE,
TASKID,
CMTCONFIG,
STATECHANGETIME,
PRODDBUPDATETIME,
LOCKEDBY,
RELOCATIONFLAG,
JOBEXECUTIONID,
VO,
PILOTTIMING,
WORKINGGROUP,
PROCESSINGTYPE,
PRODUSERNAME,
NINPUTFILES,
COUNTRYGROUP,
PANDAID,
JOBDEFINITIONID,
SCHEDULERID,
PILOTID,
CREATIONTIME,
CREATIONHOST,
MODIFICATIONTIME,
MODIFICATIONHOST,
ATLASRELEASE,
TRANSFORMATION,
HOMEPACKAGE,
PRODSERIESLABEL,
PRODSOURCELABEL,
PRODUSERID,
ASSIGNEDPRIORITY,
CURRENTPRIORITY,
ATTEMPTNR,
MAXATTEMPT,
JOBSTATUS,
JOBNAME,
NINPUTDATAFILES,
INPUTFILETYPE,
INPUTFILEPROJECT,
INPUTFILEBYTES,
NOUTPUTDATAFILES,
OUTPUTFILEBYTES,
JOBMETRICS,
WORKQUEUE_ID,
JEDITASKID,
JOBSUBSTATUS,
ACTUALCORECOUNT,
REQID,
MAXRSS,
MAXVMEM,
MAXSWAP,
MAXPSS,
AVGRSS,
AVGVMEM,
AVGSWAP,
AVGPSS,
MAXWALLTIME,
NUCLEUS,
EVENTSERVICE,
FAILEDATTEMPT,
HS06SEC,
GSHARE,
HS06,
TOTRCHAR,
TOTWCHAR,
TOTRBYTES,
TOTWBYTES,
RATERCHAR,
RATEWCHAR,
RATERBYTES,
RATEWBYTES,
RESOURCE_TYPE, 
DISKIO, 
MEMORY_LEAK,
MEMORY_LEAK_X2,
CONTAINER_NAME,
JOB_LABEL,
MEANCORECOUNT,
GCO2_REGIONAL,
GCO2_GLOBAL,
CPU_ARCHITECTURE_LEVEL,
OUTPUTFILETYPE)
(SELECT
SPECIALHANDLING,
JOBSETID,
CORECOUNT,
BATCHID,
PARENTID,
MAXCPUCOUNT,
MAXCPUUNIT,
MAXDISKCOUNT,
MAXDISKUNIT,
IPCONNECTIVITY,
MINRAMCOUNT,
MINRAMUNIT,
STARTTIME,
ENDTIME,
CPUCONSUMPTIONTIME,
CPUCONSUMPTIONUNIT,
COMMANDTOPILOT,
TRANSEXITCODE,
PILOTERRORCODE,
PILOTERRORDIAG,
EXEERRORCODE,
EXEERRORDIAG,
SUPERRORCODE,
SUPERRORDIAG,
DDMERRORCODE,
DDMERRORDIAG,
BROKERAGEERRORCODE,
BROKERAGEERRORDIAG,
JOBDISPATCHERERRORCODE,
JOBDISPATCHERERRORDIAG,
TASKBUFFERERRORCODE,
TASKBUFFERERRORDIAG,
COMPUTINGSITE,
COMPUTINGELEMENT,
JOBPARAMETERS,
METADATA,
PRODDBLOCK,
DISPATCHDBLOCK,
DESTINATIONDBLOCK,
DESTINATIONSE,
NEVENTS,
GRID,
CLOUD,
CPUCONVERSION,
SOURCESITE,
DESTINATIONSITE,
TRANSFERTYPE,
TASKID,
CMTCONFIG,
STATECHANGETIME,
PRODDBUPDATETIME,
LOCKEDBY,
RELOCATIONFLAG,
JOBEXECUTIONID,
VO,
PILOTTIMING,
WORKINGGROUP,
PROCESSINGTYPE,
PRODUSERNAME,
NINPUTFILES,
COUNTRYGROUP,
PANDAID,
JOBDEFINITIONID,
SCHEDULERID,
PILOTID,
CREATIONTIME,
CREATIONHOST,
MODIFICATIONTIME,
MODIFICATIONHOST,
ATLASRELEASE,
TRANSFORMATION,
HOMEPACKAGE,
PRODSERIESLABEL,
PRODSOURCELABEL,
PRODUSERID,
ASSIGNEDPRIORITY,
CURRENTPRIORITY,
ATTEMPTNR,
MAXATTEMPT,
JOBSTATUS,
JOBNAME,
NINPUTDATAFILES,
INPUTFILETYPE,
INPUTFILEPROJECT,
INPUTFILEBYTES,
NOUTPUTDATAFILES,
OUTPUTFILEBYTES,
JOBMETRICS,
WORKQUEUE_ID,
JEDITASKID,
JOBSUBSTATUS,
ACTUALCORECOUNT,
REQID,
MAXRSS,
MAXVMEM,
MAXSWAP,
MAXPSS,
AVGRSS,
AVGVMEM,
AVGSWAP,
AVGPSS,
MAXWALLTIME,
NUCLEUS,
EVENTSERVICE,
FAILEDATTEMPT,
HS06SEC,
GSHARE,
HS06,
TOTRCHAR,
TOTWCHAR,
TOTRBYTES,
TOTWBYTES,
RATERCHAR,
RATEWCHAR,
RATERBYTES,
RATEWBYTES, 
RESOURCE_TYPE, 
DISKIO, 
MEMORY_LEAK,
MEMORY_LEAK_X2,
CONTAINER_NAME,
JOB_LABEL,
MEANCORECOUNT,
GCO2_REGIONAL,
GCO2_GLOBAL,
CPU_ARCHITECTURE_LEVEL,
OUTPUTFILETYPE
FROM jobsArchived4 PARTITION (' || part_name || ')
)';


EXECUTE IMMEDIATE stmt;


--DBMS_OUTPUT.put_line(stmt);

-- put the logging info
UPDATE tablepart4copying SET copied_to_arch = 'Y' , copying_done_on = sysdate WHERE table_name = 'JOBSARCHIVED4' and partition_name = part_name AND copied_to_arch = 'N';



-- 15th August 2019: might be NOT needed any more as SQL depending on it is not found(!)
-- 19th Feb 2013: Insert PANDAIDs and their MODIFICATIONTIMEs into the auxiliary IOT table PANDAIDS_MODIFTIME
-- in case of any errors like constraint violation, then the errors will be logged into the ERRLOG_PANDAIDS_MODIFTIME table

-- 4th Nov 2019: commented out as considered "not necessary in BigPanDAMon" 
/*
stmt := 'INSERT INTO '|| dest_schema ||'.PANDAIDS_MODIFTIME
SELECT PANDAID, MODIFICATIONTIME
FROM jobsArchived4 PARTITION (' || part_name || ')
LOG ERRORS INTO '|| dest_schema || '.PANDAIDS_MODIFTIME_ERRLOG REJECT LIMIT UNLIMITED';

EXECUTE IMMEDIATE stmt;
*/

COMMIT;

END LOOP;


-- commented out because otherwise the rollback is executed silently and the ORA error is not returned to the user
--EXCEPTION
-- WHEN OTHERS THEN
--	ROLLBACK;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

END;

/



--------------------------------------------------------
--  DDL for Procedure DATASETS_90DAYS_SL_WINDOW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."DATASETS_90DAYS_SL_WINDOW" (DAYS_OFFSET NUMBER default 93) AUTHID DEFINER
AS
-- Procedure for sustaining 90 days sliding window in the PANDA.DATASETS table which has automatic INTERVAL partitioning NUMTOYMINTERVAL(1,'MONTH')
-- 93 days to be more secure as some for some sequential months we have 31 days

-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);

stmt VARCHAR2(4000);
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_parts part_names;
messg VARCHAR2(10);

BEGIN

-- ver 1.2, last update 2th July 2013

-- Note: Oracle does NOT allow dropping of the last remaining non-interval partition (ORA-14758)! That is why is better to have INTERVAL = 'YES' condition in the WHERE clause
-- get the older than the last 4 partitions (months)

SELECT partition_name BULK COLLECT INTO coll_parts
FROM USER_TAB_PARTITIONS
WHERE table_name = 'DATASETS'
AND INTERVAL = 'YES' AND partition_position <= (SELECT MAX(partition_position) - 4 FROM USER_TAB_PARTITIONS
WHERE table_name = 'DATASETS' );

-- do NOT drop partitions that are within 3 months from now. In that case exit the procedure
IF (coll_parts.COUNT <= 0) THEN
	stmt:= 'USER DEFINED INFO: There are NOT partitions with data older than ' || to_char(DAYS_OFFSET) || ' days for drop!';
	-- this RAISE call is commented out as the procedure will be called from within a scheduler job monthly and would be not good to be shown error on the shifters page
	-- RAISE_APPLICATION_ERROR(-20101, stmt );
	return;
END IF;


-- Verification and partition drop part --

FOR j IN 1 .. coll_parts.COUNT LOOP

	-- for each older than the last 4 partitions check whether the MAX(modificationdate) is smaller than DAYS_OFFSET (default 93) days
	stmt := 'SELECT (CASE WHEN MAX(modificationdate) < (SYSDATE - ' || to_char(DAYS_OFFSET) || ') THEN ''OK'' ELSE ''NOT OK'' END ) FROM DATASETS PARTITION ( ' || coll_parts(j) || ')' ;
	EXECUTE IMMEDIATE stmt INTO messg;

	IF (messg = 'OK') THEN
		stmt := 'ALTER TABLE DATASETS DROP PARTITION ' || coll_parts(j) ;

		-- loop until gets exclusive lock on the table
		LOOP
		   BEGIN
			EXECUTE IMMEDIATE stmt;
		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN DBMS_LOCK.sleep(1);
		   END;
		END LOOP;
	END IF;

END LOOP;

END DATASETS_90days_sl_window;

/



--------------------------------------------------------
--  DDL for Procedure DELETE_JEDI_EVENTS_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."DELETE_JEDI_EVENTS_PROC" AS 
  rows_cnt number;
  taskid_cnt number;
  --row_sum number := 0;
  --part_cnt number := 1;
BEGIN
  execute immediate 'alter session set ddl_lock_timeout=30';

  for p in (select PARTITION_NAME from user_tab_partitions where table_name = 'JEDI_EVENTS') loop
  
    execute immediate 'SELECT COUNT(*) FROM ATLAS_PANDA.JEDI_Events PARTITION ('||p.PARTITION_NAME||')' into rows_cnt;
  
    execute immediate 'SELECT COUNT(*) 
                      FROM ATLAS_PANDA.JEDI_Tasks t 
                      JOIN ATLAS_PANDA.JEDI_Events PARTITION ('||p.PARTITION_NAME||') e 
                      ON (t.JEDITASKID = e.JEDITASKID)
                      WHERE t.STATUS IN (''done'', ''finished'', ''aborted'', ''failed'', ''broken'') 
                      AND t.MODIFICATIONTIME < sysdate - 90' into taskid_cnt;
      
    if (rows_cnt = taskid_cnt and rows_cnt <> 0) then
      --dbms_output.put_line('ALTER TABLE ATLAS_PANDA.JEDI_Events DROP PARTITION '||p.PARTITION_NAME||' update global indexes;');
      execute immediate 'ALTER TABLE ATLAS_PANDA.JEDI_Events DROP PARTITION '||p.PARTITION_NAME;
      --dbms_output.put_line(part_cnt||' '||p.PARTITION_NAME||' >>> '||rows_cnt);
      --row_sum := row_sum + taskid_cnt;
      --part_cnt := part_cnt + 1;
    end if;    
    
  end loop;
  --dbms_output.put_line(row_sum);
END DELETE_JEDI_EVENTS_PROC;

/
--------------------------------------------------------
--  DDL for Procedure DO_GRANTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."DO_GRANTS" (obj_type varchar2, obj_name varchar2, owner_name varchar2)
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN

	 -- need to put " " around the object names, because some users create the objects with preserved character case.
	IF (obj_name NOT IN ('DO_GRANTS','GRANTS_UPDATE','CREATE_SYN4EXIST_OBJ') AND substr(obj_name,1,4)<>'BIN$' AND substr(obj_name,1,4)<>'SYS_') THEN

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

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."GRANT_PRIVS4EXIST_OBJ" (owner_name varchar2 ) AUTHID DEFINER
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN
 -- need to put " " around the object names, because some users create the objects with preserved character case.
	-- IMPORTANT - GRANT OBJECT PRIVILEGES FIRST TO THE TABLES
	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDA' AND object_type = 'TABLE' AND substr(object_name,1,4)<>'BIN$' AND  substr(object_name,1,4)<>'SYS_') LOOP
       	 	execute immediate 'GRANT SELECT,INSERT,UPDATE,DELETE on "'||rec.obj_name||'" to ATLAS_PANDA_WRITEROLE';
	        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDA_READROLE';
	END LOOP;

	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDA' AND object_type IN
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
--  DDL for Procedure HARVESTER_WORKERS_SL_WINDOW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."HARVESTER_WORKERS_SL_WINDOW" (DAYS_OFFSET NUMBER default 60) AUTHID DEFINER
AS
-- Procedure for sustaining N days sliding window in the PANDA.HARVESTER_WORKERS table which has automatic INTERVAL partitioning NUMTOYMINTERVAL(1,'MONTH')
-- The default is keep data for at least the last recent 60 days

-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);

stmt VARCHAR2(4000);
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_parts part_names;
messg VARCHAR2(10);

BEGIN

-- ver 1.0, last update 10th April 2018

-- Note: Oracle does NOT allow dropping of the last remaining non-interval partition (ORA-14758)! That is why is better to have INTERVAL = 'YES' condition in the WHERE clause
-- get the older than the last 4 partitions (months)

SELECT partition_name BULK COLLECT INTO coll_parts
FROM USER_TAB_PARTITIONS
WHERE table_name = 'HARVESTER_WORKERS'
AND INTERVAL = 'YES' AND partition_position <= (SELECT MAX(partition_position) - 3 FROM USER_TAB_PARTITIONS WHERE table_name = 'HARVESTER_WORKERS' );

-- do NOT drop partitions that are within 2 months from now. In that case exit the procedure
IF (coll_parts.COUNT <= 0) THEN
	stmt:= 'USER DEFINED INFO: There are NOT partitions with data older than ' || to_char(DAYS_OFFSET) || ' days for drop!';
	-- this RAISE call is commented out as the procedure will be called from within a scheduler job monthly and would be not good to be shown error on the shifters page
	-- RAISE_APPLICATION_ERROR(-20101, stmt );
	return;
END IF;


-- Verification and partition drop part --

FOR j IN 1 .. coll_parts.COUNT LOOP

	-- for each older than the last 4 partitions check whether the MAX(modificationdate) is smaller than DAYS_OFFSET (default 93) days
	stmt := 'SELECT (CASE WHEN MAX(lastupdate) < (SYSDATE - ' || to_char(DAYS_OFFSET) || ') THEN ''OK'' ELSE ''NOT OK'' END ) FROM ATLAS_PANDA.HARVESTER_WORKERS PARTITION ( ' || coll_parts(j) || ')' ;
	EXECUTE IMMEDIATE stmt INTO messg;

	IF (messg = 'OK') THEN
		stmt := 'ALTER TABLE ATLAS_PANDA.HARVESTER_WORKERS DROP PARTITION ' || coll_parts(j) || ' UPDATE GLOBAL INDEXES';

		-- loop until gets exclusive lock on the table
		LOOP
		   BEGIN
			EXECUTE IMMEDIATE stmt;
		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN DBMS_LOCK.sleep(1);
		   END;
		END LOOP;
	END IF;

END LOOP;

END HARVESTER_WORKERS_sl_window;

/
--------------------------------------------------------
--  DDL for Procedure JEDI_REFR_MINTASKIDS_BYSTATUS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."JEDI_REFR_MINTASKIDS_BYSTATUS" 
AS
BEGIN

 -- ver 1.0, last update 2th July 2013

MERGE INTO JEDI_AUX_STATUS_MINTASKID tab
USING (SELECT status, MIN(jeditaskid) min_taskid from JEDI_TASKS WHERE status NOT IN ('broken', 'aborted', 'finished', 'failed') GROUP By status) sub
ON (tab.STATUS = sub.STATUS)
WHEN MATCHED THEN UPDATE SET
MIN_JEDITASKID = sub.min_taskid
WHEN NOT MATCHED THEN INSERT (tab.status, tab.min_jeditaskid)
VALUES (sub.status, sub.min_taskid);

COMMIT;

END;

/

--------------------------------------------------------
--  DDL for Procedure JOBS_STATUSLOG_SL_WINDOW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."JOBS_STATUSLOG_SL_WINDOW" (DAYS_OFFSET NUMBER default 93) AUTHID DEFINER
AS
-- Procedure for sustaining 90 days sliding window in the PANDA.JOBS_STATUSLOG table which has automatic INTERVAL partitioning NUMTOYMINTERVAL(1,'MONTH')
-- 93 days to be more secure as some for some sequential months we have 31 days

-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);

stmt VARCHAR2(4000);
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_parts part_names;
messg VARCHAR2(10);

BEGIN

-- ver 1.3, last update 22th August 2017
-- ver 1.2, last update 30th Oct 2014

-- Note: Oracle does NOT allow dropping of the last remaining non-interval partition (ORA-14758)! That is why is better to have INTERVAL = 'YES' condition in the WHERE clause
-- get the older than 90 days

SELECT partition_name BULK COLLECT INTO coll_parts
FROM USER_TAB_PARTITIONS
WHERE table_name = 'JOBS_STATUSLOG'
AND SEGMENT_CREATED = 'YES' AND INTERVAL <> 'NO' AND partition_position <= (SELECT MAX(partition_position) - DAYS_OFFSET FROM USER_TAB_PARTITIONS
WHERE table_name = 'JOBS_STATUSLOG' );

-- do NOT drop partitions that are within 3 months from now. In that case exit the procedure
IF (coll_parts.COUNT <= 0) THEN
	stmt:= 'USER DEFINED INFO: There are NOT partitions with data older than ' || to_char(DAYS_OFFSET) || ' days for drop!';
	-- this RAISE call is commented out as the procedure will be called from within a scheduler job monthly and would be not good to be shown error on the shifters page
	-- RAISE_APPLICATION_ERROR(-20101, stmt );
	return;
END IF;


-- Verification and partition drop part --

FOR j IN 1 .. coll_parts.COUNT LOOP

	-- for each older than the last 90 partitions check whether the MAX(modificationdate) is smaller than DAYS_OFFSET (default 93) days
	stmt := 'SELECT (CASE WHEN MAX(modificationtime) < (SYSDATE - ' || to_char(DAYS_OFFSET) || ') THEN ''OK'' ELSE ''NOT OK'' END ) FROM JOBS_STATUSLOG PARTITION ( ' || coll_parts(j) || ')' ;
	EXECUTE IMMEDIATE stmt INTO messg;

	IF (messg = 'OK') THEN
		stmt := 'ALTER TABLE JOBS_STATUSLOG DROP PARTITION ' || coll_parts(j) ;

		-- loop until gets exclusive lock on the table
		LOOP
		   BEGIN
			EXECUTE IMMEDIATE stmt;
		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN DBMS_LOCK.sleep(1);
		   END;
		END LOOP;
	END IF;

END LOOP;

END JOBS_STATUSLOG_SL_WINDOW;

/


--------------------------------------------------------
--  DDL for Procedure PANDALOG_SL_WINDOW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."PANDALOG_SL_WINDOW" (mytab_name VARCHAR2, DAYS_OFFSET NUMBER default 3) AUTHID DEFINER
AS
-- Procedure for sustaining DAYS_OFFSET days sliding window in the PANDALOG table which has automatic INTERVAL partitioning NUMTODSINTERVAL(1,'DAY')

-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);

stmt VARCHAR2(4000);
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_parts part_names;
messg VARCHAR2(10);
fullq_name VARCHAR2(100);

BEGIN

-- ver 1.2, last update 2th July 2013

-- Note: Oracle does NOT allow dropping of the last remaining non-interval partition (ORA-14758)! That is why is better to have INTERVAL = 'YES' condition in the WHERE clause
-- get the older than the last DAYS_OFFSET partitions (days)

-- the DBMS_ASSERT.SQL_OBJECT_NAME function checks that the input string represents an existing object
-- The "ORA-44002: invalid object name" exception is raised when the input string does not match an existing object name
SELECT DBMS_ASSERT.SQL_OBJECT_NAME( sys_context('USERENV', 'CURRENT_SCHEMA') || '.' || UPPER(mytab_name) ) into fullq_name FROM DUAL;



SELECT partition_name BULK COLLECT INTO coll_parts
FROM USER_TAB_PARTITIONS
WHERE table_name = UPPER(mytab_name)
AND INTERVAL = 'YES' AND partition_position <= (SELECT MAX(partition_position) - DAYS_OFFSET FROM USER_TAB_PARTITIONS
WHERE table_name = UPPER(mytab_name) );

-- do NOT drop partitions that are within DAYS_OFFSET from now. In that case exit the procedure
IF (coll_parts.COUNT <= 0) THEN
	stmt:= 'USER DEFINED INFO: There are NOT partitions with data older than ' || to_char(DAYS_OFFSET) || ' days for drop!';
	-- this RAISE call is commented out as the procedure will be called from within a scheduler job monthly and would be not good to be shown error on the shifters page
	-- RAISE_APPLICATION_ERROR(-20101, stmt );
	return;
END IF;

-- Verification and partition drop part --
FOR j IN 1 .. coll_parts.COUNT LOOP

	-- for each older than the last DAYS_OFFSET partitions check whether the MAX(modificationdate) is smaller than DAYS_OFFSET days
	stmt := 'SELECT (CASE WHEN MAX(bintime) < (SYSDATE - ' || to_char(DAYS_OFFSET) || ') THEN ''OK'' ELSE ''NOT OK'' END ) FROM ' ||UPPER(mytab_name)||' PARTITION ( ' || coll_parts(j) || ')' ;
	-- DBMS_OUTPUT.put_line(stmt);

	EXECUTE IMMEDIATE stmt INTO messg;

	IF (messg = 'OK') THEN
		stmt := 'ALTER TABLE '|| UPPER(mytab_name)||' DROP PARTITION ' || coll_parts(j) ;

		-- loop until gets exclusive lock on the table
		LOOP
		   BEGIN
			EXECUTE IMMEDIATE stmt;
		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN DBMS_LOCK.sleep(1);
		   END;
		END LOOP;
	END IF;

END LOOP;

END PANDALOG_sl_window;

/



--------------------------------------------------------
--  DDL for Procedure PANDA_TABLE_SL_WINDOW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."PANDA_TABLE_SL_WINDOW" (mytab_name VARCHAR2, mytab_column VARCHAR2, DAYS_OFFSET NUMBER default 3) AUTHID DEFINER
AS
-- Procedure for sustaining DAYS_OFFSET days sliding window on a given table which has automatic INTERVAL partitioning NUMTODSINTERVAL(1,'DAY')
-- the DROP partition clause is with " UPDATE GLOBAL INDEXES" option
-- "mytab_name": name of the table on which will be enforced a sliding window policy
-- "mytab_column": a DATE or a TIMESTAMP column on which is based the RANGE (+ interval) partitioning
-- "days_offset": the number of most recent days(partitions) which have to stay in the table


-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);

stmt VARCHAR2(4000);
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_parts part_names;
messg VARCHAR2(10);
fullq_name VARCHAR2(100);

BEGIN

-- ver 1.0, last update 16th January 2015



-- Note: Oracle does NOT allow dropping of the last remaining non-interval partition (ORA-14758)! That is why is better to have INTERVAL = 'YES' condition in the WHERE clause
-- get the older than the last DAYS_OFFSET partitions (days)

-- the DBMS_ASSERT.SQL_OBJECT_NAME function checks that the input string represents an existing object
-- The "ORA-44002: invalid object name" exception is raised when the input string does not match an existing object name
SELECT DBMS_ASSERT.SQL_OBJECT_NAME( sys_context('USERENV', 'CURRENT_SCHEMA') || '.' || UPPER(mytab_name) ) into fullq_name FROM DUAL;



SELECT partition_name BULK COLLECT INTO coll_parts
FROM USER_TAB_PARTITIONS
WHERE table_name = UPPER(mytab_name)
AND INTERVAL = 'YES' AND partition_position <= (SELECT MAX(partition_position) - DAYS_OFFSET FROM USER_TAB_PARTITIONS
WHERE table_name = UPPER(mytab_name) );

-- do NOT drop partitions that are within DAYS_OFFSET from now. In that case exit the procedure
IF (coll_parts.COUNT <= 0) THEN
	stmt:= 'USER DEFINED INFO: There are NOT partitions with data older than ' || to_char(DAYS_OFFSET) || ' days for drop!';
	-- this RAISE call is commented out as the procedure will be called from within a scheduler job monthly and would be not good to be shown error on the shifters page
	-- RAISE_APPLICATION_ERROR(-20101, stmt );
	return;
END IF;

-- Verification and partition drop part --
FOR j IN 1 .. coll_parts.COUNT LOOP

	-- for each older than the last DAYS_OFFSET partitions check whether the MAX(modificationdate) is smaller than DAYS_OFFSET days
	stmt := 'SELECT (CASE WHEN MAX('||mytab_column||') < (SYSDATE - ' || to_char(DAYS_OFFSET) || ') THEN ''OK'' ELSE ''NOT OK'' END ) FROM ' ||UPPER(mytab_name)||' PARTITION ( ' || coll_parts(j) || ')' ;
	-- DBMS_OUTPUT.put_line(stmt);

	EXECUTE IMMEDIATE stmt INTO messg;

	IF (messg = 'OK') THEN
		stmt := 'ALTER TABLE '|| UPPER(mytab_name)||' DROP PARTITION ' || coll_parts(j) || ' UPDATE GLOBAL INDEXES';

		-- loop until gets exclusive lock on the table
		LOOP
		   BEGIN
			EXECUTE IMMEDIATE stmt;
		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN DBMS_LOCK.sleep(1);
		   END;
		END LOOP;
	END IF;

END LOOP;

END PANDA_TABLE_sl_window;

/



--------------------------------------------------------
--  DDL for Procedure REBUILD_TABLE_INDICES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."REBUILD_TABLE_INDICES" (m_owner VARCHAR2, m_table VARCHAR2, m_tbs_name VARCHAR2)
AS
stmt VARCHAR2(300);
TYPE indx_collection IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
indx_list indx_collection;
fullq_name VARCHAR2(100);

BEGIN

-- ver. 1.2, last update 2th July 2013

DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Rebuild indexes of table ' || UPPER(m_table)|| '.' || UPPER(m_table) );
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

-- the DBMS_ASSERT.SQL_OBJECT_NAME function checks that the input string represents an existing object
-- The "ORA-44002: invalid object name" exception is raised when the input string does not match an existing object name
SELECT DBMS_ASSERT.SQL_OBJECT_NAME( UPPER(m_owner) || '.' || UPPER(m_table) ) into fullq_name FROM DUAL;


SELECT index_name BULK COLLECT INTO indx_list
FROM all_indexes WHERE owner = UPPER(m_owner) AND table_name = UPPER(m_table) and index_type <> 'LOB' ;

	FOR j IN 1 .. indx_list.COUNT LOOP
		stmt := 'Alter index ' || UPPER(m_owner)|| '.' || UPPER(indx_list(j)) || ' rebuild ONLINE tablespace '
			|| DBMS_ASSERT.SIMPLE_SQL_NAME(UPPER(m_tbs_name));
		EXECUTE IMMEDIATE stmt;
	END LOOP;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);
END;

/



--------------------------------------------------------
--  DDL for Procedure TASKS_STATUSLOG_SL_WINDOW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."TASKS_STATUSLOG_SL_WINDOW" (DAYS_OFFSET NUMBER default 93) AUTHID DEFINER
AS
-- Procedure for sustaining 90 days sliding window in the PANDA.TASKS_STATUSLOG table which has automatic INTERVAL partitioning NUMTOYMINTERVAL(1,'DAY')
-- 93 days to be more secure as some for some sequential months we have 31 days

-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);

stmt VARCHAR2(4000);
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_parts part_names;
messg VARCHAR2(10);

BEGIN

-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Sliding window for TASKS_STATUSLOG');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

-- ver 1.1, last update 11 March 2020, based on Gancho Dimitrov's JOBS_STATUSLOG_SL_WINDOW procedures

-- Note: Oracle does NOT allow dropping of the last remaining non-interval partition (ORA-14758)! That is why is better to have INTERVAL = 'YES' condition in the WHERE clause
-- get the older than 90 days 

SELECT partition_name BULK COLLECT INTO coll_parts
FROM USER_TAB_PARTITIONS
WHERE table_name = 'TASKS_STATUSLOG'
AND SEGMENT_CREATED = 'YES' AND INTERVAL <> 'NO' AND partition_position <= (SELECT MAX(partition_position) - DAYS_OFFSET FROM USER_TAB_PARTITIONS
WHERE table_name = 'TASKS_STATUSLOG' );

-- do NOT drop partitions that are within 3 months from now. In that case exit the procedure
IF (coll_parts.COUNT <= 0) THEN
	stmt:= 'USER DEFINED INFO: There are NOT partitions with data older than ' || to_char(DAYS_OFFSET) || ' days for drop!';
	-- this RAISE call is commented out as the procedure will be called from within a scheduler job monthly and would be not good to be shown error on the shifters page
	-- RAISE_APPLICATION_ERROR(-20101, stmt );
	return;
END IF;


-- Verification and partition drop part --

FOR j IN 1 .. coll_parts.COUNT LOOP

	-- for each older than the last 90 partitions check whether the MAX(modificationdate) is smaller than DAYS_OFFSET (default 93) days
	stmt := 'SELECT (CASE WHEN MAX(modificationtime) < (SYSDATE - ' || to_char(DAYS_OFFSET) || ') THEN ''OK'' ELSE ''NOT OK'' END ) FROM TASKS_STATUSLOG PARTITION ( ' || coll_parts(j) || ')' ;
	EXECUTE IMMEDIATE stmt INTO messg;

	IF (messg = 'OK') THEN
		stmt := 'ALTER TABLE TASKS_STATUSLOG DROP PARTITION ' || coll_parts(j) ;

		-- loop until gets exclusive lock on the table
		LOOP
		   BEGIN
			EXECUTE IMMEDIATE stmt;
		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN DBMS_LOCK.sleep(1);
		   END;
		END LOOP;
	END IF;

END LOOP;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

END TASKS_STATUSLOG_SL_WINDOW;

/



--------------------------------------------------------
--  DDL for Procedure UPDATE_JOBSACTIVE_STATS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."UPDATE_JOBSACTIVE_STATS" 
AS
BEGIN

-- ver 1.3 , last modified on 2nd September 2024
-- added NUM_OF_CORES columns
-- ver 1.2 , last modified on 2th July 2013
-- added VO and WORKQUEUE_ID columns

-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Aggregates data for the active jobs!');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );


DELETE from mv_jobsactive4_stats;

INSERT INTO mv_jobsactive4_stats
  (CUR_DATE,
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
    sysdate,
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
    sysdate,
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
commit;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

end;

/

--------------------------------------------------------
--  DDL for Procedure UPDATE_RUNNING_JUMBO_TASK_COUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."UPDATE_RUN_JUMBO_COUNT"
AS
BEGIN

-- ver 0.1 , 09 August 2021

-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Aggregates data for the Jumbo task count!');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );


DELETE from MV_RUNNING_JUMBO_TASK_COUNT;

INSERT INTO MV_RUNNING_JUMBO_TASK_COUNT
  ( cur_date,
    vo,
	cloud,
    prodsourcelabel,
    usejumbo,
    status,
    gshare,
    workqueue_id,
    task_count
  )
  SELECT
    sysdate,
    vo,
	cloud,
    prodsourcelabel,
    usejumbo,
    status,
    gshare,
    workqueue_id,
    COUNT(*) AS task_count
  FROM JEDI_TASKS
  GROUP BY
    sysdate,
    vo,
	cloud,
    prodsourcelabel,
    usejumbo,
    status,
    gshare,
    workqueue_id;
commit;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

end;

/

--------------------------------------------------------
--  DDL for Procedure UPDATE_JOBSACT_STATS_BY_GSHARE
--------------------------------------------------------
set define off;

CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."UPDATE_JOBSACT_STATS_BY_GSHARE"
AS
BEGIN
-- 16th Sept 2024 , ver 1.6
-- 14th Nov 2023 , ver 1.5
-- 27th Nov 2020 , ver 1.4
-- 29th Jan 2018 , ver 1.3
-- to easily identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Aggregates data by global share for the active jobs!');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

DELETE from ATLAS_PANDA.JOBS_SHARE_STATS;

INSERT INTO ATLAS_PANDA.JOBS_SHARE_STATS (TS, GSHARE, WORKQUEUE_ID, RESOURCE_TYPE,
                                          COMPUTINGSITE, JOBSTATUS,
                                          MAXPRIORITY, PRORATED_DISKIO_AVG, PRORATED_MEM_AVG, NJOBS, HS, VO)
WITH
    sc_slimmed AS (
    SELECT /*+ MATERIALIZE */ sc.panda_queue AS pq, sc.data.corepower AS cp
    FROM ATLAS_PANDA.schedconfig_json sc
    )
SELECT sysdate, gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus,
      MAX(currentPriority) AS maxPriority,
      AVG(diskIO/NVL(ja4.coreCount, 1)) AS proratedDiskioAvg, AVG(minRamCount/NVL(ja4.coreCount, 1)) AS proratedMemAvg,
      COUNT(*) AS num_of_jobs, COUNT(*) * NVL(ja4.coreCount, 1) * sc_s.cp AS HS, VO
FROM ATLAS_PANDA.jobsActive4 ja4, sc_slimmed sc_s
WHERE ja4.computingsite = sc_s.pq
GROUP BY sysdate, gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus, ja4.coreCount, sc_s.cp, VO;


COMMIT;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

end;
/


--------------------------------------------------------
--  DDL for Procedure UPDATE_JOBSDEF_STATS_BY_GSHARE
--------------------------------------------------------
set define off;

CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."UPDATE_JOBSDEF_STATS_BY_GSHARE"
AS
BEGIN
-- 16th Sept 2024 , ver 1.2
-- 14th Nov 2023 , ver 1.1
-- 27th Nov 2020 , ver 1.0
-- Based on UPDATE_JOBSACT_STATS_BY_GSHARE
-- to easily identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Aggregates data by global share for the active jobs!');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );


DELETE from ATLAS_PANDA.JOBSDEFINED_SHARE_STATS;

INSERT INTO ATLAS_PANDA.JOBSDEFINED_SHARE_STATS (TS, GSHARE, WORKQUEUE_ID, RESOURCE_TYPE,
                                          COMPUTINGSITE, JOBSTATUS,
                                          MAXPRIORITY, PRORATED_DISKIO_AVG, PRORATED_MEM_AVG, NJOBS, HS, VO)
WITH
    sc_slimmed AS (
    SELECT /*+ MATERIALIZE */ sc.panda_queue AS pq, sc.data.corepower AS cp
    FROM ATLAS_PANDA.schedconfig_json sc
    )
SELECT sysdate, gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus,
      MAX(currentPriority) AS maxPriority,
      AVG(diskIO/NVL(ja4.coreCount, 1)) AS proratedDiskioAvg, AVG(minRamCount/NVL(ja4.coreCount, 1)) AS proratedDiskioAvg,
      COUNT(*) AS num_of_jobs, COUNT(*) * NVL(ja4.coreCount, 1) * sc_s.cp AS HS, VO
FROM ATLAS_PANDA.jobsDefined4 ja4, sc_slimmed sc_s
WHERE ja4.computingsite = sc_s.pq
GROUP BY sysdate, gshare, workqueue_id, ja4.resource_type, computingSite, jobStatus, ja4.coreCount, sc_s.cp, VO;


COMMIT;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

end;
/

--------------------------------------------------------
--  DDL for Procedure UPDATE_JOB_STATS_HP
--------------------------------------------------------
create or replace PROCEDURE UPDATE_JOB_STATS_HP
AS
BEGIN

-- 30th Nov 2020 , ver 1.0
-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Counts jobs from all tables with max priority!');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

DELETE from ATLAS_PANDA.JOB_STATS_HP;

INSERT INTO ATLAS_PANDA.JOB_STATS_HP (TS, PRODSOURCELABEL, CLOUD, RESOURCE_TYPE, GSHARE, JOBSTATUS, WORKQUEUE_ID, VO, MAX_PRIORITY, MAX_PRIORITY_COUNT)
WITH ja4_stats AS (
    SELECT PRODSOURCELABEL, CLOUD, RESOURCE_TYPE, GSHARE, JOBSTATUS, WORKQUEUE_ID, VO, MAX(currentPriority) AS max_priority
    FROM ATLAS_PANDA.jobsActive4 ja4
    WHERE PROCESSINGTYPE<>'pmerge'
    AND (eventService  IS NULL OR eventService<>2)
    AND jobstatus = 'activated'
    GROUP BY PRODSOURCELABEL, CLOUD, RESOURCE_TYPE, GSHARE, JOBSTATUS, WORKQUEUE_ID, VO),

    jd4_stats AS (
    SELECT PRODSOURCELABEL, CLOUD, RESOURCE_TYPE, GSHARE, JOBSTATUS, WORKQUEUE_ID, VO, MAX(currentPriority) AS max_priority
    FROM ATLAS_PANDA.jobsDefined4 ja4
    WHERE PROCESSINGTYPE<>'pmerge'
    AND (eventService  IS NULL OR eventService<>2)
    AND jobstatus IN ('assigned', 'defined')
    GROUP BY PRODSOURCELABEL, CLOUD, RESOURCE_TYPE, GSHARE, JOBSTATUS, WORKQUEUE_ID, VO
    )
SELECT /*+ use_nl(ja4, ja4_stats) */ SYSDATE, ja4.PRODSOURCELABEL, ja4.CLOUD, ja4.RESOURCE_TYPE, ja4.GSHARE, ja4.JOBSTATUS, ja4.WORKQUEUE_ID, ja4.VO, ja4_stats.max_priority, COUNT(*) AS max_priority_count
FROM ATLAS_PANDA.jobsActive4 ja4, ja4_stats
WHERE ja4.PRODSOURCELABEL = ja4_stats.PRODSOURCELABEL
AND ja4.PROCESSINGTYPE<>'pmerge'
AND (ja4.eventService  IS NULL OR ja4.eventService<>2)
AND ja4.CLOUD = ja4_stats.CLOUD
AND ja4.RESOURCE_TYPE = ja4_stats.RESOURCE_TYPE
AND ja4.GSHARE = ja4_stats.GSHARE
AND ja4.JOBSTATUS = ja4_stats.JOBSTATUS
AND ja4.WORKQUEUE_ID = ja4_stats.WORKQUEUE_ID
AND ja4.VO = ja4_stats.VO
AND ja4.currentpriority = ja4_stats.max_priority
AND NVL(ja4.WORKQUEUE_ID, -1) = NVL(ja4_stats.WORKQUEUE_ID, -1)
GROUP BY ja4.PRODSOURCELABEL, ja4.CLOUD, ja4.RESOURCE_TYPE, ja4.GSHARE, ja4.JOBSTATUS, ja4.WORKQUEUE_ID, ja4.VO, ja4_stats.max_priority
UNION
SELECT /*+ use_nl(jd4, jd4_stats) */ SYSDATE, jd4.PRODSOURCELABEL, jd4.CLOUD, jd4.RESOURCE_TYPE, jd4.GSHARE, jd4.JOBSTATUS, jd4.WORKQUEUE_ID, jd4.VO, jd4_stats.max_priority, COUNT(*) AS max_priority_count
FROM ATLAS_PANDA.jobsDefined4 jd4, jd4_stats
WHERE jd4.PRODSOURCELABEL = jd4_stats.PRODSOURCELABEL
AND jd4.PROCESSINGTYPE<>'pmerge'
AND (jd4.eventService  IS NULL OR jd4.eventService<>2)
AND jd4.CLOUD = jd4_stats.CLOUD
AND jd4.RESOURCE_TYPE = jd4_stats.RESOURCE_TYPE
AND jd4.GSHARE = jd4_stats.GSHARE
AND jd4.JOBSTATUS = jd4_stats.JOBSTATUS
AND jd4.WORKQUEUE_ID = jd4_stats.WORKQUEUE_ID
AND jd4.VO = jd4_stats.VO
AND jd4.currentpriority = jd4_stats.max_priority
AND NVL(jd4.WORKQUEUE_ID, -1) = NVL(jd4_stats.WORKQUEUE_ID, -1)
GROUP BY jd4.PRODSOURCELABEL, jd4.CLOUD, jd4.RESOURCE_TYPE, jd4.GSHARE, jd4.JOBSTATUS, jd4.WORKQUEUE_ID, jd4.VO, jd4_stats.max_priority;

COMMIT;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

end;
/


--------------------------------------------------------
--  DDL for Procedure UPDATE_NUM_INPUT_DATA_FILES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."UPDATE_NUM_INPUT_DATA_FILES" 
AS
BEGIN

-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Calculates mean number of input files for the different types of jobs');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

DELETE from ATLAS_PANDA.typical_num_input;

INSERT INTO ATLAS_PANDA.typical_num_input (agg_type, vo, agg_key, prodsourcelabel, 
                                           processingtype, ninputdatafiles)
SELECT 'gshare' as agg_type, vo, gshare as agg_key, prodSourceLabel, processingType, MEDIAN(nInputDataFiles)
FROM ATLAS_PANDA.jobsActive4
WHERE nInputDataFiles is not NULL 
    AND vo is not NULL 
    AND prodsourcelabel is not NULL
    AND processingtype is not NULL
    AND gshare is not NULL
    AND workqueue_id IN (SELECT UNIQUE workqueue_id FROM ATLAS_PANDA.jobsActive4
MINUS 
SELECT queue_id 
FROM atlas_panda.jedi_work_queue WHERE queue_function = 'Resource')
GROUP BY vo, gshare, prodSourceLabel, processingType
UNION
SELECT 'workqueue' as agg_type, vo, to_char(workqueue_id) as agg_key, prodSourceLabel, processingType, MEDIAN(nInputDataFiles)
FROM ATLAS_PANDA.jobsActive4
WHERE nInputDataFiles is not NULL 
    AND vo is not NULL 
    AND prodsourcelabel is not NULL
    AND processingtype is not NULL
    AND workqueue_id is not NULL
    AND workqueue_id IN (SELECT queue_id FROM atlas_panda.jedi_work_queue WHERE queue_function = 'Resource')
GROUP BY vo, WORKQUEUE_ID, prodSourceLabel, processingType;

COMMIT;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

END;

/



--------------------------------------------------------
--  DDL for Procedure UPDATE_TOTAL_WALLTIME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."UPDATE_TOTAL_WALLTIME" 
AS
BEGIN

-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Calculates queued walltime');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );

DELETE from ATLAS_PANDA.total_walltime_cache;

INSERT INTO ATLAS_PANDA.total_walltime_cache (vo, agg_type, agg_key, prodsourcelabel, resource_type, 
                                        total_walltime, n_has_value, n_no_value)
SELECT
   * 
FROM
   (
      SELECT
         vo, 'gshare' AS agg_type, gshare AS agg_key, prodsourcelabel, resource_type, 
         SUM(nvl2(maxwalltime, maxwalltime, 0)), SUM(nvl2(maxwalltime, 1, 0)), SUM(nvl2(maxwalltime, 0, 1)) 
      FROM
         atlas_panda.jobsactive4 
      WHERE
         jobstatus IN ('activated', 'starting')
         AND workqueue_id IN 
         (
            SELECT
               UNIQUE workqueue_id 
            FROM
               atlas_panda.jobsactive4 minus 
               SELECT
                  queue_id 
               FROM
                  atlas_panda.jedi_work_queue 
               WHERE
                  queue_function = 'Resource'
         )
      GROUP BY vo, gshare, prodsourcelabel, resource_type, 'gshare'
      UNION
      SELECT
         vo, 'gshare' AS agg_type, gshare AS agg_key, prodsourcelabel, resource_type,
         SUM(nvl2(maxwalltime, maxwalltime, 0)), SUM(nvl2(maxwalltime, 1, 0)), SUM(nvl2(maxwalltime, 0, 1)) 
      FROM
         atlas_panda.jobsdefined4 
      WHERE
         workqueue_id IN 
         (
            SELECT
               UNIQUE workqueue_id 
            FROM
               atlas_panda.jobsactive4 minus 
               SELECT
                  queue_id 
               FROM
                  atlas_panda.jedi_work_queue 
               WHERE
                  queue_function = 'Resource'
         )
      GROUP BY vo, gshare, prodsourcelabel, resource_type, 'gshare'
   )
UNION
SELECT
   * 
FROM
   (
      SELECT
         vo, 'workqueue' AS agg_type, to_char(workqueue_id) AS agg_key, prodsourcelabel, resource_type,
         SUM(nvl2(maxwalltime, maxwalltime, 0)), SUM(nvl2(maxwalltime, 1, 0)), SUM(nvl2(maxwalltime, 0, 1)) 
      FROM
         atlas_panda.jobsactive4 
      WHERE
         jobstatus IN ('activated', 'starting')
         AND workqueue_id IN 
         (
            SELECT
               queue_id 
            FROM
               atlas_panda.jedi_work_queue 
            WHERE
               queue_function = 'Resource'
         )
      GROUP BY
         vo, to_char(workqueue_id), prodsourcelabel, resource_type, 'workqueue'
      UNION
      SELECT
         vo, 'workqueue' AS agg_type, to_char(workqueue_id) AS agg_key, prodsourcelabel, resource_type,
         SUM(nvl2(maxwalltime, maxwalltime, 0)), SUM(nvl2(maxwalltime, 1, 0)), SUM(nvl2(maxwalltime, 0, 1)) 
      FROM
         atlas_panda.jobsdefined4 
      WHERE
         workqueue_id IN 
         (
            SELECT
               queue_id 
            FROM
               atlas_panda.jedi_work_queue 
            WHERE
               queue_function = 'Resource'
         )
      GROUP BY
         vo, to_char(workqueue_id), prodsourcelabel, resource_type, 'workqueue'
   )
;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

end;

/



--------------------------------------------------------
--  DDL for Procedure VERIF_DROP_COPIEDPANDAPART
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ATLAS_PANDA"."VERIF_DROP_COPIEDPANDAPART" (arch_schema VARCHAR2, DAYS_OFFSET NUMBER default 2) AUTHID CURRENT_USER
AS

-- define exception handling for the "ORA-00054: resource busy and acquire with NOWAIT specified" error
resource_busy EXCEPTION;
PRAGMA exception_init (resource_busy,-54);


stmt VARCHAR2(4000);
num_part NUMBER;
TYPE tab_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
TYPE part_names IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
coll_tables tab_names;
coll_parts part_names;
jobs_diff NUMBER;
valschema_name VARCHAR2(30);

BEGIN

-- ver 1.5, last update 2th July 2013

-- to easy identify the session and better view on resource usage by setting a dedicated module for the PanDA jobs
DBMS_APPLICATION_INFO.SET_MODULE( module_name => 'PanDA scheduler job', action_name => 'Verify data copying and remove partitions if the all data has been copied!');
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => sys_context('userenv', 'host') || ' ( ' || sys_context('userenv', 'ip_address') || ' )' );


-- checks that the input string represents an existing schema name
-- "ORA-44001: invalid schema" exception is raised when the input string does not match an existing schema name.
SELECT DBMS_ASSERT.schema_name(UPPER(arch_schema)) INTO valschema_name FROM dual;


SELECT COUNT(*) INTO num_part
FROM tablepart4copying
WHERE
TRUNC(copying_done_on) =
(
SELECT MIN(TRUNC(copying_done_on)) FROM tablepart4copying WHERE copied_to_arch = 'Y' AND deleted_on is NULL
)
AND deleted_on is NULL
AND (TRUNC(sysdate) - TRUNC(copying_done_on)) >= DAYS_OFFSET;


-- do NOT drop partitions that are within 3 days from now. In that case exit the procedure
-- the number is 1 because minimum 1 partitions have to be dropped. In normal operation have to be 4 partitions, but I put 1 to foresee cases
-- where DB instance crashes and not all partitions could have been dropped

IF (num_part < 1) THEN
	stmt:= 'USER DEFINED INFO: There are NOT partitions older than ' || DAYS_OFFSET || ' for drop!';
	raise_application_error(-20101, stmt );
	return;
END IF;


-- get the oldest partitions with conditions to be with offset of DAYS_OFFSET days from now
/*
SELECT table_name, partition_name BULK COLLECT INTO
coll_tables, coll_parts
FROM tablepart4copying
WHERE
TRUNC(copying_done_on) =
(
SELECT MIN(TRUNC(copying_done_on)) FROM tablepart4copying WHERE copied_to_arch = 'Y' AND deleted_on is NULL
)
AND deleted_on is NULL
AND ( TRUNC(sysdate) - TRUNC(copying_done_on) ) >= DAYS_OFFSET;
*/

-- 13th Feb 2012
-- new query with UNION as FILESTABLE4 table needs to have sliding window of 30 days (DAYS_OFFSET+28)

-- Note:
-- If data of several partitions have been copied at the same date for compensating some backlog, then in DAYS_OFFSET
-- they will be all dropped by this procedure with the logic encoded in this query - this is expected behaviour

SELECT table_name, partition_name BULK COLLECT INTO
coll_tables, coll_parts
FROM
(
SELECT table_name, partition_name
FROM tablepart4copying
WHERE
table_name <> 'FILESTABLE4'
AND
TRUNC(copying_done_on) =
(
SELECT MIN(TRUNC(copying_done_on)) FROM tablepart4copying WHERE table_name <> 'FILESTABLE4' AND copied_to_arch = 'Y' AND deleted_on is NULL
)
AND deleted_on is NULL
AND ( TRUNC(sysdate) - TRUNC(copying_done_on) ) >= DAYS_OFFSET

UNION

SELECT table_name, partition_name
FROM tablepart4copying
WHERE
table_name = 'FILESTABLE4'
AND
TRUNC(copying_done_on) =
(
SELECT MIN(TRUNC(copying_done_on)) FROM tablepart4copying WHERE table_name = 'FILESTABLE4' AND copied_to_arch = 'Y' AND deleted_on is NULL
)
AND deleted_on is NULL
AND ( TRUNC(sysdate) - TRUNC(copying_done_on) ) >= (DAYS_OFFSET+28)
);



-- Verification part --
-- Checks that the PANDAIDs of the partitions that need to be dropped are present (have been copied) to the corresponding ARCH tables

-- check for PANDAID set differences in the JOBSARCHIVED4

IF ( coll_tables.COUNT > 0 AND coll_tables.COUNT = coll_parts.COUNT ) THEN

	FOR j IN 1 .. coll_tables.COUNT LOOP

		IF coll_tables(j) = 'JOBSARCHIVED4' THEN
			jobs_diff := -1;

			-- with FULL table (actually single PARTITION) scan hint
			-- The cardinality hint is needed as sometimes for the partitions in question Oracle stats are missing !!!

			stmt :=	'SELECT /*+ CARDINALITY(tab 1000000) index_ffs(tab(PANDAID)) */ COUNT(pandaid)
			from JOBSARCHIVED4 PARTITION(' || coll_parts(j) || ') tab
			WHERE NOT EXISTS (SELECT /*+ FULL(subt) CARDINALITY(subt 3000000) */ 1 FROM '|| arch_schema ||'.JOBSARCHIVED subt
			where PANDAID= tab.PANDAID
			AND MODIFICATIONTIME >= (TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'') - 1)  AND MODIFICATIONTIME <
			TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'')) ' ;

			EXECUTE IMMEDIATE stmt INTO jobs_diff;


			IF (jobs_diff = 0)  THEN
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'YES', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);
			ELSE
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'NO', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);										commit;
				raise_application_error(-20101, 'Not all rows copied from table JOBSARCHIVED4');
				RETURN;
			END IF;

		END IF;

		IF coll_tables(j) = 'JOBPARAMSTABLE' THEN
			jobs_diff := -1;

			stmt :=	'SELECT
				COUNT(pandaid)
				FROM JOBPARAMSTABLE PARTITION(' || coll_parts(j) || ') tab
			WHERE NOT EXISTS (SELECT 1 FROM '|| arch_schema ||'.JOBPARAMSTABLE_ARCH subt
			where PANDAID= tab.PANDAID
			AND MODIFICATIONTIME >= (TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'') - 1)  AND MODIFICATIONTIME <
			TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'')) ' ;

			EXECUTE IMMEDIATE stmt INTO jobs_diff;


			IF (jobs_diff = 0)  THEN
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'YES', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);
			ELSE
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'NO', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);
				commit;
				raise_application_error(-20101, 'Not all rows copied from table JOBPARAMSTABLE');
				RETURN;
			END IF;

		END IF;

		IF coll_tables(j) = 'METATABLE' THEN
			jobs_diff := -1;
      
			stmt :=	'SELECT
				COUNT(pandaid)
				FROM METATABLE PARTITION(' || coll_parts(j) || ') tab
			WHERE NOT EXISTS (SELECT 1 FROM '|| arch_schema ||'.METATABLE_ARCH subt
			where PANDAID = tab.PANDAID
			AND MODIFICATIONTIME >= (TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'') - 1)  AND MODIFICATIONTIME <
			TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'')) ' ;

			EXECUTE IMMEDIATE stmt INTO jobs_diff;

			IF (jobs_diff = 0)  THEN
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'YES', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);
			ELSE
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'NO', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);										commit;
				raise_application_error(-20101, 'Not all rows copied from table METATABLE');
				RETURN;
			END IF;

		END IF;

		IF coll_tables(j) = 'FILESTABLE4' THEN
			jobs_diff := -1;

			stmt:='SELECT
				COUNT(row_id)
				FROM filestable4 PARTITION('|| coll_parts(j) ||') tab
			WHERE NOT EXISTS (SELECT 1 FROM '|| arch_schema ||'.FILESTABLE_ARCH subt
			WHERE ROW_ID = tab.ROW_ID AND MODIFICATIONTIME >= (TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'') - 1)
			AND MODIFICATIONTIME < TO_DATE('''|| SUBSTR(coll_parts(j), -8) ||''', ''DDMMYYYY'')) ' ;

			EXECUTE IMMEDIATE stmt INTO jobs_diff;


			IF (jobs_diff = 0)  THEN
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'YES', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);
			ELSE
				UPDATE tablepart4copying SET DATA_VERIF_PASSED = 'NO', data_verified_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);										commit;
				raise_application_error(-20101, 'Not all rows copied from table FILESTABLE4');
				RETURN;
			END IF;

		END IF;
	END LOOP;
END IF;



-- end of the verification part --
IF ( coll_tables.COUNT > 0 AND coll_tables.COUNT = coll_parts.COUNT ) THEN

	FOR j IN 1 .. coll_tables.COUNT LOOP

		stmt := 'ALTER TABLE '|| coll_tables(j) || ' DROP PARTITION ' || coll_parts(j) ;

		-- loop until gets exclusive lock on the table
		LOOP
		   BEGIN
			EXECUTE IMMEDIATE stmt;

			-- add info into the logging table 'tablepart4copying'
			UPDATE tablepart4copying SET deleted_on = SYSDATE WHERE table_name = coll_tables(j) AND partition_name = coll_parts(j);
			COMMIT;
		     	EXIT;
		   EXCEPTION
    			WHEN resource_busy THEN DBMS_LOCK.sleep(1);
		   END;
		END LOOP;

	END LOOP;

	-- the commit is moved within the above loop
	-- COMMIT;
END IF;

DBMS_APPLICATION_INFO.SET_MODULE( module_name => null, action_name => null);
DBMS_APPLICATION_INFO.SET_CLIENT_INFO ( client_info => null);

END;

/

--------------------------------------------------------
--  Constraints for Table JOBPARAMSTABLE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBPARAMSTABLE" ADD CONSTRAINT "PART_JOBPARAMSTABLE_PK" PRIMARY KEY ("PANDAID", "MODIFICATIONTIME")
  USING INDEX  LOCAL
 (PARTITION "PART_INITIAL_01011970")  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JOBPARAMSTABLE" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBPARAMSTABLE" MODIFY ("PANDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_PROCESS_LOCK
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_PROCESS_LOCK" ADD CONSTRAINT "JEDI_PROCESS_LOCK_PK" PRIMARY KEY ("VO", "PRODSOURCELABEL", "WORKQUEUE_ID", "CLOUD")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOBSDEBUG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSDEBUG" ADD CONSTRAINT "JOBSDEBUG_PANDAID_PK" PRIMARY KEY ("PANDAID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JOBSDEBUG" MODIFY ("PANDAID" CONSTRAINT "JOBSDEBUG_PANDAID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TYPICAL_NUM_INPUT
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."TYPICAL_NUM_INPUT" ADD CONSTRAINT "TYPICAL_NUM_INPUT_PK" PRIMARY KEY ("VO", "AGG_TYPE", "AGG_KEY", "PRODSOURCELABEL", "PROCESSINGTYPE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table GLOBAL_SHARES
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."GLOBAL_SHARES" ADD CONSTRAINT "GLOBAL_SHARES_QUEUE_ID_UQ" UNIQUE ("QUEUE_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."GLOBAL_SHARES" ADD PRIMARY KEY ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."GLOBAL_SHARES" MODIFY ("VALUE" CONSTRAINT "GLOBAL_SHARES_VALUE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NETWORK_MATRIX_KV
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV" ADD CONSTRAINT "SITES_MATRIX_KV_DATA_PK" PRIMARY KEY ("SRC", "DST", "KEY")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV" MODIFY ("KEY" CONSTRAINT "NETWORK_MATRIX_KV_KEY_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV" MODIFY ("DST" CONSTRAINT "NETWORK_MATRIX_KV_DST_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV" MODIFY ("SRC" CONSTRAINT "NETWORK_MATRIX_KV_SRC_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HARVESTER_REL_JOBS_WORKERS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" ADD CONSTRAINT "HARVESTER_REL_JOBS_WORKERS_PK" PRIMARY KEY ("HARVESTERID", "WORKERID", "PANDAID")
  USING INDEX  LOCAL
 (PARTITION "INITIAL_PARTITION" ) COMPRESS 1  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" MODIFY ("LASTUPDATE" CONSTRAINT "HARVREL_JOBWORKERS_LASTUPD_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" MODIFY ("PANDAID" CONSTRAINT "HARVREL_JOBWORKERS_PANID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" MODIFY ("WORKERID" CONSTRAINT "HARVREL_JOBWORKERS_WORKID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" MODIFY ("HARVESTERID" CONSTRAINT "HARVREL_JOBWORKERS_HARVID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_DATASET_CONTENTS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ADD CONSTRAINT "JEDI_DATASET_CONTENTS_PK" PRIMARY KEY ("JEDITASKID", "DATASETID", "FILEID")
  USING INDEX  LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 2  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" MODIFY ("STATUS" CONSTRAINT "JEDI_DATASETCONT_STATUS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" MODIFY ("TYPE" CONSTRAINT "JEDI_DATASETCONT_TYPE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" MODIFY ("LFN" CONSTRAINT "JEDI_DATASETCONT_LFN_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" MODIFY ("CREATIONDATE" CONSTRAINT "JEDI_DATASETCONT_CRDATE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" MODIFY ("FILEID" CONSTRAINT "JEDI_DATASETCONT_FILE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" MODIFY ("DATASETID" CONSTRAINT "JEDI_DATASETCONT_DATASETID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_DATASETCONT_JEDITASKID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_DATASETS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_DATASETS_JEDITASKID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" ADD CONSTRAINT "JEDI_DATASETS_PK" PRIMARY KEY ("JEDITASKID", "DATASETID")
  USING INDEX  LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 1  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" MODIFY ("MODIFICATIONTIME" CONSTRAINT "JEDI_DATASETS_MODIFTIME_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" MODIFY ("CREATIONTIME" CONSTRAINT "JEDI_DATASETS_CREATIONTIME_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" MODIFY ("TYPE" CONSTRAINT "JEDI_DATASETS_TYPE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" MODIFY ("DATASETNAME" CONSTRAINT "JEDI_DATASETS_DATASETNAME_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" MODIFY ("DATASETID" CONSTRAINT "JEDI_DATASETS_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HARVESTER_WORKER_STATS_OLD
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" ADD CONSTRAINT "HARVESTER_WORKER_STATS_PK" PRIMARY KEY ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "STATUS")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" MODIFY ("LASTUPDATE" CONSTRAINT "HARV_WORKER_STATS_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" MODIFY ("STATUS" CONSTRAINT "HARV_WORKER_STATS_STATUS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" MODIFY ("RESOURCETYPE" CONSTRAINT "HARV_WORKER_STATS_RES_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" MODIFY ("COMPUTINGSITE" CONSTRAINT "HARV_WORKER_STATS_COMP_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" MODIFY ("HARVESTER_ID" CONSTRAINT "HARV_WORKER_STATS_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NETWORK_MATRIX_KV_TEMP
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV_TEMP" MODIFY ("KEY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV_TEMP" MODIFY ("DST" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."NETWORK_MATRIX_KV_TEMP" MODIFY ("SRC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_TASKS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" ADD CONSTRAINT "JEDI_TASKS_PK" PRIMARY KEY ("JEDITASKID")
  USING INDEX  LOCAL
 (PARTITION "INITIAL_PARTITION")  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" MODIFY ("MODIFICATIONTIME" CONSTRAINT "JEDI_TASKS_MODIFTIME_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" MODIFY ("CREATIONDATE" CONSTRAINT "JEDI_TASKS_CRDATE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" MODIFY ("USERNAME" CONSTRAINT "JEDI_TASKS_USERNAME_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" MODIFY ("STATUS" CONSTRAINT "JEDI_TASKS_STATUS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_TASKS_JEDITASKID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" ADD CONSTRAINT "JEDITASKS_EVENTSERVICE_CHECK" CHECK (eventservice IN (0,1)) DISABLE;
--------------------------------------------------------
--  Constraints for Table JOBSACTIVE4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" ADD CONSTRAINT "JOBSACTIVE4_PANDAID_PK" PRIMARY KEY ("PANDAID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("NEVENTS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("TASKBUFFERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("JOBDISPATCHERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("BROKERAGEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("DDMERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("SUPERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("EXEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("PILOTERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("CPUCONSUMPTIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("MINRAMCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("MAXDISKCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("MAXCPUCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("JOBSTATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("MAXATTEMPT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("ATTEMPTNR" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("CURRENTPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("ASSIGNEDPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("CREATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("JOBDEFINITIONID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" MODIFY ("PANDAID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table JOBSDEFINED4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" ADD CONSTRAINT "JOBSDEFINED4_PANDAID_PK" PRIMARY KEY ("PANDAID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("NEVENTS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("TASKBUFFERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("JOBDISPATCHERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("BROKERAGEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("DDMERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("SUPERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("EXEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("PILOTERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("CPUCONSUMPTIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("MINRAMCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("MAXDISKCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("MAXCPUCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("JOBSTATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("MAXATTEMPT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("ATTEMPTNR" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("CURRENTPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("ASSIGNEDPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("CREATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("JOBDEFINITIONID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" MODIFY ("PANDAID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table JOBS_STATUSLOG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBS_STATUSLOG" MODIFY ("JOBSTATUS" CONSTRAINT "JOBS_STATUSLOG_STATUS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBS_STATUSLOG" MODIFY ("MODIFICATIONTIME" CONSTRAINT "JOBS_STATUSLOG_MODIFDATE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBS_STATUSLOG" MODIFY ("PANDAID" CONSTRAINT "JOBS_STATUSLOG_PANDAID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_TASKPARAMS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKPARAMS" ADD CONSTRAINT "JEDI_TASKPARAMS_JEDITASKID_PK" PRIMARY KEY ("JEDITASKID")
  USING INDEX  LOCAL
 (PARTITION "INITIAL_PARTITION")  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKPARAMS" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_TASKPARAMS_JEDITASKID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HARVESTER_COMMAND_LOCK
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" ADD CONSTRAINT "HARVESTER_COMMAND_LOCK_PK" PRIMARY KEY ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "COMMAND")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" MODIFY ("COMMAND" CONSTRAINT "HARV_COMMAND_LOCK_COMM_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" MODIFY ("RESOURCETYPE" CONSTRAINT "HARV_COMMAND_LOCK_RES_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" MODIFY ("COMPUTINGSITE" CONSTRAINT "HARV_COMMAND_LOCK_COMP_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" MODIFY ("HARVESTER_ID" CONSTRAINT "HARV_COMMAND_LOCK_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_JOBPARAMS_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_JOBPARAMS_TEMPLATE" ADD CONSTRAINT "JEDI_JOBPARAMSTEMPL_PK" PRIMARY KEY ("JEDITASKID")
  USING INDEX  LOCAL
 (PARTITION "INITIAL_PARTITION")  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_JOBPARAMS_TEMPLATE" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_JOBPARTEMPL_JEDITASKID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_JOB_RETRY_HISTORY
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" ADD CONSTRAINT "JEDI_JOB_RETRY_HISTORY_UQ" UNIQUE ("JEDITASKID", "OLDPANDAID", "NEWPANDAID", "ORIGINPANDAID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" MODIFY ("NEWPANDAID" CONSTRAINT "JEDI_JOB_RETRY_NEWPANDAID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" MODIFY ("OLDPANDAID" CONSTRAINT "JEDI_JOB_RETRY_OLDPANDAID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_JOB_RETRY_TASKID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PANDA_DDM_RELATION
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."PANDA_DDM_RELATION" ADD CONSTRAINT "PANDA_DDM_RELATION_PK" PRIMARY KEY ("PANDA_SITE_NAME", "DDM_ENDPOINT_NAME", "SCOPE")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."PANDA_DDM_RELATION" ADD CONSTRAINT "PANDA_DDM_REL_IS_LOCAL_CHECK" CHECK ( IS_LOCAL IN ('Y', 'N')) ENABLE;
--------------------------------------------------------
--  Constraints for Table HARVESTER_WORKER_STATS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" ADD CONSTRAINT "HARV_WORKER_STATS_PK" PRIMARY KEY ("HARVESTER_ID", "COMPUTINGSITE", "RESOURCETYPE", "STATUS", "JOBTYPE")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" MODIFY ("LASTUPDATE" CONSTRAINT "HARVR_WORKER_STATS_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" MODIFY ("JOBTYPE" CONSTRAINT "HARVR_WORKER_STATS_JOBTYPE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" MODIFY ("STATUS" CONSTRAINT "HARVR_WORKER_STATS_STATUS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" MODIFY ("RESOURCETYPE" CONSTRAINT "HARVR_WORKER_STATS_RES_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" MODIFY ("COMPUTINGSITE" CONSTRAINT "HARVR_WORKER_STATS_COMP_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" MODIFY ("HARVESTER_ID" CONSTRAINT "HARVR_WORKER_STATS_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_WORK_QUEUE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_WORK_QUEUE" ADD CONSTRAINT "JEDI_WORK_QUEUE_NAMETYPEVO_UK" UNIQUE ("QUEUE_NAME", "QUEUE_TYPE", "VO")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_WORK_QUEUE" ADD CONSTRAINT "JEDI_WORK_QUEUEID_PK" PRIMARY KEY ("QUEUE_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_WORK_QUEUE" MODIFY ("VO" CONSTRAINT "JEDI_WORK_QUEUE_VO_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_WORK_QUEUE" MODIFY ("QUEUE_TYPE" CONSTRAINT "JEDI_WORK_QUEUE_TYPE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_WORK_QUEUE" MODIFY ("QUEUE_NAME" CONSTRAINT "JEDI_WORK_QUEUE_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_WORK_QUEUE" MODIFY ("QUEUE_ID" CONSTRAINT "JEDI_WORK_QUEUE_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TASKS_STATUSLOG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."TASKS_STATUSLOG" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."TASKS_STATUSLOG" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."TASKS_STATUSLOG" MODIFY ("JEDITASKID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table MV_JOBSACTIVE4_STATS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."MV_JOBSACTIVE4_STATS" MODIFY ("JOBSTATUS" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table HARVESTER_DIALOGS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_DIALOGS" MODIFY ("DIAGID" CONSTRAINT "HARV_DIALOGS_HARV_DIAGID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_DIALOGS" MODIFY ("HARVESTER_ID" CONSTRAINT "HARV_DIALOGS_HARV_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DDM_ENDPOINT
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."DDM_ENDPOINT" ADD CONSTRAINT "BLACKLISTED_CHECK" CHECK ( blacklisted IN ('Y', 'N')) ENABLE;
  ALTER TABLE "ATLAS_PANDA"."DDM_ENDPOINT" ADD CONSTRAINT "DDM_ENDPOINT_NAME_PK" PRIMARY KEY ("DDM_ENDPOINT_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SITE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."SITE" ADD CONSTRAINT "SITE_NAME_PK" PRIMARY KEY ("SITE_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOBSARCHIVED4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" ADD CONSTRAINT "PART_JOBSARCHIVED4_PK" PRIMARY KEY ("PANDAID", "MODIFICATIONTIME")
  USING INDEX  LOCAL
 (PARTITION "PART_JOBSARCHIVED4_15032020")  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("NEVENTS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("TASKBUFFERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("JOBDISPATCHERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("BROKERAGEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("DDMERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("SUPERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("EXEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("PILOTERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("CPUCONSUMPTIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("MINRAMCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("MAXDISKCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("MAXCPUCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("JOBSTATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("MAXATTEMPT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("ATTEMPTNR" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("CURRENTPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("ASSIGNEDPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("CREATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("JOBDEFINITIONID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" MODIFY ("PANDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOBSWAITING4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" ADD CONSTRAINT "JOBSWAITING4_PANDAID_PK" PRIMARY KEY ("PANDAID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("NEVENTS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("TASKBUFFERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("JOBDISPATCHERERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("BROKERAGEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("DDMERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("SUPERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("EXEERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("PILOTERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("CPUCONSUMPTIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("MINRAMCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("MAXDISKCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("MAXCPUCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("JOBSTATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("MAXATTEMPT" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("ATTEMPTNR" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("CURRENTPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("ASSIGNEDPRIORITY" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("CREATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("JOBDEFINITIONID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" MODIFY ("PANDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PANDA_SITE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."PANDA_SITE" ADD CONSTRAINT "PANDA_SITE_IS_LOCAL_CHECK" CHECK ( IS_LOCAL IN ('Y', 'N')) ENABLE;
  ALTER TABLE "ATLAS_PANDA"."PANDA_SITE" ADD CONSTRAINT "PANDA_SITE_NAME_PK" PRIMARY KEY ("PANDA_SITE_NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."PANDA_SITE" MODIFY ("SITE_NAME" CONSTRAINT "SITE_NAME_NN" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table JOBS_SHARE_STATS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBS_SHARE_STATS" MODIFY ("JOBSTATUS" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table JOBSDEFINED_SHARE_STATS
--------------------------------------------------------
ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED_SHARE_STATS" MODIFY ("JOBSTATUS" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table TOTAL_WALLTIME_CACHE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."TOTAL_WALLTIME_CACHE" ADD CONSTRAINT "TOTAL_WALLTIME_CACHE_PK" PRIMARY KEY ("VO", "AGG_TYPE", "AGG_KEY", "PRODSOURCELABEL", "RESOURCE_TYPE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table JEDI_OUTPUT_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" ADD CONSTRAINT "JEDI_OUTPUTTEMPL_PK" PRIMARY KEY ("JEDITASKID", "DATASETID", "OUTTEMPID")
  USING INDEX  LOCAL
 (PARTITION "INITIAL_PARTITION") COMPRESS 2  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" MODIFY ("FILENAMETEMPLATE" CONSTRAINT "JEDI_OUTPUTTEMPL_FILETEMPL_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" MODIFY ("OUTTEMPID" CONSTRAINT "JEDI_OUTPUTTEMPL_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" MODIFY ("DATASETID" CONSTRAINT "JEDI_OUTPUTTEMPL_DATASETID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_OUTPUTTEMPL_JEDITASKID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RETRYACTIONS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."RETRYACTIONS" ADD CONSTRAINT "RETRYACTIONS" PRIMARY KEY ("RETRYACTION_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."RETRYACTIONS" MODIFY ("ACTIVE" CONSTRAINT "ACTIVE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."RETRYACTIONS" MODIFY ("RETRY_ACTION" CONSTRAINT "RETRY_ACTION_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."RETRYACTIONS" MODIFY ("RETRYACTION_ID" CONSTRAINT "RETRY_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JEDI_AUX_STATUS_MINTASKID
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_AUX_STATUS_MINTASKID" ADD CONSTRAINT "JEDI_AUX_STATUS_MINTASKID_PK" PRIMARY KEY ("STATUS")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_AUX_STATUS_MINTASKID" MODIFY ("MIN_JEDITASKID" CONSTRAINT "JEDI_AUX_TASKS_JEDITASKID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_AUX_STATUS_MINTASKID" MODIFY ("STATUS" CONSTRAINT "JEDI_AUX_TASKS_STATUS_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PANDALOG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."PANDALOG" MODIFY ("LINE" CONSTRAINT "PANDALOG_LINE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."PANDALOG" MODIFY ("LOGLEVEL" CONSTRAINT "PANDALOG_LOGLEVEL_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."PANDALOG" MODIFY ("PID" CONSTRAINT "PANDALOG_PID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."PANDALOG" MODIFY ("BINTIME" CONSTRAINT "PANDALOG_BINTIME_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table METATABLE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."METATABLE" ADD CONSTRAINT "PART_METATABLE_PK" PRIMARY KEY ("PANDAID", "MODIFICATIONTIME")
  USING INDEX  LOCAL
 (PARTITION "PART_INITIAL_01011970")  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."METATABLE" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table CONFIG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."CONFIG" ADD CONSTRAINT "CONFIG_DATA_PK" PRIMARY KEY ("APP", "COMPONENT", "KEY", "VO")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."CONFIG" MODIFY ("DESCR" CONSTRAINT "CONFIG_DESCR_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."CONFIG" MODIFY ("TYPE" CONSTRAINT "CONFIG_TYPE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."CONFIG" MODIFY ("VALUE" CONSTRAINT "CONFIG_VALUE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."CONFIG" MODIFY ("KEY" CONSTRAINT "CONFIG_KEY_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."CONFIG" MODIFY ("COMPONENT" CONSTRAINT "CONFIG_COMPONENT_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."CONFIG" MODIFY ("APP" CONSTRAINT "CONFIG_APP_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESOURCE_TYPES
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."RESOURCE_TYPES" ADD CONSTRAINT "RESOURCE_TYPES_PK" PRIMARY KEY ("RESOURCE_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table JEDI_EVENTS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" ADD CONSTRAINT "JEDI_EVENTS_PK" PRIMARY KEY ("JEDITASKID", "PANDAID", "FILEID", "JOB_PROCESSID")
  USING INDEX  LOCAL
 (PARTITION "JEDI_EVENTS_TASKSIDS_7400000") COMPRESS 1  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" MODIFY ("STATUS" CONSTRAINT "JEDI_EVENTS_STATUS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" MODIFY ("DATASETID" CONSTRAINT "JEDI_EVENTS_DATASETID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" MODIFY ("JOB_PROCESSID" CONSTRAINT "JEDI_EVENTS_PROCID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" MODIFY ("FILEID" CONSTRAINT "JEDI_EVENTS_FILEID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" MODIFY ("PANDAID" CONSTRAINT "JEDI_EVENTS_PANDAID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" MODIFY ("JEDITASKID" CONSTRAINT "JEDI_EVENTS_JEDITASKID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILESTABLE4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."FILESTABLE4" ADD CONSTRAINT "PART_FILESTABLE4_PK" PRIMARY KEY ("ROW_ID", "MODIFICATIONTIME")
  USING INDEX  LOCAL
 (PARTITION "PART_INITIAL_01011970")  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."FILESTABLE4" MODIFY ("FSIZE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."FILESTABLE4" MODIFY ("MODIFICATIONTIME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."FILESTABLE4" MODIFY ("PANDAID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."FILESTABLE4" MODIFY ("ROW_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HARVESTER_WORKERS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKERS" ADD CONSTRAINT "HARVESTER_WORKERS_PK" PRIMARY KEY ("HARVESTERID", "WORKERID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKERS" MODIFY ("STATUS" CONSTRAINT "HARV_WORKERS_STATUS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKERS" MODIFY ("LASTUPDATE" CONSTRAINT "HARV_WORKERS_LASTUPD_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKERS" MODIFY ("WORKERID" CONSTRAINT "HARV_WORKERS_WORKID_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKERS" MODIFY ("HARVESTERID" CONSTRAINT "HARV_WORKERS_HARVID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DATASETS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."DATASETS" ADD CONSTRAINT "DATASETS_VUID_MODIFDATE_PK" PRIMARY KEY ("VUID", "MODIFICATIONDATE")
  USING INDEX  LOCAL
 (PARTITION "DATASETS_BEFORE_01122011" )  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."DATASETS" MODIFY ("TRANSFERSTATUS" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."DATASETS" MODIFY ("MOVERID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."DATASETS" MODIFY ("MODIFICATIONDATE" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."DATASETS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."DATASETS" MODIFY ("VUID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TMP_PANDAIDS_RELATIONS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."TMP_PANDAIDS_RELATIONS" MODIFY ("NEWJOBID" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."TMP_PANDAIDS_RELATIONS" MODIFY ("PANDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HARVESTER_INSTANCES
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_INSTANCES" ADD CONSTRAINT "HARVESTER_INSTANCES_PK" PRIMARY KEY ("HARVESTER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table RETRYERRORS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."RETRYERRORS" ADD CONSTRAINT "RETRYERRORS_ID" PRIMARY KEY ("RETRYERROR_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."RETRYERRORS" MODIFY ("RETRYACTION" CONSTRAINT "RETRYACTION_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."RETRYERRORS" MODIFY ("ACTIVE" CONSTRAINT "ACTIVE_FLAG_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."RETRYERRORS" MODIFY ("ERRORCODE" CONSTRAINT "ERRORCODE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."RETRYERRORS" MODIFY ("ERRORSOURCE" CONSTRAINT "ERRORSOURCE_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."RETRYERRORS" MODIFY ("RETRYERROR_ID" CONSTRAINT "RETRYERROR_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HARVESTER_METRICS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_METRICS" MODIFY ("HARVESTER_ID" CONSTRAINT "HARVESTER_METRICS_HARV_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HARVESTER_SLOTS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_SLOTS" ADD CONSTRAINT "HARVERSTER_SLOTS_PK" UNIQUE ("PANDAQUEUENAME", "GSHARE", "RESOURCETYPE")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_SLOTS" MODIFY ("MODIFICATIONTIME" CONSTRAINT "HARV_MODIFICATIONTIME_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_SLOTS" MODIFY ("NUMSLOTS" CONSTRAINT "HARV_NUMSLOTS_NN" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_SLOTS" MODIFY ("PANDAQUEUENAME" CONSTRAINT "HARV_SLOTS_PANDAQUEUENAME_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TABLEPART4COPYING
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."TABLEPART4COPYING" ADD CONSTRAINT "TABLEPART4COPYING_PK" PRIMARY KEY ("TABLE_NAME", "PARTITION_NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."TABLEPART4COPYING" MODIFY ("COPIED_TO_ARCH" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."TABLEPART4COPYING" MODIFY ("PARTITION_NAME" NOT NULL ENABLE);
  ALTER TABLE "ATLAS_PANDA"."TABLEPART4COPYING" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITE_STATS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."SITE_STATS" ADD CONSTRAINT "SITE_STATS_PK" PRIMARY KEY ("SITE_NAME", "KEY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table HARVESTER_COMMANDS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMANDS" ADD CONSTRAINT "HARVESTER_COMMANDS_PK" PRIMARY KEY ("COMMAND_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMANDS" ADD CONSTRAINT "HARVESTER_COMMANDS_ACK_REQ_CHK" CHECK (ack_requested IN (0,1)) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DDM_ENDPOINT
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."DDM_ENDPOINT" ADD CONSTRAINT "DDM_SITE_FK" FOREIGN KEY ("SITE_NAME")
	  REFERENCES "ATLAS_PANDA"."SITE" ("SITE_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILESTABLE4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."FILESTABLE4" ADD CONSTRAINT "FILESTABLE4_FILEID_FK" FOREIGN KEY ("JEDITASKID", "DATASETID", "FILEID")
	  REFERENCES "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ("JEDITASKID", "DATASETID", "FILEID") ENABLE NOVALIDATE;
--------------------------------------------------------
--  Ref Constraints for Table GLOBAL_SHARES
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."GLOBAL_SHARES" ADD CONSTRAINT "GLOBAL_SHARES_PARENT_ID_FK" FOREIGN KEY ("PARENT")
	  REFERENCES "ATLAS_PANDA"."GLOBAL_SHARES" ("NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_COMMANDS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMANDS" ADD CONSTRAINT "HARVESTER_COMMANDS_INST_ID_FK" FOREIGN KEY ("HARVESTER_ID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_COMMAND_LOCK
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" ADD CONSTRAINT "HARVESTER_COMMAND_LOCK_ID_FK" FOREIGN KEY ("HARVESTER_ID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_COMMAND_LOCK" ADD CONSTRAINT "HARVESTER_COMMAND_LOCK_RES_FK" FOREIGN KEY ("RESOURCETYPE")
	  REFERENCES "ATLAS_PANDA"."RESOURCE_TYPES" ("RESOURCE_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_DIALOGS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_DIALOGS" ADD CONSTRAINT "HARVESTER_DIALOGS_HARV_ID_FK" FOREIGN KEY ("HARVESTER_ID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_METRICS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_METRICS" ADD CONSTRAINT "HARVESTER_METRIC_HARV_ID_FK" FOREIGN KEY ("HARVESTER_ID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_REL_JOBS_WORKERS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_REL_JOBS_WORKERS" ADD CONSTRAINT "HARVESTER_REL_JOBS_WORKERS_FK" FOREIGN KEY ("HARVESTERID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_WORKERS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKERS" ADD CONSTRAINT "HARVESTER_WORKERS_HARVID_FK" FOREIGN KEY ("HARVESTERID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_WORKER_STATS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" ADD CONSTRAINT "HARV_WORKER_STATS_ID_FK" FOREIGN KEY ("HARVESTER_ID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS" ADD CONSTRAINT "HARV_WORKER_STATS_RES_FK" FOREIGN KEY ("RESOURCETYPE")
	  REFERENCES "ATLAS_PANDA"."RESOURCE_TYPES" ("RESOURCE_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HARVESTER_WORKER_STATS_OLD
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" ADD CONSTRAINT "HARVESTER_WORKER_STATS_ID_FK" FOREIGN KEY ("HARVESTER_ID")
	  REFERENCES "ATLAS_PANDA"."HARVESTER_INSTANCES" ("HARVESTER_ID") ENABLE;
  ALTER TABLE "ATLAS_PANDA"."HARVESTER_WORKER_STATS_OLD" ADD CONSTRAINT "HARVESTER_WORKER_STATS_RES_FK" FOREIGN KEY ("RESOURCETYPE")
	  REFERENCES "ATLAS_PANDA"."RESOURCE_TYPES" ("RESOURCE_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_DATASETS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASETS" ADD CONSTRAINT "JEDI_DATASETS_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_DATASET_CONTENTS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ADD CONSTRAINT "JEDI_DATASETCONT_DATASETID_FK" FOREIGN KEY ("JEDITASKID", "DATASETID")
	  REFERENCES "ATLAS_PANDA"."JEDI_DATASETS" ("JEDITASKID", "DATASETID") ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_DATASET_CONTENTS" ADD CONSTRAINT "JEDI_DATASETCONT_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_EVENTS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_EVENTS" ADD CONSTRAINT "JEDI_EVENTS_TASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_JOBPARAMS_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_JOBPARAMS_TEMPLATE" ADD CONSTRAINT "JEDI_JOBPARTEMPL_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_JOB_RETRY_HISTORY
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_JOB_RETRY_HISTORY" ADD CONSTRAINT "JEDI_JOB_RETRY_HIST_TASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_OUTPUT_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" ADD CONSTRAINT "JEDI_OUTPUTTEMPL_DATASETID_FK" FOREIGN KEY ("JEDITASKID", "DATASETID")
	  REFERENCES "ATLAS_PANDA"."JEDI_DATASETS" ("JEDITASKID", "DATASETID") ENABLE;
  ALTER TABLE "ATLAS_PANDA"."JEDI_OUTPUT_TEMPLATE" ADD CONSTRAINT "JEDI_OUTPUTTEMPL_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_TASKPARAMS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKPARAMS" ADD CONSTRAINT "JEDI_TASKPARAMS_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JEDI_TASKS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JEDI_TASKS" ADD CONSTRAINT "JEDI_TASKS_WORKQUEUE_FK" FOREIGN KEY ("WORKQUEUE_ID")
	  REFERENCES "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JOBSACTIVE4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" ADD CONSTRAINT "JOBSACTIVE4_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE NOVALIDATE;
  ALTER TABLE "ATLAS_PANDA"."JOBSACTIVE4" ADD CONSTRAINT "JOBSACTIVE4_WORKQUEUE_ID_FK" FOREIGN KEY ("WORKQUEUE_ID")
	  REFERENCES "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_ID") ENABLE NOVALIDATE;
--------------------------------------------------------
--  Ref Constraints for Table JOBSARCHIVED4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" ADD CONSTRAINT "JOBSARCHIVED4_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE NOVALIDATE;
  ALTER TABLE "ATLAS_PANDA"."JOBSARCHIVED4" ADD CONSTRAINT "JOBSARCHIVED4_WORKQUEUE_ID_FK" FOREIGN KEY ("WORKQUEUE_ID")
	  REFERENCES "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_ID") ENABLE NOVALIDATE;
--------------------------------------------------------
--  Ref Constraints for Table JOBSDEBUG
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSDEBUG" ADD CONSTRAINT "JOBSDEBUG_PANDAID_FK" FOREIGN KEY ("PANDAID")
	  REFERENCES "ATLAS_PANDA"."JOBSACTIVE4" ("PANDAID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JOBSDEFINED4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" ADD CONSTRAINT "JOBSDEFINED4_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE NOVALIDATE;
  ALTER TABLE "ATLAS_PANDA"."JOBSDEFINED4" ADD CONSTRAINT "JOBSDEFINED4_WORKQUEUE_ID_FK" FOREIGN KEY ("WORKQUEUE_ID")
	  REFERENCES "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_ID") ENABLE NOVALIDATE;
--------------------------------------------------------
--  Ref Constraints for Table JOBSWAITING4
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" ADD CONSTRAINT "JOBSWAITING4_JEDITASKID_FK" FOREIGN KEY ("JEDITASKID")
	  REFERENCES "ATLAS_PANDA"."JEDI_TASKS" ("JEDITASKID") ENABLE NOVALIDATE;
  ALTER TABLE "ATLAS_PANDA"."JOBSWAITING4" ADD CONSTRAINT "JOBSWAITING4_WORKQUEUE_ID_FK" FOREIGN KEY ("WORKQUEUE_ID")
	  REFERENCES "ATLAS_PANDA"."JEDI_WORK_QUEUE" ("QUEUE_ID") ENABLE NOVALIDATE;

--------------------------------------------------------
--  Ref Constraints for Table PANDA_DDM_RELATION
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."PANDA_DDM_RELATION" ADD CONSTRAINT "PANDA_DDM_ENDPOINT_FK" FOREIGN KEY ("DDM_ENDPOINT_NAME")
	  REFERENCES "ATLAS_PANDA"."DDM_ENDPOINT" ("DDM_ENDPOINT_NAME") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ATLAS_PANDA"."PANDA_DDM_RELATION" ADD CONSTRAINT "PANDA_SITE_FK" FOREIGN KEY ("PANDA_SITE_NAME")
	  REFERENCES "ATLAS_PANDA"."PANDA_SITE" ("PANDA_SITE_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PANDA_SITE
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."PANDA_SITE" ADD CONSTRAINT "DEFAULT_DDM_ENDPOINT_FK" FOREIGN KEY ("DEFAULT_DDM_ENDPOINT")
	  REFERENCES "ATLAS_PANDA"."DDM_ENDPOINT" ("DDM_ENDPOINT_NAME") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ATLAS_PANDA"."PANDA_SITE" ADD CONSTRAINT "SITE_FK" FOREIGN KEY ("SITE_NAME")
	  REFERENCES "ATLAS_PANDA"."SITE" ("SITE_NAME") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ATLAS_PANDA"."PANDA_SITE" ADD CONSTRAINT "STORAGE_SITE_NAME_FK" FOREIGN KEY ("STORAGE_SITE_NAME")
	  REFERENCES "ATLAS_PANDA"."SITE" ("SITE_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RETRYERRORS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."RETRYERRORS" ADD CONSTRAINT "RETRYERRORS_RETRYACTION_FK" FOREIGN KEY ("RETRYACTION")
	  REFERENCES "ATLAS_PANDA"."RETRYACTIONS" ("RETRYACTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SITE_STATS
--------------------------------------------------------

  ALTER TABLE "ATLAS_PANDA"."SITE_STATS" ADD CONSTRAINT "SITE_STATS_SITE_NAME_FK" FOREIGN KEY ("SITE_NAME")
	  REFERENCES "ATLAS_PANDA"."SITE" ("SITE_NAME") ON DELETE CASCADE ENABLE;



