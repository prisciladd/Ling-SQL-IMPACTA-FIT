--exercício 1

create table Cor
( 
idCor tinyint identity,
descricao varchar(50),
constraint pkcor primary key (idCor)
);

create table Fornecedor
(
idFornecedor tinyint identity,
nome varchar(50),
telefone varchar(9), --prof char(9) não permitindo o - entre numeros, se quiser traço - (10)
contato varchar (10),
constraint pkfornecedor primary key (idFornecedor)
);

create table Produto
(idProduto tinyint identity,
codigo char(6),
nome varchar(50),
estoque smallint,
descontinuado bit, --pode usar tinyint tamanho =
idFornecedor tinyint, -- nome pode por diferente do nome da outra tabela
idCor tinyint,
constraint pkproduto primary key (idProduto),
-- constraint uqProduto_nome unique (nome)
constraint fkfornecedor foreign key (idFornecedor) references Fornecedor(idFornecedor),
constraint fkcor foreign key (idCor) references Cor(idCor)
)

--exercicio 2

insert into cor (descricao) values ('branco'), ('preto'), ('azul'), ('vermelho'), ('amarelo')

select * from cor

insert into fornecedor (nome, telefone, contato)--pode emitir colunas
values ('Sony', '8498-8732', 'Allan'),
('Motorola', '7987-9900', 'Cristina'),
('Asus', '5476-1120', 'Felipe'),
('Nokia', '6755-5656', 'Fábio')

select * from fornecedor

insert into produto (codigo, nome, estoque, descontinuado, idfornecedor, idcor) 
values ('XT890A', 'Asus Zenfone', 5,0,3,4),
('RQ765B', 'Nokia', 21,1,4,4),
('WD528B', 'Moto X', 3,0,2,5), 
('TF897A', 'Xperia', 7,1,1,1),
('RF212B', 'Moto Maxx', 2,0,2,1)

select * from produto

--exercicio 3
insert into produto (codigo, nome, estoque, descontinuado, idfornecedor, idcor) 
values 
('XT890A', 'Asus Zenfone', 1,0,3,1), ('XT890A', 'Asus Zenfone', 2,0,3,2),
('XT890A', 'Asus Zenfone', 3,0,3,3), ('XT890A', 'Asus Zenfone', 4,0,3,4),
('XT890A', 'Asus Zenfone', 5,0,3,5), ('XT890A', 'Asus Zenfone', 6,0,3,5),
('XT890A', 'Asus Zenfone', 7,0,3,4), ('XT890A', 'Asus Zenfone', 8,0,3,3),
('XT890A', 'Asus Zenfone', 9,0,3,2), ('XT890A', 'Asus Zenfone', 10,0,3,1)

select * from produto

--exercicio 4
--Traga o código do produto, nome do produto, nome do fornecedor, estoque para todos
--os produtos onde forem encontrado relação. Coloque nomes de colunas apropriados o
--correto entendimento da informação.

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor'
from produto join fornecedor
on produto.idfornecedor= fornecedor.idfornecedor

--exercicio 5. Baseado na Query 4, retorne as mesmas informações para produtos descontinuados.

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor'
from produto join fornecedor
on produto.descontinuado= 1

--exercicio 6. Baseado na Query 4, retorne as mesmas informações para produtos com estoque entre
--7 e 21 unidades, que ainda tenham produção.

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor'
from produto join fornecedor
on produto.estoque between 7 and 21
where produto.descontinuado= 0

--exercicio 7. Adicione a Query 4 o nome da cor de cada produto.

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor',descricao
from produto join fornecedor
on produto.idfornecedor= fornecedor.idfornecedor
join cor on cor.idcor=produto.idcor


--exercicio 8. Baseado na Query 7, traga apenas produtos de cores BRANCO, PRETO ou VERMELHO
--(utilize a coluna Descrição e não idCor)

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor',descricao
from produto join fornecedor
on produto.idfornecedor= fornecedor.idfornecedor
join cor on cor.descricao in ('BRANCO', 'PRETO' ,'VERMELHO')

--exercicio 9. traga qualquer produtos onde a cor não seja AZUL (utilize a coluna Descrição e não
--idCor)

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor',descricao
from produto join fornecedor
on produto.idfornecedor= fornecedor.idfornecedor
join cor on cor.descricao not like 'azul'

--exercicio 10. Baseado na Query 7, adicione a coluna contato do fornecedor e retorne apenas
--contatos que iniciem pela letra F.

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor',descricao,fornecedor.contato
from produto join fornecedor
on  fornecedor.contato like 'F%'
join cor on cor.idcor=produto.idcor


--exercicio 11. Baseado na Query 10, adicione a coluna telefone do fornecedor e retorne apenas
--contatos que terminem com dígito 0.

select produto.codigo,produto.nome as 'Nome do Produto',
produto.estoque,fornecedor.nome as 'Nome do Fornecedor',
descricao,fornecedor.contato,fornecedor.telefone
from produto join fornecedor
on  fornecedor.telefone like '%0'
join cor on cor.idcor=produto.idcor

select telefone from fornecedor