--Baseado no modelo, desenvolva as seguintes queries, colocando nomes apropriados
--(SIGNIFICATIVOS) para todas as colunas (se uma questão for baseada na anterior, copie a query
--que foi feita e faça alterações sobre ela, mantendo uma consulta por questão)

--1. Liste os pedidos entregues para a cidade de Resende, Brasil.
select * from sales.orders
where shipcity= 'Resende' and shipcountry= 'Brazil'

--2. Encontre os pedidos entregues para as capitais dos estados brasileiros.
select * from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil' 
and shipcity= 'Maceio'
or shipcity= 'Macapa'
or shipcity= 'Manaus'
or shipcity= 'Salvador'
or shipcity= 'Fortaleza'
or shipcity= 'Brasilia'
or shipcity= 'Vitoria'
or shipcity= 'Goiania'
or shipcity= 'São Luis'
or shipcity= 'Cuiaba'
or shipcity= 'Campo Grande'
or shipcity= 'Belo Horizonte'
or shipcity= 'Belem'
or shipcity= 'Joao Pessoa'
or shipcity= 'Curitiba'
or shipcity= 'Recife'
or shipcity= 'Teresina'
or shipcity= 'Rio de Janeiro'
or shipcity= 'Natal'
or shipcity= 'Porto Alegre'
or shipcity= 'Porto Velho'
or shipcity= 'Boa Vista'
or shipcity= 'Florianopolis'
or shipcity= 'Sao Paulo'
or shipcity= 'Aracaju'
or shipcity= 'Palmas'
order by 
shipcity


--3. Traga somente a quantidade de pedidos realizados para entrega na região SUDESTE do Brasil.--65
select count(*) as 'Total Pedidos Sudeste do Brasil'
from sales.orders
where shipcountry= 'Brazil' and shipcity= 'rio de janeiro' or shipcity= 'sao paulo' or shipcity= 'minas gerais' or shipcity= 'espirito santo'

--4. Adicione a query anterior a soma dos valores dos fretes, o menor e maior frete pago e a
--média do valor de frete.
select count(*) as 'Total Pedidos Sudeste do Brasil',
sum(freight) as 'Soma Frete Sudeste do Brasil',
min(freight) as 'Menor Frete Sudeste do Brasil',
max(freight) as 'Maior Frete Sudeste do Brasil',
avg(freight) as 'Media Frete Sudeste do Brasil'
from sales.orders
where shipcountry= 'Brazil' and shipcity= 'rio de janeiro' or shipcity= 'sao paulo' or shipcity= 'minas gerais' or shipcity= 'espirito santo'

--5. Traga apenas a soma dos preços dos itens de produtos entregues para o país Brasil ?
select * from sales.orderdetails

select sum(unitprice) as 'Soma Preços entregas no Brasil', 
shipcountry as 'país de entrega'
from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil'
group by shipcountry

--6. Observe que o valor pago em um item de pedido é calculado pelo valor unitário do produto
--na data do pedido, multiplicado pela sua quantidade comprada. Ajuste assim a soma obtida
--anteriormente para encontrar o correto valor pago para os pedidos.
select sum(unitprice * qty) as 'Soma Preços multiplicado pela quantidade entregas no Brasil',
shipcountry as 'país de entrega'
from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil'
group by shipcountry

--7. Ainda no ajuste dos mesmos os valores, observe que cada item de pedido pode ter um índice
--de desconto (discount, onde 0.25 representa 25% de desconto) que será aplicado no valor
--total de cada item. Desta forma, faça um novo ajuste na soma dos valores, com o desconto
--fornecido.
select * from sales.orderdetails

select sum(unitprice * qty-discount) as 'Soma Preços multiplicado pela quantidade entregas no Brasil',
shipcountry as 'país de entrega'
from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil'
group by shipcountry

--8. Agora com os valores devidamente acertados, faça um agrupamento de forma a obter os valores
--por estados (Some MANUALMENTE as quantidades obtidas e verifique se é a mesma encontrada na
--query anterior).
select sum(unitprice* qty - discount) as 'Soma Preços multiplicado pela quantidade menos desconto de entregas no Brasil', 
shipcountry as 'país de entrega', 
shipregion as 'estado de entrega'
from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil'
group by shipcountry,shipregion
order by shipregion

--9. Adicione a cidade de cada estado deixando o resultado ordenado pelo estado, seguidamente da
--cidade (Some MANUALMENTE as quantidades encontradas por cidades de cada estado e verifique
--se são as mesmas encontradas na query anterior referente ao estado).
select sum(unitprice* qty - discount) as 'Soma Preços multiplicado pela quantidade menos desconto de entregas no Brasil', 
shipcountry as 'país de entrega', 
shipregion as 'estado de entrega', 
shipcity as 'cidade de entrega'
from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil'
group by shipcountry, shipregion, shipcity
order by shipregion, shipcity

--10. Adicione os endereços dos clientes que realizaram estes pedidos, permanecendo a mesma
--ordenação anterior (Some MANUALMENTE as quantidades obtidas por endereço da cidade e
--verifique se são as mesmas encontradas na query anterior referente a cidade) .
select * from sales.orders

select sum(unitprice * qty - discount) as 'Soma Preços multiplicado pela quantidade menos desconto de entregas no Brasil', 
shipcountry as 'país de entrega', 
shipregion as 'estado de entrega', 
shipcity as 'cidade de entrega', 
shipaddress as 'endereco de entrega'
from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil'
group by shipcountry, shipregion, shipcity, shipaddress
order by shipregion, shipcity

--11. Limite o resultado anterior, gerando apenas as somas dos valores superiores a 6.068,19.
select sum(unitprice* qty - discount) as 'Soma Preços multiplicado pela quantidade menos desconto de entregas no Brasil', 
shipcountry, shipregion, shipcity, shipaddress
from sales.orders join sales.orderdetails 
on sales.orders.orderid=sales.orderdetails.orderid
where shipcountry= 'Brazil'
group by shipcountry, shipregion, shipcity, shipaddress
having sum(unitprice) > 6.06819
order by shipregion, shipcity

--12. Gere uma lista das das categorias de produtos, descrições dos produtos e a soma de quantidades
--vendidas, limitando os resultados apenas onde a soma das quantidades esteja entre 200 e 660.
--Ordene pela soma das quantidades.
select categoryname as 'categorias de produtos', 
description  as 'descrições dos produtos',
sum(qty) as 'soma de quantidades'
from sales.orderdetails join production.products
on sales.orderdetails.productid=production.products.productid
join production.categories on production.categories.categoryid=production.products.categoryid
group by categoryname, description
having sum(qty) between 200 and 660
order by sum(qty)

--13. Liste os número de pedidos onde ao menos um dos produtos comprados tenha sido fornecido por
--Singapura.
select * from production.suppliers

select orderid as 'numero do pedido', country as 'pais'
from sales.orderdetails join production.products
on sales.orderdetails.productid=production.products.productid
join production.suppliers on production.products.supplierid=production.suppliers.supplierid
where production.suppliers.country= 'singapore'
order by orderid