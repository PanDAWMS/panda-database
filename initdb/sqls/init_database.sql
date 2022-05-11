CREATE DATABASE panda_db;
CREATE USER panda PASSWORD 'password';
ALTER ROLE panda SET search_path = doma_panda,public;
CREATE EXTENSION pg_cron;
GRANT USAGE ON SCHEMA cron TO panda;
\c panda_db;
CREATE SCHEMA partman;
CREATE EXTENSION pg_partman SCHEMA partman;