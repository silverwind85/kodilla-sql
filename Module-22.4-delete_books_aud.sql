 drop trigger if exists books_delete;
delimiter $$
create trigger books_delete after delete on books
for each row
begin
	insert into books_aud(event_date,event_type)
    values(curdate(),"delete");
end$$

delimiter ;

select * from books;

delete from books where book_id=5;

select * from books_aud;
