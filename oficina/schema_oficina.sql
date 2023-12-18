create database oficina;
use oficina;

-- criação da tabela Cliente
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

-- criação da tabela Veículo
create table vehicle(

);

-- criação da tabela Mecanicos
create table mechanical(

);

-- criação da tabela Equipe Mecanicos
create table mechteam(

);

-- criação da tabela Estoque
create table stock(

);

-- criação da tabela Peças
create table parts(

);

-- criação da tabela Serviço
create table service(

);

-- criação da tabela Ordem de Serviço
create table serviceorder(

);

-- criação da tabela Atendimento
create table customservice(

);

-- criação da tabela Estoque Disponível
create table clients(

);

-- criação da tabela Peças OS
create table partsso(

);
-- criação da tabela Servicos OS
create table serviceos(

);