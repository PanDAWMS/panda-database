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