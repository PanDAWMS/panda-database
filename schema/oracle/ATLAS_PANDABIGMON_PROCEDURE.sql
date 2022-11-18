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
--------------------------------------------------------
--  DDL for Procedure OLD_QUERY_JOBSPAGE_CUMULATIVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ATLAS_PANDABIGMON"."OLD_QUERY_JOBSPAGE_CUMULATIVE" 
(
REQUEST_TOKEN NUMBER,
RANGE_DAYS VARCHAR2,
WITH_RETRIALS VARCHAR2 default 'Y',
SHOW_RETRIED_PANDAIDS VARCHAR2 default 'N',
ATLASRELEASE VARCHAR2 default NULL,
ATTEMPTNR VARCHAR2 default NULL,
COMPUTINGSITE VARCHAR2 default NULL,
CLOUD VARCHAR2 default NULL,
EVENTSERVICE VARCHAR2 default NULL,
HOMEPACKAGE VARCHAR2 default NULL,
INPUTFILEPROJECT VARCHAR2 default NULL,
INPUTFILETYPE VARCHAR2 default NULL,
JEDITASKID VARCHAR2 default NULL,
JOBSTATUS VARCHAR2 default NULL,
JOBSUBSTATUS VARCHAR2 default NULL,
MINRAMCOUNT VARCHAR2 default NULL,
NUCLEUS VARCHAR2 default NULL,
PROCESSINGTYPE VARCHAR2 default NULL,
PRODSOURCELABEL VARCHAR2 default NULL,
PRODUSERNAME VARCHAR2 default NULL,
REQID VARCHAR2 default NULL,
TRANSFORMATION VARCHAR2 default NULL,
WORKINGGROUP VARCHAR2 default NULL,
BROKERAGEERRORCODE VARCHAR2 default NULL,
DDMERRORCODE VARCHAR2 default NULL,
EXEERRORCODE VARCHAR2 default NULL,
JOBDISPATCHERERRORCODE VARCHAR2 default NULL,
PILOTERRORCODE VARCHAR2 default NULL,
SUPERRORCODE VARCHAR2 default NULL,
TASKBUFFERERRORCODE VARCHAR2 default NULL,
TRANSEXITCODE VARCHAR2 default NULL
)
AUTHID CURRENT_USER
AS
-- Necessary in order to avoid "ORA-14551 cannot perform a DML operation inside a query" error
-- PRAGMA AUTONOMOUS_TRANSACTION;
arch_maxtime DATE;
coll PANDAMON_JOBSPAGE_COLL:= PANDAMON_JOBSPAGE_COLL();
stmt VARCHAR2(4000);
my_request_token NUMBER;
my_range_days NUMBER;
my_jeditaskid VARCHAR2(20);
my_INPUTFILEPROJECT VARCHAR2(100);
n_iter NUMBER:=0;
n_days NUMBER:=0;
cnt_pandaids NUMBER:=0;

BEGIN


-- Ver 1.2 , 18th Oct 2016

-- In order to validate that the input value is a real number
my_request_token := TO_NUMBER(REQUEST_TOKEN);
my_range_days := TO_NUMBER(RANGE_DAYS);


-- Depends on the asked time window
IF range_days IS NOT NULL THEN

	IF range_days <= 3 THEN

	-- Then call only to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE is enough
	-- INSERT data from the QUERY_JOBSPAGE function (most recent data )
	------------------------------------------------------------------------
	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	 SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:RANGE_DAYS,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE
	)
	) ';

	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	RANGE_DAYS,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE ;


	-- 'END' label that the request is done
	INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
	COMMIT;


	ELSE --===============================================================================================================================
	-- The period is larger than the last 3 days and then SUM the result from the QUERY_JOBSPAGE and QUERY_JOBSPAGE_ARCH has to be done

	-- SELECT MAX(modificationtime) into ARCH_MAXTIME from ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH;
	/*
	IMPORTANT: insert into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT table in order to have two independent queries.
	If they are combined in a common SQL call with UNION ALL, then "ORA-08103: object no longer exists" is raised
	often because of the longer execution time on the QUERY_JOBSPAGE_ALL procedure being bound to the query start SCN where the PANDAMON_JOBSPAGE table partition is replaced every 5 minutes
	*/


	-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
	--------------------------------------------------------------------------------------------------------------

	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 	SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:RANGE_DAYS,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE
	)
	) ';

	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	RANGE_DAYS,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE ;





	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the given RANGE_DAYS parameter
	----------------------------------------------------------------------------------------------------------------------------------------------------

	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND partition_position >= (SELECT ROUND(MAX(partition_position) - range_days)  FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	order by PARTITION_POSITION) LOOP

	n_iter :=n_iter+1;

	-- prepare a MERGE instead of INSERT

	stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
	USING
	(
	SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
	FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
	(:PARTITION_NAME,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE)
	)) part
	ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
	WHEN MATCHED THEN
	UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
	WHEN NOT MATCHED THEN
	INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	--DBMS_OUTPUT.put_line(stmt);


	EXECUTE IMMEDIATE stmt USING
	j.partition_name,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
	n_iter ;


	-- commit the intermediate result
	COMMIT;

	END LOOP;



	-- Added on 5th Oct 2016
	-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
	SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

	IF cnt_pandaids <= 100 THEN

		IF ( JEDITASKID is NOT NULL) THEN

			my_JEDITASKID := JEDITASKID;

			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;

		ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN

			my_INPUTFILEPROJECT := INPUTFILEPROJECT;
			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT AND RETRIAL = 'N' and ROWNUM <=1000;

	-- Unfortunately at that point we do not know the
	--	ELSE
	--	INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
	--	SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where ROWNUM <=1000;

		END IF ;

	END IF;


-- 'END' label that the request is done
INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
COMMIT;


--============================================================
END IF; -- end of the case when the given RANGE_DAYS is NOT NULL;


ELSE -- the case when the RANGE_DAYS is NULL, then search for the fully available time range when JEDITASK or INPUTFILEPROJECT are given

	IF ( JEDITASKID is null and INPUTFILEPROJECT is null) THEN
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;

	IF ( JEDITASKID is NOT NULL) THEN
		-- get the full time range of JEDITASKID
		my_JEDITASKID := JEDITASKID;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))) INTO n_days FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where JEDITASKID = to_number(my_JEDITASKID);

	ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
		-- get the full time range of INPUTFILEPROJECT
		my_INPUTFILEPROJECT := INPUTFILEPROJECT;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))) INTO n_days FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where INPUTFILEPROJECT = my_INPUTFILEPROJECT;
	ELSE
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;


	-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
	-- (hardcoded 30 days because there could be periods of 'stuck' jobs)
	--------------------------------------------------------------------------------------------------------------

	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 	SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:RANGE_DAYS,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE
	)
	) ';

	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	'30',
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE ;


	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the computed N_DAYS
	----------------------------------------------------------------------------------------------------------------------------------------------------

	 -- BEFORE the loop: Parallelism Settings on session level
	-- EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = TRUE';
	-- EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 6';


	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND partition_position >= (SELECT ROUND(MAX(partition_position) - n_days)  FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	order by PARTITION_POSITION) LOOP

	n_iter :=n_iter+1;

	-- prepare a MERGE statement for providing a cumulative result
	stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
	USING
	(
	SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
	FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
	(:PARTITION_NAME,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE)
	)) part
	ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
	WHEN MATCHED THEN
	UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
	WHEN NOT MATCHED THEN
	INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	--DBMS_OUTPUT.put_line(stmt);


	EXECUTE IMMEDIATE stmt USING
	j.partition_name,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
	n_iter ;


	-- commit the intermediate result
	COMMIT;


END LOOP;



  -- AFTER the loop: settings on session level
 -- EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = FALSE';
 -- EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 1';


-- Added on 21st Sept 2016
-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

IF cnt_pandaids <= 100 THEN

	IF ( JEDITASKID is NOT NULL) THEN

  dbms_output.put_line(' PANDAIDS list '|| to_char(my_request_token));
  
	INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
	SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;

	ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
	INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
	SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT AND RETRIAL = 'N' and ROWNUM <=1000;

	END IF ;

END IF;


-- 'END' label that the request is done
INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
COMMIT;


END IF;


END;

