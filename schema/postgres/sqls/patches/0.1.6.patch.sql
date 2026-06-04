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

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 6
WHERE component = 'PanDA';
