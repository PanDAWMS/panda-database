-- patch to be used to upgrade from version 0.0.27
CREATE TABLE doma_panda.error_descriptions (
    id BIGSERIAL PRIMARY KEY,
    component VARCHAR(32) NOT NULL,
    code INTEGER NOT NULL CHECK (code BETWEEN 0 AND 99999),
    acronym VARCHAR(64),
    diagnostics VARCHAR(256),
    description VARCHAR(4000),
    category SMALLINT NOT NULL
);

COMMENT ON COLUMN doma_panda.error_descriptions.id IS 'Unique identifier for each row (auto-increment)';
COMMENT ON COLUMN doma_panda.error_descriptions.component IS 'Name of the component';
COMMENT ON COLUMN doma_panda.error_descriptions.code IS 'The actual error code';
COMMENT ON COLUMN doma_panda.error_descriptions.acronym IS 'Short acronym or label for the error';
COMMENT ON COLUMN doma_panda.error_descriptions.diagnostics IS 'Brief error diagnostics';
COMMENT ON COLUMN doma_panda.error_descriptions.description IS 'Detailed description of the error';
COMMENT ON COLUMN doma_panda.error_descriptions.category IS 'ID of error category';

ALTER TABLE doma_panda.error_descriptions OWNER TO panda;

-- Create table to store GPU information for worker nodes
CREATE TABLE doma_panda.worker_node_gpus (
    site VARCHAR(128),
    host_name VARCHAR(128),
    vendor VARCHAR(128),
    model VARCHAR(128),
    count INTEGER,
    vram BIGINT,
    architecture VARCHAR(128),
    framework VARCHAR(128),
    framework_version VARCHAR(20),
    driver_version VARCHAR(20),
    last_seen TIMESTAMP,
    PRIMARY KEY (site, host_name, vendor, model)
);
-- Comments on worker_node_gpus table and columns
COMMENT ON TABLE doma_panda.worker_node_gpus IS
    'Stores information about the GPUs associated to a worker node seen by PanDA pilots';
COMMENT ON COLUMN doma_panda.worker_node_gpus.site IS
    'The name of the site (not PanDA queue) where the worker node is located.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.host_name IS
    'The hostname of the worker node.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.vendor IS
    'GPU vendor, e.g. NVIDIA.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.model IS
    'GPU model, e.g. A100 80GB.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.count IS
    'Number of GPUs of this type in the worker node.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.vram IS
    'VRAM memory in MB.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.architecture IS
    'GPU architecture, e.g. Tesla, Ampere.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.framework IS
    'Driver framework available, e.g. CUDA.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.framework_version IS
    'Version of the driver framework, e.g. 12.2';
COMMENT ON COLUMN doma_panda.worker_node_gpus.driver_version IS
    'Version of the driver, e.g. 575.51.03.';
COMMENT ON COLUMN doma_panda.worker_node_gpus.last_seen IS
    'Timestamp of the last time the worker node was active.';

-- Index on last_seen for efficient time-based queries
CREATE INDEX idx_worker_node_gpu_last_seen
    ON doma_panda.worker_node_gpus (last_seen);

ALTER TABLE doma_panda.worker_node_gpus OWNER TO panda;

-- Extend doma_panda.data_carousel_requests table
ALTER TABLE doma_panda.data_carousel_requests
ADD COLUMN last_staged_time TIMESTAMP,
ADD COLUMN locked_by VARCHAR(64),
ADD COLUMN lock_time TIMESTAMP;

-- Comments for new columns in data_carousel_requests
COMMENT ON COLUMN doma_panda.data_carousel_requests.last_staged_time IS
    'Last time of update about staged files';
COMMENT ON COLUMN doma_panda.data_carousel_requests.locked_by IS
    'The process which locks the request entry';
COMMENT ON COLUMN doma_panda.data_carousel_requests.lock_time IS
    'Timestamp when the request entry was locked';

-- Update schema version
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 28
WHERE component = 'JEDI';

UPDATE doma_panda.pandadb_version
SET major = 0, minor = 0, patch = 28
WHERE component = 'SERVER';

COMMIT;