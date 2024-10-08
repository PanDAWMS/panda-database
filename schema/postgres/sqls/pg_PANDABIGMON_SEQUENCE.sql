-- Generated by Ora2Pg, the Oracle database Schema converter, version 21.1
-- Copyright 2000-2020 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:PDBR

SET client_encoding TO 'UTF8';

SET search_path = doma_pandabigmon,public;
\set ON_ERROR_STOP ON

SET check_function_bodies = false;

CREATE SCHEMA IF NOT EXISTS doma_pandabigmon;
CREATE SEQUENCE all_requests_daily_id_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE all_requests_daily_id_seq OWNER TO panda;
CREATE SEQUENCE all_requests_id_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE all_requests_id_seq OWNER TO panda;
CREATE SEQUENCE all_requests_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE all_requests_seq OWNER TO panda;
CREATE SEQUENCE auth_group_id_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE auth_group_id_seq OWNER TO panda;
CREATE SEQUENCE auth_user_tr_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE auth_user_tr_seq OWNER TO panda;
CREATE SEQUENCE auth_user_user_id_p_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE auth_user_user_id_p_seq OWNER TO panda;
CREATE SEQUENCE django_migrations_id_p_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE django_migrations_id_p_seq OWNER TO panda;
CREATE SEQUENCE objects_comparison_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE objects_comparison_seq OWNER TO panda;
CREATE SEQUENCE request_stats_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE request_stats_seq OWNER TO panda;
CREATE SEQUENCE rucio_accounts_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE rucio_accounts_seq OWNER TO panda;
CREATE SEQUENCE social_auth_association_sq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE social_auth_association_sq OWNER TO panda;
CREATE SEQUENCE social_auth_code_sq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE social_auth_code_sq OWNER TO panda;
CREATE SEQUENCE social_auth_nonce_sq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE social_auth_nonce_sq OWNER TO panda;
CREATE SEQUENCE social_auth_partial_sq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE social_auth_partial_sq OWNER TO panda;
CREATE SEQUENCE social_auth_usersociala0419 INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE social_auth_usersociala0419 OWNER TO panda;
CREATE SEQUENCE user_settings_sq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE user_settings_sq OWNER TO panda;
CREATE SEQUENCE visits_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE visits_seq OWNER TO panda;
CREATE SEQUENCE rating_seq INCREMENT 1 MINVALUE 1 NO MAXVALUE START 1 CACHE 20;
ALTER SEQUENCE rating_seq OWNER TO panda;