/

  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."OLD_QUERY_JOBSPAGE_CUMULATIVE" TO "ATLAS_PANDABIGMON_W";
  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."OLD_QUERY_JOBSPAGE_CUMULATIVE" TO "ATLAS_PANDABIGMON_R";
--------------------------------------------------------
--  DDL for Procedure QUERY_JOBSPAGE_CUMULATIVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE" 
(
REQUEST_TOKEN NUMBER,
END_DATE VARCHAR2 default TO_CHAR(SYS_EXTRACT_UTC(systimestamp),'DD-MM-YYYY HH24:MI:SS'),
RANGE_DAYS VARCHAR2,
WITH_RETRIALS VARCHAR2 default 'Y',
SHOW_RETRIED_PANDAIDS VARCHAR2 default 'N',
ATLASRELEASE VARCHAR2 default NULL,
ATTEMPTNR VARCHAR2 default NULL,
COMPUTINGSITE VARCHAR2 default NULL,
CLOUD VARCHAR2 default NULL,
EVENTSERVICE VARCHAR2 default NULL,
HOMEPACKAGE VARCHAR2 default NULL,
INPUTFILEPROJECT VARCHAR2 default NULL,
INPUTFILETYPE VARCHAR2 default NULL,
JEDITASKID VARCHAR2 default NULL,
JOBSTATUS VARCHAR2 default NULL,
JOBSUBSTATUS VARCHAR2 default NULL,
MINRAMCOUNT VARCHAR2 default NULL,
NUCLEUS VARCHAR2 default NULL,
PROCESSINGTYPE VARCHAR2 default NULL,
PRODSOURCELABEL VARCHAR2 default NULL,
PRODUSERNAME VARCHAR2 default NULL,
REQID VARCHAR2 default NULL,
TRANSFORMATION VARCHAR2 default NULL,
WORKINGGROUP VARCHAR2 default NULL,
BROKERAGEERRORCODE VARCHAR2 default NULL,
DDMERRORCODE VARCHAR2 default NULL,
EXEERRORCODE VARCHAR2 default NULL,
JOBDISPATCHERERRORCODE VARCHAR2 default NULL,
PILOTERRORCODE VARCHAR2 default NULL,
SUPERRORCODE VARCHAR2 default NULL,
TASKBUFFERERRORCODE VARCHAR2 default NULL,
TRANSEXITCODE VARCHAR2 default NULL,
SPECIALHANDLING VARCHAR2 default NULL,
PANDAID VARCHAR2 default NULL,
PRIORITYRANGE VARCHAR2 default NULL,
GSHARE VARCHAR2 default NULL,
CORECOUNT VARCHAR2 default NULL,
NOUTPUTDATAFILES VARCHAR2 default NULL,
ACTUALCORECOUNT VARCHAR2 default NULL
)
AUTHID CURRENT_USER
AS
-- Necessary in order to avoid "ORA-14551 cannot perform a DML operation inside a query" error
-- PRAGMA AUTONOMOUS_TRANSACTION;
arch_maxtime DATE;
coll PANDAMON_JOBSPAGE_COLL:= PANDAMON_JOBSPAGE_COLL();
stmt VARCHAR2(4000);
my_request_token NUMBER;
my_range_days NUMBER;
my_jeditaskid VARCHAR2(20);
my_PANDAID VARCHAR2(500);
my_INPUTFILEPROJECT VARCHAR2(100);
n_iter NUMBER:=0;
n_iter_end NUMBER:=0;
n_part NUMBER:=0;
n_days NUMBER:=0;
n_days_end NUMBER:=0;
cnt_pandaids NUMBER:=0;
computed_start_date DATE;

--offset_min_partition_pos NUMBER;
--offset_max_partition_pos NUMBER;

BEGIN



-- Ver 1.5, 19th Feb 2017
-- !!! Takes into account the DUPL_WITH_ARCH flag column depending whether the time range is beyond the most recent 3 days 

-- Note: This procedure assumes that the END_DATE is given in UTC

-- In order to validate that the input value is a real number
my_request_token := TO_NUMBER(REQUEST_TOKEN);
-- Get the absolute value of the RANGE_DAYS as sometimes PanDA monitor puts negative values for the range
my_range_days := ABS(TO_NUMBER(RANGE_DAYS));

computed_start_date := TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS') -  my_range_days;

--DBMS_OUTPUT.PUT_LINE(my_range_days);
-- Several sections depending on the END_DATE and the asked time window backwards in the past

