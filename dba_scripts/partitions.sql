-- Retrieve partitioned tables where table name is 'JOBS_STATUSLOG'
SELECT * FROM dba_part_tables
WHERE table_name = 'JOBS_STATUSLOG';

-- Find out which partition a record belongs to
SELECT dbms_rowid.rowid_object(ROWID) AS data_object_id
FROM atlas_panda.TASKS_STATUSLOG;

-- Retrieve object details for specific data object IDs
SELECT * FROM user_objects
WHERE data_object_id IN (26222557, 26222575);

-- Retrieve table partition details
SELECT table_name, partition_name, high_value
FROM dba_tab_partitions
WHERE table_name LIKE '%DATASETS'
ORDER BY table_name, partition_name;