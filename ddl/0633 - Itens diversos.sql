CREATE OR REPLACE FUNCTION inserir_item_diverso()
RETURNS VOID AS $$
BEGIN
    -- Inserir o item diverso na tabela (Todos os exemplos encontrados fala sobre ter uma tabela itens_diversos)
    INSERT INTO produtos (id, departamento_id, nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra,
						 ponto_pedido)
    VALUES (1, 1, 'Diversos', 'Diversos', 0.00, 0, 'N/D', 0);
    
    -- Commit da transação
    COMMIT;
    
    -- Retornar uma mensagem de sucesso
    RAISE NOTICE 'Item diverso inserido com sucesso!';
END;
$$ LANGUAGE plpgsql;

UPDATE empresa SET db_versao = "B0633";