IF range_days IS NOT NULL THEN

	-- IMPORTANT encoded logic: If the computed START_DATE and the END_DATE are within the last 3 days range then only the QUERY_JOBSPAGE procedure is called
	-- ============================================================================================================================================================

	IF ( ( computed_start_date >= SYS_EXTRACT_UTC(systimestamp) - 3 ) AND ( TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS') >= SYS_EXTRACT_UTC(systimestamp) - 3 ) ) THEN
  DBMS_OUTPUT.PUT_LINE(END_DATE);
  DBMS_OUTPUT.PUT_LINE(computed_start_date);
  DBMS_OUTPUT.PUT_LINE(SYS_EXTRACT_UTC(systimestamp) - 3);
		-- Then call only to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE is enough because the requested time window is within the last 3 days
		-- INSERT data from the QUERY_JOBSPAGE function (most recent data)
		------------------------------------------------------------------------
		stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
		 SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
		(
		ATLAS_PANDABIGMON.QUERY_JOBSPAGE
		(
		:END_DATE,
		:RANGE_DAYS,
		:WITH_RETRIALS,
    :DISCARD_DUPL_WITH_ARCH,
		:SHOW_RETRIED_PANDAIDS,
		:ATLASRELEASE,
		:ATTEMPTNR,
		:COMPUTINGSITE,
		:CLOUD,
		:EVENTSERVICE,
		:HOMEPACKAGE,
		:INPUTFILEPROJECT,
		:INPUTFILETYPE,
		:JEDITASKID,
		:JOBSTATUS,
		:JOBSUBSTATUS,
		:MINRAMCOUNT,
		:NUCLEUS,
		:PROCESSINGTYPE,
		:PRODSOURCELABEL ,
		:PRODUSERNAME ,
		:REQID ,
		:TRANSFORMATION ,
		:WORKINGGROUP ,
		:BROKERAGEERRORCODE ,
		:DDMERRORCODE ,
		:EXEERRORCODE ,
		:JOBDISPATCHERERRORCODE ,
		:PILOTERRORCODE ,
		:SUPERRORCODE ,
		:TASKBUFFERERRORCODE ,
		:TRANSEXITCODE,
    :SPECIALHANDLING,
    :PANDAID,
    :PRIORITYRANGE,
    :GSHARE,
    :CORECOUNT,
    :NOUTPUTDATAFILES,
    :ACTUALCORECOUNT
		)
		) ';
    DBMS_OUTPUT.PUT_LINE(stmt);

		n_iter := n_iter+1;

		EXECUTE IMMEDIATE stmt USING
		my_request_token,
		n_iter,
		END_DATE,
		RANGE_DAYS,
		WITH_RETRIALS,
    'Y',
		SHOW_RETRIED_PANDAIDS,
		ATLASRELEASE,
		ATTEMPTNR,
		COMPUTINGSITE,
		CLOUD,
		EVENTSERVICE,
		HOMEPACKAGE,
		INPUTFILEPROJECT,
		INPUTFILETYPE,
		JEDITASKID,
		JOBSTATUS,
		JOBSUBSTATUS,
		MINRAMCOUNT,
		NUCLEUS,
		PROCESSINGTYPE,
		PRODSOURCELABEL ,
		PRODUSERNAME ,
		REQID ,
		TRANSFORMATION ,
		WORKINGGROUP ,
		BROKERAGEERRORCODE ,
		DDMERRORCODE ,
		EXEERRORCODE ,
		JOBDISPATCHERERRORCODE ,
		PILOTERRORCODE ,
		SUPERRORCODE ,
		TASKBUFFERERRORCODE ,
		TRANSEXITCODE,
    SPECIALHANDLING,
    PANDAID,
    PRIORITYRANGE,
    GSHARE,
    CORECOUNT,
    NOUTPUTDATAFILES,
    ACTUALCORECOUNT;


		-- 'END' label that the request is done
		INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
		COMMIT;


	ELSE --===================================== the period is not only within the last 3 days =============================================================================
	-- =====================================================================================================================================================================

	-- The period is larger than the last 3 days and then SUM the result from the QUERY_JOBSPAGE and QUERY_JOBSPAGE_ARCH has to be done with overlaps of PANDAIDs

	-- SELECT MAX(modificationtime) into ARCH_MAXTIME from ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH;
	/*
	IMPORTANT: insert into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT table in order to have two independent queries.
	If they are combined in a common SQL call with UNION ALL, then "ORA-08103: object no longer exists" is raised
	often because of the longer execution time on the QUERY_JOBSPAGE_ALL procedure being bound to the query start SCN where the PANDAMON_JOBSPAGE table partition is replaced every 5 minutes
	*/
  DBMS_OUTPUT.PUT_LINE(END_DATE);
  DBMS_OUTPUT.PUT_LINE(computed_start_date);
  DBMS_OUTPUT.PUT_LINE(SYS_EXTRACT_UTC(systimestamp) - 3);
  DBMS_OUTPUT.PUT_LINE(TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS'));
	-- IMPORTANT: If the computed END_DATE is within the time range of the last 3 days, only then call the ATLAS_PANDABIGMON.QUERY_JOBSPAGE proc, otherwise omit it
	IF ( TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS') >= SYS_EXTRACT_UTC(systimestamp) - 3 ) THEN

		-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
    -- IMPORTANT:  DISCARD_DUPL_WITH_ARCH = 'Y'
		--------------------------------------------------------------------------------------------------------------

		stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 		SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
		(
		ATLAS_PANDABIGMON.QUERY_JOBSPAGE
		(
		:END_DATE,
		:RANGE_DAYS,
		:WITH_RETRIALS,
    :DISCARD_DUPL_WITH_ARCH,
		:SHOW_RETRIED_PANDAIDS,
		:ATLASRELEASE,
		:ATTEMPTNR,
		:COMPUTINGSITE,
		:CLOUD,
		:EVENTSERVICE,
		:HOMEPACKAGE,
		:INPUTFILEPROJECT,
		:INPUTFILETYPE,
		:JEDITASKID,
		:JOBSTATUS,
		:JOBSUBSTATUS,
		:MINRAMCOUNT,
		:NUCLEUS,
		:PROCESSINGTYPE,
		:PRODSOURCELABEL ,
		:PRODUSERNAME ,
		:REQID ,
		:TRANSFORMATION ,
		:WORKINGGROUP ,
		:BROKERAGEERRORCODE ,
		:DDMERRORCODE ,
		:EXEERRORCODE ,
		:JOBDISPATCHERERRORCODE ,
		:PILOTERRORCODE ,
		:SUPERRORCODE ,
		:TASKBUFFERERRORCODE ,
		:TRANSEXITCODE,
    :SPECIALHANDLING,
    :PANDAID,
    :PRIORITYRANGE,
    :GSHARE,
    :CORECOUNT,
    :NOUTPUTDATAFILES,
    :ACTUALCORECOUNT
		)
		) ';
    DBMS_OUTPUT.PUT_LINE(stmt);
		n_iter := n_iter+1;

		EXECUTE IMMEDIATE stmt USING
		my_request_token,
		n_iter,
		END_DATE,
		RANGE_DAYS,
		WITH_RETRIALS,
    'Y',
		SHOW_RETRIED_PANDAIDS,
		ATLASRELEASE,
		ATTEMPTNR,
		COMPUTINGSITE,
		CLOUD,
		EVENTSERVICE,
		HOMEPACKAGE,
		INPUTFILEPROJECT,
		INPUTFILETYPE,
		JEDITASKID,
		JOBSTATUS,
		JOBSUBSTATUS,
		MINRAMCOUNT,
		NUCLEUS,
		PROCESSINGTYPE,
		PRODSOURCELABEL ,
		PRODUSERNAME ,
		REQID ,
		TRANSFORMATION ,
		WORKINGGROUP ,
		BROKERAGEERRORCODE ,
		DDMERRORCODE ,
		EXEERRORCODE ,
		JOBDISPATCHERERRORCODE ,
		PILOTERRORCODE ,
		SUPERRORCODE ,
		TASKBUFFERERRORCODE ,
		TRANSEXITCODE,
    SPECIALHANDLING,
    PANDAID,
    PRIORITYRANGE,
    GSHARE,
    CORECOUNT,
    NOUTPUTDATAFILES,
    ACTUALCORECOUNT;

	END IF;


	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the given RANGE_DAYS parameter
	----------------------------------------------------------------------------------------------------------------------------------------------------

	-- calculate the time span on in terms of PANDAMON_JOBSPAGE_ARCH table partitions (each partition is a day)
	-- EXTRACT function is used to get the number of days from the calculated interval

/*
	-- offset_min_partition_pos := TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - ( SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ(END_DATE, 'DD-MM-YYYY HH24:MI:SS.FF TZH:TZM')) -  TO_NUMBER(RANGE_DAYS) ) ));
	-- offset_max_partition_pos := TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - ( SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ(END_DATE, 'DD-MM-YYYY HH24:MI:SS.FF TZH:TZM')) ) ));

	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND
	partition_position >= (SELECT ROUND(MAX(partition_position) - offset_min_partition_pos) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	AND
	partition_position <= ( SELECT ROUND(MAX(partition_position) - offset_max_partition_pos) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	order by PARTITION_POSITION) LOOP
*/

	FOR j IN ( SELECT partition_name, high_value FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' ) LOOP

		-- IMPORTANT: Because of each partition boundary which is midnight of the next day we need -1
		IF
   			( ( TO_DATE(SUBSTR(j.high_value, 11, 10), 'YYYY-MM-DD') - 1 ) >= TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS') - my_range_days )
			AND
			( (TO_DATE(SUBSTR(j.high_value, 11, 10), 'YYYY-MM-DD') - 1)  <= TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS')
    		) THEN

		n_iter := n_iter+1;
		n_part := n_part+1;


	DBMS_OUTPUT.PUT_LINE('partition ' || j.partition_name);

	-- prepare a MERGE instead of INSERT

	stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
	USING
	(
	SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
	FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
	(:PARTITION_NAME,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE,
  :SPECIALHANDLING,
  :PANDAID,
  :PRIORITYRANGE,
  :GSHARE,
  :CORECOUNT,
  :NOUTPUTDATAFILES,
  :ACTUALCORECOUNT)
	)) part
	ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
	WHEN MATCHED THEN
	UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
	WHEN NOT MATCHED THEN
	INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	--DBMS_OUTPUT.put_line(stmt);


	EXECUTE IMMEDIATE stmt USING
	j.partition_name,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
  SPECIALHANDLING,
  PANDAID,
  PRIORITYRANGE,
  GSHARE,
  CORECOUNT,
  NOUTPUTDATAFILES,
  ACTUALCORECOUNT,
	n_iter ;


	-- commit the intermediate result
	COMMIT;

	END IF;

	END LOOP;



	-- Added on 5th Oct 2016
	-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
	SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

	IF cnt_pandaids <= 100 THEN

		IF ( JEDITASKID is NOT NULL) THEN

			my_JEDITASKID := JEDITASKID;

			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;

		ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN

			my_INPUTFILEPROJECT := INPUTFILEPROJECT;
			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT  AND RETRIAL = 'N' and ROWNUM <=1000;

		END IF ;

	END IF;


	-- 'END' label that the request is done
	INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
	COMMIT;


	--==================================================================================================
	END IF; -- end of the case when the given RANGE_DAYS is NOT NULL;


--==================================================================================================
-- !!! the case when the RANGE_DAYS is NULL, then search for the fully available time range when JEDITASK or INPUTFILEPROJECT are given
ELSE
	IF ( JEDITASKID is null and INPUTFILEPROJECT is null AND PANDAID is null) THEN
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;

	IF ( PANDAID is NOT NULL) THEN
		-- get the full time range of PANDAID
		my_PANDAID := PANDAID;
    stmt := 'SELECT ROUND(sysdate-TRUNC(MIN(modificationtime))), ROUND(sysdate-TRUNC(MAX(modificationtime))) FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where PANDAID IN '|| my_PANDAID;
    DBMS_OUTPUT.put_line (stmt);
    EXECUTE IMMEDIATE stmt INTO n_days, n_iter_end;

	ELSIF ( JEDITASKID is NOT NULL) THEN
		-- get the full time range of JEDITASKID
		my_JEDITASKID := JEDITASKID;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))), ROUND(sysdate-TRUNC(MAX(modificationtime))) INTO n_days, n_iter_end FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where JEDITASKID = to_number(my_JEDITASKID);

	ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
		-- get the full time range of INPUTFILEPROJECT
		my_INPUTFILEPROJECT := INPUTFILEPROJECT;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))), ROUND(sysdate-TRUNC(MAX(modificationtime))) INTO n_days, n_iter_end FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where INPUTFILEPROJECT = my_INPUTFILEPROJECT;
	ELSE
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;


	-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
	-- (hardcoded 30 days because there could be periods of 'stuck' jobs)
	--------------------------------------------------------------------------------------------------------------

	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 	SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:END_DATE,
	:RANGE_DAYS,
	:WITH_RETRIALS,
  :DISCARD_DUPL_WITH_ARCH,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE,
  :SPECIALHANDLING,
  :PANDAID,
  :PRIORITYRANGE,
  :GSHARE,
  :CORECOUNT,
  :NOUTPUTDATAFILES,
  :ACTUALCORECOUNT
	)
	) ';
  DBMS_OUTPUT.PUT_LINE(stmt);
	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	END_DATE,
	'30',
	WITH_RETRIALS,
  'Y',
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
  SPECIALHANDLING,
  PANDAID,
  PRIORITYRANGE,
  GSHARE,
  CORECOUNT,
  NOUTPUTDATAFILES,
  ACTUALCORECOUNT;


	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the computed N_DAYS
	----------------------------------------------------------------------------------------------------------------------------------------------------

	 -- BEFORE the loop: Parallelism Settings on session level
	--EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = TRUE';
	--EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 2';


	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND partition_position >= (SELECT ROUND(MAX(partition_position) - n_days)  FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' ) AND
  partition_position <= (SELECT ROUND(MAX(partition_position) - n_iter_end+1)  FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )  
	order by PARTITION_POSITION) LOOP

		n_iter :=n_iter+1;

		-- prepare a MERGE statement for providing a cumulative result
		stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
		USING
		(
		SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
		FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
		(:PARTITION_NAME,
		:WITH_RETRIALS,
		:SHOW_RETRIED_PANDAIDS,
		:ATLASRELEASE,
		:ATTEMPTNR,
		:COMPUTINGSITE,
		:CLOUD,
		:EVENTSERVICE,
		:HOMEPACKAGE,
		:INPUTFILEPROJECT,
		:INPUTFILETYPE,
		:JEDITASKID,
		:JOBSTATUS,
		:JOBSUBSTATUS,
		:MINRAMCOUNT,
		:NUCLEUS,
		:PROCESSINGTYPE,
		:PRODSOURCELABEL ,
		:PRODUSERNAME ,
		:REQID ,
		:TRANSFORMATION ,
		:WORKINGGROUP ,
		:BROKERAGEERRORCODE ,
		:DDMERRORCODE ,
		:EXEERRORCODE ,
		:JOBDISPATCHERERRORCODE ,
		:PILOTERRORCODE ,
		:SUPERRORCODE ,
		:TASKBUFFERERRORCODE ,
		:TRANSEXITCODE,
    :SPECIALHANDLING,
    :PANDAID,
    :PRIORITYRANGE,
    :GSHARE,
    :CORECOUNT,
    :NOUTPUTDATAFILES,
    :ACTUALCORECOUNT)
		)) part
		ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
		WHEN MATCHED THEN
		UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
		WHEN NOT MATCHED THEN
		INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
		VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	 DBMS_OUTPUT.put_line(stmt);


		EXECUTE IMMEDIATE stmt USING
		j.partition_name,
		WITH_RETRIALS,
		SHOW_RETRIED_PANDAIDS,
		ATLASRELEASE,
		ATTEMPTNR,
		COMPUTINGSITE,
		CLOUD,
		EVENTSERVICE,
		HOMEPACKAGE,
		INPUTFILEPROJECT,
		INPUTFILETYPE,
		JEDITASKID,
		JOBSTATUS,
		JOBSUBSTATUS,
		MINRAMCOUNT,
		NUCLEUS,
		PROCESSINGTYPE,
		PRODSOURCELABEL ,
		PRODUSERNAME ,
		REQID ,
		TRANSFORMATION ,
		WORKINGGROUP ,
		BROKERAGEERRORCODE ,
		DDMERRORCODE ,
		EXEERRORCODE ,
		JOBDISPATCHERERRORCODE ,
		PILOTERRORCODE ,
		SUPERRORCODE ,
		TASKBUFFERERRORCODE ,
		TRANSEXITCODE,
    SPECIALHANDLING,
    PANDAID,
    PRIORITYRANGE,
    GSHARE,
    CORECOUNT,
    NOUTPUTDATAFILES,
    ACTUALCORECOUNT,
		n_iter ;


		-- commit the intermediate result
		COMMIT;

	END LOOP;


  -- AFTER the loop: settings on session level
  -- EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = FALSE';
  -- EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 1';


	-- Added on 21st Sept 2016
	-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
	SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

	IF cnt_pandaids <= 100 THEN

		IF ( JEDITASKID is NOT NULL) THEN 
      DELETE FROM ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT WHERE REQUEST_TOKEN = my_request_token and ATTR like 'PANDAID'; 
			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;
    
		ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
			DELETE FROM ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT WHERE REQUEST_TOKEN = my_request_token and ATTR like 'PANDAID'; 
      INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT AND RETRIAL = 'N' and ROWNUM <=1000;

		END IF ;

	END IF;


	-- 'END' label that the request is done
	INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
	COMMIT;


