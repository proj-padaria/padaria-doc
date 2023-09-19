CREATE OR REPLACE FUNCTION f_reajuste_preco_venda(percentual_reajuste decimal(8,2))
RETURNS INT AS $$
DECLARE
	r record;
    quantidade_de_registros  integer;
BEGIN
	quantidade_de_registros = 0 ;
	FOR r in (SELECT ID, preco_venda FROM produtos  ) 
	LOOP
		UPDATE produtos SET preco_venda = r.preco_venda * (percentual_reajuste/100 + 1)
		WHERE id = r.id;
        quantidade_de_registros = quantidade_de_registros + 1;
	END LOOP;
    RETURN quantidade_de_registros;
END;
$$ LANGUAGE plpgsql;

select f_reajuste_preco_venda(10);

UPDATE empresa SET db_versao = "B0265";