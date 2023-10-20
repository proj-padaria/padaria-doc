CREATE OR REPLACE FUNCTION f_venda_media_bairro(data_inicial date, data_final date)
RETURNS TABLE (produto_id int,produto_nome varchar(45), pessoa_bairro varchar(30)
			   , quantidade_media_por_bairro numeric(8,3)) AS $$
DECLARE
	quantidade_dias int;
BEGIN	
	quantidade_dias = data_final - data_inicial;
	
	RETURN QUERY

SELECT p.id, p.nome, pe.bairro,    
	   SUM(vi.quantidade/quantidade_dias) AS quantidade_media_por_bairro
	FROM produtos p     
	   INNER JOIN vendas_itens vi     
	   	ON p.id = vi.produto_id     
	   INNER JOIN vendas v      
	 	ON vi.venda_id = v.id  
	   INNER JOIN clientes cl
	 	ON v.cliente_id = cl.id
	   INNER JOIN pessoas pe
	 	ON cl.id = pe.id
	 WHERE v.data BETWEEN data_inicial AND data_final
	 GROUP BY p.id,p.nome,pe.bairro
	 ORDER BY p.id  ;
	
END;
$$ LANGUAGE plpgsql;
