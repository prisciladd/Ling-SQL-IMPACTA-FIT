--1) Crie a view vwVeiculo que traga todas as descrições dos veículos, com seus respectivos
--modelos e nomes dos fabricantes.
create view vwVeiculo
as
select v.descricao as 'Veiculo', f.nome as 'Fabricante', m.descricao as 'Modelo' 
from veiculo as v
join modelo as m on m.idmodelo= v.idmodelo
join fabricante as f on v.idfabricante=f.idfabricante

--2) Utilizando a view, Contabilize pelo o Fabricante , a quantidade de Veiculos produzidos.
select count(veiculo) --melhorar colocar count(*) para não pular null
as 'Quantidade de Veículos', fabricante 
from vwveiculo
group by fabricante

select * from vwveiculo order by fabricante

--3) Utilizando a view, Contabilize pelo fabricante e veiculo, a quantidade de modelos
--produzidos.
select count(modelo) as 'Modelos de Veículos', fabricante, veiculo 
from vwveiculo
group by fabricante, veiculo


--4) Crie uma função onde possamos passar qualquer data e nos retorne o dia da semana
--(2a.feira, 3a.feira, ...).

create function DiaDaSemana (@data date) --não é char é date
returns varchar (20)

as

begin

	declare @semana varchar(20)

	select @semana =	case datepart(week, @data)  
						when 1 then 'domingo'
						when 2 then 'segunda'
						when 3 then 'terça'
						when 4 then 'quarta'
						when 5 then 'quinta'
						when 6 then 'sexta'
						when 7 then 'sabado'
						end 
	
	return @semana
end as 'dia da semana'--case antes do datepart

select * from sys.functions

sp_helptext diadasemana

select diadasemana ('20200521')

--Com o modelo adicionado de Cliente, Vendas2013, Vendas2014 e Vendas2015:

--5) Crie uma função onde passando o sexo, retorne todas as informações dos clientes
--respectivos.

create function generocliente(@genero char(1))

returns table

as

return(
	
	select * 
	from cliente 
	where genero= @genero
 
)

--6) Com a função criada, faça um SELECT em Cliente, mostrando o dia da semana em que
--cada cliente nasceu.

select 
datepart(weekday,datanasc) as 'dia da semana no nascimento'--chama função e passa data na coluna
from generocliente('m')

--7) Com a mesma função, agrupe pelo dia da semana e veja quantos clientes nasceram em
--cada dia. Ordene pela quantidade de forma descendente.

select count(datepart(day,datanasc)) --chamar função
as 'quantos clientes nasceram em cada dia', datanasc 
from generocliente('m') --tabela cliente
group by datanasc --tem que por função pois tem count
order by datanasc desc --count

--8) Usando a função, retorne somente os clientes que nasceram no sábado ou domingo.
select count(datepart(day(datanasc))) --função
from generocliente('m') --cliente
where datanasc= 'sabado' or datanasc= 'domingo' --função in sabado,domingo
group by datanasc 
order by datanasc desc
