CREATE TABLE receber (
  id SERIAL NOT NULL PRIMARY KEY,
  vendas_id INT NOT NULL REFERENCES vendas(id)
							ON UPDATE CASCADE
   							ON DELETE RESTRICT,
  cliente_id INT NOT NULL,
  valor DECIMAL(14,2) NOT NULL,
  data_vencimento DATE NOT NULL,
  data_pagamento DATE NOT NULL
);

CREATE  INDEX venda_id_idx ON vendas_id(id);


    