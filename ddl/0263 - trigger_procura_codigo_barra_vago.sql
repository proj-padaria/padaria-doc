CREATE OR REPLACE FUNCTION f_procura_produto_balanca_vago()
RETURNS INTEGER AS
$$
DECLARE
	r record;
	produto_id INTEGER;
BEGIN
	produto_id = 0;
	
	FOR r IN(SELECT ID 
			  FROM produtos
			  WHERE ID < 10000
			  ORDER BY ID)
	LOOP
		produto_id = produto_id + 1;
	IF (produto_id <> r.id) THEN
			RETURN produto_id;
	ELSEIF (produto_id > 9999)THEN
	RAISE EXCEPTION 'Todos os valores vagos em codigo_barra foram preenchidos favor excluir codigos sem utilização';
			EXIT;
	END IF;
	END LOOP;
END;		
$$ LANGUAGE plpgsql;

select f_procura_produto_balanca_vago();
					
UPDATE empresa SET db_versao = 'B0263';