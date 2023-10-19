CREATE OR REPLACE FUNCTION f_tau_vendas_encerrar()
RETURNS TRIGGER AS $$
DECLARE
	vencimento DATE;
	dia_fiado INT;
	r record;
	dia_vencimento INT;
	mes_vencimento INT;
	ano_vencimento INT;
	-- efetuar encerramento da venda se data_fim passar de null para uma data válida. inserir receber. atualizar estoque
BEGIN
    IF NEW.data_fim IS NOT NULL AND OLD.data_fim IS NULL THEN
		-- Verificar fiado
		IF NEW.fiado > 0 THEN
			SELECT INTO dia_fiado dia_vencimento_fiado
			FROM clientes
			WHERE pessoa_id = NEW.cliente_id;
			-- o vencimento = data com o dia_fiado
			-- ATENÇÃO: Se o dia de hoje for >= o dia_fiado, então o mês do vencimento é o mês seguinte
			-- Gerar o valor da variável vencimento
			
			SELECT EXTRACT(DAY FROM CURRENT_DATE) INTO dia_vencimento;
			SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO mes_vencimento;
			SELECT EXTRACT(YEAR FROM CURRENT_DATE) INTO ano_vencimento;
			
			IF dia_vencimento >= dia_fiado THEN
				mes_vencimento = mes_vencimento + 1;
				IF mes_vencimento = 13 THEN
					mes_vencimento = 1;
					ano_vencimento = ano_vencimento + 1;
				END IF;
				
			END IF;
			-- Ajustar a data do vencimento com os valores encontrados de dia_fiado/mes_atual/ano_atual
			vencimento = make_to_date(ano_vencimento, mes_vencimento, dia_fiado);
			
        	INSERT INTO receber (venda_id, cliente_id, valor, data_vencimento)
				VALUES (NEW.id, NEW.cliente_id, NEW.fiado, vencimento);
		END IF;
		
		-- Atualizar estoque para cada produto das linhas de vendas itens
				-- Tenho que rodar todas as linhas de vendas itens desta venda
		FOR r IN (SELECT produto_id, quantidade 
			  FROM vendas_itens
			  WHERE venda_id = NEW.id)
		LOOP
        	UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque - r.quantidade
				WHERE id = r.produto_id;
		END LOOP;
	
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tau_vendas_encerrar
AFTER UPDATE ON vendas
FOR EACH ROW
EXECUTE FUNCTION f_tau_vendas_encerrar();

UPDATE empresa SET db_versao = 'B0262';