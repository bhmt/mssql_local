#!/bin/sh
set -ex

/opt/mssql-tools/bin/sqlcmd -S $HOST -U $USERNAME -P $SA_PASSWORD -i /opt/scripts/add_schemas.sql;

# schemas
for f in /opt/scripts/schemas/*.sql
do
    /opt/mssql-tools/bin/sqlcmd -S $HOST -U $USERNAME -P $SA_PASSWORD -d $DATABASE -i $f;
done

/opt/mssql-tools/bin/sqlcmd -S $HOST -U $USERNAME -P $SA_PASSWORD -d $DATABASE -i /opt/scripts/constraint_off.sql;

# seed
for f in /opt/scripts/seed/*.sql
do
    /opt/mssql-tools/bin/sqlcmd -S $HOST -U $USERNAME -P $SA_PASSWORD -d $DATABASE -i $f;
done

/opt/mssql-tools/bin/sqlcmd -S $HOST -U $USERNAME -P $SA_PASSWORD -d $DATABASE -i /opt/scripts/constraint_on.sql;
/opt/mssql-tools/bin/sqlcmd -S $HOST -U $USERNAME -P $SA_PASSWORD -d $DATABASE -i /opt/scripts/check_seed.sql;
