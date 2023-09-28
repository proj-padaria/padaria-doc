-- Inserir o cliente consumidor na tabela (Todos os exemplos encontrados fala sobre ter uma tabela clientes_consumidores)
    INSERT INTO pessoas (id, cidade_id, nome, logradouro, logradouro_numero, bairro, cep, data_cadastro)
	VALUES (1, 2, 'Consumidor', 'N/D', 'S/N', 'N/D', '00000-000', CURRENT_DATE);
	
	INSERT INTO clientes (id, pessoa_id, renda_mensal, limite_de_credito, dia_vencimento_fiado)
    VALUES (1, 1, 0.00, 0.00, 1);
    
    
UPDATE empresa SET db_versao = 'B0632';