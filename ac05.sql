--Matheus Marques Silva ra 1801198 
--Bruno Assuncao ra 1902440 
--Priscila Da Dalt ra 1901843

create table Estabelecimento(
idEstabelecimento tinyint identity,
nome varchar (50) not null,
endereco varchar (100) not null,
telefone char(11) not null,
ramo_de_atuacao varchar (100), --lanche, almoço,etc.
pedido_minimo decimal (5,2),
horario_de_entregas smalldatetime,
constraint pkEstabelecimento primary key (idEstabelecimento)
);

create table Pedido(
idPedido tinyint identity,
data_pedido smalldatetime not null,
produto varchar(50) not null,
descricao varchar(50),
quantidade tinyint not null,
preco decimal (5,2) not null,
tipo_pagamento varchar (20),
observacao varchar (50), --sem tomate, sem queijo, casa azul, travessa da rua tal, etc.
idEstabele tinyint,
constraint pkPedido primary key (idPedido),
constraint fkEstabelecimento foreign key (idEstabele) references Estabelecimento (idEstabelecimento),
);

create table Cliente(
idCliente tinyint identity,
nome_completo varchar (50) not null,
endereco varchar (100) not null,
telefone char (11) not null,
CPF_CNPJ varchar (14) not null,
idPedi tinyint,
constraint pkCliente primary key (idCliente),
constraint fkPedido foreign key (idPedi) references Pedido (idPedido),
);

create table Entrega(
idEntrega tinyint identity,
idPedi tinyint ,
idClien tinyint ,
taxa decimal (5,2), --depende do endereço, ou fixa?
constraint pkEntrega primary key (idEntrega),
constraint fkPedido_Ent foreign key (idPedi) references Pedido (idPedido),
constraint fkCliente foreign key (idClien) references Cliente (idCliente),
);

create table Estado(
idEstado tinyint identity,
descricao char (9),
idPed tinyint,
constraint pkEsta primary key (idEstado),
constraint fkPedido_Est foreign key (idPed) references Pedido (idPedido),
);

-- Criação das procedures para inserir dados, tabela por tabela

CREATE PROCEDURE INSERE_ESTABELECIMENTO (@nome VARCHAR(50), @endereco VARCHAR(100), @telefone CHAR(11), @ramo_de_atuacao VARCHAR(100), @pedido_minimo DECIMAL(5,2), @horario_de_entregas SMALLDATETIME)
AS
BEGIN
	INSERT INTO Estabelecimento VALUES(@nome, @endereco, @telefone, @ramo_de_atuacao, @pedido_minimo, @horario_de_entregas)
END
GO

CREATE PROCEDURE INSERE_PEDIDO (@data_pedido SMALLDATETIME, @produto VARCHAR(50), @descricao VARCHAR(50), @quantidade TINYINT, @preco DECIMAL(5,2), @tipo_pagamento VARCHAR(20), @observacao VARCHAR(50), @idEstabele TINYINT)
AS
BEGIN
	INSERT INTO Pedido VALUES(@data_pedido, @produto, @descricao, @quantidade, @preco, @tipo_pagamento, @observacao, @idEstabele)
END
GO

CREATE PROCEDURE INSERE_CLIENTE (@nome_completo VARCHAR(50), @endereco VARCHAR(100), @telefone CHAR(11), @CPF_CNPJ VARCHAR(14), @idPedi TINYINT)
AS
BEGIN
	INSERT INTO Cliente VALUES(@nome_completo, @endereco, @telefone, @CPF_CNPJ, @idPedi)
END
GO

CREATE PROCEDURE INSERE_ENTREGA (@idPedi TINYINT, @idClien TINYINT, @taxa DECIMAL(5, 2))
AS
BEGIN
	INSERT INTO Entrega VALUES(@idPedi, @idClien, @taxa)
END
GO

CREATE PROCEDURE INSERE_ESTADO (@descricao CHAR(9), @idPed TINYINT)
AS
BEGIN
	INSERT INTO Estado VALUES(@descricao, @idPed)
