--1. Na tabela Veículo, encontre a média (com casas decimais) para todos os valores de veículos que foram
--comprados entre os anos de 2003 e 2005.
select avg(valor) as 'Média de Preços', year (datacompra) as '2003 a 2005' 
from veiculo 
where datacompra between '20030101' and '20051231' 
group by datacompra, valor
order by datacompra

--2. Utilizando funções de arredondamento, faça com que a média encontrada na query anterior tenha
--(executar um SELECT por vez para cada uma das solicitações abaixo) :

--2a. Aproximação para a 2a. casa decimal
select avg (valor),round(valor,2) as 'Média de Preços', year (datacompra) as '2003 a 2005' 
from veiculo 
where datacompra between '20030101' and '20051231' 
group by datacompra, valor
order by datacompra

--2b. Seja truncado para o inteiro menor que a média encontrada
select avg (valor),floor(valor) as 'Média de Preços', year (datacompra) as '2003 a 2005' 
from veiculo 
where datacompra between '20030101' and '20051231' 
group by datacompra, valor
order by datacompra

--2c. Seja truncado para o inteiro maior que a média encontrada
select avg (valor),ceiling(valor) as 'Média de Preços', year (datacompra) as '2003 a 2005' 
from veiculo 
where datacompra between '20030101' and '20051231' 
group by datacompra, valor
order by datacompra

--3. Faça um SELECT que traga a data de compra no formato de nosso idioma, ou seja, DD/MM/YYYY.
select datacompra, convert(varchar(10),datacompra,103) from veiculo

--4. Na tabela de VendasAnuais, faça a soma das quantidades para cada mês ímpar do ano de 2004.
select * from vendasanuais 
select * from mes
select * from ano

select sum(qtd) as 'Vendas dos meses ímpares de 2004', mes, ano
from vendasanuais join mes on idmesdavenda=idmes join ano on idanodavenda=idano
where (idmesdavenda= 48 or idmesdavenda=42 or idmesdavenda=36 
or idmesdavenda=30 or idmesdavenda=24 or idmesdavenda=18) and ano=2004
group by mes, ano
order by mes

--5. Faça uma query similar a anterior, trazendo agora a soma das quantidades para cada ano e trimestre.
select sum(qtd) as 'Vendas por ano e trimestre',mes, ano
from vendasanuais join mes on idmesdavenda=idmes join ano on idanodavenda=idano
group by mes, ano
order by ano