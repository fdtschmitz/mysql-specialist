use mysql;
show tables;
select * from user;

create user 'gerente'@'localhost' identified by 'TROCARsenha@2023';

grant select on `ecommerce`.`clients_by_city_view` to 'gerente'@'localhost';
flush privileges;