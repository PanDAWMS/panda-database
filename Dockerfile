ARG VERSION=14

FROM postgres:${VERSION}

ARG VERSION

ENV POSTGRESQL_USER postgres
ENV POSTGRES_PASSWORD password

# to run with non-root PID
ENV PGDATA /temp/data

RUN apt-get update \
      && apt-get install -y postgresql-${VERSION}-cron \
      postgresql-${VERSION}-partman procps \
      && rm -rf /var/lib/apt/lists/*


COPY ./etc/*.conf /etc/postgresql/

RUN mkdir -p /docker-entrypoint-initdb.d/sqls

COPY ./initdb/*.sh /docker-entrypoint-initdb.d/
COPY ./initdb/sqls/* /docker-entrypoint-initdb.d/sqls/

# to run with non-root PID
RUN mkdir /temp
RUN chmod 777 /temp
RUN mkdir -p /var/run/postgres && chmod -R 777 /var/run
RUN chmod -R 777 /docker-entrypoint-initdb.d

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "hba_file=/etc/postgresql/pg_hba.conf"]
