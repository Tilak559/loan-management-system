FROM mysql:8.0.33

ENV MYSQL_ROOT_PASSWORD=my-secret-pw

COPY ./query.sql /docker-entrypoint-initdb.d/

