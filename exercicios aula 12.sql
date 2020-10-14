--1. Traga o nome dos fabricantes que possuam mais de 5 letras.
select nome  as 'Nome do fabricante' from fabricante where len (nome) > 5

--2. Traga o nome dos fabricantes que terminem com a letra “i”.
select nome as 'Nome do fabricante' from fabricante where right (nome,1)='i' 

--3. Concatene numa coluna com o nome “CONCATENA”, composta pela 1ª. e última letra dos nomes de cada
--fabricante (ambas maiúsculas).
select nome , left(nome,1) + right (upper(nome),1) as 'CONCATENA' from fabricante

--4. Retorne o endereço dos fabricantes substituindo a palavra “Av.” por “Avenida”.
select endereco,
replace(endereco,'Av.','Avenida') 
as 'Endereço do fabricante' 
from fabricante

--5. Utilizando o predicado LIKE, traga os endereços que contenha a palavra “DA”.
select endereco as 'Endereço do fabricante' from fabricante where endereco like '%da%'  

--6. Utilizando a função CHARINDEX, traga os endereços que contenha a palavra “DA”.
select endereco, charindex('da', endereco) as 'Endereço do fabricante' from fabricante 

--7. Liste os 8 primeiros telefones da tabela Fabricante, separando por hífen os primeiros 4 dígitos, dos últimos dígitos.
select top(8) telefone ,left(telefone,4) + '-' + right(telefone,4) as 'Telefone do fabricante'  from fabricante 

--8. Na tabela fabricante, liste uma coluna de nome “NÚMERO” contendo apenas o número dos endereços.
select endereco ,
right (endereco, len(endereco) - charindex(',', endereco)) 
as 'NUMERO'
from fabricante

--9. Faça um JOIN entre Veículo e Fabricante, trazendo a Descrição do Veículo, a UF do Fabricante e através de um
--CASE, liste um campo de nome “REGIÃO”, colocando a região do Brasil referente a UF encontrada (ex: Região Sul,
--Região Norte, ...).
select uf from fabricante

select descricao, uf,
case
when UF='AC' then 'REGIÃO NORTE'
when UF='AP' then 'REGIÃO NORTE'
when UF='AM' then 'REGIÃO NORTE'
when UF='PA' then 'REGIÃO NORTE'
when UF='RO' then 'REGIÃO NORTE'
when UF='RR' then 'REGIÃO NORTE'
when UF='TO' then 'REGIÃO NORTE'
when UF='AL' then 'REGIÃO NORDESTE'
when UF='BA' then 'REGIÃO NORDESTE'
when UF='CE' then 'REGIÃO NORDESTE'
when UF='MA' then 'REGIÃO NORDESTE'
when UF='PB' then 'REGIÃO NORDESTE'
when UF='PI' then 'REGIÃO NORDESTE'
when UF='PE' then 'REGIÃO NORDESTE'
when UF='RN' then 'REGIÃO NORDESTE'
when UF='SE' then 'REGIÃO NORDESTE'
when UF='DF' then 'REGIÃO CENTRO-OESTE'
when UF='GO' then 'REGIÃO CENTRO-OESTE'
when UF='MT' then 'REGIÃO CENTRO-OESTE'
when UF='MS' then 'REGIÃO CENTRO-OESTE'
when UF='ES' then 'REGIÃO SUDESTE'
when UF='MG' then 'REGIÃO SUDESTE'
when UF='SP' then 'REGIÃO SUDESTE'
when UF='RJ' then 'REGIÃO SUDESTE'
when UF='PR' then 'REGIÃO SUL'
when UF='RS' then 'REGIÃO SUL'
when UF='SC' then 'REGIÃO SUL'
else 'NÃO ENCONTRADO'
end as 'REGIÃO'
from fabricante join veiculo 
on fabricante.idfabricante = veiculo.idfabricante

--10. Partindo da query anterior, com um outro CASE, liste uma coluna de nome “SEGMENTO DA VENDA”, onde o
--conteúdo deve seguir a seguinte regra:
-- “Segmento 1” – quando a cidade for São Paulo
-- “Segmento 2” – cidade do Rio de Janeiro
-- “Segmento 3” – cidade de Curitiba
-- “Segmento 4” – qualquer outra cidade
SELECT * FROM FABRICANTE

select descricao, uf,
case
when UF='AC' then 'REGIÃO NORTE'
when UF='AP' then 'REGIÃO NORTE'
when UF='AM' then 'REGIÃO NORTE'
when UF='PA' then 'REGIÃO NORTE'
when UF='RO' then 'REGIÃO NORTE'
when UF='RR' then 'REGIÃO NORTE'
when UF='TO' then 'REGIÃO NORTE'
when UF='AL' then 'REGIÃO NORDESTE'
when UF='BA' then 'REGIÃO NORDESTE'
when UF='CE' then 'REGIÃO NORDESTE'
when UF='MA' then 'REGIÃO NORDESTE'
when UF='PB' then 'REGIÃO NORDESTE'
when UF='PI' then 'REGIÃO NORDESTE'
when UF='PE' then 'REGIÃO NORDESTE'
when UF='RN' then 'REGIÃO NORDESTE'
when UF='SE' then 'REGIÃO NORDESTE'
when UF='DF' then 'REGIÃO CENTRO-OESTE'
when UF='GO' then 'REGIÃO CENTRO-OESTE'
when UF='MT' then 'REGIÃO CENTRO-OESTE'
when UF='MS' then 'REGIÃO CENTRO-OESTE'
when UF='ES' then 'REGIÃO SUDESTE'
when UF='MG' then 'REGIÃO SUDESTE'
when UF='SP' then 'REGIÃO SUDESTE'
when UF='RJ' then 'REGIÃO SUDESTE'
when UF='PR' then 'REGIÃO SUL'
when UF='RS' then 'REGIÃO SUL'
when UF='SC' then 'REGIÃO SUL'
else 'NÃO ENCONTRADO'
end as 'REGIÃO',

CASE
when cidade='sao paulo' THEN 'Segmento 1'
when cidade='rio de janeiro' THEN 'Segmento 2'
when cidade='curitiba' THEN 'Segmento 3'
else 'Segmento 4'
END AS 'SEGMENTO DA VENDA'

from fabricante join veiculo 
on fabricante.idfabricante = veiculo.idfabricante
