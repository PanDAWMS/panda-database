-- patch to be used to upgrade from version 0.1.4

SET search_path = doma_panda,public;

-- ===============================================
-- New tables for async processing (PANDA-1754)
-- ===============================================

CREATE TABLE IF NOT EXISTS doma_panda.machine_heartbeat (
    machine_name varchar(128) NOT NULL,
    service_name varchar(64)  NOT NULL,
    last_seen    TIMESTAMP,
    CONSTRAINT machine_heartbeat_pk PRIMARY KEY (machine_name)
);
COMMENT ON TABLE  doma_panda.machine_heartbeat              IS 'Liveness registry updated by async_request_daemon on each cycle; used to snapshot expected machines at request submission time';
COMMENT ON COLUMN doma_panda.machine_heartbeat.machine_name IS 'Hostname of the machine (e.g. aipanda090)';
COMMENT ON COLUMN doma_panda.machine_heartbeat.service_name IS 'Logical service this machine belongs to (e.g. server, jedi)';
COMMENT ON COLUMN doma_panda.machine_heartbeat.last_seen    IS 'Timestamp of the last daemon heartbeat';
ALTER TABLE doma_panda.machine_heartbeat OWNER TO panda;


CREATE TABLE IF NOT EXISTS doma_panda.async_requests (
    request_id        varchar(64)  NOT NULL,
    request_type      varchar(64)  NOT NULL,
    service_name      varchar(64),
    machine_name      varchar(128),
    parameters        TEXT,
    expected_machines TEXT,
    created_at        TIMESTAMP,
    CONSTRAINT async_requests_pk PRIMARY KEY (request_id)
);
CREATE INDEX IF NOT EXISTS async_req_target_idx ON doma_panda.async_requests (service_name, machine_name);
COMMENT ON TABLE  doma_panda.async_requests                   IS 'One row per submitted async request; records what to do and which machines are expected to process it';
COMMENT ON COLUMN doma_panda.async_requests.request_id        IS 'UUID identifying this request; returned to the caller at submission time for polling';
COMMENT ON COLUMN doma_panda.async_requests.request_type      IS 'Type of work to perform (e.g. grep); drives handler dispatch in async_request_daemon';
COMMENT ON COLUMN doma_panda.async_requests.service_name      IS 'If set, every alive machine in this service processes the request; mutually exclusive with machine_name';
COMMENT ON COLUMN doma_panda.async_requests.machine_name      IS 'If set, only this specific machine processes the request; mutually exclusive with service_name';
COMMENT ON COLUMN doma_panda.async_requests.parameters        IS 'JSON object with request-type-specific inputs, e.g. {"pattern":"ERROR","log_filename":"panda.log"}';
COMMENT ON COLUMN doma_panda.async_requests.expected_machines IS 'JSON array of hostnames snapshotted from machine_heartbeat at submission time; used by get_result to determine overall completion';
COMMENT ON COLUMN doma_panda.async_requests.created_at        IS 'Submission timestamp; used as the basis for TTL-based cleanup';
ALTER TABLE doma_panda.async_requests OWNER TO panda;


CREATE TABLE IF NOT EXISTS doma_panda.async_results (
    request_id   varchar(64)   NOT NULL,
    machine_name varchar(128)  NOT NULL,
    status       varchar(16)   DEFAULT 'running',
    result       TEXT,
    stderr       TEXT,
    return_code  smallint,
    truncated    smallint      DEFAULT 0,
    error_msg    varchar(2048),
    attempts     smallint      DEFAULT 0,
    started_at   TIMESTAMP,
    finished_at  TIMESTAMP,
    CONSTRAINT async_results_pk PRIMARY KEY (request_id, machine_name),
    CONSTRAINT async_results_req_fk FOREIGN KEY (request_id) REFERENCES doma_panda.async_requests(request_id)
);
CREATE INDEX IF NOT EXISTS async_results_req_idx ON doma_panda.async_results (request_id);
COMMENT ON TABLE  doma_panda.async_results              IS 'One row per (request x machine); inserted when a machine first claims a request; persists across retries';
COMMENT ON COLUMN doma_panda.async_results.request_id   IS 'FK to async_requests.request_id';
COMMENT ON COLUMN doma_panda.async_results.machine_name IS 'Hostname of the machine processing this result';
COMMENT ON COLUMN doma_panda.async_results.status       IS 'Processing status: pending (awaiting retry), running (in progress), done (success), failed (error/timeout/max-retries)';
COMMENT ON COLUMN doma_panda.async_results.result       IS 'Output of the async operation (e.g. grep stdout); NULL until status = done';
COMMENT ON COLUMN doma_panda.async_results.stderr       IS 'Stderr of the async operation';
COMMENT ON COLUMN doma_panda.async_results.return_code  IS 'Return code of the async operation';
COMMENT ON COLUMN doma_panda.async_results.truncated    IS '1 if result was cut off at 1 MB due to size; 0 otherwise';
COMMENT ON COLUMN doma_panda.async_results.error_msg    IS 'Error description when status = failed (e.g. timeout, max retries exceeded)';
COMMENT ON COLUMN doma_panda.async_results.attempts     IS 'Number of processing attempts made by this machine; incremented on each claim; capped at max_retries (default 3)';
COMMENT ON COLUMN doma_panda.async_results.started_at   IS 'Timestamp when this machine most recently began processing';
COMMENT ON COLUMN doma_panda.async_results.finished_at  IS 'Timestamp when this machine completed processing; NULL while status = running or pending';
ALTER TABLE doma_panda.async_results OWNER TO panda;

-- ===============================================
-- New column to skip files in DT RSEs (PANDA-1755)
-- ===============================================
ALTER TABLE doma_panda.jedi_dataset_contents ADD COLUMN IF NOT EXISTS constituent_id bigint;
COMMENT ON COLUMN doma_panda.jedi_dataset_contents.constituent_id IS 'Constituent dataset ID to which the file belongs within the dataset container';

-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 5
WHERE component = 'PanDA';
