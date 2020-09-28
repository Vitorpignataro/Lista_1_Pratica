--José Vitor Alves Pignataro
--00096150
--Sexto Semestre

--Aula 3 pratica 2 EXERCICIO 13
--criamos a view para acessar pegar os dados da venda, usei groupby para tirar valores repetidos
create or alter view VENDA_INFO as
select
	a.id_venda,
	a.dt_venda,
	a.total_liquido,
	c.numero_nota,
	c.dt_emissao
from venda a
join item_venda b on a.id_venda = b.id_venda
left join nota_fiscal c on c.id_venda = b.id_venda 
group by 
	a.id_venda,
	a.dt_venda,
	a.total_liquido,
	c.numero_nota,
	c.dt_emissao