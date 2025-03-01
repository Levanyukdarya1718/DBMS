USE PV_319_Import
SET DATEFIRST 1;
GO 
DECLARE @date AS DATE = DATEFROMPARTS (2025,01,01);
DECLARE @weekday	AS TINYINT = DATEPART (WEEKDAY,@date);
DECLARE @start_date AS DATE = DATEADD(DAY, 1-@weekday, @date);
PRINT(@date)
PRINT (@weekday);
PRINT(@start_date);
--CREATE PROCEDURE sp_AddNewYearHolidaysFor
--		@year	AS SMALLINT  
--BEGIN
--		DECLARE @start_date AS DATE = 
--END
