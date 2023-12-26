create database oficina;

use oficina;

-- criação da tabela cadastro Cliente
create table clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(120),
    Phone varchar(11),
    Email varchar(45),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

-- criação da tabela cadastro Veículo
create table vehicle(
	idVehicle int auto_increment primary key,
    Model varchar(45),
    Plate varchar(9),
    Color varchar(10),
    Vyear varchar(5),
    idClient int not null,
    constraint fk_idClient foreign key (idClient) references clients(idClient)
);

alter table vehicle auto_increment=1;

-- criação da tabela cadastro Equipe Mecanicos
create table mechteam(
	idMechteam int auto_increment primary key,
    Nameteam varchar(45) not null
);

alter table mechteam auto_increment=1;

-- criação da tabela cadastro Mecanicos
create table mechanical(
	idMechanical int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(120),
    Phone varchar(11),
    Email varchar(45),
    constraint unique_cpf_client unique (CPF),
    Expertise varchar(45),
    IdMechteam int not null,
    constraint fk_mechteam foreign key (idMechteam) references mechteam(idMechteam)
);

alter table mechanical auto_increment=1;

-- criação da tabela cadastro Estoque
create table stock(
	idStock int auto_increment primary key,
    sDesc varchar(45),
    Quantity int,
    Minstock int
);

alter table stock auto_increment=1;

-- criação da tabela cadastro Peças
create table parts(
	idPart int auto_increment primary key,
    Pcod varchar(10) not null,
    Psdesc varchar(45) not null,
    Pfdesc varchar(250),
    Pprice decimal(10,2) not null
);

alter table parts auto_increment=1;

-- criação da tabela cadastro Serviço
create table service(
	idService int auto_increment primary key,
    Scod varchar(10) not null,
    Ssdesc varchar(45) not null,
    Sfdesc varchar(250),
    Sprice decimal(10,2) not null,
    Sesttime time not null
);

alter table service auto_increment=1;
desc service;

-- criação da tabela relacionamento Atendimento
create table customservice(
	idVehicle int not null,
    idClient int not null,
    idMechteam int not null,
    constraint pk_customservice primary key(
		idVehicle,
        idClient,
        idMechteam
	),
	foreign key (idVehicle) references vehicle(idVehicle),
    foreign key (idClient) references clients(idClient),
    foreign key (idMechteam) references mechteam(idMechteam)
);

-- criação da tabela cadasrto Ordem de Serviço
create table serviceorder(
	idserviceorder int auto_increment primary key,
    Emission datetime default current_timestamp,
    Vparts decimal(10,2),
    Vservice decimal(10,2),
    SOstatus varchar(45),
    SOconclusion datetime,
    idVehicle int not null,
    idClient int not null,
    idMechteam int not null,
    constraint fk_so_vehicle foreign key (idVehicle) references customservice(idVehicle),
    constraint fk_so_client foreign key (idClient) references customservice(idClient),
    constraint fk_so_mechteam foreign key (idMechteam) references customservice(idMechteam)
);



-- criação da tabela relacionamento Estoque Disponível
create table availablestock(
	idStock int not null,
    idPart int not null,
    constraint pk_available primary key(
		idStock,
        idPart
	),
	constraint fk_as_stock foreign key (idStock) references stock(idStock),
    constraint fk_as_parts foreign key (idPart) references parts(idPart)
);

-- criação da tabela relacionamento Peças OS
create table partsso(
	idPart int not null,
    idserviceorder int not null,
    constraint pk_partsso primary key(
		idPart,
        idserviceorder
	),
	constraint fk_pso_parts foreign key (idPart) references parts(idPart),
    constraint fk_pso_soid foreign key (idserviceorder) references serviceorder(idserviceorder)
);


-- criação da tabela relacionamento Servicos OS
create table serviceos(
	idService int not null,
    idserviceorder int not null,
    constraint pk_partsso primary key(
		idService,
        idserviceorder
	),
	constraint fk_sso_service foreign key (idService) references service(idService),
    constraint fk_sso_soid foreign key (idserviceorder) references serviceorder(idserviceorder)
);

show tables;