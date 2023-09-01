CREATE OR REPLACE FUNCTION f_tau_compras_recebimento()
RETURNS TRIGGER AS $$
DECLARE
      vencimento DATE;
      r RECORD;
      -- Se a data de recebimento antiga for nula e a data de recebimento nova não, então é encerrada a compra
      -- Efetua o recebimento da compra e atualiza o estoque dos itens comprados.
      -- E insere no pagar os valores das faturas.
BEGIN
    IF NEW.data_recebimento IS NOT NULL AND OLD.data_recebimento IS NULL THEN
            -- Atualizar estoque
            for r IN (SELECT produto_id, quantidade_recebida
                          FROM compras_itens
                          WHERE compra_id = NEW.id)
            LOOP
                  -- Atualizar estoque do produto lido            
                  
            UPDATE produtos SET quantidade_em_estoque = quantidade_em_estoque + r.quantidade_recebida
                  WHERE id = produto_id;
            END LOOP
                                                  
            -- Inserir os pagar da compra
            -- 1 - Buscar os dias de pagamento dessa compra
            -- 2 - Inserir um pagar para cada dia de pagamento (tem que calcular o valor de cada parcela
            for r IN (SELECT dias_do_vencimento, percentual_pagamento
                          FROM planos_pagamento_dias
                          WHERE plano_pagamento_id = NEW.plano_pagamento_id
                          ORDER BY dias_do_vencimento
           LOOP 
			valor_da_parcela = NEW.valor_total_comprado * r.percentual_pagamento / 100 ;
			data_do_vencimento = NEW.data_faturamento + dias_do_vencimento;
			-- adicionar pagar para o NEW.fornecedor_id para vencimento hoje + dias_do_vencimento com o valor da parcela.
			INSERT INTO pagar (fornecedor_id, compra_id, valor, data_vencimento)
				  VALUES (NEW.fornecedor_id, NEW.compra_id, valor_da_parcela, data_do_vencimento);
		END LOOP
            
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tau_compras
AFTER UPDATE ON pagar
FOR EACH ROW
EXECUTE FUNCTION f_tau_compras_recebimento();