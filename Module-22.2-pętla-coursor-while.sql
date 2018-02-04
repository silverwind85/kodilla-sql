drop function if exists BestsellerBook;

delimiter $$

create function BestsellerBook(bestseller boolean) returns boolean
begin
	if bestseller > 2 
	then return true;
	else return false;
	end if;
end $$
 
 delimiter ;
select BestsellerBook(3);

