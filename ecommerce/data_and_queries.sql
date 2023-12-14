-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF) 
	   values('Maria','M','Silva', 12346789),
		     ('Matheus','O','Pimentel', 987654321),
			 ('Ricardo','F','Silva', 45678913),
			 ('Julia','S','França', 789123456),
			 ('Roberta','G','Assis', 98745631),
			 ('Isabela','M','Cruz', 654789123);

-- idAdress, idAddressClient, Lname, Address1, Address2, Address3, City, State, Country, PostalCode
insert into clientsAddress (idAddressClient, Lname, Address1, City, State, Country, PostalCode)
		values(1, 'Casa', 'rua chuva de prata n29', 'Jaraguá', 'SC', 'BR', '89201-455'),
			(2, 'Casa', 'rua chuva de ouro n30', 'Joinville', 'SC', 'BR', '89202-456'),
            (3, 'Casa', 'rua chuva de água n31', 'Araquari', 'SC', 'BR', '89203-457'),
            (4, 'Casa', 'rua chuva de prata n32', 'Jaraguá', 'SC', 'BR', '89201-455'),
            (5, 'Casa', 'rua chuva de ouro n33', 'Joinville', 'SC', 'BR', '89202-456'),
            (6, 'Casa', 'rua chuva de água n34', 'Araquari', 'SC', 'BR', '89203-457'),
            (1, 'Trabalho', 'rua luz da lua n55', 'São Francisco do Sul', 'SC', 'BR', '89200-405'),
            (2, 'Trabalho', 'rua plutao n66', 'Barra Velha', 'SC', 'BR', '89300-504');


-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis', 'Limpeza', 'Acessórios', 'Informática', 'Pet Shop' ), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
							  ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2',null),
                              ('Alcool 70',False,'Limpeza','5',null),
                              ('Memoria Ram DD4 Fireground',False,'Informática','3',null),
                              ('Guia Fluffy Dog Temas',False,'Pet Shop','3',null),
                              ('Kit de amarrador de cabelo c/10',False,'Acessórios','3',null);

select * from clients;
select * from clientsAddress;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (1, default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,1,2,null),
                         (2,2,1,null),
                         (3,3,3,null),
                         (4,4,1,null);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,6,80),
                         (2,7,10);

select * from productSeller;

select c.Fname, c.Lname, ca.City, ca.State from clients c, clientsAddress ca where c.idClient = ca.idAddressClient;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (2, default,'compra via aplicativo',null,1);
                             
select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;

select * from orders;

-- recuperação de pedido com produto associado
select * from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 