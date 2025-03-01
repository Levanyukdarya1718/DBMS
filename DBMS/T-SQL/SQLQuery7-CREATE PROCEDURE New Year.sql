USE PV_319_Import
SET DATEFIRST 1;
GO 
--DECLARE @date AS DATE = DATEFROMPARTS (2025,01,01);
--DECLARE @weekday	AS TINYINT = DATEPART (WEEKDAY,@date);
--DECLARE @start_date AS DATE = DATEADD(DAY, 1-@weekday, @date);
--PRINT(@date)
--PRINT (@weekday);
--PRINT(@start_date);
CREATE PROCEDURE sp_AddNewYearHolidaysFor
		@year	AS SMALLINT  
BEGIN
		DECLARE @new_year_date		 AS DATE = DATEFROMPARTS (2025,01,01);
		DECLARE @weekday	AS TINYINT		= DATEPART (WEEKDAY,@new_year_date);
		DECLARE @start_date AS DATE			= DATEADD(DAY, 1-@weekday, @new_year_date);
		DECLARE @date		AS DATE			=	@start_date;
		DECLARE @duraction	AS TINYINT		= (SELECT duration FROM Holidays WHERE holiday_id = 1);
		DECLARE @day		AS TINYINT		=	0;

		WHILE @day < @duraction
		BEGIN
			INSERT	DaysOFF ([date], holiday) VALUES (@date,1);
			SET		@date	=	DATEADD(DAY,1, @date);
			SET		@duraction	=	@duraction-1;
		END
		--PRINT(@date)
		--PRINT (@weekday);
		--PRINT(@start_date);
END
