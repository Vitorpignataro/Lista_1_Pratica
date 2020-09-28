--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

--Exercicio 21 - Aula 4 
CREATE OR ALTER PROCEDURE sp_Calculo_LucroDiario(
	@dataDaVenda DATE
)
as
Select 
--Eu peguei a quantidade de produtos em item_venda e o valor o qual foi vendido, relacionei que cada um desses produtos+
--era uma vez o valor que foi ventido então ficava qtd de produto vezes o valor que foi vendido o produto menos a+
--qtd de produtos vezes o valor de compra com fornecedor.
 SUM((a.qtd_produto * a.valor_vendido) - (a.qtd_produto * c.valor_compraFornecedor)) as Total_Lucro_DoDIA
from item_venda a
	left join venda b on a.id_venda = b.id_venda
	left join produto c on c.id_produto = a.id_produto
where b.dt_venda = convert(VARCHAR,@dataDaVenda,102)--aceita somente string e converte para tipo date no formato 102, ex: '0000-00-00'
 