END IF;


END;

/

  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE" TO "ATLAS_PANDABIGMON_W";
  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE" TO "ATLAS_PANDABIGMON_R";
--------------------------------------------------------
--  DDL for Procedure QUERY_JOBSPAGE_CUMULATIVE_FORK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE_FORK" 
(
REQUEST_TOKEN NUMBER,
END_DATE VARCHAR2 default TO_CHAR(SYS_EXTRACT_UTC(systimestamp),'DD-MM-YYYY HH24:MI:SS'),
RANGE_DAYS VARCHAR2,
WITH_RETRIALS VARCHAR2 default 'Y',
SHOW_RETRIED_PANDAIDS VARCHAR2 default 'N',
ATLASRELEASE VARCHAR2 default NULL,
ATTEMPTNR VARCHAR2 default NULL,
COMPUTINGSITE VARCHAR2 default NULL,
CLOUD VARCHAR2 default NULL,
EVENTSERVICE VARCHAR2 default NULL,
HOMEPACKAGE VARCHAR2 default NULL,
INPUTFILEPROJECT VARCHAR2 default NULL,
INPUTFILETYPE VARCHAR2 default NULL,
JEDITASKID VARCHAR2 default NULL,
JOBSTATUS VARCHAR2 default NULL,
JOBSUBSTATUS VARCHAR2 default NULL,
MINRAMCOUNT VARCHAR2 default NULL,
NUCLEUS VARCHAR2 default NULL,
PROCESSINGTYPE VARCHAR2 default NULL,
PRODSOURCELABEL VARCHAR2 default NULL,
PRODUSERNAME VARCHAR2 default NULL,
REQID VARCHAR2 default NULL,
TRANSFORMATION VARCHAR2 default NULL,
WORKINGGROUP VARCHAR2 default NULL,
BROKERAGEERRORCODE VARCHAR2 default NULL,
DDMERRORCODE VARCHAR2 default NULL,
EXEERRORCODE VARCHAR2 default NULL,
JOBDISPATCHERERRORCODE VARCHAR2 default NULL,
PILOTERRORCODE VARCHAR2 default NULL,
SUPERRORCODE VARCHAR2 default NULL,
TASKBUFFERERRORCODE VARCHAR2 default NULL,
TRANSEXITCODE VARCHAR2 default NULL,
SPECIALHANDLING VARCHAR2 default NULL,
PANDAID VARCHAR2 default NULL
)
AUTHID CURRENT_USER
AS
-- Necessary in order to avoid "ORA-14551 cannot perform a DML operation inside a query" error
-- PRAGMA AUTONOMOUS_TRANSACTION;
arch_maxtime DATE;
coll PANDAMON_JOBSPAGE_COLL:= PANDAMON_JOBSPAGE_COLL();
stmt VARCHAR2(4000);
my_request_token NUMBER;
my_range_days NUMBER;
my_jeditaskid VARCHAR2(20);
my_INPUTFILEPROJECT VARCHAR2(100);
n_iter NUMBER:=0;
n_part NUMBER:=0;
n_days NUMBER:=0;
cnt_pandaids NUMBER:=0;
computed_start_date DATE;

