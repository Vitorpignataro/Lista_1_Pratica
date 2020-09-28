--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

--Aula 1 pratica 1 EXERCICIO 4
--Seleciona todos os dados da venda e traz o numero da nota fiscal e a data que foi emitida
select 
	a.*,
	b.numero_nota as Notas_Fiscal, 
	b.dt_emissao as Data_Emissão
from venda a 
join
	nota_fiscal b on b.id_venda = a.id_venda