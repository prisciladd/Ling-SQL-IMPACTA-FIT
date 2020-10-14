-- Matheus Marques Silva - 1901198 Representante
-- Bruno Assunção - 1902440
-- Samuel Miranda Braga - 1900885
-- Priscila da Dalt - 1901843
-- David sumiu não está mais no grupo

SELECT E.FIRSTNAME + ' ' + E.LASTNAME AS 'Nome completo do vendedor'
	 , COUNT(*) AS 'Quantidade de pedidos'
FROM SALES.Orders AS O INNER JOIN HR.Employees AS E ON O.empid = E.empid
					   INNER JOIN Sales.OrderDetails AS OD ON OD.orderid = O.orderid
					   INNER JOIN SALES.Shippers AS S ON S.shipperid = O.shipperid
WHERE OD.qty > 15 
	  AND (OD.UNITPRICE * (1 - OD.discount)) < 64.92
	  AND (S.phone LIKE '(415%' OR S.phone LIKE '(503%')
	  AND O.freight > 140.50 AND O.freight < 350.64
GROUP BY E.firstname, E.lastname
HAVING COUNT(*) > 3 OR COUNT(*) <= 6
ORDER BY COUNT(*) ASC
