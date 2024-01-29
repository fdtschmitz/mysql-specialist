use ecommerce;

create view clients_by_city_view as 
	select
		ca.City,
        ca.State,
        count(c.idClient) as client_count
	from
		clients c
	join
		clientsAddress ca on c.idClient = ca.idAddressClient
	group by
		ca.City, ca.State;

select * from clients_by_city_view;


delimiter //

create trigger old_clients_record
before delete on clients
for each row
begin
	INSERT INTO `ecommerce`.`old_clients`
		(`idClient`,`Fname`,`Minit`,`Lname`,`CPF`)
	VALUES
		(OLD.idClient, OLD.Fname, OLD.Minit, OLD.Lname, OLD.CPF);
end;
//
delimiter ;

delimiter //
create trigger old_address_clean
before delete on clients
for each row
begin
	delete from clientsAddress
		where idAddressClient = OLD.idClient;
end;
//
delimiter ;
        

