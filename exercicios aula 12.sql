--1. Traga o nome dos fabricantes que possuam mais de 5 letras.
select nome  as 'Nome do fabricante' from fabricante where len (nome) > 5

--2. Traga o nome dos fabricantes que terminem com a letra �i�.
select nome as 'Nome do fabricante' from fabricante where right (nome,1)='i' 

--3. Concatene numa coluna com o nome �CONCATENA�, composta pela 1�. e �ltima letra dos nomes de cada
--fabricante (ambas mai�sculas).
select nome , left(nome,1) + right (upper(nome),1) as 'CONCATENA' from fabricante

--4. Retorne o endere�o dos fabricantes substituindo a palavra �Av.� por �Avenida�.
select endereco,
replace(endereco,'Av.','Avenida') 
as 'Endere�o do fabricante' 
from fabricante

--5. Utilizando o predicado LIKE, traga os endere�os que contenha a palavra �DA�.
select endereco as 'Endere�o do fabricante' from fabricante where endereco like '%da%'  

--6. Utilizando a fun��o CHARINDEX, traga os endere�os que contenha a palavra �DA�.
select endereco, charindex('da', endereco) as 'Endere�o do fabricante' from fabricante 

--7. Liste os 8 primeiros telefones da tabela Fabricante, separando por h�fen os primeiros 4 d�gitos, dos �ltimos d�gitos.
select top(8) telefone ,left(telefone,4) + '-' + right(telefone,4) as 'Telefone do fabricante'  from fabricante 

--8. Na tabela fabricante, liste uma coluna de nome �N�MERO� contendo apenas o n�mero dos endere�os.
select endereco ,
right (endereco, len(endereco) - charindex(',', endereco)) 
as 'NUMERO'
from fabricante

--9. Fa�a um JOIN entre Ve�culo e Fabricante, trazendo a Descri��o do Ve�culo, a UF do Fabricante e atrav�s de um
--CASE, liste um campo de nome �REGI�O�, colocando a regi�o do Brasil referente a UF encontrada (ex: Regi�o Sul,
--Regi�o Norte, ...).
select uf from fabricante

select descricao, uf,
case
when UF='AC' then 'REGI�O NORTE'
when UF='AP' then 'REGI�O NORTE'
when UF='AM' then 'REGI�O NORTE'
when UF='PA' then 'REGI�O NORTE'
when UF='RO' then 'REGI�O NORTE'
when UF='RR' then 'REGI�O NORTE'
when UF='TO' then 'REGI�O NORTE'
when UF='AL' then 'REGI�O NORDESTE'
when UF='BA' then 'REGI�O NORDESTE'
when UF='CE' then 'REGI�O NORDESTE'
when UF='MA' then 'REGI�O NORDESTE'
when UF='PB' then 'REGI�O NORDESTE'
when UF='PI' then 'REGI�O NORDESTE'
when UF='PE' then 'REGI�O NORDESTE'
when UF='RN' then 'REGI�O NORDESTE'
when UF='SE' then 'REGI�O NORDESTE'
when UF='DF' then 'REGI�O CENTRO-OESTE'
when UF='GO' then 'REGI�O CENTRO-OESTE'
when UF='MT' then 'REGI�O CENTRO-OESTE'
when UF='MS' then 'REGI�O CENTRO-OESTE'
when UF='ES' then 'REGI�O SUDESTE'
when UF='MG' then 'REGI�O SUDESTE'
when UF='SP' then 'REGI�O SUDESTE'
when UF='RJ' then 'REGI�O SUDESTE'
when UF='PR' then 'REGI�O SUL'
when UF='RS' then 'REGI�O SUL'
when UF='SC' then 'REGI�O SUL'
else 'N�O ENCONTRADO'
end as 'REGI�O'
from fabricante join veiculo 
on fabricante.idfabricante = veiculo.idfabricante

--10. Partindo da query anterior, com um outro CASE, liste uma coluna de nome �SEGMENTO DA VENDA�, onde o
--conte�do deve seguir a seguinte regra:
-- �Segmento 1� � quando a cidade for S�o Paulo
-- �Segmento 2� � cidade do Rio de Janeiro
-- �Segmento 3� � cidade de Curitiba
-- �Segmento 4� � qualquer outra cidade
SELECT * FROM FABRICANTE

select descricao, uf,
case
when UF='AC' then 'REGI�O NORTE'
when UF='AP' then 'REGI�O NORTE'
when UF='AM' then 'REGI�O NORTE'
when UF='PA' then 'REGI�O NORTE'
when UF='RO' then 'REGI�O NORTE'
when UF='RR' then 'REGI�O NORTE'
when UF='TO' then 'REGI�O NORTE'
when UF='AL' then 'REGI�O NORDESTE'
when UF='BA' then 'REGI�O NORDESTE'
when UF='CE' then 'REGI�O NORDESTE'
when UF='MA' then 'REGI�O NORDESTE'
when UF='PB' then 'REGI�O NORDESTE'
when UF='PI' then 'REGI�O NORDESTE'
when UF='PE' then 'REGI�O NORDESTE'
when UF='RN' then 'REGI�O NORDESTE'
when UF='SE' then 'REGI�O NORDESTE'
when UF='DF' then 'REGI�O CENTRO-OESTE'
when UF='GO' then 'REGI�O CENTRO-OESTE'
when UF='MT' then 'REGI�O CENTRO-OESTE'
when UF='MS' then 'REGI�O CENTRO-OESTE'
when UF='ES' then 'REGI�O SUDESTE'
when UF='MG' then 'REGI�O SUDESTE'
when UF='SP' then 'REGI�O SUDESTE'
when UF='RJ' then 'REGI�O SUDESTE'
when UF='PR' then 'REGI�O SUL'
when UF='RS' then 'REGI�O SUL'
when UF='SC' then 'REGI�O SUL'
else 'N�O ENCONTRADO'
end as 'REGI�O',

CASE
when cidade='sao paulo' THEN 'Segmento 1'
when cidade='rio de janeiro' THEN 'Segmento 2'
when cidade='curitiba' THEN 'Segmento 3'
else 'Segmento 4'
END AS 'SEGMENTO DA VENDA'

from fabricante join veiculo 
on fabricante.idfabricante = veiculo.idfabricante
