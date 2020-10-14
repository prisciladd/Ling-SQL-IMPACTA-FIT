--1) Qual o número de registros existentes na tabela VendasAnuais ?
select count(*) 
from vendasanuais 
-- como a pk é unica pode por count(pk)
-- top 10 NÃO SÃO os primeiros 10

--2) Qual o acumulado da quantidade de vendas totais até o momento ?
select sum(qtd)
from vendasanuais

--3) Quais as quantidades de vendas totais até o momento para: menor venda, média de
--vendas e a maior venda?
select min(qtd) as 'minimo' ,avg(qtd) as 'media', max(qtd) as 'maximo' --funções escalar pois retorna 1 linha e 1 coluna
from vendasanuais

--4) Extraia a soma das vendas totais por ano em ordem descendente.
select ano, sum(qtd)as 'total de vendas'
from vendasanuais join ano on vendasanuais.idanodavenda = ano.idano -- se id ano não é igual não precisa do schema ano. 
--Em vez de schema pode usar apelido vendasanuais as v-- v.idanodavenda
group by ano
order by ano desc

select 16801 --664794
+22505
+29274
+36308
+57101
+62946
+66007
+98668
+119411
+155773

--5) Traga a soma das vendas totais para o veículo/modelo CG 125(1) STD(7) (as informações do
--veículo devem constar na query).
select * from modelo

select * from veiculo

select sum(qtd) as 'total de vendas', veiculo.descricao as 'veiculo', modelo.descricao as 'modelo'
from vendasanuais 
join veiculo on vendasanuais.idveiculo=veiculo.idveiculo
join modelo on modelo.idmodelo= veiculo.idmodelo
where veiculo.idveiculo= 1 and modelo.idmodelo=7
group by veiculo.descricao, modelo.descricao


--6) Traga as primeiras datas (ANOS) de FABRICAÇÃO de todos os veículos e modelos,
--ordenados pelo nome do fabricante (ascendente), ano (descendente), Veículo
--(ascendente) e Modelo (descendente) Toda as informações solicitadas, inclusive
--ordenação, devem constar na query.
select * from modelo

select min(ano) as 'ano de fabricacao',veiculo.descricao as 'veiculo',
modelo.descricao as 'modelo',fabricante.nome as 'fabricante' 
from veiculo
join modelo on veiculo.idmodelo=modelo.idmodelo
join ano on veiculo.idanofabricacao=ano.idano
join fabricante on veiculo.idfabricante=fabricante.idfabricante
group by veiculo.descricao,modelo.descricao,fabricante.nome -- 1 LINHA PRA CADA
order by fabricante.nome, veiculo.descricao asc, modelo.descricao desc

--7) Extraia a menor, maior, média e a soma das vendas de cada mês do ano de 2000, em
--ordem ascendente.
select min(qtd) as menor ,max(qtd) as maior,
avg(qtd) as media, sum(qtd) as soma, 
mes, ano
from vendasanuais as va
join ano on va.idanodavenda = ano.idano
join mes on va.idmesdavenda = mes.idmes
where ano.ano= 2000
group by mes, ano
order by ano,mes

--8) Retorne a mesma consulta anterior, mas somente os registros que tiverem média de
--vendas superior a 500.
select min(qtd) as menor ,max(qtd) as maior,
avg(qtd) as media, sum(qtd) as soma, 
mes, ano
from vendasanuais as va
join ano on va.idanodavenda = ano.idano
join mes on va.idmesdavenda = mes.idmes
where ano.ano= 2000
group by mes, ano
having avg (qtd)>500
order by ano,mes