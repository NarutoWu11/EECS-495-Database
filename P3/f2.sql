drop procedure if exists ChangePassword;

DELIMITER //
CREATE PROCEDURE ChangePassword(in student_ID INT, in new_Password CHAR(10)) 
BEGIN
	update student 
	set Password = new_Password
    where Id = student_ID;
    
END //
DELIMITER ;

