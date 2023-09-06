-- patches to be included in the next version

ALTER TABLE "DOMA_PANDA"."JEDI_EVENTS" ADD ("ERROR_DIAG" VARCHAR2(500 BYTE));


UPDATE "DOMA_PANDA"."PANDADB_VERSION" SET major=0, minor=0, patch=15 where component='JEDI';
UPDATE "DOMA_PANDA"."PANDADB_VERSION" SET major=0, minor=0, patch=15 where component='SERVER';

COMMIT;
