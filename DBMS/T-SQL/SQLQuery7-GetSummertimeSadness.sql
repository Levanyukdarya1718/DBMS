USE PV_319_Import;
GO

ALTER FUNCTION GetSummerHolidaysStary (@year AS SMALLINT) RETURNS DATE
BEGIN
	DECLARE	@first_august	AS DATE		=	DATEFROMPARTS(@year, 08,01);
	DECLARE @weekday		AS TINYINT	=	DATEPART(WEEKDAY, @first_august);
	DECLARE @start_date		AS DATE		=	DATEADD(DAY, -@weekday+1, @first_august);
	RETURN	@start_date;
END
