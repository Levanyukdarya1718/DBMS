USE PV_319_Import;
GO

CREATE FUNCTION GetHolidaysDuration	(@name	AS NVARCHAR(150)) RETURNS TINYINT
BEGIN
		RETURN	(SELECT	duration FROM Holidays WHERE holiday_name LIKE @name);
END