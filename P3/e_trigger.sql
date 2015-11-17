drop trigger if exists belowHalf;

delimiter //
create trigger belowHalf after update on uosoffering
for each row
begin
	if new.Enrollment < 0.5*new.MaxEnrollment
    then
		SIGNAL SQLSTATE 'HY000' 
            SET MESSAGE_TEXT = "check constraint on Enrollment Number. Enrollment Number goes below 50% of the MaxEnrollment." ; 
		end if;
end	//




delimiter ;