use temp
select * from pringrediente

create table pringrediente --prof: ptingrediente
(
idpting			int --smallint
idproduto		tinyint identity(250,3) --smallint
idmetrica		int --smallint
qtdproduto		tinyint check (<=250) -- check n�o era obrigat�rio exc n�o pedia

constraint pkproduto primary key (idproduto) --idproduto,idpting chave composta
)
constraint fkidpting foreign key (idprato) references prato(idprato) --foreign key (idpting)

)