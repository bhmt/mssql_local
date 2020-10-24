SET IDENTITY_INSERT [Users].[Items] ON

INSERT INTO [Users].[Items]
	(id, user_id, uuid, name, description)
VALUES
	(1, 1, "d769f5ef-92fd-4a73-9633-173c5a989120", 'One Item', 'Some short description'),
	(2, 1, "9d4004da-20a7-4ad0-8e41-87e7084dfeaf", 'Two Items', 'Something more'),
	(3, 2, "20a704da-9d40-8e41-4ad0-87e7084dfeaf", 'Three Items', 'Example'),
	(4, 2, "4ad004da-20a7-9d40-8e41-87e7084dfeaf", 'Four Items', 'Last item in seed');

SET IDENTITY_INSERT [Users].[Items] OFF
