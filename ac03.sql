--Matheus Marques Silva ra 1801198 
--Bruno Assuncao ra 1902440 
--Priscila Da Dalt ra 1901843

create table Estabelecimento(
idEstabelecimento tinyint identity,
Nome varchar (50) not null,
Endereço varchar (100) not null,
Telefone char(11) not null,
Ramo_de_Atuacao varchar (100), --lanche, almoço,etc.
Pedido_mínimo decimal (5,2),
Horario_de_Entregas smalldatetime,
constraint pkEstabelecimento primary key (idEstabelecimento)
);

sp_help estabelecimento

create table Pedido(
idPedido tinyint identity,
Data_Pedido smalldatetime not null,
Produto varchar(50) not null,
Descrição varchar(50),
Quantidade tinyint not null,
Preço decimal (5,2) not null,
Tipo_de_Pagamento varchar (20),
Observação varchar (50), --sem tomate, sem queijo, casa azul, travessa da rua tal, etc.
idEstabele tinyint,
constraint pkPedido primary key (idPedido),
constraint fkEstabelecimento foreign key (idEstabele) references Estabelecimento (idEstabelecimento),
);

sp_help pedido

create table Entrega(
idEntrega tinyint identity,
idPedi tinyint ,
idClien tinyint ,
Taxa decimal (5,2), --depende do endereço, ou fixa?
constraint pkEntrega primary key (idEntrega),
constraint fkPedido_Ent foreign key (idPedi) references Pedido (idPedido),
constraint fkCliente foreign key (idClien) references Cliente (idCliente),
);

sp_help entrega

-- tabelas abaixo opicionais, fazer se quiser ou se tiver tempo

create table Cliente(
idCliente tinyint identity,
Nome_Completo varchar (50) not null,
genero char(1) ,
datanasc varchar(10),
Endereço varchar (100) not null,
Telefone char (11) not null,
CPF_CNPJ varchar (14) not null,
idPedi tinyint,
constraint pkCliente primary key (idCliente),
constraint fkPedido foreign key (idPedi) references Pedido (idPedido),
);

sp_help cliente

create table Estado(
idEstado tinyint identity,
descricao char (9),
idped tinyint,
constraint pkEsta primary key (idEstado),
constraint fkPedido_Est foreign key (idPed) references Pedido (idPedido),
);

sp_help estado



INSERT INTO Estabelecimento VALUES
('VK Burgers', 'Av. Irineu, 22', '11958252214', 'Alimenticio', 10.00, '20200419 08:00:00'),
('Burger King', 'Av. Maraja, 555', '11957259214', 'Alimenticio', 15.00, '20200419 10:00:00'),
('Bebidas JR', 'Av. 9 Junho, 1', '11953252371', 'Bebidas', 20.00, '20200419 08:00:00'),
('Point da Feijoada', 'Av. Carlos lacerda, 100', '11928452213', 'Alimenticio', 30.00, '20200419 11:00:00'),
('Marmitas Já', 'Av. São João, 33', '11941252217', 'Alimenticio', 10.00, '20200419 09:00:00'),
('MM Confecções', 'Av. Jubileu, 533', '11998222218', 'Vestuário', 100.00, '20200419 08:00:00'),
('Calçados NRAS', 'Av. Paulista, 1100', '11955152219', 'Calçados', 200.00, '20200419 07:00:00'),
('Rubi joias', 'Av. Faria lima, 2', '11978252212', 'Joias', 500.00, '20200419 08:00:00'),
('Salgado do gordo', 'Av. Yasmin, 88', '11913232214', 'Alimenticio', 10.00, '20200419 08:00:00'),
('Pizzaria Alto relevo', 'Av. DaPizza, 435', '11958758215', 'Alimenticio', 30.00, '20200419 08:00:00')

INSERT INTO Pedido VALUES 
('20200419', 'Super Hamburguer', 'Dobro de queijo', 2, 50.00, 'Dinheiro', 'Completo', 1),
('20200419', 'Stacker Triplo', 'Entrega rápido', 1, 20.00, 'Dinheiro', 'Sem cebola', 2),
('20200419', 'Jack Daniels', 'Acrescentar gelo de coco', 1, 130.00, 'Débito', 'Gelado', 3),
('20200419', 'Feijoada completa', 'Acrescentar caipirinha', 2, 50.00, 'Dinheiro', 'Tamanho G', 4),
('20200419', 'Filé Migon', 'Bem passado', 1, 25.00, 'Dinheiro', 'Sem cebola', 5),
('20200419', 'Medalhão de carne', 'Com molho de madeira', 1, 70.00, 'Dinheiro', 'Completo', 5),
('20200419', 'Terno Lacoste', 'Encomendado Sobre medida', 1, 700.00, 'Dinheiro', 'Completo', 6),
('20200419', 'Anel de formatura', 'Com um diamante de 10 pontos', 1, 900.00, 'A vista', 'Ouro branco', 8),
('20200419', 'Combo 10 de cada', 'Acompanhar limão e ketchup', 1, 50.00, 'Crédito', 'Completo', 9),
('20200419', 'Pizza de 4 queijos', 'Dobro de tomate e oregano', 1, 40.00, 'Dinheiro', 'Completo', 10)

