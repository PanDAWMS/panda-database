-- patch to be used to upgrade from version 0.1.9

SET search_path = doma_pandabigmon,public;

-- ===============================================
-- Add user_id and status columns to all_requests and all_requests_daily
-- ===============================================

ALTER TABLE all_requests ADD COLUMN user_id bigint;
ALTER TABLE all_requests ADD COLUMN status smallint;
ALTER TABLE all_requests_daily ADD COLUMN user_id bigint;
ALTER TABLE all_requests_daily ADD COLUMN status smallint;

SET search_path = doma_panda,public;

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 10
WHERE component = 'PanDA';
