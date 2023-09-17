CREATE OR REPLACE FUNCTION f_reajuste_preco_venda(percentual_reajuste decimal(8,2))RETURNS VOID
AS
$$
DECLARE
	r record;
BEGIN
	FOR r in (SELECT ID, preco_venda FROM produtos ) --aqui jogamos cada valor na variavel r do record
	LOOP
		UPDATE produtos SET preco_venda = r.preco_venda *(percentual_reajuste/100 + 1)
		WHERE id = r.id;
	END LOOP;
END;
$$ LANGUAGE plpgsql;



