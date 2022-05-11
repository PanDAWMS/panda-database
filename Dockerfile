ARG VERSION=14

FROM postgres:${VERSION}

ARG VERSION
ENV POSTGRES_PASSWORD password

RUN apt-get update \
      && apt-get install -y postgresql-${VERSION}-cron \
      postgresql-${VERSION}-partman \
      && rm -rf /var/lib/apt/lists/*


COPY ./etc/postgresql.conf /etc/postgresql/postgresql.conf

RUN mkdir -p /docker-entrypoint-initdb.d/sqls

COPY ./initdb/*.sh /docker-entrypoint-initdb.d/
COPY ./initdb/sqls/* /docker-entrypoint-initdb.d/sqls/

USER postgres
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
