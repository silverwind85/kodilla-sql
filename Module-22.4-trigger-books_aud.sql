select * from books;
create table books_aud(
book_id int(11) not null auto_increment,
book_date datetime not null,
book_type varchar(10) default null,
old_title varchar(255),
new_title varchar(255),
old_pubyesr int(4),
new_pubyear int(4),
old_bestseller boolean,
new_bestseller boolean,
primary key(book_id)
)
delimiter ;
drop trigger if exists book_insert;
delimiter $$
 create trigger book_insert after  insert on books
 for each row
 begin
 insert into books_aud(book_date,book_type,new_title,new_pubyear,new_bestseller)
	values(curdate(),"insert",new.title,new.pubyear,new.bestseller);
end$$

delimiter ;
insert into books(title,pubyear,bestseller)
values ("Dog",2001,0);
select * from books_aud;


delimiter $$

create trigger books_delete after delete on books
for each row
begin
	insert into books_aud(book_date,book_type)
    values(curdate(),"delete");
end$$

delimiter ;

delete from books where book_id=1;

delimiter $$

 create trigger books_update after update on books
 for each row
 begin
	insert into books_aud(book_date,book_type,old_title,new_title,old_pubyear,new_pubyear,old_bestseller,new_bestseller)
			values(curdate(),"update",old.title,new.title,old.pubyear,new.pubyear,old.bestseller,new.bestseller);
end$$

delimiter ;

update books set bestseller=1 where book_id =2;	

ALTER TABLE books_aud change COLUMN old_pubyesr  old_pubyear int(4);


