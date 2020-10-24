CREATE DATABASE foo_replace_me;
GO

USE foo_replace_me;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Users')
  BEGIN
    EXEC ('CREATE SCHEMA Users;');
  END
