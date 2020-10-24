SELECT 
    [foo_replace_me].[Users].[Items].[uuid],
    [foo_replace_me].[Users].[Items].[name],
    [foo_replace_me].[Users].[Items].[description],
    [foo_replace_me].[Users].[User].[username],
    [foo_replace_me].[Users].[User].[email]
FROM [foo_replace_me].[Users].[Items]
INNER JOIN [foo_replace_me].[Users].[User]
ON [foo_replace_me].[Users].[User].[id] = [foo_replace_me].[Users].[Items].[user_id];
GO
