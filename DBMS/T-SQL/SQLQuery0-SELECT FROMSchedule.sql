USE PV_319_Import
GO

--DELETE FROM Schedule;
SELECT
		[Группа]				=		group_name,
		[Дисциплина]			=		discipline_name,
		[Преподаватель]		=		FORMATMESSAGE(N'%s %s %s',last_name,first_name,middle_name),
		[День]				=		DATENAME(WEEKDAY,[date]),
		[Дата]				=		[date],
		[время]				=		[time],
		[Статус]				=		IIF(spent=1, N'Проведено', N'Запланировано')
FROM Schedule,Groups,Disciplines,Teachers
WHERE	[group]				=		group_id
AND		discipline			=		discipline_id
AND		teacher				=		teacher_id
;
