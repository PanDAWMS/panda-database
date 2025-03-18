-- Retrieve the top 10 SQL queries consuming the most CPU
SELECT * FROM (
    SELECT sql_text, buffer_gets, disk_reads, sorts, cpu_time/1000000 AS cpu_sec, executions, rows_processed
    FROM v$sqlstats
    ORDER BY cpu_time DESC
)
WHERE rownum < 10;

-- Retrieve the top 10 SQL queries consuming the most disk reads
SELECT sql_id, child_number, sql_text, disk_reads
FROM (
    SELECT sql_id, child_number, sql_text, elapsed_time, cpu_time, disk_reads,
           RANK() OVER (ORDER BY disk_reads DESC) AS sql_rank
    FROM v$sql
)
WHERE sql_rank < 10;

-- Show CPU usage by active sessions
SELECT ss.username, se.SID, VALUE/100 AS cpu_usage_seconds, ss.program, ss.logon_time
FROM v$session ss, v$sesstat se, v$statname sn
WHERE se.STATISTIC# = sn.STATISTIC#
AND sn.NAME LIKE '%CPU used by this session%'
AND se.SID = ss.SID
AND ss.status = 'ACTIVE'
AND ss.username IS NOT NULL
ORDER BY VALUE DESC;

-- Retrieve CPU, buffer, and disk usage by each query execution
SELECT * FROM (
    SELECT a.sid AS session_id, a.sql_id, a.status, a.cpu_time/1000000 AS cpu_sec,
           a.buffer_gets, a.disk_reads, b.sql_text
    FROM v$sql_monitor a, v$sql b
    WHERE a.sql_id = b.sql_id
    ORDER BY a.cpu_time DESC
)
WHERE rownum <= 20;

-- Monitor active queries consuming the most disk reads
SELECT * FROM (
    SELECT a.sid AS session_id, a.sql_id, a.status, a.cpu_time/1000000 AS cpu_sec,
           a.buffer_gets, a.disk_reads, SUBSTR(b.sql_text, 1, 35) AS sql_text
    FROM v$sql_monitor a, v$sql b
    WHERE a.sql_id = b.sql_id
    AND a.status = 'EXECUTING'
    ORDER BY a.disk_reads DESC
)
WHERE rownum <= 20;

-- Find the sessions running queries with the highest buffer gets
SELECT * FROM (
    SELECT s.sid, s.username, s.sql_id, sa.elapsed_time/1000000, sa.cpu_time/1000000, sa.buffer_gets, sa.sql_text
    FROM v$sqlarea sa, v$session s
    WHERE s.sql_hash_value = sa.hash_value
    AND s.sql_address = sa.address
    AND s.username IS NOT NULL
    ORDER BY sa.buffer_gets DESC
)
WHERE rownum <= 10;

-- Retrieve session-level CPU usage and connection details
SELECT NVL(a.username, '(oracle)') AS username, a.osuser, a.sid, a.serial#, c.value,
       a.lockwait, a.status, a.module, a.machine, a.program,
       TO_CHAR(a.logon_Time, 'DD-MON-YYYY HH24:MI:SS') AS logon_time
FROM v$session a, v$sesstat c, v$statname d
WHERE a.sid = c.sid
AND c.statistic# = d.statistic#
AND d.name = 'CPU used by this session'
ORDER BY c.value DESC;



