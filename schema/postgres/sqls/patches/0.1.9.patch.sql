-- patch to be used to upgrade from version 0.1.8

SET search_path = doma_panda,public;

-- ===============================================
-- Add table to record task command history (ATLASPANDA-1919)
-- ===============================================

CREATE SEQUENCE IF NOT EXISTS doma_panda.tasks_commandlog_id_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE doma_panda.tasks_commandlog_id_seq OWNER TO panda;

CREATE TABLE IF NOT EXISTS doma_panda.tasks_commandlog (
    "command_id"     BIGINT      NOT NULL,
    "jeditaskid"     BIGINT      NOT NULL,
    "command"        VARCHAR(64) NOT NULL,
    "parameters"     JSONB,
    "requester"      VARCHAR(256),
    "prod_role"      SMALLINT,
    "client_addr"    VARCHAR(64),
    "server_host"    VARCHAR(128),
    "command_time"   TIMESTAMP   NOT NULL,
    "status"         VARCHAR(16) NOT NULL,
    "status_time"    TIMESTAMP   NOT NULL,
    "status_reason"  VARCHAR(256),
    "response"       JSONB,
    "response_time"  TIMESTAMP,
    PRIMARY KEY ("command_id", "jeditaskid", "command_time")
) PARTITION BY RANGE ("command_time");

COMMENT ON TABLE doma_panda.tasks_commandlog IS 'Task commands received through the PanDA API, one row per task per command, with what became of each command';
COMMENT ON COLUMN doma_panda.tasks_commandlog."command_id" IS 'ID of the API request, from tasks_commandlog_id_seq. Shared by the rows of a request that targets several tasks';
COMMENT ON COLUMN doma_panda.tasks_commandlog."jeditaskid" IS 'Task the command targets';
COMMENT ON COLUMN doma_panda.tasks_commandlog."command" IS 'Name of the API endpoint, e.g. retry or change_attribute';
COMMENT ON COLUMN doma_panda.tasks_commandlog."parameters" IS 'Arguments of the request other than the task ID, as JSON';
COMMENT ON COLUMN doma_panda.tasks_commandlog."requester" IS 'User name of the requester, the compact form of the DN';
COMMENT ON COLUMN doma_panda.tasks_commandlog."prod_role" IS '1 if the requester had a production role, otherwise 0';
COMMENT ON COLUMN doma_panda.tasks_commandlog."client_addr" IS 'Address of the client that sent the command';
COMMENT ON COLUMN doma_panda.tasks_commandlog."server_host" IS 'PanDA server host that received the command';
COMMENT ON COLUMN doma_panda.tasks_commandlog."command_time" IS 'Time the command was received, in UTC';
COMMENT ON COLUMN doma_panda.tasks_commandlog."status" IS 'Where the command is: received, responded, error, queued, accepted, rejected or superseded';
COMMENT ON COLUMN doma_panda.tasks_commandlog."status_time" IS 'Time STATUS last changed, in UTC';
COMMENT ON COLUMN doma_panda.tasks_commandlog."status_reason" IS 'Why STATUS moved on from queued: the task status change, the reason JEDI rejected it, or the command that superseded it';
COMMENT ON COLUMN doma_panda.tasks_commandlog."response" IS 'Response the API returned to the client, as JSON';
COMMENT ON COLUMN doma_panda.tasks_commandlog."response_time" IS 'Time the API returned the response, in UTC';

ALTER TABLE doma_panda.tasks_commandlog OWNER TO panda;

CREATE INDEX IF NOT EXISTS tasks_commandlog_taskid_idx ON doma_panda.tasks_commandlog ("jeditaskid");

SELECT partman.create_parent(
    p_parent_table => 'doma_panda.tasks_commandlog',
    p_control => 'command_time',
    p_type => 'range',
    p_interval => '1 month',
    p_premake => 3
);
UPDATE partman.part_config
SET infinite_time_partitions = true,
    retention = '13 months',
    retention_keep_table = false
WHERE parent_table = 'doma_panda.tasks_commandlog';

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 9
WHERE component = 'PanDA';
