#!/bin/bash
set -e

# redirect stdout to log file
exec 6>&1
exec > /var/log/initdb.log

DIR=/docker-entrypoint-initdb.d/sqls

PANDA_DB_PASSWORD=${PANDA_DB_PASSWORD:-password}
sed 's/${PANDA_DB_PASSWORD}/'"${PANDA_DB_PASSWORD}"'/g' ${DIR}/init_step.sql > /tmp/init_step.sql

echo INFO init database
psql -U postgres -v ON_ERROR_STOP=1 -f /tmp/init_step.sql

for COMP in PANDA PANDAMETA PANDAARCH PANDABIGMON DEFT PARTITION
do
    FILE=${DIR}/pg_${COMP}.sql
        if [ -f "$FILE" ]; then
            echo INFO setup ${FILE}
            psql -U postgres -d panda_db -f ${FILE}
            echo INFO done  ${FILE}
        fi
    for SUB in TABLE VIEW TYPE SEQUENCE FUNCTION TRIGGER SCHEDULER_JOBS
    do
        FILE=${DIR}/pg_${COMP}_${SUB}.sql
        if [ -f "$FILE" ]; then
            echo INFO setup ${FILE}
            psql -U postgres -d panda_db -f ${FILE}
            echo INFO done  ${FILE}
        fi
    done
done

echo INFO post step
psql -U postgres -d panda_db -f $DIR/post_step_panda.sql

echo INFO install cron
psql -U postgres -f $DIR/post_step_cron.sql

# restore stdout
exec 1>&6 6>&-
