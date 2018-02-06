drop table  if exists readers_aud;

create table readers_aud(
	reader_id int(11) not null auto_increment,
	event_date datetime not null,
	event_type varchar(10) default null,
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