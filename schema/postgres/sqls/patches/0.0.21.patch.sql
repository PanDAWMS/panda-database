-- patch to be used to upgrade from version 0.0.20
CREATE SEQUENCE doma_panda.jedi_data_carousel_request_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START 1;
ALTER SEQUENCE doma_panda.jedi_data_carousel_request_id_seq OWNER TO panda;

ALTER TABLE doma_panda.jedi_tasks ADD COLUMN job_label varchar(20);
ALTER TABLE doma_panda.jedi_tasks ADD COLUMN framework varchar(50);
COMMENT ON COLUMN doma_panda.jedi_tasks.framework IS E'Submission framework that was used to generate the task';

CREATE TABLE data_carousel_requests (
    "request_id" bigint NOT NULL,
    "dataset" varchar(256) NOT NULL,
    "source_rse" varchar(64),
    "destination_rse" varchar(64),
    "ddm_rule_id" varchar(64),
    "status" varchar(32),
    "total_files" bigint,
    "staged_files" bigint,
    "dataset_size" bigint,
    "staged_size" bigint,
    "creation_time" timestamp,
    "start_time" timestamp,
    "end_time" timestamp,
    "modification_time" timestamp,
    "check_time" timestamp
);
COMMENT ON TABLE data_carousel_requests IS E'Table of Data Carousel requests';
COMMENT ON COLUMN data_carousel_requests.request_id IS E'Sequential ID of the request, generated from PostgreSQL sequence object jedi_data_carousel_request_id_seq when new request is inserted';
COMMENT ON COLUMN data_carousel_requests.dataset IS E'Dataset to stage';
COMMENT ON COLUMN data_carousel_requests.source_rse IS E'Source RSE (usually tape) of staging';
COMMENT ON COLUMN data_carousel_requests.destination_rse IS E'Destination RSE (usually DATADISK) of staging';
COMMENT ON COLUMN data_carousel_requests.ddm_rule_id IS E'DDM rule ID of the staging rule';
COMMENT ON COLUMN data_carousel_requests.status IS E'Status of the request';
COMMENT ON COLUMN data_carousel_requests.total_files IS E'Number of total files of the dataset';
COMMENT ON COLUMN data_carousel_requests.staged_files IS E'Number of files already staged';
COMMENT ON COLUMN data_carousel_requests.dataset_size IS E'Size in bytes of the dataset';
COMMENT ON COLUMN data_carousel_requests.staged_size IS E'Size in bytes of files already staged';
COMMENT ON COLUMN data_carousel_requests.creation_time IS E'Timestamp when the request is created';
COMMENT ON COLUMN data_carousel_requests.start_time IS E'Timestamp when the request starts staging';
COMMENT ON COLUMN data_carousel_requests.end_time IS E'Timestamp when the request ended';
COMMENT ON COLUMN data_carousel_requests.modification_time IS E'Timestamp of the last request update';
COMMENT ON COLUMN data_carousel_requests.check_time IS E'Last time when the request was checked';
ALTER TABLE data_carousel_requests OWNER TO panda;
ALTER TABLE data_carousel_requests ADD PRIMARY KEY (request_id);


CREATE TABLE data_carousel_relations (
    "request_id" bigint NOT NULL,
    "task_id" bigint NOT NULL
);
COMMENT ON TABLE data_carousel_relations IS E'Table of mapping between Data Carousel requests and tasks';
COMMENT ON COLUMN data_carousel_relations.request_id IS E'ID of the request';
COMMENT ON COLUMN data_carousel_relations.task_id IS E'ID of the task';
ALTER TABLE data_carousel_relations OWNER TO panda;
ALTER TABLE data_carousel_relations ADD PRIMARY KEY (request_id);

-- Update versions
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=21 where component='JEDI';
UPDATE doma_panda.pandadb_version SET major=0, minor=0, patch=21 where component='SERVER';
COMMIT;
