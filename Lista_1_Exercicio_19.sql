--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

--Exercicio 19 - Aula 4 

CREATE  or alter PROCEDURE sp_Quantidade_Estoque(
 @Valor_Base INT
)
as
declare @Valor_10 INT;
Select @Valor_10 = @Valor_Base

--realiza o select dos itens pedidos pegando a condição se o estoque do item for menor que o valor passado.
select 
 a.id_produto,
 a.nome_produto,
 a.qtd_estoque,
 c.nome_fornecedor
from produto a
 join fornecedor_produto b on a.id_produto = b.id_produto
 join fornecedor c on c.id_fornecedor = b.id_fornecedor
 where a.qtd_estoque < @Valor_10

declare @Valor_9 INT;
Select @Valor_9 = Min(qtd_estoque) from produto 
--com a var que declarei acima eu pego o minimo do estoque e passo para ele, abaixo eu verifico a quantidade+
--informada pelo usuário, se esse falor informado for menor que o valor minimo de estoque então não há produtos+
--abaixo do estoque aceitável que foi passado
 IF @Valor_Base <= @Valor_9
  BEGIN
     select isnull(
--subquery de verificação
 (select produto.qtd_estoque
 from produto 
 where produto.qtd_estoque < @Valor_Base)
--mostra na tela se há valores abaixo deste estoque
, NULL) as 'Não há produtos com estoque abaixo do valor informado'
  END

