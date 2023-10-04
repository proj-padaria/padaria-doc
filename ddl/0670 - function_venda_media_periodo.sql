CREATE OR REPLACE FUNCTION f_venda_media_periodo(data_inicial date, data_final date)
RETURNS TABLE (vendas_id int , vendas_itens_id int ,	vendas_itens_produto_id int ,
					 data_venda date, quantidade_por_periodo numeric(8,3)) AS $$
DECLARE
	quantidade_dias int;
BEGIN	
	quantidade_dias = data_final - data_inicial;

	IF data_final IS NOT NULL THEN
	RETURN QUERY
	SELECT v.id, vi.id, vi.produto_id,v.data,
	SUM (vi.quantidade/quantidade_dias) as quantidade_por_periodo
	FROM vendas v
	INNER JOIN vendas_itens vi
		ON v.id = vi.venda_id
	INNER JOIN produtos p
		ON vi.produto_id = p.id
WHERE data BETWEEN data_inicial AND data_final
GROUP BY v.id, vi.id, vi.produto_id, v.data
ORDER BY vi.produto_id;
	ELSE
		RETURN QUERY
	SELECT v.id, vi.id, vi.produto_id,v.data,
	SUM (vi.quantidade) as quantidade_por_periodo
	FROM vendas v
	INNER JOIN vendas_itens vi
		ON v.id = vi.venda_id
	INNER JOIN produtos p
		ON vi.produto_id = p.id
WHERE data = data_inicial 
GROUP BY v.id, vi.id, vi.produto_id, v.data
ORDER BY vi.produto_id;
	END IF;
END;
$$ LANGUAGE plpgsql;



