ALTER TABLE vendas ADD COLUMN data_fim TIMESTAMP;

UPDATE empresa SET db_versao = 'B0255';