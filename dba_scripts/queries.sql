-- Retrieve details about a specific query using its SQL ID
SELECT * FROM gv$sql WHERE sql_id = '38wz5rhvkjyh3';

-- Retrieve bind variables associated with a query
SELECT * FROM gv$sql_bind_capture WHERE sql_id = '38wz5rhvkjyh3';

-- Count how many queries each service is executing
SELECT service, COUNT(*)
FROM gv$sql
GROUP BY service;

-- Count how many queries a specific user is running on each instance
SELECT inst_id, COUNT(*)
FROM gv$sql
WHERE parsing_schema_name = 'ATLAS_PANDAANALYTICS_R'
GROUP BY inst_id;

-- Retrieve all queries executed by a specific user
SELECT * FROM gv$sql
WHERE parsing_schema_name = 'ATLAS_GRISLI_R';

-- Count queries executed by different applications (e.g., Python, SQL Developer)
SELECT module, COUNT(*)
FROM gv$sql
WHERE parsing_schema_name = 'ATLAS_PANDAANALYTICS_R'
  AND inst_id = 4
GROUP BY module
ORDER BY 2;

-- Monitor progress of long-running queries
COLUMN percent FORMAT 999.99;
SELECT sid, TO_CHAR(start_time, 'HH24:MI:SS') AS stime,
       message, (sofar/totalwork)*100 AS percent
FROM v$session_longops
WHERE sofar/totalwork < 1;