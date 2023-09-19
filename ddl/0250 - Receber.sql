CREATE TABLE receber (
  id SERIAL NOT NULL PRIMARY KEY,
  venda_id INT NOT NULL REFERENCES vendas(id)
							ON UPDATE CASCADE
   							ON DELETE RESTRICT,
  cliente_id INT NOT NULL REFERENCES clientes(pessoa_id)
							ON UPDATE CASCADE
   							ON DELETE RESTRICT,
  valor DECIMAL(14,2) NOT NULL,
  data_vencimento DATE NOT NULL,
  data_pagamento DATE
);

CREATE INDEX x_receber_venda_id ON receber(venda_id);

CREATE INDEX x_receber_cliente_id ON receber(cliente_id);

UPDATE empresa SET db_versao = 'B0250';
    