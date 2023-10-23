CREATE OR REPLACE FUNCTION f_venda_media_bairro(data_inicial date, data_final date)
RETURNS TABLE (produto_nome varchar(45), pessoa_bairro varchar(30)
			   , quantidade_media_por_bairro numeric(8,3)) AS $$
DECLARE
	quantidade_dias int;
BEGIN	
	quantidade_dias = data_final - data_inicial;
	
RETURN QUERY
	SELECT pr.nome,
		CASE
		WHEN pe.nome = 'Consumidor' THEN 'N/D'
		ELSE bairro
		END AS bairro,
 		SUM(vi.quantidade/quantidade_dias) AS quantidade_media_por_bairro
	FROM pessoas pe
		INNER JOIN clientes cl
			ON pe.id = cl.pessoa_id
	    INNER JOIN vendas v
	   		ON cl.id = v.cliente_id	
		INNER JOIN vendas_itens vi
			ON v.id = vi.venda_id
		INNER JOIN produtos pr
			ON vi.produto_id = pr.id	   	
	 	WHERE v.data BETWEEN data_inicial AND data_final
	 	GROUP BY pe.nome,pe.bairro,pr.nome;
END;
$$ LANGUAGE plpgsql




