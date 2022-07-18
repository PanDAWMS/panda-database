#!/bin/bash
set -e

# redirect stdout to log file
exec 6>&1
exec 7>&2
exec > /var/log/initdb.log 2>&1

DIR=/docker-entrypoint-initdb.d/sqls

PANDA_DB_PASSWORD=${PANDA_DB_PASSWORD:-password}
sed 's/${PANDA_DB_PASSWORD}/'"${PANDA_DB_PASSWORD}"'/g' ${DIR}/init_step.sql > /tmp/init_step.sql

echo ========== init database
psql -U postgres -v ON_ERROR_STOP=1 -f /tmp/init_step.sql
echo

for COMP in PANDA PANDAMETA PANDAARCH PANDABIGMON DEFT PARTITION
do
    FILE=${DIR}/pg_${COMP}.sql
        if [ -f "$FILE" ]; then
            echo ========== setup ${FILE}
            psql -U postgres -d panda_db -f ${FILE}
            echo
        fi
    for SUB in TABLE VIEW TYPE SEQUENCE FUNCTION TRIGGER SCHEDULER_JOBS
    do
        FILE=${DIR}/pg_${COMP}_${SUB}.sql
        if [ -f "$FILE" ]; then
            echo ========== setup ${FILE}
            psql -U postgres -d panda_db -f ${FILE}
            echo
        fi
    done
done

echo ========== post step
psql -U postgres -d panda_db -f $DIR/post_step_panda.sql
echo

echo ========== install cron
psql -U postgres -f $DIR/post_step_cron.sql
echo

echo ========== done

# restore stdout
exec 1>&6 6>&-
exec 2>&7 7>&-
