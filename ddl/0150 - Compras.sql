CREATE TABLE pagar (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fornecedor_id INT NOT NULL REFERENCES pessoas(id)
    				ON DELETE RESTRICT
    				ON UPDATE CASCADE,
  compra_id INT NOT NULL REFERENCES compras(id)
				ON UPDATE CASCADE
    				DELETE RESTRICT,
  valor DECIMAL(14,2) NOT NULL,
  data_vencimento DATE NOT NULL,
  data_pagamento DATE NULL,
  valor_pago DECIMAL(14,2) NULL
);

CREATE INDEX fornecedor_id_idx ON pagar (fornecedor_id);
CREATE INDEX compra_id_idx ON pagar (compra_id);