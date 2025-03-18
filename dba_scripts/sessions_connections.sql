-- Retrieve all active sessions for a specific user
SELECT * FROM GV$SESSION WHERE username = 'ATLAS_PANDABIGMON_R';

-- Count how many users are connected to the database per instance and service
SELECT inst_id, service_name, username, COUNT(*)
FROM GV$SESSION
GROUP BY inst_id, service_name, username
ORDER BY inst_id, service_name, username;

-- List connection sources for a specific account, with login timestamps
SELECT os_username, userhost, COUNT(*), MAX(timestamp)
FROM sys.dba_audit_session
WHERE username = 'ATLAS_PANDA_READER'
  AND action_name = 'LOGON'
GROUP BY os_username, userhost
ORDER BY MAX(timestamp) DESC;

-- List all users who logged in within the last 24 hours
SELECT os_username, userhost, timestamp
FROM sys.dba_audit_session
WHERE username = 'ATLAS_PANDA_READER'
  AND action_name = 'LOGON'
  AND timestamp > SYSDATE - INTERVAL '24' HOUR
ORDER BY timestamp DESC;
