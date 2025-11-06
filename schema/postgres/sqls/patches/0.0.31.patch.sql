-- patch to be used to upgrade from version 0.0.30
-- =========================
-- Table: WORKER_NODE_QUEUE
-- =========================
CREATE TABLE IF NOT EXISTS doma_panda.worker_node_queue (
  site        VARCHAR(128),
  host_name   VARCHAR(128),
  panda_queue VARCHAR(128),
  last_seen   timestamp,
  CONSTRAINT pk_worker_node_queue PRIMARY KEY (site, host_name, panda_queue)
);

-- ===========================================
-- MV: MV_WORKER_NODE_SUMMARY  (partition = pq)
-- ===========================================
CREATE MATERIALIZED VIEW IF NOT EXISTS doma_panda.mv_worker_node_summary AS
SELECT
    wn.site,
    wnq.panda_queue,
    wn.cpu_architecture_level,
    SUM(wn.n_logical_cpus) AS total_logical_cpus,
    ROUND(
      (SUM(wn.n_logical_cpus)::numeric * 100)
      / NULLIF(SUM(SUM(wn.n_logical_cpus)) OVER (PARTITION BY wnq.panda_queue), 0)::numeric
    , 2) AS pct_within_pq
FROM doma_panda.worker_node       AS wn,
     doma_panda.worker_node_queue AS wnq
WHERE wnq.last_seen > (CURRENT_TIMESTAMP - INTERVAL '1 month')
  AND wn.site      = wnq.site
  AND wn.host_name = wnq.host_name
GROUP BY wn.site, wnq.panda_queue, wn.cpu_architecture_level
WITH NO DATA;

CREATE UNIQUE INDEX IF NOT EXISTS ux_mv_wn_summary
  ON doma_panda.mv_worker_node_summary (site, panda_queue, cpu_architecture_level);

-- ===============================================
-- MV: MV_WORKER_NODE_GPU_SUMMARY (per-host config)
-- ===============================================
CREATE MATERIALIZED VIEW IF NOT EXISTS doma_panda.mv_worker_node_gpu_summary AS
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
WHERE wnq.last_seen > (CURRENT_TIMESTAMP - INTERVAL '1 month')
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

CREATE UNIQUE INDEX IF NOT EXISTS ux_mv_wn_gpu_summary
  ON doma_panda.mv_worker_node_gpu_summary
  (site, panda_queue, vendor, model, vram, framework, framework_version, gpus_per_host);

-- ===================
-- Initial population (must be non-concurrent the first time)
-- ===================
REFRESH MATERIALIZED VIEW doma_panda.mv_worker_node_summary;
REFRESH MATERIALIZED VIEW doma_panda.mv_worker_node_gpu_summary;

-- Update schema version
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 31
WHERE component = 'PanDA';
commit;