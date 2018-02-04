drop procedure if exists UpdateBestSellers;

delimiter $$

create procedure UpdateBestSellers()
begin 
	declare booksread, days, rdr_id int ;
    declare bookspermonth decimal(5,2);
    declare finished int default 0;
    declare all_readers cursor for select book_id from books;
    declare continue handler for not found set finished = 1;
    open all_readers;
    while(finished = 0) Do
    fetch all_readers into rdr_id;
    if (finished =0) then
    select count(*) from rents
    where book_id = rdr_id
    into booksread;
    select datediff(max(rent_date), min(rent_date)) from rents
    where book_id = rdr_id
    into days;
    set bookspermonth = booksread/days*30;
    update books set bestseller = BestsellerBook(bookspermonth)
    where book_id = rdr_id;
    commit;
    end if;
    end while;
    close all_readers;
end $$

delimiter ;

call UpdateBestSellers;
select* from books;