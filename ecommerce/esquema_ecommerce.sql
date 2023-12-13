-- criação do banco de dados para e-commerce
create database ecommerce;
use ecommerce;

-- criação da tabela cliente || ajustar coluna de enderenço
create table clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

-- criação da tabela endereços de cliente || ajustar FK/PK
create table clientAdress(
    idAdress int auto_increment primary key,
    idClient int,
    Lname varchar(10) not null,
    Address1 varchar(120),
    Address2 varchar(120),
    Address3 varchar(120),
    City varchar(100) not null,
    State char(2) not null,
    Country char(2) not null,
    PostalCode varchar(16) not null,

);

-- criação da tabela produto | incluído novas categorias
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(255) not null,
        classification_kids bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis', 'Limpeza', 'Acessórios', 'Informática', 'Pet Shop' ) not null,
        avaliação float default 0,
        size varchar(10)
);

alter table product auto_increment=1;

-- criação da tabela pagamento | inclusão de tipos de pagamento
create table payments(
	idclient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois cartões', 'Pix'),
    limitAvailable float,
    primary key(idClient, idPayment)
);

-- criação da tabela pedido:
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false, 
    constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
);
alter table orders auto_increment=1;


-- criação da tabela estoque:
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);
alter table productStorage auto_increment=1;


-- criação da tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;

-- criação da tabela vendedor

-- criação da tabela fornecedor

-- criação da tabela fornecedor
