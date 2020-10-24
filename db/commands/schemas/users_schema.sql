/* Drop Tables */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Users].[User]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Users].[User]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Users].[Items]') AND OBJECTPROPERTY(id, N'IsItemsTable') = 1) 
DROP TABLE [Users].[Items]
GO

/* Create Tables */
CREATE TABLE [Users].[User] (
  [id] int NOT NULL IDENTITY(1, 1),
  [uuid] varchar (36) NOT NULL,
  [username] varchar(15) NOT NULL,
  [email] varchar(254) NOT NULL
)
GO

CREATE TABLE [Users].[Items] (
  [id] int NOT NULL IDENTITY(1, 1),
  [user_id] int NOT NULL,
  [uuid] varchar(36) NOT NULL,
  [name] varchar(20) NOT NULL,
  [description] varchar(200)
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */
/* User */
ALTER TABLE [Users].[User]
 ADD CONSTRAINT [PK_User]
	PRIMARY KEY CLUSTERED ([Id] ASC)
GO

ALTER TABLE [Users].[User] 
 ADD CONSTRAINT [UK_User_Uuid] UNIQUE NONCLUSTERED ([uuid] ASC)
GO

ALTER TABLE [Users].[User] 
 ADD CONSTRAINT [UK_User_UserName] UNIQUE NONCLUSTERED ([username] ASC)
GO

ALTER TABLE [Users].[User] 
 ADD CONSTRAINT [UK_User_Email] UNIQUE NONCLUSTERED ([email] ASC)
GO

/* Items */
ALTER TABLE [Users].[Items] 
 ADD CONSTRAINT [PK_Items]
	PRIMARY KEY CLUSTERED ([Id] ASC)
GO

ALTER TABLE [Users].[Items] 
 ADD CONSTRAINT [UK_Items_Uuid] UNIQUE NONCLUSTERED ([uuid] ASC)
GO

/* Create Foreign Key constraints */
ALTER TABLE [Users].[Items] 
	ADD FOREIGN KEY ([user_id]) REFERENCES [Users].[User] ([id])
GO
