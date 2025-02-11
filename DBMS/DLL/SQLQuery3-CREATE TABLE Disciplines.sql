USE PV_319_DLL
GO

--CREATE TABLE Disciplins
--(
--discipline_id			SMALLINT			PRIMARY KEY,
--discipline_name			NVARCHAR (150)	NOT NULL,
--number_of_lessons		TINYINT			NOT NULL
--);
--CREATE TABLE TeacherDisciplinsRelation 
--(
--teacher				INT,
--discipline			SMALLINT,
--PRIMARY KEY (teacher, discipline),
--CONSTRAINT FK_TDR_teacher_2_Teachers 	FOREIGN KEY(teacher)			REFERENCES Teachers(teacher_id),
--CONSTRAINT FK_TDR_discipline				FOREIGN KEY(discipline)			REFERENCES Disciplins(discipline_id)
--);
--CREATE TABLE DisciplineDirectionRelation
--(
--discipline SMALLINT,
--direction TINYINT,
--PRIMARY KEY (discipline, direction),
--CONSTRAINT FK_DDR_discipline_2_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplins(discipline_id),
--CONSTRAINT FK_DDR_direction_2_Directions FOREIGN KEY (direction) REFERENCES Directions (direction_id)
--);
--CREATE TABLE RequiredDisciplines
--(
--discipline	SMALLINT,
--required_discipline SMALLINT,
--PRIMARY KEY(discipline, required_discipline),
--CONSTRAINT FK_RD_discipline_2_Disciplins FOREIGN KEY (discipline) REFERENCES Disciplins(discipline_id),
--CONSTRAINT FK_RD_rewuired_2_Disciplins	FOREIGN KEY (required_discipline)	REFERENCES Disciplins(discipline_id)
--);
CREATE TABLE CompleteDisciplines
(
discipline SMALLINT,
[group] INT,
PRIMARY KEY (discipline, [group]),
CONSTRAINT FK_CompliteDisciplines_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplins(discipline_id),
CONSTRAINT FK_CompliteDisciplines_Group	FOREIGN KEY([group]) REFERENCES Groups(group_id)
);