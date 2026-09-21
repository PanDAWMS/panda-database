-- patch to be used to upgrade from version 0.1.7

SET search_path = doma_pandabigmon,public;

-- ===============================================
-- Add missing sequence and trigger for auth_user_groups.id
-- auth_user_groups already has rows on live deployments, so the
-- sequence is advanced past the current max id before the trigger
-- goes live, to avoid colliding with existing primary keys.
-- ===============================================

CREATE SEQUENCE auth_user_group_id_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE auth_user_group_id_seq OWNER TO panda;

SELECT setval('auth_user_group_id_seq', COALESCE((SELECT MAX(id) FROM auth_user_groups), 0) + 1, false);

DROP TRIGGER IF EXISTS auth_user_group_tr ON auth_user_groups CASCADE;
CREATE OR REPLACE FUNCTION trigger_fct_auth_user_group_tr() RETURNS trigger AS $BODY$
BEGIN
        SELECT nextval('auth_user_group_id_seq')
        INTO STRICT NEW.id;
RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION trigger_fct_auth_user_group_tr() OWNER TO panda;

CREATE TRIGGER auth_user_group_tr
	BEFORE INSERT ON auth_user_groups FOR EACH ROW
	EXECUTE PROCEDURE trigger_fct_auth_user_group_tr();

SET search_path = doma_panda,public;
-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 8
WHERE component = 'PanDA';
