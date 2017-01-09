/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO Student AS Target
USING (VALUES 
        (1, 'Donnie', 15), 
        (2, 'Liza', 15), 
	    (3, 'Phil', 15)
)
AS Source (Id,Name, Age)
ON Target.StudentID = Source.StudentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Name, Age)
VALUES (Name, Age); 
