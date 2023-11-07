CREATE OR REPLACE FUNCTION f_venda_media_bairro(data_inicial date, data_final date)
RETURNS TABLE (nome_bairro varchar(30) , valor_medio_por_bairro numeric(8,3))
AS $$
DECLARE
	quantidade_dias int;
BEGIN	
	quantidade_dias = data_final - data_inicial;
	
RETURN QUERY
	SELECT
CASE
WHEN pe.nome = 'Consumidor' THEN 'N/D'
ELSE bairro
END AS bairro,
 ROUND(SUM(v.valor_total/quantidade_dias),2)AS valor_medio_por_bairro
	FROM pessoas pe
		INNER JOIN clientes cl
			ON pe.id = cl.pessoa_id
	    INNER JOIN vendas v
	   		ON cl.id = v.cliente_id	
		WHERE v.data BETWEEN data_inicial AND data_final
	 	GROUP BY pe.nome,pe.bairro;
END;
$$ LANGUAGE plpgsql





