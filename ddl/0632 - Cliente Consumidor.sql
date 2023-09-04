CREATE OR REPLACE FUNCTION f_inserir_cliente_consumidor() 
RETURNS VOID AS $$
BEGIN
    -- Inserir o cliente consumidor na tabela (Todos os exemplos encontrados fala sobre ter uma tabela clientes_consumidores)
    INSERT INTO pessoas (id, cidade_id, nome, logradouro, logradouro_numero, bairro, cep, data_cadastro)
	VALUES (1, 2, 'Consumidor', 'N/D', 'S/N', 'N/D', '00000-000', CURRENT_DATE);
	
	INSERT INTO clientes (id, renda_mensal, limite_de_credito, dia_vencimento_fiado)
    VALUES (1, 0.00, 0.00, 1);
    
    -- Commit da transação
    COMMIT;
    
    -- Retornar uma mensagem de sucesso
    RAISE NOTICE 'Cliente consumidor inserido com sucesso!';
END;
$$ LANGUAGE plpgsql;
