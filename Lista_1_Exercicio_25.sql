--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

-- Exercicio 25 Aula 5

CREATE OR ALTER FUNCTION fc_produtoImposto(
    @ValorProd FLOAT,
	@Porcentagem FLOAT
)
--Aqui declaramos o tipo de retorno
RETURNS VARCHAR(200)
BEGIN
    DECLARE @resultado float
	select @resultado = ((@Porcentagem * @ValorProd) / 100 )  
	--aqui imprime nossa saida convertendo os valores floats em varchar
    RETURN 'O imposto de'+ CAST(@Porcentagem AS VARCHAR(50))+ '% aplicado no produto com o valor ' + convert(VARCHAR,@ValorProd,128) + ' é: ' + convert(VARCHAR,@resultado,128)
END
GO
