USE PV_319_DLL
GO

--CREATE TABLE Disciplins
--(
--discipline_id			SMALLINT			PRIMARY KEY,
--discipline_name			NVARCHAR (150)	NOT NULL,
--number_of_lessons		TINYINT			NOT NULL
--);
CREATE TABLE TeacherDisciplinsRelation 
(
teacher				INT,
discipline			SMALLINT,
PRIMARY KEY (teacher, discipline),
CONSTRAINT FK_TDR_teacher_2_Teachers 	FOREIGN KEY(teacher)			REFERENCES Teachers(teacher_id),
CONSTRAINT FK_TDR_discipline				FOREIGN KEY(discipline)			REFERENCES Disciplins(discipline_id)
);