-- patch to be used to upgrade from version 0.0.28
CREATE INDEX wn_metrics_timestamp_idx ON doma_panda.worker_node_metrics ("timestamp");

UPDATE "ATLAS_PANDA"."PANDADB_VERSION" SET major=0, minor=0, patch=29 where component ='JEDI';
UPDATE "ATLAS_PANDA"."PANDADB_VERSION" SET major=0, minor=0, patch=29 where component ='SERVER';
commit;