USE PV_319_DLL;
GO

SELECT 
		last_name +' ' +first_name+' '+middle_name		AS N'Ф.И.О. студента',
		birth_date		AS N'Дата рождения',
		[group_name]			AS N'Группа'

FROM Students, Groups
WHERE [group]=group_id;