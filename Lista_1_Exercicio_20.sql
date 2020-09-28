--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

--Exercicio 20 - Aula 4 
-- Uma procedure que verifica as vendas de tal funcionario idenficando ele pelo ID, trazendo a data da venda,
-- qtd de produtos que houve a venda, o valor da venda e o nome do produto.
CREATE or alter PROCEDURE sp_Vendas_Funcionario(
	@FuncionarioID INT
)
as

select distinct
 f.nome_pessoa,
 c.dt_venda,
 d.qtd_produto,
 d.valor_vendido,
 e.nome_produto
from funcionario a
 join pedido b on b.id_funcionario = a. id_funcionario
 join venda c on c.id_pedido = b.id_pedido
 join item_venda d on c.id_venda = d.id_venda
 join produto e on e.id_produto = d.id_produto
 join pessoa f on f.id_pessoa = a.id_pessoa
 where a.id_funcionario = @FuncionarioID

