USE PV_319_Import;
GO

--DROP TABLE Holidays;
--CREATE TABLE Holidays
--(
--	holiday_id		TINYINT			PRIMARY KEY,
--	holiday_name	NVARCHAR(150)	 NOT NULL,

--);
CREATE TABLE DaysOFF
(
	[date]	DATE	PRIMARY KEY,
	holiday	TINYINT NOT NULL	CONSTRAINT	FK_DO_Holidays	REFERENCES	Holidays (holiday_id)
);
GO
--INSERT Holidays
--		(holiday_id, holiday_name)
--VALUES	
--		(1,		N'���������� ��������'),
--		(2,		N'23 �������'),
--		(3,		N'8 �����'),
--		(4,		N'�����'),
--		(5,		N'������� ��������'),
--		(6,		N'������ ��������'),
--		(7,		N'���� ��������� ��������')
--;
ALTER TABLE Holidays
ADD duration TINYINT;
GO

--ALTER TABLE Holidays
--DROP COLUMN duraction;

UPDATE Holidays SET duration =14 WHERE holiday_id=1;
UPDATE Holidays SET duration =3 WHERE holiday_id=2;
UPDATE Holidays SET duration =3 WHERE holiday_id=3;
UPDATE Holidays SET duration =3 WHERE holiday_id=4; 
UPDATE Holidays SET duration =10 WHERE holiday_id=5; 
UPDATE Holidays SET duration =14 WHERE holiday_id=6; 
UPDATE Holidays SET duration =3 WHERE holiday_id=7;

SELECT * FROM Holidays;