--offset_min_partition_pos NUMBER;
--offset_max_partition_pos NUMBER;

BEGIN



-- Ver 1.5, 19th Feb 2017
-- !!! Takes into account the DUPL_WITH_ARCH flag column depending whether the time range is beyond the most recent 3 days 

-- Note: This procedure assumes that the END_DATE is given in UTC

-- In order to validate that the input value is a real number
my_request_token := TO_NUMBER(REQUEST_TOKEN);
-- Get the absolute value of the RANGE_DAYS as sometimes PanDA monitor puts negative values for the range
my_range_days := ABS(TO_NUMBER(RANGE_DAYS));

computed_start_date := TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS') -  my_range_days;

DBMS_OUTPUT.PUT_LINE(my_range_days);
-- Several sections depending on the END_DATE and the asked time window backwards in the past

IF range_days IS NOT NULL THEN

	-- IMPORTANT encoded logic: If the computed START_DATE and the END_DATE are within the last 3 days range then only the QUERY_JOBSPAGE procedure is called
	-- ============================================================================================================================================================

	IF ( ( computed_start_date >= SYS_EXTRACT_UTC(systimestamp) - 3 ) AND ( TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS') >= SYS_EXTRACT_UTC(systimestamp) - 3 ) ) THEN
  DBMS_OUTPUT.PUT_LINE(END_DATE);
  DBMS_OUTPUT.PUT_LINE(computed_start_date);
  DBMS_OUTPUT.PUT_LINE(SYS_EXTRACT_UTC(systimestamp) - 3);
		-- Then call only to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE is enough because the requested time window is within the last 3 days
		-- INSERT data from the QUERY_JOBSPAGE function (most recent data)
		------------------------------------------------------------------------
		stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
		 SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
		(
		ATLAS_PANDABIGMON.QUERY_JOBSPAGE
		(
		:END_DATE,
		:RANGE_DAYS,
		:WITH_RETRIALS,
    :DISCARD_DUPL_WITH_ARCH,
		:SHOW_RETRIED_PANDAIDS,
		:ATLASRELEASE,
		:ATTEMPTNR,
		:COMPUTINGSITE,
		:CLOUD,
		:EVENTSERVICE,
		:HOMEPACKAGE,
		:INPUTFILEPROJECT,
		:INPUTFILETYPE,
		:JEDITASKID,
		:JOBSTATUS,
		:JOBSUBSTATUS,
		:MINRAMCOUNT,
		:NUCLEUS,
		:PROCESSINGTYPE,
		:PRODSOURCELABEL ,
		:PRODUSERNAME ,
		:REQID ,
		:TRANSFORMATION ,
		:WORKINGGROUP ,
		:BROKERAGEERRORCODE ,
		:DDMERRORCODE ,
		:EXEERRORCODE ,
		:JOBDISPATCHERERRORCODE ,
		:PILOTERRORCODE ,
		:SUPERRORCODE ,
		:TASKBUFFERERRORCODE ,
		:TRANSEXITCODE,
    :SPECIALHANDLING,
    :PANDAID
		)
		) ';
    DBMS_OUTPUT.PUT_LINE(stmt);

		n_iter := n_iter+1;

		EXECUTE IMMEDIATE stmt USING
		my_request_token,
		n_iter,
		END_DATE,
		RANGE_DAYS,
		WITH_RETRIALS,
    'Y',
		SHOW_RETRIED_PANDAIDS,
		ATLASRELEASE,
		ATTEMPTNR,
		COMPUTINGSITE,
		CLOUD,
		EVENTSERVICE,
		HOMEPACKAGE,
		INPUTFILEPROJECT,
		INPUTFILETYPE,
		JEDITASKID,
		JOBSTATUS,
		JOBSUBSTATUS,
		MINRAMCOUNT,
		NUCLEUS,
		PROCESSINGTYPE,
		PRODSOURCELABEL ,
		PRODUSERNAME ,
		REQID ,
		TRANSFORMATION ,
		WORKINGGROUP ,
		BROKERAGEERRORCODE ,
		DDMERRORCODE ,
		EXEERRORCODE ,
		JOBDISPATCHERERRORCODE ,
		PILOTERRORCODE ,
		SUPERRORCODE ,
		TASKBUFFERERRORCODE ,
		TRANSEXITCODE,
    SPECIALHANDLING,
    PANDAID;


		-- 'END' label that the request is done
		INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
		COMMIT;


	ELSE --===================================== the period is not only within the last 3 days =============================================================================
	-- =====================================================================================================================================================================

	-- The period is larger than the last 3 days and then SUM the result from the QUERY_JOBSPAGE and QUERY_JOBSPAGE_ARCH has to be done with overlaps of PANDAIDs

	-- SELECT MAX(modificationtime) into ARCH_MAXTIME from ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH;
	/*
	IMPORTANT: insert into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT table in order to have two independent queries.
	If they are combined in a common SQL call with UNION ALL, then "ORA-08103: object no longer exists" is raised
	often because of the longer execution time on the QUERY_JOBSPAGE_ALL procedure being bound to the query start SCN where the PANDAMON_JOBSPAGE table partition is replaced every 5 minutes
	*/
  DBMS_OUTPUT.PUT_LINE(END_DATE);
  DBMS_OUTPUT.PUT_LINE(computed_start_date);
  DBMS_OUTPUT.PUT_LINE(SYS_EXTRACT_UTC(systimestamp) - 3);
	-- IMPORTANT: If the computed START DATE is within the time range of the last 3 days, only then call the ATLAS_PANDABIGMON.QUERY_JOBSPAGE proc, otherwise omit it
	--IF ( computed_start_date > SYS_EXTRACT_UTC(systimestamp) - 3 ) THEN
  --END IF;
		-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
    -- IMPORTANT:  DISCARD_DUPL_WITH_ARCH = 'Y'
		--------------------------------------------------------------------------------------------------------------

		stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 		SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
		(
		ATLAS_PANDABIGMON.QUERY_JOBSPAGE
		(
		:END_DATE,
		:RANGE_DAYS,
		:WITH_RETRIALS,
    :DISCARD_DUPL_WITH_ARCH,
		:SHOW_RETRIED_PANDAIDS,
		:ATLASRELEASE,
		:ATTEMPTNR,
		:COMPUTINGSITE,
		:CLOUD,
		:EVENTSERVICE,
		:HOMEPACKAGE,
		:INPUTFILEPROJECT,
		:INPUTFILETYPE,
		:JEDITASKID,
		:JOBSTATUS,
		:JOBSUBSTATUS,
		:MINRAMCOUNT,
		:NUCLEUS,
		:PROCESSINGTYPE,
		:PRODSOURCELABEL ,
		:PRODUSERNAME ,
		:REQID ,
		:TRANSFORMATION ,
		:WORKINGGROUP ,
		:BROKERAGEERRORCODE ,
		:DDMERRORCODE ,
		:EXEERRORCODE ,
		:JOBDISPATCHERERRORCODE ,
		:PILOTERRORCODE ,
		:SUPERRORCODE ,
		:TASKBUFFERERRORCODE ,
		:TRANSEXITCODE,
    :SPECIALHANDLING,
    :PANDAID
		)
		) ';
    DBMS_OUTPUT.PUT_LINE(stmt);
		n_iter := n_iter+1;

		EXECUTE IMMEDIATE stmt USING
		my_request_token,
		n_iter,
		END_DATE,
		RANGE_DAYS,
		WITH_RETRIALS,
    'Y',
		SHOW_RETRIED_PANDAIDS,
		ATLASRELEASE,
		ATTEMPTNR,
		COMPUTINGSITE,
		CLOUD,
		EVENTSERVICE,
		HOMEPACKAGE,
		INPUTFILEPROJECT,
		INPUTFILETYPE,
		JEDITASKID,
		JOBSTATUS,
		JOBSUBSTATUS,
		MINRAMCOUNT,
		NUCLEUS,
		PROCESSINGTYPE,
		PRODSOURCELABEL ,
		PRODUSERNAME ,
		REQID ,
		TRANSFORMATION ,
		WORKINGGROUP ,
		BROKERAGEERRORCODE ,
		DDMERRORCODE ,
		EXEERRORCODE ,
		JOBDISPATCHERERRORCODE ,
		PILOTERRORCODE ,
		SUPERRORCODE ,
		TASKBUFFERERRORCODE ,
		TRANSEXITCODE,
    SPECIALHANDLING,
    PANDAID;



	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the given RANGE_DAYS parameter
	----------------------------------------------------------------------------------------------------------------------------------------------------

	-- calculate the time span on in terms of PANDAMON_JOBSPAGE_ARCH table partitions (each partition is a day)
	-- EXTRACT function is used to get the number of days from the calculated interval

/*
	-- offset_min_partition_pos := TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - ( SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ(END_DATE, 'DD-MM-YYYY HH24:MI:SS.FF TZH:TZM')) -  TO_NUMBER(RANGE_DAYS) ) ));
	-- offset_max_partition_pos := TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - ( SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ(END_DATE, 'DD-MM-YYYY HH24:MI:SS.FF TZH:TZM')) ) ));

	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND
	partition_position >= (SELECT ROUND(MAX(partition_position) - offset_min_partition_pos) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	AND
	partition_position <= ( SELECT ROUND(MAX(partition_position) - offset_max_partition_pos) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	order by PARTITION_POSITION) LOOP
*/

	FOR j IN ( SELECT partition_name, high_value FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' ) LOOP

		-- IMPORTANT: Because of each partition boundary which is midnight of the next day we need -1
		IF
   			( ( TO_DATE(SUBSTR(j.high_value, 11, 10), 'YYYY-MM-DD') - 1 ) >= TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS') - my_range_days )
			AND
			( (TO_DATE(SUBSTR(j.high_value, 11, 10), 'YYYY-MM-DD') - 1)  <= TO_DATE(END_DATE, 'DD-MM-YYYY HH24:MI:SS')
    		) THEN

		n_iter := n_iter+1;
		n_part := n_part+1;


	DBMS_OUTPUT.PUT_LINE('partition ' || j.partition_name);

	-- prepare a MERGE instead of INSERT

	stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
	USING
	(
	SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
	FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
	(:PARTITION_NAME,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE,
  :SPECIALHANDLING,
  :PANDAID)
	)) part
	ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
	WHEN MATCHED THEN
	UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
	WHEN NOT MATCHED THEN
	INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	--DBMS_OUTPUT.put_line(stmt);


	EXECUTE IMMEDIATE stmt USING
	j.partition_name,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
  SPECIALHANDLING,
  PANDAID,
	n_iter ;


	-- commit the intermediate result
	COMMIT;

	END IF;

	END LOOP;



	-- Added on 5th Oct 2016
	-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
	SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

	IF cnt_pandaids <= 100 THEN

		IF ( JEDITASKID is NOT NULL) THEN

			my_JEDITASKID := JEDITASKID;

			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;

		ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN

			my_INPUTFILEPROJECT := INPUTFILEPROJECT;
			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT  AND RETRIAL = 'N' and ROWNUM <=1000;

		END IF ;

	END IF;


	-- 'END' label that the request is done
	INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
	COMMIT;


	--==================================================================================================
	END IF; -- end of the case when the given RANGE_DAYS is NOT NULL;


--==================================================================================================
-- !!! the case when the RANGE_DAYS is NULL, then search for the fully available time range when JEDITASK or INPUTFILEPROJECT are given
ELSE
	IF ( JEDITASKID is null and INPUTFILEPROJECT is null) THEN
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;

	IF ( JEDITASKID is NOT NULL) THEN
		-- get the full time range of JEDITASKID
		my_JEDITASKID := JEDITASKID;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))) INTO n_days FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where JEDITASKID = to_number(my_JEDITASKID);

	ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
		-- get the full time range of INPUTFILEPROJECT
		my_INPUTFILEPROJECT := INPUTFILEPROJECT;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))) INTO n_days FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where INPUTFILEPROJECT = my_INPUTFILEPROJECT;
	ELSE
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;


	-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
	-- (hardcoded 30 days because there could be periods of 'stuck' jobs)
	--------------------------------------------------------------------------------------------------------------

	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 	SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:END_DATE,
	:RANGE_DAYS,
	:WITH_RETRIALS,
  :DISCARD_DUPL_WITH_ARCH,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE,
  :SPECIALHANDLING,
  :PANDAID
	)
	) ';
  DBMS_OUTPUT.PUT_LINE(stmt);
	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	END_DATE,
	'30',
	WITH_RETRIALS,
  'Y',
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
  SPECIALHANDLING,
  PANDAID;


	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the computed N_DAYS
	----------------------------------------------------------------------------------------------------------------------------------------------------

	 -- BEFORE the loop: Parallelism Settings on session level
	--EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = TRUE';
	--EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 2';


	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND partition_position >= (SELECT ROUND(MAX(partition_position) - n_days)  FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	order by PARTITION_POSITION) LOOP

		n_iter :=n_iter+1;

		-- prepare a MERGE statement for providing a cumulative result
		stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
		USING
		(
		SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
		FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
		(:PARTITION_NAME,
		:WITH_RETRIALS,
		:SHOW_RETRIED_PANDAIDS,
		:ATLASRELEASE,
		:ATTEMPTNR,
		:COMPUTINGSITE,
		:CLOUD,
		:EVENTSERVICE,
		:HOMEPACKAGE,
		:INPUTFILEPROJECT,
		:INPUTFILETYPE,
		:JEDITASKID,
		:JOBSTATUS,
		:JOBSUBSTATUS,
		:MINRAMCOUNT,
		:NUCLEUS,
		:PROCESSINGTYPE,
		:PRODSOURCELABEL ,
		:PRODUSERNAME ,
		:REQID ,
		:TRANSFORMATION ,
		:WORKINGGROUP ,
		:BROKERAGEERRORCODE ,
		:DDMERRORCODE ,
		:EXEERRORCODE ,
		:JOBDISPATCHERERRORCODE ,
		:PILOTERRORCODE ,
		:SUPERRORCODE ,
		:TASKBUFFERERRORCODE ,
		:TRANSEXITCODE,
    :SPECIALHANDLING,
    :PANDAID)
		)) part
		ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
		WHEN MATCHED THEN
		UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
		WHEN NOT MATCHED THEN
		INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
		VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	 --DBMS_OUTPUT.put_line(stmt);


		EXECUTE IMMEDIATE stmt USING
		j.partition_name,
		WITH_RETRIALS,
		SHOW_RETRIED_PANDAIDS,
		ATLASRELEASE,
		ATTEMPTNR,
		COMPUTINGSITE,
		CLOUD,
		EVENTSERVICE,
		HOMEPACKAGE,
		INPUTFILEPROJECT,
		INPUTFILETYPE,
		JEDITASKID,
		JOBSTATUS,
		JOBSUBSTATUS,
		MINRAMCOUNT,
		NUCLEUS,
		PROCESSINGTYPE,
		PRODSOURCELABEL ,
		PRODUSERNAME ,
		REQID ,
		TRANSFORMATION ,
		WORKINGGROUP ,
		BROKERAGEERRORCODE ,
		DDMERRORCODE ,
		EXEERRORCODE ,
		JOBDISPATCHERERRORCODE ,
		PILOTERRORCODE ,
		SUPERRORCODE ,
		TASKBUFFERERRORCODE ,
		TRANSEXITCODE,
    SPECIALHANDLING,
    PANDAID,
		n_iter ;


		-- commit the intermediate result
		COMMIT;

	END LOOP;


  -- AFTER the loop: settings on session level
  -- EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = FALSE';
  -- EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 1';


	-- Added on 21st Sept 2016
	-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
	SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

	IF cnt_pandaids <= 100 THEN

		IF ( JEDITASKID is NOT NULL) THEN

			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;

		ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT AND RETRIAL = 'N' and ROWNUM <=1000;

		END IF ;

	END IF;


	-- 'END' label that the request is done
	INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
	COMMIT;


