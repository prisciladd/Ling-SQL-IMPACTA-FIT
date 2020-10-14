--exercício 1
--Retornar os apelidos número do pedido (orderid), data do pedido (orderdate), nome do contato
--(contactname) e o país (country).

select orderid as 'número do pedido',orderdate as 'data do pedido',contactname as 'nome do contato',country as 'país' from sales.orders
join sales.customers on sales.orders.custid=sales.customers.custid

--exercício 2
--Retornar os apelidos data do pedido (orderdate), nome do contato (contactname), nome completo
--do empregado (firstname/lastname) e país do empregado (country), onde o país do empregado
--seja Inglaterra.

select orderdate as 'data do pedido', 
contactname as 'nome do contato',
firstname+ ' '+lastname as 'nome completo do empregado', 
hr.employees.country as 'país' 
from sales.orders 
join sales.customers on sales.orders.custid=sales.customers.custid
join hr.employees on hr.employees.country='Inglaterra'

select country from hr.employees

--exercicio 3
--Retornar os apelidos número do pedido (orderid), data do pedido (orderdate), nome do contato do
--cliente (contactname), nome completo do empregado (firstname/lastname) e país do cliente
--(country), onde o país do cliente seja Brasil, ordernado pela data do pedido mais recente.

select orderid as 'número do pedido',
orderdate as 'data do pedido',
contactname as 'nome do contato do cliente',
firstname+ ' '+lastname as 'nome completo do empregado', 
sales.customers.country as 'país do cliente'
from sales.orders 
join sales.customers on sales.customers.country='Brazil' 
join hr.employees on hr.employees.empid= sales.orders.empid
order by sales.orders.orderdate desc 

select country from sales.customers

--exercicio 4
--Retornar os apelidos número do pedido (orderid), data do pedido (orderdate), nome do contato
--(contactname), nome completo do empregado (firstname/lastname), país do empregado (country)
--e nome da empresa de entrega, onde o país do empregado seja Estados Unidos e a empresa de
--entrega seja Shipper ETYNR ou Shipper GVSUA. Ordene pelo número do pedido.

select orderid as 'número do pedido',
orderdate as 'data do pedido',
contactname as 'nome do contato',
firstname+ ' '+lastname as 'nome completo do empregado', 
hr.employees.country as 'país do empregado',
sales.shippers.companyname as 'nome da empresa de entrega'
from sales.orders
join sales.customers on sales.orders.custid=sales.customers.custid
join hr.employees on hr.employees.country='USA'
join sales.shippers on sales.shippers.companyname='shipper ETYNR' OR sales.shippers.companyname='shipper GVSUA' 
order by sales.orders.orderid --prof: where hr.employees.country='USA', no join somente fk com pk

select companyname from sales.shippers

--Detalhes de Pedidos (Sales.OrderDetails)
--Produtos (Production.Products)
--Fornecedores (Production.Suppliers) 
--Categorias (Production.Categories)

--exercício 5
--Retorne todas informações de nome do produto e o nome da categoria, onde esta seja Beverages e
--o preço do produto (unitprice) seja menor que 30, ordenado pelo preço de forma descendente.

select productname,categoryname
from production.categories 
join production.products on production.products.unitprice < 30 and production.categories.categoryname= 'Beverages' 
order by unitprice desc

select unitprice,productname from production.products order by unitprice

--exercício 6
--Retorne os apelidos, nome do produto (productname), nome da empresa de entrega
--(companyname) e a quantidade do produto (qty), quando essa ultrapassar 100 unidades. Ordene
--pelo nome do produto ascendente e quantidade de forma descendente.

select productname as 'nome do produto',
companyname as 'nome da empresa de entrega',
qty as 'quantidade do produto'
from production.products
join sales.orderdetails on sales.orderdetails.productid = production.products.productid 
join sales.orders on sales.orderdetails.orderid = sales.orders.orderid
join sales.shippers on qty>100
order by productname,
qty desc

--exercicio 7
--Retorne os apelidos, nome do contato do cliente (contactname), nome do produto (productname),
--quantidade do produto (qty), data do pedido (orderdate) e cidade do fornecedor (city), onde a
--data do pedido seja todo o mês de julho de 2006, a quantidade de produtos seja maior ou igual a
--20 e menor que 60, o nome do produto inicie por Product A ou Product G, o nome da cidade do
--fornecedor seja Stockholm, Sydney, Sandvika ou Ravenna. Ordene pelo número do empregado
--(empid) de forma descendente


select sales.customers.contactname as 'nome do contato do cliente',
productname as 'nome do produto',
production.suppliers.city as 'cidade do fornecedor',
qty as 'quantidade do produto',
orderdate as 'data do pedido' 
from sales.orders
join production.products on productname like 'product A %' or production.products.productname like 'product G %' --product A% or tabela like product G%
join sales.orderdetails on qty >=20 and qty < 60 
join sales.customers on orderdate between '20060701' and '20060731'
join production.suppliers on production.suppliers.city in ('Stockholm', 'Sydney', 'Sandvika', 'Ravenna')
join hr.employees on sales.orders.empid=hr.employees.empid
order by hr.employees.empid desc