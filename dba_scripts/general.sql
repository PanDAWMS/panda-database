-- Retrieve Oracle version details
SELECT * FROM v$version;

-- Get the diagnostic trace location for troubleshooting
SELECT * FROM v$diag_info WHERE name = 'Diag Trace';

-- Check the default temporary tablespace
SELECT * FROM database_properties
WHERE property_name = 'DEFAULT_TEMP_TABLESPACE';

-- List all background processes
SELECT * FROM v$bgprocess;

-- Display shared global area (SGA) memory usage
SELECT * FROM v$sgastat;