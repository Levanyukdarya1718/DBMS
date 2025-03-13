USE PV_319_Import
SET DATEFIRST 1;
GO

ALTER PROCEDURE sp_ScheduleForBaseStacionarGroup
	@group_name				NVARCHAR(16),
	@dascipline_name		NVARCHAR	(150),
	@teacher_last_name		NVARCHAR(50),
	@start_date				DATE	,
	@time					TIME(0),
	--@learning_1				TINYINT,
	--@learning_2				TINYINT,
	--@learning_3				TINYINT,
	@resident_day			TINYINT,
	@alternating_day			TINYINT,
	@first_week_present		BIT
AS
BEGIN
	DECLARE @group					AS	INT			=		(SELECT group_id				FROM Groups			WHERE group_name=@group_name);
	DECLARE @discipline				AS	SMALLINT		=		(SELECT discipline_id		FROM Disciplines		WHERE discipline_name LIKE @dascipline_name);
	DECLARE @teacher					AS	SMALLINT		=		(SELECT teacher_id			FROM Teachers		WHERE last_name = @teacher_last_name);
	DECLARE @date					AS	DATE			=		@start_date;
	DECLARE @current_week_present	AS	BIT		=		@first_week_present;
	DECLARE @number_of_lessons		TINYINT		=		(SELECT number_of_lessons	FROM Disciplines		WHERE discipline_id = @discipline);
	DECLARE	@lesson_number			AS	TINYINT = 0;
		
	DECLARE @rr_interval AS TINYINT = 7; 
	DECLARE @ar_interval AS TINYINT = IIF(@alternating_day > @resident_day, @alternating_day-@resident_day, @resident_day-@alternating_day);
	DECLARE @ra_interval AS TINYINT = @rr_interval - @ar_interval;

	PRINT(@number_of_lessons);
	PRINT('Intervals:');
	PRINT(@rr_interval);
	PRINT(@ar_interval);
	PRINT (@ra_interval);

	WHILE	(@lesson_number<@number_of_lessons)
	BEGIN
		PRINT(@date);
		IF (NOT EXISTS (SELECT [date] FROM DaysOFF WHERE [date]=@date))
		BEGIN
			IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = @time)
			BEGIN
				PRINT(DATENAME(WEEKDAY,@date));
				PRINT (DATEPART(WEEKDAY,@date));
				PRINT(@lesson_number+1);
				PRINT(@time);
				PRINT('Inserted');
				INSERT Schedule
					([group],discipline,teacher,[date],[time],spent)
				VALUES (@group,@discipline,@teacher,@date, @time,IIF(@date<GETDATE(),1,0))
			END
			SET	@lesson_number = @lesson_number+1;
			PRINT(@lesson_number+1);
			PRINT(DATEADD(MINUTE, 95,@time));
			
			IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = DATEADD(MINUTE,95,@time))
			BEGIN
				PRINT(DATENAME(WEEKDAY,@date));
				PRINT (DATEPART(WEEKDAY,@date));
				PRINT(@lesson_number+1);
				PRINT(DATEADD(MINUTE,95,@time));
				

				INSERT Schedule
					([group],discipline,teacher,[date],[time],spent)
				VALUES (@group,@discipline,@teacher,@date, DATEADD(MINUTE,95,@time),IIF(@date<GETDATE(),1,0))
			END
			SET	@lesson_number = @lesson_number+1;
		END 
		ELSE
		BEGIN
			PRINT(@date);
			PRINT(N'Holiday');
		END
		PRINT('-----------------------------------------');
		PRINT (DATEPART (WEEKDAY,@date));
		PRINT (@alternating_day);

		PRINT('Current week present');
		PRINT(@current_week_present);


		IF(DATEPART(WEEKDAY,@date)=@alternating_day)
		BEGIN
			SET @date = DATEADD(DAY,@ar_interval,@date);
			--SET @date = DATEADD(DAY,2,@date);
		END
		ELSE IF (DATEPART(WEEKDAY,@date)=@resident_day)
		BEGIN
			PRINT('IIF:');
			PRINT(DATEPART(WEEKDAY,@date));
		
			--SET @date = IIF(@current_week_present=1,DATEADD(WEEK, 1, @date), DATEADD(DAY, 5, @date));
			SET @date = IIF(@current_week_present=1,DATEADD(WEEK, @rr_interval, @date), DATEADD(DAY, @ra_interval, @date));
		SET @current_week_present=IIF(@current_week_present=1,0,1);
	END
	PRINT('====================================================================================');
	END
END
	
