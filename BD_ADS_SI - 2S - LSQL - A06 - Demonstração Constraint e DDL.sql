----------------------------------------------------------------------------------------
-- Demonstração Constraint e DML
----------------------------------------------------------------------------------------
/*
drop table Automovel, Venda, Cliente
*/


create table Cliente
(
	idCliente smallint identity(-32767, 1) 
	, Telefone varchar(14) 
    , DataEntrada datetime 
	, Idade tinyint not null
	, constraint pkCliente primary key (idCliente)
	, constraint ckCliente_Idade check (Idade between 18 and 90)
	, constraint ckCliente_Telefone check 	(
									Telefone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
									Telefone LIKE '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
									)
)


create table Venda
( 
	DataVenda date not null constraint dfVenda_DataVenda default (getdate())
	, Quantidade smallint not null constraint dfQtd default (1)
	, NumeroCliente smallint not null
	, constraint pkVenda primary key (DataVenda)
	, constraint fkVenda_NumeroCliente foreign key (NumeroCliente) references Cliente(idCliente)
);


alter table Cliente drop constraint ckCliente_Idade

alter table Cliente add constraint ckCliente_Idade check (idade between 18 and 90)

alter table Venda drop constraint dfVenda_DataVenda

alter table Venda add constraint dfVenda_DataVenda default (getdate()) for dataVenda



-- DML
create table Automovel
( 
	idAutomovel  int identity not null
	, Placa  char(8) not null
	, Marca  varchar(20)  not null
);

-- INSERT
insert into Automovel (Placa, Marca) values ('XPT-7654', 'Ford');
insert into Automovel (Marca, Placa) values ('GM', 'KML-7299');
insert into Automovel values ('EXH-2566', 'Fiat');

select * from Automovel

-- UPDATE
select * from Automovel where idAutomovel = 1

update Automovel set Marca = 'VW' where idAutomovel = 1

--DELETE
select * from Automovel where idAutomovel = 3

delete Automovel where idAutomovel = 3


