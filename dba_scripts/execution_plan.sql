-- This script retrieves execution plan hints for a given SQL query.
-- Usage: Pass the SQL_ID as a parameter.
SELECT *
FROM TABLE(dbms_xplan.display_cursor('&1', NULL, 'ADVANCED OUTLINE ALLSTATS LAST +PEEKED_BINDS'));