drop function if exists findById;

delimiter $$

create function findById(id int(11) ) returns int(11) deterministic 

begin 
   declare message varchar(255);
    
	if id > 0 then
		return (select reader_id from readers where reader_id = id);
	else
		set  message  ='Not correct pesel. Write a pesel consisting of digits greater than zero';
	end if;
	return message;
end $$
  
  delimiter ;
  
  select findById(5) as result;
  
  
  
  