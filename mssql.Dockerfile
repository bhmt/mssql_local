FROM mcr.microsoft.com/mssql/server

RUN mkdir -p /opt/scripts/seed /opt/scripts/schemas /tmp/db
COPY db/ /tmp/db/

USER root
RUN chmod +x /tmp/db/helper/setup.sh

RUN cp /tmp/db/helper/* /opt/scripts/
RUN find /tmp/db/commands/seed/ -type f -name "*.sql" -exec cp {} /opt/scripts/seed/ \;
RUN find /tmp/db/commands/schemas/ -type f -name "*.sql" -exec cp {} /opt/scripts/schemas/ \;

ENV USERNAME "sa"
ENV HOST "localhost"
ENV SA_PASSWORD "1q2w3e4r."
ENV ACCEPT_EULA "Y"
ENV DATABASE "mydb"

RUN sed -i "s/foo_replace_me/$DATABASE/g" /opt/scripts/add_schemas.sql
RUN sed -i "s/foo_replace_me/$DATABASE/g" /opt/scripts/check_seed.sql

RUN ( /opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" && /opt/scripts/setup.sh
