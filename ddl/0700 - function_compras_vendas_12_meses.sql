CREATE OR REPLACE FUNCTION f_compras_vendas_12_meses() 
	RETURNS TABLE(mes_ano char(7),
				  venda 	numeric(14,2),
				  compra 	numeric(14,2),
				  saldo 	numeric(14,2)) AS 
$$		
DECLARE
	data_para_soma		DATE;
	mes_para_soma       INT;
	ano_para_soma		INT;
	i					INT;
	
BEGIN
	SELECT CURRENT_DATE - 365 INTO data_para_soma;
	
	FOR  i in 1..12 
	LOOP
		mes_para_soma = EXTRACT(MONTH FROM data_para_soma);
		ano_para_soma = EXTRACT(YEAR FROM data_para_soma);
		
		
	SELECT INTO venda COALESCE(SUM(v.valor_total),0)
	 	FROM vendas v
	 	WHERE EXTRACT(MONTH FROM data) = mes_para_soma AND  --TODO: COLOCAR DATA_FIM NAS VENDAS
		     EXTRACT(YEAR FROM data)  = ano_para_soma;
			  
		SELECT INTO compra COALESCE(SUM(c.valor_total_recebido),0)  
	 	FROM compras c
	 	WHERE EXTRACT(MONTH FROM c.data_recebimento) = mes_para_soma AND
		      EXTRACT(YEAR FROM c.data_recebimento)  = ano_para_soma;	--TODO: TROCAR DATA COMPRA POR DATA RECEBIMENTO
			  
		saldo = venda - compra;	

		mes_ano = mes_para_soma || '/' || ano_para_soma;
			  
		RETURN NEXT;
		data_para_soma = data_para_soma + interval '1 months';
	
	END LOOP;
	
END;
$$
LANGUAGE plpgsql;

UPDATE empresa SET db_versao = 'B0700';