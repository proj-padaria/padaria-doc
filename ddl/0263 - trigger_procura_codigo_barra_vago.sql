CREATE OR REPLACE FUNCTION f_procura_produto_balanca_vago
RETURNS INTEGER 
$$
DECLARE
	id INTEGER;
	produto_id INTEGER;
BEGIN
	produto_id = 0;
	
	FOR id IN(SELECT ID 
					  FROM produtos
						WHERE ID < 10000
						ORDER BY ID)
	LOOP
	DO BEGIN 
		produto_id = produto_id + 1;
		
		IF (produto_id <> id) THEN
		BEGIN 
			RETURN produto_id;
			EXIT;
		END IF;
	END LOOP;
	
	produto_id = produto_id + 1;
	IF produto_id > 9999 THEN
		RAISE EXCEPTION "Todos os valores vagos em codigo_barra foram preenchidos,
	 							favor excluir codigos sem utilização";
	END IF;
	RETURN produto_id;
END;		
			 
SELECT * FROM f_procura_produto_balanca_vago();
						
