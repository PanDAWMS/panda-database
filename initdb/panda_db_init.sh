#!/bin/bash
set -e

DIR=/docker-entrypoint-initdb.d/sqls

PANDA_PASSWORD=${PANDA_PASSWORD:-password}
sed 's/${PANDA_PASSWORD}/'"${PANDA_PASSWORD}"'/g' ${DIR}/init_database.sql > /tmp/init_database.sql
psql -U postgres -v ON_ERROR_STOP=1 -f /tmp/init_database.sql

for COMP in PANDA PANDAMETA PANDAARCH PANDABIGMON DEFT PARTITION
do
    FILE=${DIR}/pg_${COMP}_${SUB}.sql
        if [ -f "$FILE" ]; then
            psql -U postgres -d panda_db -f ${FILE}
        fi
    for SUB in TABLE VIEW TYPE SEQUENCE FUNCTION SCHEDULER_JOBS
    do
        FILE=${DIR}/pg_${COMP}_${SUB}.sql
        if [ -f "$FILE" ]; then
            psql -U postgres -d panda_db -f ${FILE}
        fi
    done
done