END
GO

SELECT * FROM SYS.procedures
-- Execução das procedures

SELECT * FROM Estabelecimento

EXEC INSERE_ESTABELECIMENTO 'VK Burgers', 'Av. Irineu, 22', '11958252214', 'Alimenticio', 10.00, '20200419 08:00:00'
EXEC INSERE_ESTABELECIMENTO 'Burger King', 'Av. Maraja, 555', '11957259214', 'Alimenticio', 15.00, '20200419 10:00:00'
EXEC INSERE_ESTABELECIMENTO 'Bebidas JR', 'Av. 9 Junho, 1', '11953252371', 'Bebidas', 20.00, '20200419 08:00:00'
EXEC INSERE_ESTABELECIMENTO 'Point da Feijoada', 'Av. Carlos lacerda, 100', '11928452213', 'Alimenticio', 30.00, '20200419 11:00:00'
EXEC INSERE_ESTABELECIMENTO 'Marmitas Já', 'Av. São João, 33', '11941252217', 'Alimenticio', 10.00, '20200419 09:00:00'
EXEC INSERE_ESTABELECIMENTO 'MM Confecções', 'Av. Jubileu, 533', '11998222218', 'Vestuário', 100.00, '20200419 08:00:00'
EXEC INSERE_ESTABELECIMENTO 'Calçados NRAS', 'Av. Paulista, 1100', '11955152219', 'Calçados', 200.00, '20200419 07:00:00'
EXEC INSERE_ESTABELECIMENTO 'Rubi joias', 'Av. Faria lima, 2', '11978252212', 'Joias', 500.00, '20200419 08:00:00'
EXEC INSERE_ESTABELECIMENTO 'Salgado do gordo', 'Av. Yasmin, 88', '11913232214', 'Alimenticio', 10.00, '20200419 08:00:00'
EXEC INSERE_ESTABELECIMENTO 'Pizzaria Alto relevo', 'Av. DaPizza, 435', '11958758215', 'Alimenticio', 30.00, '20200419 08:00:00'

 
EXEC INSERE_PEDIDO '20200419', 'Super Hamburguer', 'Dobro de queijo', 2, 50.00, 'Dinheiro', 'Completo', 1
EXEC INSERE_PEDIDO '20200419', 'Stacker Triplo', 'Entrega rápido', 1, 20.00, 'Dinheiro', 'Sem cebola', 2
EXEC INSERE_PEDIDO '20200419', 'Jack Daniels', 'Acrescentar gelo de coco', 1, 130.00, 'Débito', 'Gelado', 3
EXEC INSERE_PEDIDO '20200419', 'Feijoada completa', 'Acrescentar caipirinha', 2, 50.00, 'Dinheiro', 'Tamanho G', 4
EXEC INSERE_PEDIDO '20200419', 'Filé Migon', 'Bem passado', 1, 25.00, 'Dinheiro', 'Sem cebola', 5
EXEC INSERE_PEDIDO '20200419', 'Medalhão de carne', 'Com molho de madeira', 1, 70.00, 'Dinheiro', 'Completo', 5
EXEC INSERE_PEDIDO '20200419', 'Terno Lacoste', 'Encomendado Sobre medida', 1, 700.00, 'Dinheiro', 'Completo', 6
EXEC INSERE_PEDIDO '20200419', 'Anel de formatura', 'Com um diamante de 10 pontos', 1, 900.00, 'A vista', 'Ouro branco', 8
EXEC INSERE_PEDIDO '20200419', 'Combo 10 de cada', 'Acompanhar limão e ketchup', 1, 50.00, 'Crédito', 'Completo', 9
EXEC INSERE_PEDIDO '20200419', 'Pizza de 4 queijos', 'Dobro de tomate e oregano', 1, 40.00, 'Dinheiro', 'Completo', 10


