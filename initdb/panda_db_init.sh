#!/bin/bash
set -e

DIR=/docker-entrypoint-initdb.d/sqls

psql -v ON_ERROR_STOP=1 -f ${DIR}/init_database.sql

for COMP in PANDA PANDAMETA PANDAARCH PANDABIGMON DEFT PARTITION
do
    FILE=${DIR}/pg_${COMP}_${SUB}.sql
        if [ -f "$FILE" ]; then
            psql -d panda_db -f ${FILE}
        fi
    for SUB in TABLE VIEW TYPE SEQUENCE FUNCTION SCHEDULER_JOBS
    do
        FILE=${DIR}/pg_${COMP}_${SUB}.sql
        if [ -f "$FILE" ]; then
            psql -d panda_db -f ${FILE}
        fi
    done
done
