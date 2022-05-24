#!/bin/bash
set -e

DIR=/docker-entrypoint-initdb.d/sqls

PANDA_DB_PASSWORD=${PANDA_DB_PASSWORD:-password}
sed 's/${PANDA_DB_PASSWORD}/'"${PANDA_DB_PASSWORD}"'/g' ${DIR}/init_step.sql > /tmp/init_step.sql
psql -U postgres -v ON_ERROR_STOP=1 -f /tmp/init_step.sql

for COMP in PANDA PANDAMETA PANDAARCH PANDABIGMON DEFT PARTITION
do
    FILE=${DIR}/pg_${COMP}.sql
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

psql -U postgres -d panda_db -f $DIR/post_step_panda.sql
psql -U postgres -f $DIR/post_step_cron.sql
