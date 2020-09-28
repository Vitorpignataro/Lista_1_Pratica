--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

--Exercicio 22 - Aula 4 
--Pega os valores corresposdente das colunas oriundas da tabela nota fiscal como entrada.
CREATE OR ALTER PROCEDURE sp_New_NotaFiscal(
	@ID_VENDA INT,
	@NumeroNOTAFISCAL INT,
	@Data_Emissao DATE
)
as
--realiza a inserção, ele aceita somente um varchar '0000-00-00' e converte para date
INSERT INTO nota_fiscal VALUES(@ID_VENDA, @NumeroNOTAFISCAL, convert(VARCHAR,@Data_Emissao,102))
