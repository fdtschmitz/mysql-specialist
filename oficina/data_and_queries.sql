-- Inserção de dados e queries
use oficina;
show tables;

desc clients;
-- Cadastro de Clientes
insert into clients (Fname, Minit, Lname, CPF, Address, Phone, Email)
	values('José', 'I', 'Silva', 123456789, 'Rua das Couves, 23, Joinville-SC', 12457823568, 'joseisilva@email.com'),
    ('Maria', 'II', 'Santos', 123456788, 'Rua dos Alfaces, 24, Joinville-SC', 32457823568, 'mariasantos@email.com'),
    ('João', 'III', 'Soares', 123456787, 'Rua das Salças, 25, Joinville-SC', 42457823568, 'joaosoares@email.com'),
    ('Mateus', 'IV', 'Costa', 123456786, 'Rua do Espinafre, 26, Joinville-SC', 42457823568, 'mateuscosta@email.com'),
    ('Lucas', 'V', 'Pereira', 123456785, 'Rua da Cebolinha, 27, Joinville-SC', 52457823568, 'lucasvpererira@email.com'),
    ('Marcos', 'VI', 'Alecrim', 123456784, 'Rua da Acelga, 28, Joinville-SC', 62457823568, 'marcosalecrim@email.com');

select * from clients;

desc vehicle;
-- Cadastro de Veículos
insert into vehicle (Model, Plate, Color, Vyear, idClient)
	values('C3', 'QWE-1234', 'branco', '15/16', 1),
    ('C4 Lounge', 'QWE-1234', 'preto', '18/18', 2),
    ('GOL', 'ASD-1234', 'vermelho', '20/21', 3),
    ('ONIX', 'WER-1234', 'prata', '22/23', 4),
    ('PALIO', 'SDF-1234', 'cinza', '17/18', 5),
    ('KWID', 'XCV-1234', 'vermelho', '19/19', 6),
    ('C3', 'DFG-1234', 'azul', '23/24', 5),
    ('UNO', 'RTY-1234', 'preto', '15/16', 4);

select * from vehicle;

desc mechteam;
-- Cadastro de Equipes de Mecânicos
insert into mechteam (Nameteam)
	values('Eletricista'),
    ('Pintor'),
    ('Retifica'),
    ('Lubrificador'),
    ('Lataria'),
    ('Estofado');
    
select * from mechteam;

desc mechanical;
-- Cadastro de Mecanicos
insert into mechanical (Fname, Minit, Lname, CPF, Address, Phone, Email, Expertise, idMechteam)
	values('João', 'I', 'Pereira', 23456789107, 'Rua Mercurio, 20, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Eletricista', 1),
	('Celio', 'II', 'Silveira', 33456789106, 'Rua Venus, 22, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Pintor', 2),
	('Marcos', 'III', 'Madureira', 43456789105, 'Rua da Terra, 24, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Latueiro', 5),
    ('Valdir', 'IV', 'Ferrão', 53456789104, 'Rua Marte, 26, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Auxiliar', 1),
	('Cleber', 'V', 'Santos', 63456789103, 'Rua Jupiter, 27, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Assistente', 4),
	('Jurandir', 'VI', 'Bento', 73456789102, 'Rua Saturno, 29, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Aprendiz', 3),
    ('Renato', 'VII', 'Frade', 83456789101, 'Rua Urano, 31, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Caldeireiro', 3),
    ('Marcelo', 'D', 'Sasse', 93456789101, 'Rua Netuno, 33, Joinville-SC', 24578235698, 'joaoisilva@email.com', 'Estofadista', 6);

desc stock;
-- Cadastro de Estoque
insert into stock (sDesc, Quantity, Minstock)
	values('Peca_Motor', 3, 1),
    ('Peca_Cambio', 3, 1),
    ('Rolamento', 20, 10),
    ('Correia', 10, 5),
    ('Fixadores', 50, 20),
    ('Abrasivos', 40, 10),
    ('Limpeza', 60, 20),
    ('Lubrificantes', 50, 20),
    ('Elétrica', 10, 5),
    ('EPI', 40, 16);
    
select * from stock;

