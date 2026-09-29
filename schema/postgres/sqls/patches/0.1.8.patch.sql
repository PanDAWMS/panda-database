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

-- ===============================================
-- Add table for pilot attributes and job to clean old partitions
-- ===============================================

CREATE TABLE IF NOT EXISTS doma_panda.pilot_attributes (
    "pandaid" BIGINT NOT NULL,
    "pilot_version" VARCHAR(50),
    "attributes" JSONB,
    "modification_time" TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    PRIMARY KEY ("pandaid", "modification_time")
) PARTITION BY RANGE ("modification_time");

COMMENT ON TABLE doma_panda.pilot_attributes IS 'Attributes reported by the pilot for a job. Inserted once per job and never updated.';
COMMENT ON COLUMN doma_panda.pilot_attributes."pandaid" IS 'PandaID of the job';
COMMENT ON COLUMN doma_panda.pilot_attributes."pilot_version" IS 'Version of the pilot running';
COMMENT ON COLUMN doma_panda.pilot_attributes."attributes" IS 'Serialized JSON dictionary of pilot attributes';
COMMENT ON COLUMN doma_panda.pilot_attributes."modification_time" IS 'Timestamp of the last update, in UTC.';

ALTER TABLE doma_panda.pilot_attributes OWNER TO panda;

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.pilot_attributes',
    p_control => 'modification_time',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '3 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.pilot_attributes';

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 8
WHERE component = 'PanDA';
