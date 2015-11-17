drop procedure if exists WithdrawClasses;

DELIMITER //
CREATE PROCEDURE WithdrawClasses(in student_ID INT, in class_ID CHAR(8), in year_num int, in semester_num char(2)) 
BEGIN
    declare mode_num INT;
    if (select grade from transcript where StudId = student_ID and UoSCode = class_ID and Semester = semester_num and Year = year_num) is null
    then
		update uosoffering 
        set Enrollment = Enrollment-1
        where uosoffering.UoSCode = class_ID and uosoffering.Year = year_num and uosoffering.Semester = semester_num;
        
        delete from transcript
        where StudId = student_ID and UoSCode = class_ID and Semester = semester_num and Year = year_num;
        
        set mode_num = 1;
        select mode_num;
	else
		set mode_num = 2;
        select mode_num;
        
        
    end if;
END //
DELIMITER ;