END IF;


END;

/

  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE_FORK" TO "ATLAS_PANDABIGMON_W";
  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE_FORK" TO "ATLAS_PANDABIGMON_R";
--------------------------------------------------------
--  DDL for Procedure QUERY_JOBSPAGE_CUMULATIVE_MM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE_MM" 
(
REQUEST_TOKEN NUMBER,
END_DATE VARCHAR2 default TO_CHAR(systimestamp,'DD-MM-YYYY HH24:MI:SS.FF TZR'),
RANGE_DAYS VARCHAR2,
WITH_RETRIALS VARCHAR2 default 'Y',
SHOW_RETRIED_PANDAIDS VARCHAR2 default 'N',
ATLASRELEASE VARCHAR2 default NULL,
ATTEMPTNR VARCHAR2 default NULL,
COMPUTINGSITE VARCHAR2 default NULL,
CLOUD VARCHAR2 default NULL,
EVENTSERVICE VARCHAR2 default NULL,
HOMEPACKAGE VARCHAR2 default NULL,
INPUTFILEPROJECT VARCHAR2 default NULL,
INPUTFILETYPE VARCHAR2 default NULL,
JEDITASKID VARCHAR2 default NULL,
JOBSTATUS VARCHAR2 default NULL,
JOBSUBSTATUS VARCHAR2 default NULL,
MINRAMCOUNT VARCHAR2 default NULL,
NUCLEUS VARCHAR2 default NULL,
PROCESSINGTYPE VARCHAR2 default NULL,
PRODSOURCELABEL VARCHAR2 default NULL,
PRODUSERNAME VARCHAR2 default NULL,
REQID VARCHAR2 default NULL,
TRANSFORMATION VARCHAR2 default NULL,
WORKINGGROUP VARCHAR2 default NULL,
BROKERAGEERRORCODE VARCHAR2 default NULL,
DDMERRORCODE VARCHAR2 default NULL,
EXEERRORCODE VARCHAR2 default NULL,
JOBDISPATCHERERRORCODE VARCHAR2 default NULL,
PILOTERRORCODE VARCHAR2 default NULL,
SUPERRORCODE VARCHAR2 default NULL,
TASKBUFFERERRORCODE VARCHAR2 default NULL,
TRANSEXITCODE VARCHAR2 default NULL
)
AUTHID CURRENT_USER
AS
-- Necessary in order to avoid "ORA-14551 cannot perform a DML operation inside a query" error
-- PRAGMA AUTONOMOUS_TRANSACTION;
arch_maxtime DATE;
coll PANDAMON_JOBSPAGE_COLL:= PANDAMON_JOBSPAGE_COLL();
stmt VARCHAR2(4000);
my_request_token NUMBER;
my_range_days NUMBER;
my_jeditaskid VARCHAR2(20);
my_INPUTFILEPROJECT VARCHAR2(100);
n_iter NUMBER:=0;
n_days NUMBER:=0;
cnt_pandaids NUMBER:=0;

