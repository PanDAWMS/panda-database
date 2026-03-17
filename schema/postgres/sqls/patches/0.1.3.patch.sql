-- patch to be used to upgrade from version 0.1.2

SET search_path = doma_panda,public;

-- ===============================================
-- Fix MV_WORKER_NODE_GPU_SUMMARY: filter on wng.last_seen instead of wnq.last_seen
-- Worker nodes that stop reporting GPU info (e.g. nvidia-smi not found) should
-- be excluded based on when GPU data was last seen, not when the queue was last seen.
-- ===============================================
DROP MATERIALIZED VIEW IF EXISTS doma_panda.mv_worker_node_gpu_summary;

CREATE MATERIALIZED VIEW doma_panda.mv_worker_node_gpu_summary AS
SELECT
  wng.site,
  wnq.panda_queue,
  wng.vendor,
  wng.model,
  wng.vram,
  wng.framework,
  wng.framework_version,
  wng.count AS gpus_per_host,
  COUNT(*)  AS host_count
FROM doma_panda.worker_node_gpus  AS wng,
     doma_panda.worker_node_queue AS wnq
WHERE wng.last_seen > (CURRENT_TIMESTAMP - INTERVAL '1 month')
  AND wng.site      = wnq.site
  AND wng.host_name = wnq.host_name
GROUP BY
  wng.site,
  wnq.panda_queue,
  wng.vendor,
  wng.model,
  wng.vram,
  wng.framework,
  wng.framework_version,
  wng.count
WITH NO DATA;

ALTER MATERIALIZED VIEW doma_panda.mv_worker_node_gpu_summary OWNER TO panda;

CREATE UNIQUE INDEX ux_mv_wn_gpu_summary
  ON doma_panda.mv_worker_node_gpu_summary
  (site, panda_queue, vendor, model, vram, framework, framework_version, gpus_per_host);

REFRESH MATERIALIZED VIEW doma_panda.mv_worker_node_gpu_summary;

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 3
WHERE component = 'PanDA';
