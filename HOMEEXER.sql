CREATE DATABASE Second
USE Second

CREATE TABLE Student(
Id int identity primary key,
Name nvarchar(50)not null,
Surname nvarchar(50),
Phone int unique,
Score int default(50),
Comment nvarchar(50), 
IsGraduet bit default 'false'
)

INSERT INTO Student
VALUES('Murad','Eliyev',55445566,100,'wqsqsqw','True'),
('Adil','Eliyev',55457206,85,'adasdasd','True'),
('Azad','Eliyev',45454550,75,'trrt','True'),
('Marif','Eliyev',45454560,65,'jkhkhk','True'),
('Muxtar','Eliyev',555454545,55,'gfdfsdf','False')



SELECT * FROM Student st
WHERE Score> (SELECT AVG(Score) FROM Student)
UPDATE Student Set Comment='Congurtulation';


SELECT * FROM Student st
WHERE Score< (SELECT AVG(Score) FROM Student);
UPDATE Student Set Comment='Bad';



CREATE TABLE GraduatedStudents(Id int identity primary key,
Name nvarchar(50)not null,
Surname nvarchar(50),
Phone int unique,
Score int default(50),
Comment nvarchar(50), 
IsGraduet bit default 'false');
    

INSERT INTO GraduatedStudents (Name,Surname,Phone,Score,Comment,IsGraduet)
   SELECT st.Name,st.Surname,st.Phone,st.Score,st.Comment,st.IsGraduet
   FROM Student st 
   WHERE st.IsGraduet='true'
   DELETE FROM Student WHERE IsGraduet='true'