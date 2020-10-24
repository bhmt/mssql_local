# local_mssql

Create a container from `mcr.microsoft.com/mssql/server` docker image, and use files in the `db` folder to create a database, schema, and run seed files.
The default database name is `mydb` and can be changed in the `mssql.Dockerfile`.

The schemas files are any files found recursively in the `db/commands/schemas` folder, and seed files are found in the same way from the `db/commands/seed` folder.
All constraints are removed before running the seed files and added after, to easily loop over files and run them without getting Foreign Key Constraint errors. 

<ins>The container user is set to root</ins>, to make sure setup script can have the correct permissions.

## Description

docker-compose is used to be able to rebuild and run the container without the need to stop the container.
To recreate the container and reuse the seed files the `--build` flag is used.

### Setup

`db/helper/setup.sh` follows a few steps:

    - add schemas
    - run schemas files to create all schemas
    - remove all constraints
    - run seed files to populate tables
    - add all constraints back
    - [optional] check if seed worked by running check_seed.sql


### Add, change, or remove items 

Follow `db/helper/add_schemas.sql` example for `Users` schema to create you own.
`db/commands` folder contains example for creating the tables and defining the seed files.

### Environment

The container will use the port `1433` that is a default port for mssql.
Default user is `sa`, and the password is set to `1q2w3e4r.`
Add, change, or remove environment variables in mssql.Dockerfile.

## Run
Run using `docker-compose up -d --build`
