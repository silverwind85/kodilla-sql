drop procedure if exists ExplainQueryLibrary;

delimiter $$
create procedure ExplainQueryLibrary()
begin

	explain select *from readers where firstname='John';
    create index bookstitle on books (title);
    create index readersfirst on readers (firstname);
    create index readerslast on readers (lastname);
    explain select *from readers where firstname='John';
end$$

call ExplainQueryLibrary();
	