EXEC INSERE_CLIENTE 'Nilton Romeiro', 'Av. Mesquita', '11958479152', '23457892523', 10
EXEC INSERE_CLIENTE 'Nilton Romeiro', 'Av. Mesquita', '11958479152', '23457892523', 8
EXEC INSERE_CLIENTE 'Nilton Romeiro', 'Av. Mesquita', '11958479152', '23457892523', 5
EXEC INSERE_CLIENTE 'Matheus Marques', 'Av. Jafui', '11923499722', '95110891723', 1
EXEC INSERE_CLIENTE 'Matheus Marques', 'Av. Jafui', '11923499722', '95110891723', 2
EXEC INSERE_CLIENTE 'Matheus Marques', 'Av. Jafui', '11923499722', '95110891723', 4
EXEC INSERE_CLIENTE 'Bruno Assunção', 'Av. Numsei', '11922334452', '12345692523', 3
EXEC INSERE_CLIENTE 'Bruno Assunção', 'Av. Nemsei', '11922334452', '12345692523', 6
EXEC INSERE_CLIENTE 'Priscila Da Dalt', 'Av. Takiperto', '11913579152', '12852564187', 9
EXEC INSERE_CLIENTE 'Priscila Da Dalt', 'Av. Takiperto', '11913579152', '12852564187', 7


EXEC INSERE_ESTADO 'Concluido', 1
EXEC INSERE_ESTADO 'Concluido', 2
EXEC INSERE_ESTADO 'Concluido', 3
EXEC INSERE_ESTADO 'Andamento', 4
EXEC INSERE_ESTADO 'Andamento', 5
EXEC INSERE_ESTADO 'Andamento', 6
EXEC INSERE_ESTADO 'Cancelado', 7
EXEC INSERE_ESTADO 'Cancelado', 8
EXEC INSERE_ESTADO 'Cancelado', 9
EXEC INSERE_ESTADO 'Concluido', 10


EXEC INSERE_ENTREGA 1, 1, 10.00
EXEC INSERE_ENTREGA 2, 2, 10.00
EXEC INSERE_ENTREGA 3, 3, 10.00
EXEC INSERE_ENTREGA 4, 4, 10.00
EXEC INSERE_ENTREGA 5, 5, 10.00
EXEC INSERE_ENTREGA 6, 6, 10.00
EXEC INSERE_ENTREGA 7, 7, 10.00
EXEC INSERE_ENTREGA 8, 8, 10.00
EXEC INSERE_ENTREGA 9, 9, 10.00
EXEC INSERE_ENTREGA 10, 10, 10.00



select * from estabelecimento
select * from pedido
select * from cliente
select * from entrega 
select * from estado


SELECT Pedido.idPedido AS 'número do pedido', Pedido.Quantidade AS 'quantidade de pedidos'
, Estabelecimento.Nome AS 'nome do estabelecimento', Estabelecimento.Ramo_de_Atuacao AS 'ramo do Restaurante'
FROM Estabelecimento	join	Pedido 
						ON Estabelecimento.idEstabelecimento = Pedido.idEstabele

SELECT Pedido.Produto AS 'tipo de produto', Pedido.tipo_pagamento AS 'tipo de pagamento'
, Estado.descricao AS 'Situação do pedido'
FROM Estado		join	Pedido 
				ON Estado.idPed = Pedido.idPedido
ORDER BY Estado.idEstado

SELECT Entrega.taxa AS 'total da entrega'
, Cliente.endereco AS 'endereço do cliente'
, Pedido.preco AS ' preço do pedido'
FROM Entrega	join	Cliente
				ON Entrega.idClien = Cliente.idCliente
				join	Pedido
				ON Pedido.idPedido = Entrega.idPedi
WHERE Pedido.preco >=40
ORDER BY Pedido.preco DESC

SELECT Estabelecimento.Nome AS 'nome do estabelecimento', Estabelecimento.Ramo_de_Atuacao AS 'ramo do estabelecimento'
, Pedido.Quantidade AS 'quantidade'
, Estado.descricao AS 'Estado'
, Entrega.Taxa AS 'taxa de entrega'
, Cliente.Endereco AS 'endereço do cliente'
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


select * from sys.procedures

sp_helptext INSERE_ESTABELECIMENTO