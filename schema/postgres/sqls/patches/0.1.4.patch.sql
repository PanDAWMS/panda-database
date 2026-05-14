-- patch to be used to upgrade from version 0.1.3

SET search_path = doma_panda,public;

-- ===============================================
-- Add architecture and driver_version to MV_WORKER_NODE_GPU_SUMMARY
-- These fields are available in worker_node_gpus but were not projected
-- into the summary MV, preventing their use in GPU brokerage.
-- ===============================================
DROP MATERIALIZED VIEW IF EXISTS doma_panda.mv_worker_node_gpu_summary;

CREATE MATERIALIZED VIEW doma_panda.mv_worker_node_gpu_summary AS
SELECT
  wng.site,
  wnq.panda_queue,
  wng.vendor,
  wng.model,
  wng.vram,
  wng.architecture,
  wng.framework,
  wng.framework_version,
  wng.driver_version,
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
  wng.architecture,
  wng.framework,
  wng.framework_version,
  wng.driver_version,
  wng.count
WITH NO DATA;

ALTER MATERIALIZED VIEW doma_panda.mv_worker_node_gpu_summary OWNER TO panda;

CREATE UNIQUE INDEX ux_mv_wn_gpu_summary
  ON doma_panda.mv_worker_node_gpu_summary
  (site, panda_queue, vendor, model, vram, architecture, framework, framework_version, driver_version, gpus_per_host);

REFRESH MATERIALIZED VIEW doma_panda.mv_worker_node_gpu_summary;

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 4
WHERE component = 'PanDA';
