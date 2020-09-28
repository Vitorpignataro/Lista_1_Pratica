--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

--Aula 3 pratica 1 EXERCICIO 12
--criamos a view para acessar o nome do produto
create or alter view Produto_vendidos_DT2 as
select 
	c.nome_produto,
	a.dt_venda
from venda a
   join item_venda b on a.id_venda = b.id_venda
   join produto c on c.id_produto = b.id_produto
   

