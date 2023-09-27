CREATE OR REPLACE FUNCTION f_verifica_ponto_pedido(ponto_pedido_produto int)
RETURNS TABLE (id_produto int, nome_produto varchar(45), quantidade_em_estoque_produto numeric(12,3)) 
AS
$$
BEGIN 
	RETURN QUERY SELECT 
			id,
			nome,
			quantidade_em_estoque
			FROM produtos
			WHERE quantidade_em_estoque < ponto_pedido_produto;
END;
$$
LANGUAGE 'plpgsql'


			