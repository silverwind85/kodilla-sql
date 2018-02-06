drop table if exists books_aud;

create table books_aud(
book_id int(11) not null auto_increment,
event_date datetime not null,
event_type varchar(10) default null,
old_title varchar(255),
new_title varchar(255),
old_pubyear int(4),
new_pubyear int(4),
old_bestseller boolean,
new_bestseller boolean,
primary key(book_id)
)