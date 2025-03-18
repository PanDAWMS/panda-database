-- Retrieve all tablespaces containing 'PANDA' in their name
SELECT tablespace_name
FROM dba_tablespaces
WHERE tablespace_name LIKE '%PANDA%'
ORDER BY tablespace_name;

-- Retrieve tablespace quotas for ATLAS_PANDA users
SELECT *
FROM DBA_TS_QUOTAS
WHERE USERNAME LIKE 'ATLAS_PANDA%'
ORDER BY USERNAME;

-- Retrieve tablespace usage statistics (size vs free space)
SELECT b.tablespace_name, tbs_size AS SizeMb, a.free_space AS FreeMb
FROM (
    -- Calculate free space per tablespace
    SELECT tablespace_name, ROUND(SUM(bytes)/1024/1024,2) AS free_space
    FROM dba_free_space
    GROUP BY tablespace_name
) a,
(
    -- Calculate total size per tablespace
    SELECT tablespace_name, SUM(bytes)/1024/1024 AS tbs_size
    FROM dba_data_files
    GROUP BY tablespace_name
) b
WHERE a.tablespace_name(+) = b.tablespace_name;