desc parts;
-- Cadastro de Peças
insert into parts (Pcod, Psdesc, Pfdesc, Pprice)
	values(1000500101, 'Jogo Pistão Anel Camisa C3 1.3 Gasolina', 'Jogo Pistão Anel Camisa C3 1.3 8v Gasolina Flex', 1331.90),
    (1000500102, 'Junta de vedação C3 1.3', 'Junta de vedação C3 1.3 8v Gasolina Flex', 64.90),
    (1000500103, 'Conjunto de Biela C3 1.3 Gasolina', 'Conjunto de Biela C3 1.3 8v Gasolina Flex', 829.90),
    (1000500104, 'Jogo Bronzina Biela C3 1.3 8v', 'Jogo Pistão Anel Camisa C3 1.3 8v Gasolina Flex', 208.35),
    (2000600101, 'PeçaA', 'Peça A 123asdqwe', 50.90),
    (2000600102, 'PeçaB', 'Peça B 123asdqwe', 60.90),
    (2000600103, 'PeçaC', 'Peça C 123asdqwe', 70.90),
    (3000500101, 'PeçaD', 'Peça D 123asdqwe', 80.90),
    (3000500102, 'PeçaE', 'Peça E 123asdqwe', 90.90),
    (4000500104, 'PeçaF', 'Peça F 123asdqwe', 100.90),
    (4000500101, 'PeçaG', 'Peça G 123asdqwe', 150.90),
    (4000500102, 'PeçaH', 'Peça H 123asdqwe', 50.90),
    (5000500101, 'PeçaI', 'Peça I 123asdqwe', 60.90),
    (5000500102, 'PeçaJ', 'Peça J 123asdqwe', 70.90),
    (6000500101, 'PeçaK', 'Peça K 123asdqwe', 80.90),
    (6000500102, 'PeçaL', 'Peça L 123asdqwe', 90.90),
    (7000500101, 'PeçaM', 'Peça M 123asdqwe', 100.90),
    (7000500102, 'PeçaN', 'Peça N 123asdqwe', 110.90),
    (8000500101, 'PeçaO', 'Peça O 123asdqwe', 150.90),
    (8000500102, 'PeçaP', 'Peça P 123asdqwe', 20.90),
    (9000500101, 'PeçaQ', 'Peça Q 123asdqwe', 30.90),
    (9000500102, 'PeçaR', 'Peça R 123asdqwe', 40.90),
    (1100500101, 'EPIA', 'EPI A 123asdqwe', 15.90),
    (1100500102, 'EPIB', 'EPI B 123asdqwe', 39.90);

desc service;
-- Cadastro de Serviços
insert into service (Scod, Ssdesc, Sfdesc, Sprice, Sesttime)
	values(9899500102, 'Troca Sensor Freio', 'Troca do sensor do freio, com desmonagem do tambor', 60.50, '00:30:00'),
    (9899500103, 'Troca Oleo', 'Troca de óleo com troca de filtro', 15.50, '00:15:00'),
    (9899500104, 'Alinhamento', 'Alinhamento digital', 120.00, '00:35:00'),
    (9899500105, 'Pintura Parachoque', 'Pintura do Parachoque traseiro', 350.00, '06:00:00'),
    (9899500106, 'Troca Rolamento', 'Troca Rolamento', 159.90, '00:45:00'),
    (9899500107, 'Aperto de Parafuso', 'Aperto de Parafuso, com torquímetro de estalo', 100.50, '01:00:00');
    

desc customservice;
-- Inclusão de Atendimento:
insert into customservice (IdVehicle, IdClient, IdMechteam)
	values(1, 1, 1),
    (2, 2, 3),
    (3, 3, 3);

desc serviceorder;
-- Criação das Ordens de Serviço
insert into serviceorder (SOstatus, idVehicle, idClient, idMechteam)
	values('working', 1, 1, 1),
    ('working', 2, 2, 3),
    ('working', 3, 3, 3);
    
select * from serviceorder;

select * from parts;
-- Inclusão de Peças na Ordem de Serviço
insert into partsso (idPart, idserviceorder)
	values(2, 7),
    (3, 7),
    (4, 7),
    (5, 7),
    (6, 8),
    (7, 8),
    (8, 8),
    (8, 9),
    (9, 9);

select * from service;
-- Inclusão de Serviços na Ordem de Serviço
insert into serviceos (idService, idserviceorder)
	values(6, 7),
    (5, 7),
    (4, 7),
    (1, 8),
    (2, 8),
    (6, 9);

-- Atualizando os valores das peças da Ordem de Serviço
update serviceorder as os
set os.Vparts = (
	select SUM(p.Pprice)
    from partsso as pos
    join parts as p on pos.idPart = p.idPart
	where pos.idserviceorder = os.idserviceorder
)
where os.idserviceorder in (7, 8, 9);

-- Atualizando os valores dos serviços da Ordem de Serviço
update serviceorder as os
set os.Vservice = (
	select SUM(s.Sprice)
    from serviceos as sos
    join service as s on sos.idService = s.idService
	where sos.idserviceorder = os.idserviceorder
)
where os.idserviceorder in (7, 8, 9);

select * from serviceorder;

-- Concluindo as Ordens de Serviço
update serviceorder
set SOstatus = 'Concluded',
	SOconclusion = current_timestamp
where idserviceorder in (7, 8, 9);

select * from serviceorder;

-- Tabelas de consulta:

-- Ordem de Serviço Detalhada:
SELECT
    so.idserviceorder, 
    so.Emission,
    so.Vparts,
    so.Vservice,
    so.SOstatus,
    so.SOconclusion,
    p.Psdesc AS PartDescription,
    p.Pprice AS PartPrice,
    s.Ssdesc AS ServiceDescription,
    s.Sprice AS ServicePrice,
    mt.Nameteam AS MechTeam,
    CONCAT(v.Model, ' | ', v.Plate) as Vehicle,
    CONCAT(c.Fname, ' ', c.Lname) as Clients
FROM serviceorder so
JOIN partsso pso ON so.idserviceorder = pso.idserviceorder
JOIN parts p ON pso.idPart = p.idPart
JOIN serviceos sso ON so.idserviceorder = sso.idserviceorder
JOIN service s ON sso.idService = s.idService
JOIN mechteam mt on so.idMechteam = mt.idMechteam
JOIN vehicle v on so.idVehicle = v.idVehicle
JOIN clients c on so.idClient = c.idClient;

-- Ordem de serviço acima de X valor:



