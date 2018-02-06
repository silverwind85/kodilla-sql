drop trigger if exists books_update;

delimiter $$
 create trigger books_update after update on books
 for each row
 begin
	insert into books_aud(event_date,event_type,old_title,new_title,old_pubyear,new_pubyear,old_bestseller,new_bestseller)
			values(curdate(),"update",old.title,new.title,old.pubyear,new.pubyear,old.bestseller,new.bestseller);
end$$

delimiter ;

select * from books;
update books set bestseller=1 where book_id =5;	

select * from books_aud;