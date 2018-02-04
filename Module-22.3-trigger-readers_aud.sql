select * from readers;
create table readers_aud(
reader_id int(11) not null auto_increment,
reader_date datetime not null,
reader_type varchar(10) default null,
old_firstname varchar(25),
new_firstname varchar(25),
old_lastname varchar(25),
new_lastname varchar(25),
old_peselid varchar(25),
new_peselid varchar(25),
old_vip_level varchar(40),
new_vip_level varchar(40),
primary key(reader_id)
)
delimiter ;
drop trigger if exists readers_insert;
delimiter $$
 create trigger readers_insert after  insert on readers
 for each row
 begin
 insert into readers_aud(reader_date,reader_type,new_firstname,new_lastname,new_peselid,new_vip_level)
	values(curdate(),"insert",new.firstname,new.lastname,new.peselid,new.vip_level);
end$$

delimiter ;
insert into readers(firstname,lastname,peselid,vip_level)
values ("Dog","Smith","87120112345",null);
select * from readers_aud;


delimiter $$

create trigger readers_delete after delete on readers
for each row
begin
	insert into readers_aud(reader_date,reader_type)
    values(curdate(),"delete");
end$$

delimiter ;

delete from readers where reader_id=1;

delimiter $$

 create trigger readers_update after update on readers
 for each row
 begin
	insert into readers_aud(reader_date,reader_type,old_firstname,new_firstname,old_lastname,new_lastname,old_peselid,new_peselid,old_vip_level,new_vip_level)
			values(curdate(),"update",old.firstname,new.firstname,old.lastname,new.lastname,old.peselid,new.peselid,old.vip_level,new.vip_level);
end$$

delimiter ;

update readers set vip_level="Gold customer" where reader_id =2;	

