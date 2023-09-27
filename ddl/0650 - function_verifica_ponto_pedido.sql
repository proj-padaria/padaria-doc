CREATE OR REPLACE FUNCTION f_verifica_ponto_pedido(ponto_pedido_produto int)
RETURNS SETOF produtos 
AS
$$
BEGIN 
	RETURN QUERY SELECT 
				*
			FROM produtos
			WHERE quantidade_em_estoque < ponto_pedido_produto;
		IF NOT FOUND THEN 
			RAISE EXCEPTION 'Não foram encontrados registros com esta consulta!';
		END IF;
		RETURN;
END;
$$
LANGUAGE 'plpgsql'