INSERT INTO Cliente VALUES
('Nilton Romeiro', 'M','19591209', 'Av. Mesquita', '11958479152', '23457892523', 10),
('Nilton Romeiro',  'M','19581208','Av. Mesquita', '11958479152', '23457892523', 8),
('Nilton Romeiro',  'M','19571207','Av. Mesquita', '11958479152', '23457892523', 5),
('Matheus Marques',  'M','19561201','Av. Jafui', '11923499722', '95110891723', 1),
('Matheus Marques',  'M','19551202','Av. Jafui', '11923499722', '95110891723', 2),
('Matheus Marques',  'M','19541203','Av. Jafui', '11923499722', '95110891723', 4),
('Bruno Assunção',  'M','19531209','Av. Numsei', '11922334452', '12345692523', 3),
('Bruno Assunção',  'M','19521208','Av. Nemsei', '11922334452', '12345692523', 6),
('Priscila Da Dalt',  'F','19511207','Av. Takiperto', '11913579152', '12852564187', 9),
('Priscila Da Dalt',  'F','19501203','Av. Takiperto', '11913579152', '12852564187', 7)

INSERT INTO Estado VALUES
('Concluido', 1),
('Concluido', 2),
('Concluido', 3),
('Andamento', 4),
('Andamento', 5),
('Andamento', 6),
('Cancelado', 7),
('Cancelado', 8),
('Cancelado', 9),
('Concluido', 10)

INSERT INTO Entrega VALUES
(1, 1, 10.00),
(2, 2, 10.00),
(3, 3, 10.00),
(4, 4, 10.00),
(5, 5, 10.00),
(6, 6, 10.00),
(7, 7, 10.00),
(8, 8, 10.00),
(9, 9, 10.00),
(10, 10, 10.00)

/*1ª Consulta: Retornar idPedido como 'número do pedido', quantidade como 'quantidade de 
pedidos'. Referente a tabela 'estabelecimento', retornar nome como 'nome do estabelecimento' e
Ramo_de_Atuacao como 'ramo do restaurante'.*/
SELECT Pedido.idPedido AS 'número do pedido', Pedido.Quantidade AS 'quantidade de pedidos'
, Estabelecimento.Nome AS 'nome do estabelecimento', Estabelecimento.Ramo_de_Atuacao AS 'ramo do Restaurante'
FROM Estabelecimento	join	Pedido 
						ON Estabelecimento.idEstabelecimento = Pedido.idEstabele

/*2ª Consulta: Retornar da tabela 'pedido' os campos 'produto' (como 'tipo de produto') e 
'Tipo_de_Pagamento (como 'tipo de pagamento'). Da tabela 'estado', retornar apenas o
atributo 'descricao'.*/
SELECT Pedido.Produto AS 'tipo de produto', Pedido.Tipo_de_Pagamento AS 'tipo de pagamento'
, Estado.descricao AS 'Situação do pedido'
FROM Estado		join	Pedido 
				ON Estado.idPed = Pedido.idPedido
ORDER BY Estado.idEstado

/*3ª Consulta: Retornar da tabela 'entrega', o campo Total como 'total da entrega'. Referente 
a tabela 'cliente', retornar o atributo endereço como 'endereço co cliente'. E em relação a 
tabela 'pedido', retornar o atributo preço como 'preço do pedido', onde só serão retornados
valores maiores que 40,00.*/

SELECT Entrega.Taxa AS 'total da entrega'
, Cliente.Endereço AS 'endereço do cliente'
, Pedido.Preço AS ' preço do pedido'
FROM Entrega	join	Cliente
				ON Entrega.idClien = Cliente.idCliente
				join	Pedido
				ON Pedido.idPedido = Entrega.idPedi
WHERE Pedido.Preço >=40
ORDER BY Pedido.Preço DESC

/*4ª Consulta: Retornar da tabela 'estabelecimento', os atributos nome (como 'nome do estabelecimento')
e ramo_de_atuacao (como 'Ramo do estabelecimento'), esse só retornará ramos alimentícios. Referente a tabela 'pedido', 
retornar o atributo 'quantidade'. A tabela 'estado', será retornado o idEstado em ordem descendente. Em
relação a tabela 'entrega', será retornado o campo 'taxa' (como 'taxa de entrega'), no qual só será retornado 
valores acima de 5. E finalmente a tabela 'cliente', onde sera exibido o atributo 'endereço' (como 'endereço
do cliente').*/
SELECT Estabelecimento.Nome AS 'nome do estabelecimento', Estabelecimento.Ramo_de_Atuacao AS 'ramo do estabelecimento'
, Pedido.Quantidade AS 'quantidade'
, Estado.descricao AS 'Estado'
, Entrega.Taxa AS 'taxa de entrega'
, Cliente.Endereço AS 'endereço do cliente'
FROM Estabelecimento	join	Pedido 
						ON Estabelecimento.idEstabelecimento = Pedido.idEstabele
						join	Estado
						ON Estado.idped = Pedido.idPedido
						join	Entrega
						ON Entrega.idPedi = Pedido.idPedido
						join	Cliente
						ON Cliente.idCliente = Entrega.idClien
WHERE Estabelecimento.Ramo_de_Atuacao in ('Alimenticio') and Entrega.Taxa >=5
ORDER BY Estado.idEstado DESC 