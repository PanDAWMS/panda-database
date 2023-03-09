CREATE OR REPLACE FUNCTION doma_panda.bitor ( P_BITS1 integer, P_BITS2 integer ) RETURNS integer AS \$body$
BEGIN
     RETURN P_BITS1 | P_BITS2;
END;
\$body$
LANGUAGE PLPGSQL
;
ALTER FUNCTION doma_panda.bitor ( P_BITS1 integer, P_BITS2 integer ) OWNER TO panda;
