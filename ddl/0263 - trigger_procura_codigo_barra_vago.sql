CREATE OR REPLACE FUNCTION t_tbi_procura_codigo_barra_vago
RETURNS TRIGGER AS $$(
	codigo_barra TEXT)
DECLARE
	i record;
BEGIN
	codigo_barra = 0;
	
	FOR i IN(SELECT ID, codigo_barra FROM produtos
			WHERE codigo_barra < 10000
			ORDER BY codigo_barra
	LOOP
	DO BEGIN 
		NEW.codigo_barra = codigo_barra + 1;
		
		IF (i.codigo_barra <>: NEW.codigo_barra) THEN
		BEGIN 
			--SUSPEND;
			EXIT;
		END IF;
		RETURN NEW;
	END LOOP;
	
	EXCEPTION WHEN i.codigo_barra := 10000 THEN 
	 RAISE NOTICE "Todos os valores vagos em codigo_barra foram preenchidos
	 							, favor excluir codigos sem utilização"
END;		

CREATE TRIGGER t_tbi_procura_codigo_barra_vago
BEFORE INSERT ON produtos
FOR EACH ROW
			 
EXECUTE FUNCTION t_tbi_procura_codigo_barra_vago();
						
