--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

-- Exercicio 24 aula 5

CREATE OR ALTER FUNCTION fc_VendasCliente(
   @id_cliente INT
)
RETURNS VARCHAR(300)
BEGIN
	declare @resultado float
		--atribuição ao resultado, aqui ele faz o calculo do total bruto da venda de determinado cliente.
		select @resultado = SUM(c.total_bruto)
		from cliente a
		inner join pedido b on a.id_cliente = b.id_cliente
		inner join  venda c on c.id_pedido = b.id_pedido
		inner join pessoa d on d.id_pessoa = a.id_pessoa
		where a.id_cliente = @id_cliente
		--declaro uma variavle para pegar o nome desse cliente
		DECLARE @nome_cliente VARCHAR(100)
		-- select reponsável por trazer o nome
		select @nome_cliente = b.nome_pessoa from cliente a inner join pessoa b on a.id_pessoa = b.id_pessoa
		--retorno da minha função
    RETURN 'O cliente ' + @nome_cliente + ' tem o valor total de todas as vendas já feitas de: ' +  CAST(@resultado AS VARCHAR(50))
END
GO
