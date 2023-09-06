ALTER SESSION set DDL_LOCK_TIMEOUT = 30;

-- MODIFICATIONTIME TRIGGER
-- New column JEDI_TASKS.REALMODIFICATIONTIME
ALTER TABLE "DOMA_PANDA"."JEDI_TASKS" ADD ("REALMODIFICATIONTIME" DATE);
COMMENT ON COLUMN "DOMA_PANDA"."JEDI_TASKS"."REALMODIFICATIONTIME" IS 'Set ALWAYS to last modification time, without any tricks like old timestamps';

CREATE INDEX "DOMA_PANDA"."JEDI_TASKS_REALMODTIME_IDX" ON "DOMA_PANDA"."JEDI_TASKS" ("REALMODIFICATIONTIME");

-- Trigger to set JEDI_TASKS.REALMODIFICATIONTIME to current UTC timestamp
CREATE OR REPLACE TRIGGER "DOMA_PANDA"."UPDATE_REALMODIFICATIONTIME"
BEFORE UPDATE OR INSERT OF MODIFICATIONTIME ON "DOMA_PANDA"."JEDI_TASKS"
FOR EACH ROW
BEGIN
    :NEW."REALMODIFICATIONTIME" := SYS_EXTRACT_UTC(systimestamp);
END;
/

-- SQL_QUEUE TABLE

CREATE TABLE "DOMA_PANDA"."SQL_QUEUE" 
   (	
    "TOPIC" VARCHAR2(50 BYTE),
    "PANDAID" NUMBER(11,0), 
    "EXECUTION_ORDER" NUMBER(5,0),
    "JEDITASKID" NUMBER(11,0), 
    "CREATIONTIME" DATE,
    "DATA" VARCHAR2(4000 BYTE),
    CONSTRAINT "SQL_QUEUE_PK" PRIMARY KEY ("TOPIC", "PANDAID", "EXECUTION_ORDER")
   );

CREATE INDEX "DOMA_PANDA"."SQL_QUEUE_TOPIC_TASK_IDX" ON "DOMA_PANDA"."SQL_QUEUE" ("TOPIC", "JEDITASKID");
CREATE INDEX "DOMA_PANDA"."SQL_QUEUE_TOPIC_CREATIONTIME_IDX" ON "DOMA_PANDA"."SQL_QUEUE" ("TOPIC", "CREATIONTIME");
   
COMMENT ON TABLE "DOMA_PANDA"."SQL_QUEUE" IS 'Queue to send messages between agents';   
COMMENT ON COLUMN "DOMA_PANDA"."SQL_QUEUE"."TOPIC" IS 'Topic of the message';
COMMENT ON COLUMN "DOMA_PANDA"."SQL_QUEUE"."PANDAID" IS 'Job ID';
COMMENT ON COLUMN "DOMA_PANDA"."SQL_QUEUE"."EXECUTION_ORDER" IS 'In case multiple SQLs need to be executed together';
COMMENT ON COLUMN "DOMA_PANDA"."SQL_QUEUE"."JEDITASKID" IS 'JEDI Task ID in case the messages want to be batched';
COMMENT ON COLUMN "DOMA_PANDA"."SQL_QUEUE"."CREATIONTIME" IS 'Timestamp when the message was created';
COMMENT ON COLUMN "DOMA_PANDA"."SQL_QUEUE"."DATA" IS 'CLOB in JSON format containing the SQL query and variables';

-- Update versions
UPDATE "DOMA_PANDA"."PANDADB_VERSION" SET major=0, minor=0, patch=16 where component='JEDI';
UPDATE "DOMA_PANDA"."PANDADB_VERSION" SET major=0, minor=0, patch=16 where component='SERVER';
COMMIT;