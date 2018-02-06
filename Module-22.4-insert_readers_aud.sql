drop trigger if exists readers_insert;
delimiter $$
 create trigger readers_insert after  insert on readers
 for each row
 begin
	insert into readers_aud(event_date,event_type,new_firstname,new_lastname,new_peselid,new_vip_level)
	values(curdate(),"insert",new.firstname,new.lastname,new.peselid,new.vip_level);
end$$

delimiter ;

insert into readers(firstname,lastname,peselid,vip_level)
values ("Dog","Smith","87120112345",null);

select * from readers_aud;