CREATE OR REPLACE FUNCTION f_procura_produto_balanca_vago
RETURNS INTEGER 
$$
DECLARE
	r record;
	produto_id INTEGER;
BEGIN
	produto_id = 0;
	
	FOR produto_id IN(SELECT ID 
					  FROM produtos
						WHERE ID < 10000
						ORDER BY ID)
	LOOP
	DO BEGIN 
		produto_id = produto_id + 1;
		
		IF (produto_id <>: produto_id) THEN
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
END;		
			 
SELECT * FROM f_procura_produto_balanca_vago();
						
