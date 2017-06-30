drop trigger if exists setUpdateTime;

delimiter $$
create trigger setUpdateTime before insert on bookin for each row
begin
	update book set lastUpdateTime = new.inTime where ISBN = new.ISBN;
end;
$$