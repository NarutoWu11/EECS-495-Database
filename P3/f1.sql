drop procedure if exists ChangeAddress;

DELIMITER //
CREATE PROCEDURE ChangeAddress(in student_ID INT, in new_Address CHAR(50)) 
BEGIN
	update student 
	set Address = new_Address
    where Id = student_ID;
    
END //
DELIMITER ;

