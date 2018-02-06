drop table if exists stats;

create table stats(
	stat_id int(11) not null auto_increment,
    stat_date datetime not null,
    stat varchar(20) not null,
    value int(11) not null,
    primary key(stat_id)
    );
    
 drop view if exists bestsellers_count;
 
create view bestsellers_count as
 select count(bestseller) as bestsellers_count from books where bestseller=1;
 select * from books;
 

 delimiter |
 create event Update_stat
	on schedule every 1 minute
    do begin 
		call UpdateBestSellers();
		insert into stats(stat_date,stat,value)
		values(curdate(),'bestsellers',(select bestsellers_count from bestsellers_count));
	end|
    delimiter ;
    
 select * from stats;
 show processlist; 
 drop event Update_stat;
 
 
 
 