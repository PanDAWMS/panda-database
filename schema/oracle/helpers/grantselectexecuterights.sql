-- Helper sql file to grant select and execute from
-- OWNER (DOMA_PANDAMETA in our case) to a new USER (DOMA_PANDABIGMON_R in our case).
BEGIN
   FOR objects IN
   (
         SELECT 'GRANT SELECT ON DOMA_PANDAMETA."'||object_name||'" TO DOMA_PANDABIGMON_R' grantSQL
           FROM all_objects
          WHERE owner = 'DOMA_PANDAMETA'
            AND object_type NOT IN
                (
                   --Ungrantable objects.  Your schema may have more.
                   'SYNONYM', 'INDEX', 'INDEX PARTITION', 'DATABASE LINK',
                   'LOB', 'TABLE PARTITION', 'TRIGGER', 'PROCEDURE', 'PACKAGE',
                   'FUNCTION', 'JOB', 'TYPE', 'LOB PARTITION'
                )
       ORDER BY object_type, object_name
   ) LOOP
      BEGIN
         EXECUTE IMMEDIATE objects.grantSQL;
      EXCEPTION WHEN OTHERS THEN
         --Ignore ORA-04063: view "X.Y" has errors.
         --(You could potentially workaround this by creating an empty view,
         -- granting access to it, and then recreat the original view.)
         IF SQLCODE IN (-4063) THEN
            NULL;
         --Raise exception along with the statement that failed.
         ELSE
            raise_application_error(-20000, 'Problem with this statement: ' ||
               objects.grantSQL || CHR(10) || SQLERRM);
         END IF;
      END;
   END LOOP;
END;
/

BEGIN
   FOR objects IN
   (
         SELECT 'GRANT EXECUTE ON DOMA_PANDAMETA."'||object_name||'" TO DOMA_PANDABIGMON_R' grantSQL
           FROM all_objects
          WHERE owner = 'DOMA_PANDAMETA'
            AND object_type IN
                (
                   'PROCEDURE', 'PACKAGE', 'FUNCTION'
                )
       ORDER BY object_type, object_name
   ) LOOP
      BEGIN
         EXECUTE IMMEDIATE objects.grantSQL;
      EXCEPTION WHEN OTHERS THEN
         --Ignore ORA-04063: view "X.Y" has errors.
         --(You could potentially workaround this by creating an empty view,
         -- granting access to it, and then recreat the original view.)
         IF SQLCODE IN (-4063) THEN
            NULL;
         --Raise exception along with the statement that failed.
         ELSE
            raise_application_error(-20000, 'Problem with this statement: ' ||
               objects.grantSQL || CHR(10) || SQLERRM);
         END IF;
      END;
   END LOOP;
END;
/