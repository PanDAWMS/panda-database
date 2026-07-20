-- patch to be used to upgrade from version 0.1.5

SET search_path = doma_panda,public;

-- ===============================================
-- Index on jedi_tasks (reqid, username) for reqID->taskIDs lookup (ATLASPANDA-1766)
-- ===============================================

-- The query "SELECT jeditaskid FROM jedi_tasks WHERE username=? AND modificationtime>sysdate-90 AND reqid=?"
-- was doing a full table scan across all partitions because jedi_tasks is partitioned by jeditaskid
-- and no index existed on reqid or username. A composite index on (reqid, username) allows Oracle/PG
-- to resolve the equality predicates directly and skip the full scan entirely.
CREATE INDEX IF NOT EXISTS jedi_tasks_reqid_idx ON doma_panda.jedi_tasks (reqid, username);

-- ===============================================
-- New space columns on ddm_endpoint (ATLASPANDA-1806, ATLASPANDA-1805)
-- ===============================================

ALTER TABLE doma_panda.ddm_endpoint ADD COLUMN IF NOT EXISTS space_min_free bigint;
ALTER TABLE doma_panda.ddm_endpoint ADD COLUMN IF NOT EXISTS space_unavailable bigint;

COMMENT ON COLUMN doma_panda.ddm_endpoint.space_min_free IS 'Min_free target space of a DDM endpoint as reported by Rucio. Below this value Rucio deletes secondary data. Value in GB';
COMMENT ON COLUMN doma_panda.ddm_endpoint.space_unavailable IS 'Unavailable space of a DDM endpoint as reported by Rucio. This is the amount of data yet to be transferred. Value in GB';

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 6
WHERE component = 'PanDA';
