SET client_encoding TO 'UTF8';

SET search_path = doma_panda,public;

\set ON_ERROR_STOP ON

SET check_function_bodies = false;

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
