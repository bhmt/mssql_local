SET IDENTITY_INSERT [Users].[User] ON

INSERT INTO [Users].[User]
	(id, uuid, username, email)
VALUES
	(1, "826f1f20-6e61-48d1-83e1-1f10f1c2f1d9" ,'First', 'test@mail.com'),
	(2, "8001055c-2c46-4188-938a-a1776534aae8" ,'Second', 'additional@mail.com');

SET IDENTITY_INSERT [Users].[User] OFF