offset_min_partition_pos NUMBER;
offset_max_partition_pos NUMBER;
min_modiftime DATE;
max_modiftime DATE;

BEGIN


-- Ver 1.3, 20th Oct 2016

-- In order to validate that the input value is a real number
my_request_token := TO_NUMBER(REQUEST_TOKEN);
my_range_days := TO_NUMBER(RANGE_DAYS);


-- Several sections depending on the END_DATE and the asked time window backwards in the past

IF range_days IS NOT NULL THEN

	-- IMPORTANT encoded logic: If the END_DATE minus the RANGE_DAYS is larger then the current time minus 3 days, then we fit into the range of most recent 3 days
	-- ========================

	IF ( (SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ(END_DATE, 'DD-MM-YYYY HH24:MI:SS.FF TZH:TZM')) -  TO_NUMBER(RANGE_DAYS)) > SYS_EXTRACT_UTC(systimestamp) - 3 ) THEN

	-- Then call only to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE is enough because the requested time window is within the last 3 days
	-- INSERT data from the QUERY_JOBSPAGE function (most recent data)
	------------------------------------------------------------------------
	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	 SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:END_DATE,
	:RANGE_DAYS,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE
	)
	) ';

	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	END_DATE,
	RANGE_DAYS,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE ;


	-- 'END' label that the request is done
	INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
	COMMIT;


	ELSE --===================================== the period is not only within the last 3 days =============================================================================
	-- =====================================================================================================================================================================

	-- The period is larger than the last 3 days and then SUM the result from the QUERY_JOBSPAGE and QUERY_JOBSPAGE_ARCH has to be done with overlaps of PANDAIDs

	-- SELECT MAX(modificationtime) into ARCH_MAXTIME from ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH;
	/*
	IMPORTANT: insert into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT table in order to have two independent queries.
	If they are combined in a common SQL call with UNION ALL, then "ORA-08103: object no longer exists" is raised
	often because of the longer execution time on the QUERY_JOBSPAGE_ALL procedure being bound to the query start SCN where the PANDAMON_JOBSPAGE table partition is replaced every 5 minutes
	*/


	-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
	--------------------------------------------------------------------------------------------------------------

	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 	SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:END_DATE,
	:RANGE_DAYS,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE
	)
	) ';

	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	END_DATE,
	RANGE_DAYS,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE ;





	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the given RANGE_DAYS parameter
	----------------------------------------------------------------------------------------------------------------------------------------------------

	-- calculate the time span on in terms of PANDAMON_JOBSPAGE_ARCH table partitions (each partition is a day)
	-- EXTRACT function is used to get the number of days from the calculated interval

	offset_min_partition_pos := TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - ( SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ(END_DATE, 'DD-MM-YYYY HH24:MI:SS.FF TZH:TZM')) -  TO_NUMBER(RANGE_DAYS) ) ));

	offset_max_partition_pos := TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - ( SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ(END_DATE, 'DD-MM-YYYY HH24:MI:SS.FF TZH:TZM')) ) ));



	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND
	partition_position >= (SELECT ROUND(MAX(partition_position) - offset_min_partition_pos) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	AND
	partition_position <= ( SELECT ROUND(MAX(partition_position) - offset_max_partition_pos) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	order by PARTITION_POSITION) LOOP

	n_iter :=n_iter+1;

	-- prepare a MERGE instead of INSERT

	stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
	USING
	(
	SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
	FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
	(:PARTITION_NAME,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE)
	)) part
	ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
	WHEN MATCHED THEN
	UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
	WHEN NOT MATCHED THEN
	INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	--DBMS_OUTPUT.put_line(stmt);


	EXECUTE IMMEDIATE stmt USING
	j.partition_name,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
	n_iter ;


	-- commit the intermediate result
	COMMIT;

	END LOOP;



	-- Added on 5th Oct 2016
	-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
	SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

	IF cnt_pandaids <= 100 THEN

		IF ( JEDITASKID is NOT NULL) THEN

			my_JEDITASKID := JEDITASKID;

			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;

		ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN

			my_INPUTFILEPROJECT := INPUTFILEPROJECT;
			INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
			SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT  AND RETRIAL = 'N' and ROWNUM <=1000;

	-- Unfortunately at that point we do not know the
	--	ELSE
	--	INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
	--	SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where ROWNUM <=1000;

		END IF ;

	END IF;


-- 'END' label that the request is done
INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
COMMIT;


--============================================================
END IF; -- end of the case when the given RANGE_DAYS is NOT NULL;


ELSE -- the case when the RANGE_DAYS is NULL, then search for the fully available time range when JEDITASK or INPUTFILEPROJECT are given

	IF ( JEDITASKID is null and INPUTFILEPROJECT is null) THEN
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;


	IF ( JEDITASKID is NOT NULL) THEN

		-- get the full time range of JEDITASKID
		my_JEDITASKID := JEDITASKID;

		-- Get the timespan of certain JEDITASKID
		SELECT  MIN(modificationtime), MAX(modificationtime) INTO min_modiftime , max_modiftime
		FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where JEDITASKID = to_number(my_JEDITASKID);

		SELECT TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - min_modiftime ) ) ,
			TO_NUMBER(EXTRACT( DAY FROM SYS_EXTRACT_UTC(systimestamp) - max_modiftime ) ) 
      INTO  offset_min_partition_pos, offset_max_partition_pos 
		FROM dual;


	ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
		-- get the full time range of INPUTFILEPROJECT
		my_INPUTFILEPROJECT := INPUTFILEPROJECT;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))) INTO n_days FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where INPUTFILEPROJECT = my_INPUTFILEPROJECT;
	ELSE
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;



