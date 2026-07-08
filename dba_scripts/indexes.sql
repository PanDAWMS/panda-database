-- Check for UNUSABLE global (non-partitioned) indexes in ATLAS_PANDA.
-- These cause full table scans. Root cause is usually a DROP PARTITION
-- executed without UPDATE GLOBAL INDEXES.
SELECT index_name, table_name, status, index_type
FROM all_indexes
WHERE owner = 'ATLAS_PANDA'
AND status = 'UNUSABLE'
ORDER BY table_name, index_name;

-- Check for UNUSABLE partitions within partitioned indexes in ATLAS_PANDA.
SELECT index_name, partition_name, status
FROM all_ind_partitions
WHERE index_owner = 'ATLAS_PANDA'
AND status = 'UNUSABLE'
ORDER BY index_name, partition_name;

-- List all global (non-partitioned) indexes on partitioned tables in ATLAS_PANDA.
-- These are the ones at risk of becoming UNUSABLE after a DROP PARTITION
-- that omits UPDATE GLOBAL INDEXES.
SELECT i.index_name, i.table_name, i.status, i.uniqueness
FROM all_indexes i
JOIN all_part_tables t ON t.owner = i.owner AND t.table_name = i.table_name
WHERE i.owner = 'ATLAS_PANDA'
AND i.partitioned = 'NO'
ORDER BY i.table_name, i.index_name;

-- Rebuild a specific UNUSABLE global index (run manually as needed).
-- ONLINE is not supported for global non-partitioned indexes on interval-partitioned tables (ORA-14086).
-- Use DBMS_REPAIR.ONLINE_INDEX_CLEAN first if ORA-08104 is raised.
-- ALTER INDEX ATLAS_PANDA.<index_name> REBUILD;
