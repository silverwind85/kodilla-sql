drop procedure if exists UpdateBestSellers;

delimiter $$

create procedure UpdateBestSellers()
begin 
	declare booksread, days, bk_id int ;
    declare bookspermonth decimal(5,2);
    declare finished int default 0;
    declare all_books cursor for select book_id from books;
    declare continue handler for not found set finished = 1;
    
    open all_books;
    
	while(finished = 0) Do
		fetch all_books into bk_id;
		if (finished =0) then
			select count(*) from rents where book_id = bk_id into booksread;
			select datediff(max(rent_date), min(rent_date)) from rents where book_id = bk_id into days;
			set bookspermonth = booksread/days*30;
			update books set bestseller = BestsellerBook(bookspermonth) where book_id = bk_id;
			commit;
		end if;
    end while;
    close all_books;
end $$

delimiter ;

call UpdateBestSellers;
select* from books;