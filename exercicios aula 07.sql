--exercicio 1
--Recriar toda a estrutura de tabelas (abrir o script Carga Consessionaria, DROP nos objetos que já
--haviam criado e executar o script para que crie novamente as tabelas com dados originais).

drop table VendasAnuais, Veiculo, fabricante, Ano, Mes, Modelo
drop procedure [InserirVeiculoVendas]

--exercicio 2
--Adicionar os fabricantes a seguir com todos dados: FIAT, GM e VW.

insert into Fabricante (nome, endereco, cidade, uf, telefone, contato) 
values('FIAT', 'AV ALCANTARA MACHADO 2132 BRAS', 'SAO PAULO', 'SP', '11 2799-6000','AMAZONAS-MOOCA')

insert into Fabricante (nome, endereco, cidade, uf, telefone, contato) 
values('GM', 'AV. ARICANDUVA 5.555 BAIRRO JARDIM SANTA TEREZINHA ', 'SAO PAULO', 'SP', '(11) 2227-6100','VIGORITO (ARICANDUVA)')

insert into Fabricante (nome, endereco, cidade, uf, telefone, contato) 
values('VW', 'Rua Coelho Lisboa, 574 ', 'SAO PAULO', 'SP', '(11) 2942-1800','Green Automoveis')

select * from fabricante

--exercicio 3
--Adicionar os modelos: Standard, Premium, Executive.

insert into modelo(descricao) values('Standard')
insert into modelo(descricao) values('Executive')
insert into modelo(descricao) values('Premium') 

select * from modelo

--exercicio 4
--Adicionar os Veículos: Artic (Fiat - Standard - ano 2025), Voltz (GM - Executive - ano 2027), 
--Zeo (Volks Premium - ano 2028), Bjorn (GM - Premium - ano 2028), 
--Duntzen (Fiat - Standard – ano 2026),Tungsten (Volks - Executive - ano 2027).

select * from ano
insert into ano(ano) values(2025)
insert into ano(ano) values(2026)
insert into ano(ano) values(2027)
insert into ano(ano) values(2028)

select * from veiculo
select* from modelo
select * from ano

insert into veiculo(descricao,valor,datacompra,idmodelo, idfabricante, idanofabricacao) values ('Artic', '39.900', '20230301', 1,1,1 )
insert into veiculo(descricao,valor,datacompra,idmodelo, idfabricante, idanofabricacao) values ('Voltz', '51.000', '20240608', 2,2,3 )
insert into veiculo(descricao,valor,datacompra,idmodelo, idfabricante, idanofabricacao) values ('Zeo', '151.000', '20250704', 3,3,4 )
insert into veiculo(descricao,valor,datacompra,idmodelo, idfabricante, idanofabricacao) values ('Bjorn', '205.000', '20260306', 3,2,4 )
insert into veiculo(descricao,valor,datacompra,idmodelo, idfabricante, idanofabricacao) values ('Duntzen', '45.900', '20270507', 1,1,2 )
insert into veiculo(descricao,valor,datacompra,idmodelo, idfabricante, idanofabricacao) values ('Tungsten ', '325.900', '20280902', 2,3,3 )

--exercicio 5
--Adicionar três Vendas para cada veículo para o ano de 2029 em meses distintos.

select* from ano
insert into ano(ano) values(2029)

select * from mes
insert into mes(mes)values(1) 
insert into mes(mes)values(2)
insert into mes(mes)values(3)
insert into mes(mes)values(4)
insert into mes(mes)values(5)
insert into mes(mes)values(6)
insert into mes(mes)values(7)
insert into mes(mes)values(8)
insert into mes(mes)values(9)
insert into mes(mes)values(10)
insert into mes(mes)values(11)
insert into mes(mes)values(12)

select* from vendasanuais
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(1,1,5,18 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(2,1,5,21 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(3,1,5,24 )

insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(1,2,5,27 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(2,2,5,30 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(3,2,5,33 )

insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(1,3,5,36 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(2,3,5,39 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(3,3,5,42 )

insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(1,4,5,45 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(2,4,5,48 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(3,4,5,51 )

insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(1,6,5,36 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(2,6,5,48 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(3,6,5,42 )

insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(1,7,5,18 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(2,7,5,36 )
insert into vendasanuais(qtd, idveiculo,idanodavenda, idmesdavenda) values(3,7,5,48 )

--exercicio 6
--Alterar a fabricação dos veículos Zeo e Bjorn para o ano de 2026. 
--Os demais veículos alterar para 2030.

select * from ano
insert into Ano(ano) values('2026'),('2030'),('2031'),('2032')
update veiculo set idanofabricacao=10 where descricao='Zeo' , 'Bjorn'    
update veiculo set idanofabricacao=11 where descricao='Artic', 'Voltz', 'Duntzen', 'Tungsten '

--exercicio 7
--Alterar as Vendas dos Veículos Premium para janeiro de 2030, 
--Standard para Dezembro de 2031 e Executive para outubro de 2032. 1s 2ex 3 pr '1Artic', '2Voltz' '3Zeo' '3Bjorn'  '1Duntzen', '2Tungsten '
update vendasanuais set idanodavenda=11, idmesdavenda=01 where idveiculo=3 or 4
update vendasanuais set idanodavenda=12, idmesdavenda=12 where idveiculo=1 or 5
update vendasanuais set idanodavenda=13, idmesdavenda=10 where idveiculo=2 or 6