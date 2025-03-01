USE PV_319_Import;
SET DATEFIRST 1;
GO

PRINT (dbo.GetGroupID(N'PV_319'));
PRINT(dbo.GetDisciplineID(N'Hardware%'));
--EXEC sp_PrintScheduleForGroup N'PV_319';
PRINT (dbo.CountSpentLessons(N'PV_319',N'Процедурное программирование%'));