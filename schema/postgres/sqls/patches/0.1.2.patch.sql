-- patch to be used to upgrade from version 0.1.1

SET search_path = doma_pandabigmon,public;

CREATE SEQUENCE auth_permission_id_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE auth_permission_id_seq OWNER TO panda;
CREATE SEQUENCE django_content_type_id_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE django_content_type_id_seq OWNER TO panda;

ALTER TABLE authtoken_token
  ALTER COLUMN user_id TYPE bigint USING user_id::bigint,
  ALTER COLUMN user_id SET NOT NULL;


CREATE TABLE auth_permission (
    id integer NOT NULL,
    name varchar(255),
    content_type_id integer NOT NULL,
    codename varchar(100)
);
ALTER TABLE auth_permission OWNER TO panda;
CREATE UNIQUE INDEX sys_c002462743 ON auth_permission (id ASC);
CREATE INDEX auth_perm_content_ty_2f476e4b ON auth_permission (content_type_id ASC);
CREATE UNIQUE INDEX auth_perm_content_t_01ab375a_u ON auth_permission (content_type_id ASC, codename ASC);

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label varchar(100),
    model varchar(100)
);
ALTER TABLE django_content_type OWNER TO panda;
CREATE UNIQUE INDEX django_content_type_idx ON django_content_type (id ASC);
CREATE UNIQUE INDEX django_content_type_idx_comb_label_model ON django_content_type (app_label ASC, model ASC);

DROP TRIGGER IF EXISTS auth_permission_tr ON auth_permission CASCADE;
CREATE OR REPLACE FUNCTION trigger_fct_auth_permission_tr() RETURNS trigger AS $BODY$
BEGIN
    SELECT nextval('auth_permission_id_seq')
    INTO STRICT NEW.id;
RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION trigger_fct_auth_permission_tr() OWNER TO panda;

CREATE TRIGGER auth_permission_tr
	BEFORE INSERT ON auth_permission FOR EACH ROW
	EXECUTE PROCEDURE trigger_fct_auth_permission_tr();


DROP TRIGGER IF EXISTS django_content_type_tr ON django_content_type CASCADE;

CREATE OR REPLACE FUNCTION trigger_fct_django_content_type_tr() RETURNS trigger AS $BODY$
BEGIN
        SELECT nextval('django_content_type_id_seq')
        INTO STRICT NEW.id;
RETURN NEW;
END;
$BODY$
 LANGUAGE 'plpgsql';

ALTER FUNCTION trigger_fct_django_content_type_tr() OWNER TO panda;

CREATE TRIGGER django_content_type_tr
	BEFORE INSERT ON django_content_type FOR EACH ROW
	EXECUTE PROCEDURE trigger_fct_django_content_type_tr();

SET search_path = doma_panda,public;
-- =========================
-- Version bump
-- =========================
UPDATE doma_panda.pandadb_version
SET major = 0, minor = 1, patch = 2
WHERE component = 'PanDA';
