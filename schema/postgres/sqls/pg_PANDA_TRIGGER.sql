-- Generated by Ora2Pg, the Oracle database Schema converter, version 23.2
-- Copyright 2000-2022 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:ADCR

SET client_encoding TO 'UTF8';

SET search_path = doma_panda,public;
\set ON_ERROR_STOP ON

SET check_function_bodies = false;

DROP TRIGGER IF EXISTS jeditaskid_avoid_update_delete ON jedi_tasks CASCADE;
CREATE OR REPLACE FUNCTION trigger_fct_jeditaskid_avoid_update_delete() RETURNS trigger AS $BODY$
BEGIN
  BEGIN
	IF (OLD.jeditaskid <> NEW.jeditaskid) THEN
	     RAISE EXCEPTION '%', 'Update or delete on the JEDITASKID column values is not allowed!' USING ERRCODE = '45101';
	END IF;
  END;
IF TG_OP = 'DELETE' THEN
	RETURN OLD;
ELSE
	RETURN NEW;
END IF;

END
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION trigger_fct_jeditaskid_avoid_update_delete() OWNER TO panda;

CREATE TRIGGER jeditaskid_avoid_update_delete
	BEFORE UPDATE OR DELETE ON jedi_tasks FOR EACH ROW
	EXECUTE PROCEDURE trigger_fct_jeditaskid_avoid_update_delete();

DROP TRIGGER IF EXISTS jediworkqueueid_avoid_upd_del ON jedi_work_queue CASCADE;
CREATE OR REPLACE FUNCTION trigger_fct_jediworkqueueid_avoid_upd_del() RETURNS trigger AS $BODY$
BEGIN
  BEGIN
	IF (OLD.QUEUE_ID <> NEW.QUEUE_ID) THEN
	     RAISE EXCEPTION '%', 'Update or delete on the JEDI WORKQUEUE_ID column values is not allowed!' USING ERRCODE = '45101';
	END IF;
  END;
IF TG_OP = 'DELETE' THEN
	RETURN OLD;
ELSE
	RETURN NEW;
END IF;

END
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION trigger_fct_jediworkqueueid_avoid_upd_del() OWNER TO panda;

CREATE TRIGGER jediworkqueueid_avoid_upd_del
	BEFORE UPDATE OR DELETE ON jedi_work_queue FOR EACH ROW
	EXECUTE PROCEDURE trigger_fct_jediworkqueueid_avoid_upd_del();

DROP TRIGGER IF EXISTS update_amiflag_trig ON jedi_tasks CASCADE;
CREATE OR REPLACE FUNCTION trigger_fct_update_amiflag_trig() RETURNS trigger AS $BODY$
BEGIN

    -- 18th June 2018: combined BEFORE UPDATE trigger for five JEDI_TASKS columns
    IF ( coalesce(OLD.amiflag::text, '') = '' ) THEN
         NEW.AMIFLAG := 1;
    ELSE
         NEW.AMIFLAG := BITOR(OLD.AMIFLAG,1);
    END IF;
RETURN NEW;
END
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION trigger_fct_update_amiflag_trig() OWNER TO panda;

CREATE TRIGGER update_amiflag_trig
	BEFORE UPDATE OF status,campaign,vo,reqid,prodsourcelabel ON jedi_tasks FOR EACH ROW
	EXECUTE PROCEDURE trigger_fct_update_amiflag_trig();
