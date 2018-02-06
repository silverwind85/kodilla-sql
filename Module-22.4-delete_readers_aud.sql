drop trigger if exists readers_delete;
delimiter $$

create trigger readers_delete after delete on readers
for each row
begin
	insert into readers_aud(event_date,event_type)
    values(curdate(),"delete");
end$$

delimiter ;

select * from readers;

delete from readers where reader_id=2;
commit;

select * from readers_aud;