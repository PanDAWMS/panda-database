-- CPU summary by site / queue / CPU arch
CREATE MATERIALIZED VIEW "ATLAS_PANDA"."MV_WORKER_NODE_SUMMARY"
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
START WITH SYSDATE
NEXT SYSDATE + 1/24
AS
SELECT
    wn.site,
    wnq.panda_queue,
    wn.cpu_architecture_level,
    SUM(wn.n_logical_cpus) AS total_logical_cpus,
    ROUND(
        100 * SUM(wn.n_logical_cpus)
        / SUM(SUM(wn.n_logical_cpus)) OVER (PARTITION BY wnq.panda_queue),
        2
    ) AS pct_within_pq
FROM atlas_panda.worker_node wn, atlas_panda.worker_node_queue wnq
WHERE wnq.last_seen > sysdate - interval '1' month
AND wn.site = wnq.site AND wn.host_name = wnq.host_name
GROUP BY wn.site, wnq.panda_queue, wn.cpu_architecture_level;

-- GPU inventory summary (per host configuration) by site/queue
CREATE MATERIALIZED VIEW "ATLAS_PANDA"."MV_WORKER_NODE_GPU_SUMMARY"
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
START WITH SYSDATE
NEXT SYSDATE + 1/24
AS
SELECT
  wng.site,
  wnq.panda_queue,
  wng.vendor,
  wng.model,
  wng.vram,
  wng.framework,
  wng.framework_version,
  wng.count AS gpus_per_host,
  COUNT(*) AS host_count
FROM ATLAS_PANDA.worker_node_gpus wng,
     ATLAS_PANDA.worker_node_queue wnq
WHERE wnq.last_seen > SYSDATE - INTERVAL '1' MONTH
  AND wng.site = wnq.site
  AND wng.host_name = wnq.host_name
GROUP BY
  wng.site,
  wnq.panda_queue,
  wng.vendor,
  wng.model,
  wng.vram,
  wng.framework,
  wng.framework_version,
  wng.count;