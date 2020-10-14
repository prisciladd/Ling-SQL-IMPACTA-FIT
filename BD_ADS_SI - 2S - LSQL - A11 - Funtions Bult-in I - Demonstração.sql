-----------------------------------------------------------------------------------------------------
-- DEMONSTRA��O FUNCTIONS BUILT-IN I 
-----------------------------------------------------------------------------------------------------

-- SUBSTRING
select substring('Sistemas de Informa��o', 13, 10) as Extrai

declare @texto as varchar(30) = 'Covid-19'
select substring(@texto, 1, 5), substring(@texto, 7, 2) as PartCity


-- LEFT / RIGHT
select	Cidade
		, left(cidade, 3) as Left3Cidade
		, right(cidade, 3) as Right3Cidade
		, substring(cidade, 1, 5) as Subst5Cidade 
from	Fabricante

-- UPPER / LOWER
select Cidade, lower(cidade) as LowerCidade, upper(cidade) as UpperCidade from Fabricante

-- RTRIM e LTRIM
select	'       Sistemas    de    Informa��o      ' as Texto_Original
		, rtrim('       Sistemas    de    Informa��o      ') as Retira_Espacos_Direita
		, ltrim('       Sistemas    de    Informa��o      ') as Retira_Espacos_Esquerda
		, rtrim(ltrim('       Sistemas    de    Informa��o      ')) as Retira_Espacos_Esquerda




-- SPACE, REPLICATE, REVERSE
select	idFabricante , Cidade, UF, Contato
		, cidade + space(5) + UF as ColunaComSpace
		, replicate(idFabricante, 9) as ColunaComReplicate
		, reverse(contato) as ColunaComReverse
from	Fabricante


-- CHARINDEX e LEN
select	contato
		, charindex(' ', contato) as [Posi��o do Espa�o] 
		, charindex('H', contato) as [Posi��o do H] 
		, len(contato) as [N�mero de Caractere]
from	Fabricante




-- CASE (1a. e 2a. forma)
select	UF
		, case UF	
				when 'SP' then 'Regi�o Sudeste'
				when 'RJ' then 'Regi�o Sudeste'
				when 'ES' then 'Regi�o Sudeste'
				when 'MG' then 'Regi�o Sudeste'
				when 'SC' then 'Regi�o Sul'
				when 'RS' then 'Regi�o Sul'
				when 'PR' then 'Regi�o Sul'
				else 'Demais Regi�es' 
			end as Case1aForma
		, case 	
				when UF in ('SP', 'RJ', 'ES', 'MG') then 'Regi�o Sudeste'
				when UF in ('SC', 'RS', 'PR') then 'Regi�o Sul'
				else 'Demais Regi�es' 
			end as Case2aForma
from	Fabricante
-----------------------------------------------------------------------------------------------------




