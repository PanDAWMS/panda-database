--------------------------------------------------------
--  File created - Thursday-November-17-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure DO_GRANTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ATLAS_PANDABIGMON"."DO_GRANTS" (obj_type varchar2, obj_name varchar2,owner_name varchar2)
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN

	 -- need to put " " around the object names, because some users create the objects with preserved character case.
	IF (obj_name NOT IN ('DO_GRANTS','GRANTS_UPDATE','CREATE_SYN4EXIST_OBJ') AND substr(obj_name,1,4)<>'BIN$' AND substr(obj_name,1,4)<>'SYS_' ) THEN

		IF obj_type IN ('TABLE') THEN
        	 	execute immediate 'GRANT SELECT,INSERT,UPDATE,DELETE on "'||obj_name||'" to ATLAS_PANDABIGMON_W';
		        execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDABIGMON_R';
		elsif obj_type = 'SEQUENCE' THEN
	        	execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDABIGMON_W';
		        execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDABIGMON_R';
		elsif obj_type IN ('VIEW', 'MATERIALIZED VIEW') THEN
			privs := ' SELECT,INSERT,UPDATE,DELETE ' ;
			FOR i IN 1..2 LOOP /*if fails on the first loop with error 01720, then goes to the EXEPTION and changes the statement */
				BEGIN
					execute immediate 'GRANT '|| privs ||' on "'|| obj_name||'" to ATLAS_PANDABIGMON_W';
				        execute immediate 'GRANT SELECT on "'||obj_name||'" to ATLAS_PANDABIGMON_R';
					EXIT;
				EXCEPTION
					WHEN grant_on_view_failed THEN
						privs := ' SELECT ' ;
				END;
			END LOOP;
		elsif obj_type IN ('PROCEDURE', 'PACKAGE','FUNCTION', 'TYPE') AND obj_name <> 'CREATE_SYN' THEN
	         	execute immediate 'GRANT EXECUTE on "'||obj_name||'" to ATLAS_PANDABIGMON_W';
		        execute immediate 'GRANT EXECUTE on "'||obj_name||'" to ATLAS_PANDABIGMON_R';
		END IF;
	END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure GRANT_PRIVS4EXIST_OBJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ATLAS_PANDABIGMON"."GRANT_PRIVS4EXIST_OBJ" (owner_name varchar2 ) AUTHID DEFINER
AS
	grant_on_view_failed EXCEPTION;
	PRAGMA EXCEPTION_INIT(grant_on_view_failed, -01720);
	privs VARCHAR2(100);
BEGIN
 -- need to put " " around the object names, because some users create the objects with preserved character case.
	-- IMPORTANT - GRANT OBJECT PRIVILEGES FIRST TO THE TABLES
	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDABIGMON' AND object_type = 'TABLE' AND substr(object_name,1,4)<>'BIN$' AND substr(object_name,1,4)<>'SYS_') LOOP
       	 	execute immediate 'GRANT SELECT,INSERT,UPDATE,DELETE on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_W';
	        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_R';
	END LOOP;

	FOR rec in (SELECT object_name as obj_name, object_type as obj_type FROM all_objects WHERE owner = 'ATLAS_PANDABIGMON' AND object_type IN
	('VIEW','SEQUENCE','PROCEDURE', 'PACKAGE', 'FUNCTION', 'MATERIALIZED VIEW', 'TYPE' ) ORDER BY object_type DESC ) LOOP

		IF rec.obj_name NOT IN ('DO_GRANTS','GRANTS_UPDATE','GRANT_PRIVS4EXIST_OBJ') THEN
			IF rec.obj_type IN ('VIEW', 'MATERIALIZED VIEW' ) THEN
				privs := ' SELECT,INSERT,UPDATE,DELETE ' ;
				FOR i IN 1..2 LOOP /*if fails on the first loop with error 01720, then goes to the EXEPTION and changes the statement */
					BEGIN
						execute immediate 'GRANT '|| privs ||' on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_W';
					        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_R';
						EXIT;
					EXCEPTION
						WHEN grant_on_view_failed THEN
						privs := ' SELECT ' ;
					END;
				END LOOP;
			elsif rec.obj_type = 'SEQUENCE' THEN
	        		execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_W';
			        execute immediate 'GRANT SELECT on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_R';
			elsif rec.obj_type IN ('PROCEDURE', 'PACKAGE','FUNCTION', 'TYPE') AND rec.obj_name <> 'CREATE_SYN' THEN
		         	execute immediate 'GRANT EXECUTE on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_W';
			        execute immediate 'GRANT EXECUTE on "'||rec.obj_name||'" to ATLAS_PANDABIGMON_R';
			END IF;
		END IF;
	END LOOP;
END;

/

