CREATE OR REPLACE FUNCTION f_cliente_maior_valor_compra(data_inicial DATE, data_final DATE)
RETURNS TABLE(cliente_id INT, nome VARCHAR(40), valor_total_gasto NUMERIC(8,3)) 
AS $$
BEGIN
	RETURN QUERY
		SELECT v.cliente_id, p.nome, SUM(v.valor_total) AS valor_total_gasto
        FROM vendas v
           INNER JOIN pessoas p 
           		ON v.cliente_id = p.id 
        WHERE data BETWEEN data_inicial AND data_final  -- Tem que ser parâmetros
        GROUP BY p.nome, v.cliente_id
        ORDER BY valor_total_gasto DESC;
END;
$$ LANGUAGE plpgsql;