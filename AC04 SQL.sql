SELECT E.FIRSTNAME + ' ' + E.LASTNAME AS 'Nome completo do vendedor'
	 , COUNT(*) AS 'Quantidade de pedidos',
	 left ('phone',3) as 'DDD do telefone do entregador'
FROM SALES.Orders AS O INNER JOIN HR.Employees AS E ON O.empid = E.empid
					   INNER JOIN Sales.OrderDetails AS OD ON OD.orderid = O.orderid
					   join Sales.shippers as SS on ss.shipperid = o.shipperid
WHERE OD.qty > 15 and unitprice < 64.92 and discount > 0 
GROUP BY E.firstname, E.lastname



select * from Sales.shippers 