/* the old logic 
	IF ( JEDITASKID is NOT NULL) THEN
		-- get the full time range of JEDITASKID
		my_JEDITASKID := JEDITASKID;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))) INTO n_days FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where JEDITASKID = to_number(my_JEDITASKID);

	ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
		-- get the full time range of INPUTFILEPROJECT
		my_INPUTFILEPROJECT := INPUTFILEPROJECT;
		SELECT ROUND(sysdate - TRUNC(MIN(modificationtime))) INTO n_days FROM ATLAS_PANDABIGMON.pandamon_jobspage_arch where INPUTFILEPROJECT = my_INPUTFILEPROJECT;
	ELSE
		raise_application_error(-20010, 'Undefined time window is available only for JEDITASKID or INPUTFILEPROJECT job attributes!');
	END IF;
*/



	-- 1.1: Call to the ATLAS_PANDABIGMON.QUERY_JOBSPAGE to insert aggregated data of the most recent PanDA data
	-- (hardcoded 30 days because there could be periods of 'stuck' jobs)
	--------------------------------------------------------------------------------------------------------------

	stmt:= 'INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
 	SELECT :request_token, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES, :n_iter FROM table
	(
	ATLAS_PANDABIGMON.QUERY_JOBSPAGE
	(
	:END_DATE,
	:RANGE_DAYS,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE
	)
	) ';

	n_iter := n_iter+1;

	EXECUTE IMMEDIATE stmt USING
	my_request_token,
	n_iter,
	END_DATE,
	'30',
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE ;


	-- 1.2: MERGE data into the JOBSPAGE_CUMULATIVE_RESULT partition by partition by calling the QUERY_JOBSPAGE_ARCH_PARTITION function in a loop
	-- Get all partitions by position > the partition number - the computed N_DAYS
	----------------------------------------------------------------------------------------------------------------------------------------------------

	 -- BEFORE the loop: Parallelism Settings on session level
	--EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = TRUE';
	--EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 2';



	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
	AND
	partition_position >= (SELECT ROUND(MAX(partition_position) - (offset_min_partition_pos +2)) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	AND
	partition_position <= ( SELECT ROUND(MAX(partition_position) - (offset_max_partition_pos-2)) FROM ALL_TAB_PARTITIONS
	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
	order by PARTITION_POSITION) LOOP


--	FOR j IN (SELECT partition_name  FROM ALL_TAB_PARTITIONS WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH'
--	AND partition_position >= (SELECT ROUND(MAX(partition_position) - n_days)  FROM ALL_TAB_PARTITIONS
--	WHERE table_owner = 'ATLAS_PANDABIGMON' AND table_name = 'PANDAMON_JOBSPAGE_ARCH' )
--	order by PARTITION_POSITION) LOOP

	n_iter :=n_iter+1;

	-- prepare a MERGE statement for providing a cumulative result
	stmt:= 'MERGE into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT aggr
	USING
	(
	SELECT '|| TO_CHAR(my_request_token) ||' as MY_REQ_TOKEN, PANDA_ATTRIBUTE, ATTR_VALUE, NUM_OCCURRENCES
	FROM table(ATLAS_PANDABIGMON.QUERY_JOBSPAGE_ARCH_PARTITION
	(:PARTITION_NAME,
	:WITH_RETRIALS,
	:SHOW_RETRIED_PANDAIDS,
	:ATLASRELEASE,
	:ATTEMPTNR,
	:COMPUTINGSITE,
	:CLOUD,
	:EVENTSERVICE,
	:HOMEPACKAGE,
	:INPUTFILEPROJECT,
	:INPUTFILETYPE,
	:JEDITASKID,
	:JOBSTATUS,
	:JOBSUBSTATUS,
	:MINRAMCOUNT,
	:NUCLEUS,
	:PROCESSINGTYPE,
	:PRODSOURCELABEL ,
	:PRODUSERNAME ,
	:REQID ,
	:TRANSFORMATION ,
	:WORKINGGROUP ,
	:BROKERAGEERRORCODE ,
	:DDMERRORCODE ,
	:EXEERRORCODE ,
	:JOBDISPATCHERERRORCODE ,
	:PILOTERRORCODE ,
	:SUPERRORCODE ,
	:TASKBUFFERERRORCODE ,
	:TRANSEXITCODE)
	)) part
	ON (aggr.REQUEST_TOKEN = part.MY_REQ_TOKEN AND aggr.ATTR=part.PANDA_ATTRIBUTE AND aggr.ATTR_VALUE=part.ATTR_VALUE )
	WHEN MATCHED THEN
	UPDATE SET aggr.NUM_OCCUR = aggr.NUM_OCCUR + part.NUM_OCCURRENCES, aggr.NUM_ITERATIONS = aggr.NUM_ITERATIONS+1
	WHEN NOT MATCHED THEN
	INSERT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS)
	VALUES (part.MY_REQ_TOKEN, part.PANDA_ATTRIBUTE, part.ATTR_VALUE, part.NUM_OCCURRENCES, :n_iter ) ';


	--DBMS_OUTPUT.put_line(stmt);


	EXECUTE IMMEDIATE stmt USING
	j.partition_name,
	WITH_RETRIALS,
	SHOW_RETRIED_PANDAIDS,
	ATLASRELEASE,
	ATTEMPTNR,
	COMPUTINGSITE,
	CLOUD,
	EVENTSERVICE,
	HOMEPACKAGE,
	INPUTFILEPROJECT,
	INPUTFILETYPE,
	JEDITASKID,
	JOBSTATUS,
	JOBSUBSTATUS,
	MINRAMCOUNT,
	NUCLEUS,
	PROCESSINGTYPE,
	PRODSOURCELABEL ,
	PRODUSERNAME ,
	REQID ,
	TRANSFORMATION ,
	WORKINGGROUP ,
	BROKERAGEERRORCODE ,
	DDMERRORCODE ,
	EXEERRORCODE ,
	JOBDISPATCHERERRORCODE ,
	PILOTERRORCODE ,
	SUPERRORCODE ,
	TASKBUFFERERRORCODE ,
	TRANSEXITCODE,
	n_iter ;


	-- commit the intermediate result
	COMMIT;


END LOOP;


  -- AFTER the loop: settings on session level
  -- EXECUTE IMMEDIATE 'ALTER SESSION SET PARALLEL_FORCE_LOCAL = FALSE';
  -- EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY parallel 1';


-- Added on 21st Sept 2016
-- If the number of PanDAIDs is less than 100 then get the first found 1000 PANDAIDs from the PANDAMON_JOBSPAGE_ARCH table
SELECT count(*) INTO cnt_pandaids from ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT where REQUEST_TOKEN = my_request_token and attr = 'PANDAID';

IF cnt_pandaids <= 100 THEN

	IF ( JEDITASKID is NOT NULL) THEN

	INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
	SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where JEDITASKID = my_JEDITASKID AND RETRIAL = 'N' and ROWNUM <=1000;

	ELSIF ( INPUTFILEPROJECT is NOT NULL) THEN
	INSERT INTO ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT (REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS )
	SELECT my_request_token , 'PANDAID', pandaid, 1, 1 FROM ATLAS_PANDABIGMON.PANDAMON_JOBSPAGE_ARCH where INPUTFILEPROJECT = my_INPUTFILEPROJECT AND RETRIAL = 'N' and ROWNUM <=1000;

	END IF ;

END IF;


-- 'END' label that the request is done
INSERT into ATLAS_PANDABIGMON.JOBSPAGE_CUMULATIVE_RESULT(REQUEST_TOKEN, ATTR, ATTR_VALUE, NUM_OCCUR, NUM_ITERATIONS ) VALUES(my_request_token, 'END', 'END', 1 , n_iter );
COMMIT;


END IF;


END;

/

  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE_MM" TO "ATLAS_PANDABIGMON_W";
  GRANT EXECUTE ON "ATLAS_PANDABIGMON"."QUERY_JOBSPAGE_CUMULATIVE_MM" TO "ATLAS_PANDABIGMON_R";
