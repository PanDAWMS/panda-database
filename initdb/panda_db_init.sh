#!/bin/bash
set -e

# compare version strings
ver_let() {
    [  "$1" = "$(printf "%s\n%s" "$1" "$2" | sort -V | head -n1)" ]
}

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

# check schema version
LATEST_VERSION=$(cat ${DIR}/version)
CURRENT_VERSION=$(psql -d panda_db -U postgres -tc "SELECT schema_version FROM panda_db_info")

if [ -z "$CURRENT_VERSION" ]; then
    # new database
    psql -d panda_db -U postgres -c "INSERT INTO panda_db_info (schema_version) VALUES('${LATEST_VERSION}')"
else
    echo "Latest: $LATEST_VERSION   Current: $CURRENT_VERSION"
    # exit if already latest
    if ver_let ${LATEST_VERSION} ${CURRENT_VERSION} ; then
        echo ========== already using the latest schema "$LATEST_VERSION"
        exit 0
    fi
    # patch
    LAST_PATCH="$CURRENT_VERSION".patch.sql
    for patchname in $(find "$DIR" -name "*.patch.sql" -printf "%\n" | sort -V); do
        if ver_let ${LAST_PATCH} ${patchname} ; then
            echo ========== patch "$patchname"
            psql -d panda_db -U postgres -c "$DIR/$patchname"
        fi
    done
    # update version
    psql -d panda_db -U postgres -c "UPDATE panda_db_info set schema_version='${LATEST_VERSION}'"
    echo ========== updated to the latest schema "$LATEST_VERSION"
    exit 0
fi

# define database objects for new database
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
