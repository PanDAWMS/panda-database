-- Generated by Ora2Pg, the Oracle database Schema converter, version 23.2
-- Copyright 2000-2022 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:ADCR

SET client_encoding TO 'UTF8';

SET search_path = doma_panda,public;
\set ON_ERROR_STOP ON

SET check_function_bodies = false;

CREATE OR REPLACE FUNCTION doma_panda.bitor ( P_BITS1 integer, P_BITS2 integer ) RETURNS integer AS $body$
BEGIN
     RETURN P_BITS1 | P_BITS2;
END;
$body$
LANGUAGE PLPGSQL
;
ALTER FUNCTION doma_panda.bitor ( P_BITS1 integer, P_BITS2 integer ) OWNER TO panda;
