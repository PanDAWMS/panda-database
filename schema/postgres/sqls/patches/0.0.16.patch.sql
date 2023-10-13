-- patch to be used to upgrade from version 0.0.15

-- MODIFICATIONTIME TRIGGER
-- New column JEDI_TASKS.REALMODIFICATIONTIME
ALTER TABLE jedi_tasks ADD realmodificationtime timestamp;
COMMENT ON COLUMN jedi_tasks.realmodificationtime IS E'Set ALWAYS to last modification time, without any tricks like old timestamps';

CREATE INDEX jedi_tasks_realmodtime_idx ON jedi_tasks (realmodificationtime);

-- Trigger to set JEDI_TASKS.REALMODIFICATIONTIME to current UTC timestamp
DROP TRIGGER IF EXISTS update_realmodificationtime ON jedi_tasks CASCADE;
-- Trigger to set JEDI_TASKS.REALMODIFICATIONTIME to current UTC timestamp
CREATE OR REPLACE FUNCTION update_realmodificationtime_trg() RETURNS trigger AS $BODY$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		NEW.realmodificationtime := CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
        ELSIF (TG_OP = 'UPDATE') THEN
		IF NEW.modificationtime <> OLD.modificationtime THEN
		        NEW.realmodificationtime := CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
	        END IF;
        END IF;
RETURN NEW;
END
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION update_realmodificationtime_trg() OWNER TO panda;

CREATE TRIGGER update_realmodificationtime
	BEFORE INSERT OR UPDATE ON jedi_tasks FOR EACH ROW
	EXECUTE PROCEDURE update_realmodificationtime_trg();
/

-- SQL_QUEUE TABLE

CREATE TABLE sql_queue
   (
    topic varchar(50),
    pandaid bigint,
    execution_order integer,
    jeditaskid bigint,
    creationtime timestamp,
    data VARCHAR(4000)
   );

CREATE INDEX sql_queue_topic_task_idx ON sql_queue (topic, jeditaskid);
CREATE INDEX sql_queue_topic_creationtime_idx ON sql_queue (topic, creationtime);
COMMENT ON TABLE sql_queue IS E'Queue to send messages between agents';
COMMENT ON COLUMN sql_queue.topic IS E'Topic of the message';
COMMENT ON COLUMN sql_queue.pandaid IS E'Job ID';
COMMENT ON COLUMN sql_queue.execution_order IS E'In case multiple SQLs need to be executed together';
COMMENT ON COLUMN sql_queue.jeditaskid IS E'JEDI Task ID in case the messages want to be batched';
COMMENT ON COLUMN sql_queue.creationtime IS E'Timestamp when the message was created';
COMMENT ON COLUMN sql_queue.data IS E'CLOB in JSON format containing the SQL query and variables';
ALTER TABLE sql_queue ADD PRIMARY KEY (topic, pandaid, execution_order);
ALTER TABLE sql_queue OWNER TO panda;

-- Update versions
UPDATE pandadb_version SET major=0, minor=0, patch=16 where component='JEDI';
UPDATE pandadb_version SET major=0, minor=0, patch=16 where component='SERVER';
COMMIT;