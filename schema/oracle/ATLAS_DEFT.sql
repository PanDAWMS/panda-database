-- This file collects the mandatory tables to have a running panda installation, but does not attempt to have a full ProdSys schema

-- Schema definition for T_ACTION_STAGING
  CREATE TABLE "ATLAS_PANDA"."T_ACTION_STAGING"
   (	"ACT_ST_ID" NUMBER(12,0) NOT NULL ENABLE,
	"STEP_ACTION_ID" NUMBER(12,0) NOT NULL ENABLE,
	"DATASET_STAGING_ID" NUMBER(12,0) NOT NULL ENABLE,
	"TASKID" NUMBER(12,0) NOT NULL ENABLE,
	"SHARE_NAME" VARCHAR2(20 BYTE),
	 CONSTRAINT "T_ACTION_STAGING_TASKID_ID_NN" CHECK ("TASKID" IS NOT NULL) ENABLE,
	 CONSTRAINT "T_ACTION_STAGING_ID_NN" CHECK ("ACT_ST_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "T_ACTION_STAGING_DATASET_ID_NN" CHECK ("DATASET_STAGING_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "T_ACTION_STAGING_ACT_ID_NN" CHECK ("STEP_ACTION_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "T_ACTION_STAGING_FK2" FOREIGN KEY ("DATASET_STAGING_ID")
	  REFERENCES "ATLAS_PANDA"."T_DATASET_STAGING" ("DATASET_STAGING_ID") ENABLE
   );
  CREATE UNIQUE INDEX "ATLAS_PANDA"."T_ACTION_STAGING_PK" ON "ATLAS_PANDA"."T_ACTION_STAGING" ("ACT_ST_ID");
ALTER TABLE "ATLAS_PANDA"."T_ACTION_STAGING" ADD CONSTRAINT "T_ACTION_STAGING_PK" PRIMARY KEY ("ACT_ST_ID")
  USING INDEX "ATLAS_PANDA"."T_ACTION_STAGING_PK"  ENABLE;


  GRANT SELECT ON "ATLAS_PANDA"."T_ACTION_STAGING" TO "ATLAS_PANDABIGMON_R";
  GRANT DELETE ON "ATLAS_PANDA"."T_ACTION_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT INSERT ON "ATLAS_PANDA"."T_ACTION_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_ACTION_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT UPDATE ON "ATLAS_PANDA"."T_ACTION_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_ACTION_STAGING" TO "ATLAS_PANDA_READER";

-- Schema definition for T_DATASET_STAGING
  CREATE TABLE "ATLAS_PANDA"."T_DATASET_STAGING"
   (	"DATASET_STAGING_ID" NUMBER(12,0) NOT NULL ENABLE,
	"DATASET" VARCHAR2(256 BYTE) NOT NULL ENABLE,
	"STATUS" VARCHAR2(20 BYTE),
	"TAPE_STATUS_ID" NUMBER(12,0),
	"STAGED_FILES" NUMBER(10,0),
	"START_TIME" TIMESTAMP (6),
	"END_TIME" TIMESTAMP (6),
	"RSE" VARCHAR2(100 BYTE),
	"TOTAL_FILES" NUMBER(10,0),
	"UPDATE_TIME" TIMESTAMP (6),
	"SOURCE_RSE" VARCHAR2(200 BYTE),
	 CONSTRAINT "T_DATASET_STAGING_ID_NN" CHECK ("DATASET_STAGING_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "T_DATASET_STAGING_DATASET_NN" CHECK ("DATASET" IS NOT NULL) ENABLE
   );
  CREATE UNIQUE INDEX "ATLAS_PANDA"."T_DATASET_STAGING_PK" ON "ATLAS_PANDA"."T_DATASET_STAGING" ("DATASET_STAGING_ID");
ALTER TABLE "ATLAS_PANDA"."T_DATASET_STAGING" ADD CONSTRAINT "T_DATASET_STAGING_PK" PRIMARY KEY ("DATASET_STAGING_ID")
  USING INDEX "ATLAS_PANDA"."T_DATASET_STAGING_PK"  ENABLE;


  GRANT SELECT ON "ATLAS_PANDA"."T_DATASET_STAGING" TO "ATLAS_PANDABIGMON_R";
  GRANT DELETE ON "ATLAS_PANDA"."T_DATASET_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT INSERT ON "ATLAS_PANDA"."T_DATASET_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_DATASET_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT UPDATE ON "ATLAS_PANDA"."T_DATASET_STAGING" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_DATASET_STAGING" TO "ATLAS_PANDA_READER";

-- Schema definition for PRODSYS_COMM
  CREATE TABLE "ATLAS_PANDA"."PRODSYS_COMM"
   (	"COMM_TASK" NUMBER(12,0) NOT NULL ENABLE,
	"COMM_META" NUMBER(12,0),
	"COMM_OWNER" VARCHAR2(16 BYTE),
	"COMM_CMD" VARCHAR2(256 BYTE),
	"COMM_TS" NUMBER(12,0),
	"COMM_COMMENT" VARCHAR2(128 BYTE),
	"COMM_PARAMETERS" CLOB
   );

  CREATE UNIQUE INDEX "ATLAS_PANDA"."PRODSYS_COMM_PK" ON "ATLAS_PANDA"."PRODSYS_COMM" ("COMM_TASK") LOCAL;


  GRANT SELECT ON "ATLAS_PANDA"."PRODSYS_COMM" TO "ATLAS_PANDABIGMON_R";
  GRANT DELETE ON "ATLAS_PANDA"."PRODSYS_COMM" TO "ATLAS_PANDA_WRITER";
  GRANT INSERT ON "ATLAS_PANDA"."PRODSYS_COMM" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."PRODSYS_COMM" TO "ATLAS_PANDA_WRITER";
  GRANT UPDATE ON "ATLAS_PANDA"."PRODSYS_COMM" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."PRODSYS_COMM" TO "ATLAS_PANDA_READER";


-- Schema definition for T_HASHTAG
  CREATE TABLE "ATLAS_PANDA"."T_HASHTAG"
   (	"HT_ID" NUMBER(10,0) NOT NULL ENABLE,
	"HASHTAG" VARCHAR2(80 BYTE) NOT NULL ENABLE,
	"TYPE" VARCHAR2(20 BYTE) NOT NULL ENABLE,
	 CONSTRAINT "T_HASHTAG_PK" PRIMARY KEY ("HT_ID") ENABLE,
	 CONSTRAINT "HT_ID_NN" CHECK ("HT_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "HASHTAG_TYPE_NN" CHECK ("TYPE" IS NOT NULL) ENABLE,
	 CONSTRAINT "HASHTAG_NN" CHECK ("HASHTAG" IS NOT NULL) ENABLE
   );
  CREATE UNIQUE INDEX "ATLAS_PANDA"."T_HASHTAG_UQ" ON "ATLAS_PANDA"."T_HASHTAG" ("HASHTAG");
ALTER TABLE "ATLAS_PANDA"."T_HASHTAG" ADD CONSTRAINT "T_HASHTAG_UQ" UNIQUE ("HASHTAG")
  USING INDEX "ATLAS_PANDA"."T_HASHTAG_UQ"  ENABLE;


  GRANT SELECT ON "ATLAS_PANDA"."T_HASHTAG" TO "ATLAS_PANDABIGMON_R";
  GRANT SELECT ON "ATLAS_PANDA"."T_HASHTAG" TO "ATLAS_PANDABIGMON_TB";
  GRANT DELETE ON "ATLAS_PANDA"."T_HASHTAG" TO "ATLAS_PANDA_WRITER";
  GRANT INSERT ON "ATLAS_PANDA"."T_HASHTAG" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_HASHTAG" TO "ATLAS_PANDA_WRITER";
  GRANT UPDATE ON "ATLAS_PANDA"."T_HASHTAG" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_HASHTAG" TO "ATLAS_PANDA_READER";

-- Schema definition for T_PRODUCTION_TASK
  CREATE TABLE "ATLAS_PANDA"."T_PRODUCTION_TASK"
   (	"TASKID" NUMBER(12,0) NOT NULL ENABLE,
	"STEP_ID" NUMBER(12,0) NOT NULL ENABLE,
	"PR_ID" NUMBER(12,0) NOT NULL ENABLE,
	"PARENT_TID" NUMBER(12,0),
	"TASKNAME" VARCHAR2(255 BYTE),
	"PROJECT" VARCHAR2(60 CHAR) NOT NULL ENABLE,
	"DSN" VARCHAR2(12 BYTE),
	"PHYS_SHORT" VARCHAR2(80 BYTE),
	"SIMULATION_TYPE" VARCHAR2(20 BYTE),
	"PHYS_GROUP" VARCHAR2(20 CHAR),
	"PROVENANCE" VARCHAR2(12 BYTE),
	"STATUS" VARCHAR2(12 CHAR),
	"TOTAL_EVENTS" NUMBER(10,0) DEFAULT 0,
	"TOTAL_REQ_JOBS" NUMBER(10,0) DEFAULT 0,
	"TOTAL_DONE_JOBS" NUMBER(10,0) DEFAULT 0,
	"SUBMIT_TIME" TIMESTAMP (6) NOT NULL ENABLE,
	"START_TIME" TIMESTAMP (6),
	"TIMESTAMP" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP,
	"PPTIMESTAMP" TIMESTAMP (6),
	"POSTPRODUCTION" VARCHAR2(150 BYTE),
	"PRIORITY" NUMBER(5,0),
	"UPDATE_TIME" TIMESTAMP (6),
	"UPDATE_OWNER" VARCHAR2(24 BYTE),
	"COMMENTS" VARCHAR2(256 BYTE),
	"INPUTDATASET" VARCHAR2(255 BYTE),
	"PHYSICS_TAG" VARCHAR2(20 BYTE),
	"VO" VARCHAR2(16 BYTE),
	"PRODSOURCELABEL" VARCHAR2(20 BYTE),
	"USERNAME" VARCHAR2(128 BYTE),
	"CURRENT_PRIORITY" NUMBER(5,0),
	"CHAIN_TID" NUMBER(12,0),
	"REFERENCE" VARCHAR2(50 BYTE),
	"DYNAMIC_JOB_DEFINITION" NUMBER(1,0),
	"BUG_REPORT" NUMBER(12,0),
	"CAMPAIGN" VARCHAR2(32 BYTE),
	"TOTAL_REQ_EVENTS" NUMBER(10,0) DEFAULT 0,
	"JEDI_INFO" VARCHAR2(256 BYTE),
	"PILEUP" NUMBER(1,0),
	"NFILESTOBEUSED" NUMBER(10,0),
	"NFILESUSED" NUMBER(10,0),
	"NFILESFINISHED" NUMBER(10,0),
	"NFILESFAILED" NUMBER(10,0),
	"NFILESONHOLD" NUMBER(10,0),
	"SUBCAMPAIGN" VARCHAR2(32 BYTE),
	"BUNCHSPACING" VARCHAR2(32 BYTE),
	"IS_EXTENSION" NUMBER(1,0),
	"TTCR_TIMESTAMP" TIMESTAMP (6),
	"TTCJ_TIMESTAMP" TIMESTAMP (6),
	"TTCJ_UPDATE_TIME" TIMESTAMP (6),
	"ENDTIME" DATE,
	"PPFLAG" NUMBER(3,0) DEFAULT -1,
	"PPGRACEPERIOD" NUMBER(4,0) DEFAULT 48,
	"PRIMARY_INPUT" VARCHAR2(255 BYTE),
	"PRIMARY_INPUT_NEVENTS" NUMBER(10,0),
	"PRIMARY_INPUT_NFILES" NUMBER(10,0),
	"CTAG" VARCHAR2(15 BYTE),
	"OUTPUT_FORMATS" VARCHAR2(250 BYTE),
	 CONSTRAINT "T_PROD_PROJECT_NN" CHECK ("PROJECT" IS NOT NULL) ENABLE,
	 CONSTRAINT "TASKID_NN" CHECK ("TASKID" IS NOT NULL) ENABLE,
	 CONSTRAINT "STEPID_NN" CHECK ("STEP_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "PRID_NN" CHECK ("PR_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "LIMIT_PPGRACEPERIOD_VALUE" CHECK (PPGRACEPERIOD < 8784) ENABLE
   )
  PARTITION BY LIST ("PROJECT")
 (PARTITION "INITIAL_PARTITION"  VALUES ('Initial_partition') SEGMENT CREATION DEFERRED );
  CREATE UNIQUE INDEX "ATLAS_PANDA"."T_PRODUCTION_TASK_PART_PK" ON "ATLAS_PANDA"."T_PRODUCTION_TASK" ("TASKID");
ALTER TABLE "ATLAS_PANDA"."T_PRODUCTION_TASK" ADD CONSTRAINT "T_PRODUCTION_TASK_PART_PK" PRIMARY KEY ("TASKID")
  USING INDEX "ATLAS_PANDA"."T_PRODUCTION_TASK_PART_PK"  ENABLE;

  CREATE INDEX "ATLAS_PANDA"."T_PRODUCTION_TASK_PR_ID_IDX" ON "ATLAS_PANDA"."T_PRODUCTION_TASK" ("PR_ID");

  CREATE INDEX "ATLAS_PANDA"."T_PRODUCTION_TASK_STEP_ID_IDX" ON "ATLAS_PANDA"."T_PRODUCTION_TASK" ("STEP_ID");

  CREATE INDEX "ATLAS_PANDA"."T_PROD_TASK_INPUTDATASET_IDX" ON "ATLAS_PANDA"."T_PRODUCTION_TASK" ("INPUTDATASET");

  CREATE INDEX "ATLAS_PANDA"."T_PROD_TASK_PRIMARYINPUT_IDX" ON "ATLAS_PANDA"."T_PRODUCTION_TASK" ("PRIMARY_INPUT");

  GRANT SELECT ON "ATLAS_PANDA"."T_PRODUCTION_TASK" TO "ATLAS_PANDABIGMON_R";
  GRANT DELETE ON "ATLAS_PANDA"."T_PRODUCTION_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT INSERT ON "ATLAS_PANDA"."T_PRODUCTION_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_PRODUCTION_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT UPDATE ON "ATLAS_PANDA"."T_PRODUCTION_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_PRODUCTION_TASK" TO "ATLAS_PANDA_READER";

-- Schema definition for T_HT_TO_TASK
  CREATE TABLE "ATLAS_PANDA"."T_HT_TO_TASK"
   (	"HT_ID" NUMBER(10,0) NOT NULL ENABLE,
	"TASKID" NUMBER(12,0) NOT NULL ENABLE,
	 CONSTRAINT "HT_TO_TASK_PK" PRIMARY KEY ("HT_ID", "TASKID") ENABLE,
	 CONSTRAINT "T_HT_TO_TASK_TASK_ID_NN" CHECK ("TASKID" IS NOT NULL) ENABLE,
	 CONSTRAINT "T_HT_TO_TASK_HT_ID_NN" CHECK ("HT_ID" IS NOT NULL) ENABLE,
	 CONSTRAINT "HT_TO_TASK_TASK_ID_FK" FOREIGN KEY ("TASKID")
	  REFERENCES "ATLAS_PANDA"."T_PRODUCTION_TASK" ("TASKID") ENABLE,
	 CONSTRAINT "HT_TO_TASK_HT_ID_FK" FOREIGN KEY ("HT_ID")
	  REFERENCES "ATLAS_PANDA"."T_HASHTAG" ("HT_ID") ENABLE
   );

  CREATE INDEX "ATLAS_PANDA"."T_HT_TO_TASK_TASKID_IDX" ON "ATLAS_PANDA"."T_HT_TO_TASK" ("TASKID");

  GRANT SELECT ON "ATLAS_PANDA"."T_HT_TO_TASK" TO "ATLAS_PANDABIGMON_R";
  GRANT SELECT ON "ATLAS_PANDA"."T_HT_TO_TASK" TO "ATLAS_PANDABIGMON_TB";
  GRANT DELETE ON "ATLAS_PANDA"."T_HT_TO_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT INSERT ON "ATLAS_PANDA"."T_HT_TO_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_HT_TO_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT UPDATE ON "ATLAS_PANDA"."T_HT_TO_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_HT_TO_TASK" TO "ATLAS_PANDA_READER";

-- Schema definition for T_TASK
  CREATE TABLE "ATLAS_PANDA"."T_TASK"
   (	"TASKID" NUMBER(12,0) NOT NULL ENABLE,
	"PARENT_TID" NUMBER(12,0),
	"STATUS" VARCHAR2(12 BYTE),
	"TOTAL_DONE_JOBS" NUMBER(10,0),
	"SUBMIT_TIME" TIMESTAMP (0) NOT NULL ENABLE,
	"START_TIME" TIMESTAMP (0),
	"TIMESTAMP" TIMESTAMP (0),
	"VO" VARCHAR2(16 BYTE),
	"PRODSOURCELABEL" VARCHAR2(20 BYTE),
	"TASKNAME" VARCHAR2(256 BYTE),
	"USERNAME" VARCHAR2(128 BYTE),
	"PRIORITY" NUMBER(5,0),
	"CURRENT_PRIORITY" NUMBER(5,0),
	"TOTAL_REQ_JOBS" NUMBER(10,0),
	"CHAIN_TID" NUMBER(12,0),
	"TOTAL_EVENTS" NUMBER(10,0),
	"JEDI_TASK_PARAMETERS" CLOB,
	"TOTAL_INPUT_EVENTS" NUMBER(10,0),
	 CONSTRAINT "T_TASK_TASKID_NN" CHECK ("TASKID" IS NOT NULL) ENABLE,
	 CONSTRAINT "T_TASK_SUBMIT_TIME_NN" CHECK ("SUBMIT_TIME" IS NOT NULL) ENABLE
   )
  PARTITION BY RANGE ("TASKID") INTERVAL (1000000)
 (PARTITION "INITIAL_PARTITION"  VALUES LESS THAN (1) SEGMENT CREATION DEFERRED) ;
  CREATE UNIQUE INDEX "ATLAS_PANDA"."T_TASK_PK_PART" ON "ATLAS_PANDA"."T_TASK" ("TASKID") LOCAL;
ALTER TABLE "ATLAS_PANDA"."T_TASK" ADD CONSTRAINT "T_TASK_PK_PART" PRIMARY KEY ("TASKID")
  USING INDEX "ATLAS_PANDA"."T_TASK_PK_PART"  ENABLE;

  CREATE INDEX "ATLAS_PANDA"."T_TASK_STATUS_PRODLABEL_IDX" ON "ATLAS_PANDA"."T_TASK" ("STATUS", "PRODSOURCELABEL") LOCAL;

  CREATE INDEX "ATLAS_PANDA"."T_TASK_TASKNAME_IDX" ON "ATLAS_PANDA"."T_TASK" ("TASKNAME") LOCAL;

  CREATE INDEX "ATLAS_PANDA"."T_TASK_USERNAME_IDX" ON "ATLAS_PANDA"."T_TASK" ("USERNAME") LOCAL;


  GRANT SELECT ON "ATLAS_PANDA"."T_TASK" TO "ATLAS_PANDABIGMON_R";
  GRANT DELETE ON "ATLAS_PANDA"."T_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT INSERT ON "ATLAS_PANDA"."T_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT UPDATE ON "ATLAS_PANDA"."T_TASK" TO "ATLAS_PANDA_WRITER";
  GRANT SELECT ON "ATLAS_PANDA"."T_TASK" TO "ATLAS_PANDA_READER";
