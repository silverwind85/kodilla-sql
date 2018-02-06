drop trigger if exists readers_update;
delimiter $$
 create trigger readers_update after update on readers
 for each row
 begin
	insert into readers_aud(event_date,event_type,old_firstname,new_firstname,old_lastname,new_lastname,old_peselid,new_peselid,old_vip_level,new_vip_level)
			values(curdate(),"update",old.firstname,new.firstname,old.lastname,new.lastname,old.peselid,new.peselid,old.vip_level,new.vip_level);
end$$

delimiter ;

update readers set vip_level="Gold customer" where reader_id =3;	

select * from readers_aud;