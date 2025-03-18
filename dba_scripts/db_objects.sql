show all
-- Set output format to CSV for better readability
SET SQLFORMAT CSV

-- Retrieve all tables belonging to ATLAS_PANDA schemas, along with their tablespaces
SELECT owner, tablespace_name, table_name
FROM DBA_ALL_TABLES
WHERE OWNER LIKE 'ATLAS_PANDA%'
ORDER BY owner, tablespace_name, table_name

-- Retrieve information about all database instances and their associated hosts
SELECT inst_id, INSTANCE_NUMBER, INSTANCE_NAME, HOST_NAME
FROM gv$instance
ORDER BY inst_id;
