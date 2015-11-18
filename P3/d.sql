drop procedure if exists EnrollClasses;

DELIMITER //
CREATE PROCEDURE EnrollClasses(in student_ID INT, in class_ID CHAR(8), in year_num int, in semester_num char(2)) 
BEGIN
	declare mode_num int ;
	set @num_class = 
	(select count(*)
	from requires
	where UoSCode = class_ID);


	set @res = (
	select count(*)
	from requires, transcript A, uosoffering
	where requires.UoSCode = class_ID and A.StudId = student_ID and requires.PrereqUoSCode = A.UoSCode and
	A.grade is not NULL and A.grade != 'F' and A.UoSCode != class_ID
	
    and uosoffering.UoSCode = class_ID and uosoffering.year = year_num and uosoffering.Semester = semester_num and uosoffering.MaxEnrollment > uosoffering.Enrollment
	
	);
    
    if (select count(*) from transcript where StudId= student_ID and UoSCode = class_ID) = 1
	then 
		set mode_num = 0student;
        select mode_num;
    elseif @num_class = @res
    then
		update uosoffering 
        set Enrollment = Enrollment+1
        where uosoffering.UoSCode = class_ID and uosoffering.Year = year_num and uosoffering.Semester = semester_num;
        
        insert into transcript
        values (student_ID, class_ID, semester_num, year_num, NULL);
        
        set mode_num = 1;
        select mode_num;
	else
		set mode_num = 2;
        select B.PrereqUoSCode
		from 
		(select UoSCode, PrereqUoSCode from requires where UoSCode = @class_ID) B
		where B.PrereqUoSCode not in (select requires.PrereqUoSCode
		from requires, transcript A, uosoffering
		where requires.UoSCode = @class_ID and A.StudId = @student_ID and requires.PrereqUoSCode = A.UoSCode and
		A.grade is not NULL and A.grade != 'F' and A.UoSCode != @class_ID
		and uosoffering.UoSCode = @class_ID and uosoffering.year = @year_num and uosoffering.Semester = @semester_num and uosoffering.MaxEnrollment > uosoffering.Enrollment);
			
        
    end if;
END //
DELIMITER ;

