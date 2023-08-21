CREATE OR REPLACE FUNCTION f_reajuste_preco_venda(percentual_reajuste numeric(8,2));
AS
$$
DECLARE
	preco_reajustado numeric(14,2);
	produto_id int;
BEGIN
	--tenho que fazer um loop para cada produto
		SELECT id, preco_venda -- tenho que colocar o valor dessas colunas em um record
		FROM produtos 
		
		preco_reajustado := preco_venda *(percentual_reajuste/100 + 1);
		
		UPDATE produtos SET preco_venda = preco_reajustado 
		WHERE id = produto_id;
	--end loop;
$$ LANGUAGE plpgsql;

EXECUTE FUNCTION f_reajuste_preco_venda();