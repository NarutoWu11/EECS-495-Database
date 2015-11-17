drop procedure if exists EnrollClasses;

DELIMITER //
CREATE PROCEDURE EnrollClasses(in student_ID INT, in class_ID CHAR(8), in year_num int, in semester_num char(2)) 
BEGIN
	declare mode_num int ;
	set @num_class = 
	(select count(*)
	from requires
	where A.UoSCode = class_ID);


	set @res = (
	select count(*)
	from requires, transcript A, uosoffering
	where requires.UoSCode = class_ID and A.StudId = student_ID and requires.PrereqUoSCode = A.UoSCode and
	A.grade is not NULL and A.grade != 'F'
	
    and uosoffering.UoSCode = class_ID and uosoffering.year = year_num and uosoffering.Semester = semester_num and uosoffering.MaxEnrollment > uosoffering.Enrollment

	);
    
    
    if @num_class = @res
    then
		update uosoffering 
        set Enrollment = Enrollment+1
        where uosoffering.UoSCode = class_ID and uosoffering.Year = year_num and uosoffering.Semester = semester_num;
        
        insert into transcript
        values (student_ID, class_ID, semester_no, year_num, NULL);
        
        set mode_num = 1;
        select mode_num;
	else
		set mode_num = 2;
        select B.PrereqUoSCode
        from (select A.PrereqUoSCode from requires A where A.UoSCode = class_ID) B, 
        (
			select requires.PrereqUoSCode
			from requires, transcript A, uosoffering
			where requires.UoSCode = class_ID and A.StudId = student_ID and requires.PrereqUoSCode = A.UoSCode and
			A.grade is not NULL and A.grade != 'F'
			
			and uosoffering.UoSCode = class_ID and uosoffering.year = year_num and uosoffering.Semester = semester_num and uosoffering.MaxEnrollment > uosoffering.Enrollment

			) C
        where B.PrereqUoSCode != C.PrereqUoSCode
        ;
        
    end if;
END //
DELIMITER ;

