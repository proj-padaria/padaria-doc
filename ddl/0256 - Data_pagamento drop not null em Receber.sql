ALTER TABLE receber ALTER COLUMN data_pagamento DROP NOT NULL;

UPDATE empresa SET db_versao = 'B0256';
