--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

-- Exercicio 23 aula 5

CREATE OR ALTER FUNCTION fc_Status_Cliente(
   @id_cliente INT
)
RETURNS VARCHAR(300)
BEGIN
	--declaração da variavel auxiliar clietstatus para chamarmos no return
	declare @clientstatus varchar(300)
	declare @resultado float
		--atribuição ao resultado, conta quantas vendas o cliente possui usando o COUNT e armazena em resultado.
		select @resultado = COUNT(c.total_bruto)
		from cliente a
		inner join pedido b on a.id_cliente = b.id_cliente
		inner join  venda c on c.id_pedido = b.id_pedido
		inner join pessoa d on d.id_pessoa = a.id_pessoa
		where a.id_cliente = @id_cliente
		--declaro uma variavel para pegar o nome desse cliente
		DECLARE @nome_cliente VARCHAR(100)
		-- select reponsável por trazer o nome
		select @nome_cliente = b.nome_pessoa from cliente a inner join pessoa b on a.id_pessoa = b.id_pessoa
		
		--condição para definição do status do cliente na empresa
		if(@resultado < 2)
			set @clientstatus = 'O cliente ' + @nome_cliente + ' é um cliente esporádico'
		else if (@resultado >= 2 and @resultado <=10)
			set @clientstatus = 'O cliente ' + @nome_cliente + ' é um cliente recorrente'
		else if(@resultado > 10)
			set @clientstatus = 'O cliente ' + @nome_cliente + ' é um cliente fidelizado'

	RETURN @clientstatus
END
GO
