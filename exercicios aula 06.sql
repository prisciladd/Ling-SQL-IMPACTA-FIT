--exercício 1
alter table modelo alter column descricao varchar(30) not null 
--prof: tem descricao tbm no veiculo

--exercício 2
alter table Veiculo add StatusVeiculo varchar(20) 

--exercício 3
alter table Fabricante drop column contato

--exercício 4
alter table Veiculo add constraint dfStatus default 'ATIVO' for StatusVeiculo

--exercício 5
--prof: tbm pode usar check (qtd between 1 and 10000)

alter table VendasAnuais alter column qtd decimal (7,2) 
select qtd from VendasAnuais
delete VendasAnuais where qtd>10000 or qtd<1 

--exercício 6
--prof: values (2016),(2017),...

select ano from ano
insert into Ano (ano) values(2016)
insert into Ano (ano) values(2017)
insert into Ano (ano) values(2018)
insert into Ano (ano) values(2019)
insert into Ano (ano) values(2020)

--exercício 7
select descricao from modelo
insert into Modelo (descricao) values ('LST')
insert into Modelo (descricao) values ('KS')
insert into Modelo (descricao) values ('RS')

--exercício 8
alter table Mes add descricaoMes varchar(9)
alter table Mes drop column descricaoMes

--exercício 9
--prof: from não precisa
select mes,descricaoMes from mes
update Mes set descricaoMes='Janeiro' from Mes where mes=1
update Mes set descricaoMes='Fevereiro' from Mes where mes=2
update Mes set descricaoMes='Março' from Mes where mes=3
update Mes set descricaoMes='Abril' from Mes where mes=4
update Mes set descricaoMes='Maio' from Mes where mes=5
update Mes set descricaoMes='Junho' from Mes where mes=6
update Mes set descricaoMes='Julho' from Mes where mes=7
update Mes set descricaoMes='Agosto' from Mes where mes=8
update Mes set descricaoMes='Setembro' from Mes where mes=9
update Mes set descricaoMes='Outubro' from Mes where mes=10
update Mes set descricaoMes='Novembro' from Mes where mes=11
update Mes set descricaoMes='Dezembro' from Mes where mes=12

--exercício 10
select * from Fabricante

insert into Fabricante (nome,endereco,cidade,UF,telefone) 
values('TRIUMPH','Avenida das Nações Unidas 14.171 Marble Tower Torre B Térreo Loja B1','São Paulo','SP','3010-1010'),
('KTM','Rua João Negrão, 1888, Rebouças','Curitiba', 'PR','3779-9630'),
('Kynco', 'Av. Doutor Ricardo Jafet, 51 , Vila Santa Eulália', 'São Paulo', 'SP', '99439-5700')

delete from fabricante where idfabricante=13

--exercício 11 fonte: webmotors
select * from Veiculo

--prof: inserir idmodelo,idfabricante,idanofabricacao 
insert into Veiculo (descricao, valor, datacompra)
values 
('Tiger Explorer','39000','2015-03-31'),
('ECX 450','29.9','2012'),
('Dowtown','16.70','2017')

update Veiculo set valor='29900' where idveiculo=113
update Veiculo set valor='16700' where idveiculo=114

select * from modelo

update Veiculo set idmodelo=10,from veiculo where descricao='tiger explorer'
update Veiculo set idmodelo=11 from veiculo where descricao='ecx 450'
update Veiculo set idmodelo=12 from veiculo where descricao='dowtown'


update Veiculo set idfabricante=14 from veiculo where descricao='tiger explorer'
update Veiculo set idfabricante=15 from veiculo where descricao='ecx 450'
update Veiculo set idfabricante=16 from veiculo where descricao='dowtown'

update Veiculo set idanofabricacao=5 from veiculo where descricao='tiger explorer'
update Veiculo set idanofabricacao=13 from veiculo where descricao='ecx 450'
update Veiculo set idanofabricacao=18 from veiculo where descricao='dowtown'

sp_help veiculo

select * from ano 

--exercício 12
select * from vendasanuais

insert into vendasanuais(qtd,idveiculo,idanodavenda,idmesdavenda) values(1,112,17,15) 
insert into vendasanuais(qtd,idveiculo,idanodavenda,idmesdavenda) values(5,112,18,18) 
insert into vendasanuais(qtd,idveiculo,idanodavenda,idmesdavenda) values(2,113,19,21)
insert into vendasanuais(qtd,idveiculo,idanodavenda,idmesdavenda) values(3,113,20,24)
insert into vendasanuais(qtd,idveiculo,idanodavenda,idmesdavenda) values(6,114,21,30)
insert into vendasanuais(qtd,idveiculo,idanodavenda,idmesdavenda) values(7,114,21,33)

--exercício 13
--prof: usar id modelo =10
select * from modelo

update modelo set descricao= 'GTX' where descricao='LST'

--exercício 14
select * from veiculo
delete from vendasanuais where idveiculo=113
delete from veiculo where idveiculo=113 and idmodelo=11 and idfabricante=15 and idanofabricacao=13