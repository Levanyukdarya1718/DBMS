USE PV_319_Import;
SET DATEFIRST 1;
GO

PRINT (dbo.GetGroupID(N'PV_319'));
PRINT(dbo.GetDisciplineID(N'Hardware%'));
--EXEC sp_PrintScheduleForGroup N'PV_319';
PRINT (dbo.CountSpentLessons(N'PV_319',N'Процедурное программирование%'));
PRINT (dbo.GetNewYearHolidaysStartDate(2024));
PRINT(dbo.GetSummerHolidaysStary(2023));
PRINT (dbo.GetHolidaysDuration (N'Майские%'));
PRINT (N'----------------------------------');

DECLARE @holiday	AS	NVARCHAR(150) = N'Нов%';
DECLARE @year		AS	SMALLINT = 2025;
PRINT (dbo.GetHolidayStartDate (@holiday, @year));

DECLARE @month AS TINYINT = (SELECT [month] FROM Holidays WHERE holiday_name LIKE @holiday);
		DECLARE @day	AS TINYINT =(SELECT [day]	FROM Holidays WHERE holiday_name LIKE @holiday);
		DECLARE @start_date AS DATE =
		(
		CASE
		WHEN	@holiday	LIKE N'Нов%'	THEN  dbo.GetNewYearHolidaysStartDate(@year)	
		WHEN	@holiday	LIKE N'Лет%'	THEN  dbo.GetSummerHolidaysStary(@year)		
		WHEN	@month !=0 AND @day != 0	THEN DATEFROMPARTS (@year,@month, @day)
		END
		)
		--SET @start_date = DATEFROMPARTS(@year, (SELECT))
		--PRINT(@start_date);