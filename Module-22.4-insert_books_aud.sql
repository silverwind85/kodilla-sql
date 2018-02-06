drop trigger if exists book_insert;
delimiter $$
 create trigger book_insert after  insert on books
 for each row
 begin
 insert into books_aud(event_date,event_type,new_title,new_pubyear,new_bestseller)
	values(curdate(),"insert",new.title,new.pubyear,new.bestseller);
end$$

delimiter ;
insert into books(title,pubyear,bestseller)
values ("Dog",2001,0);
select * from books_aud;