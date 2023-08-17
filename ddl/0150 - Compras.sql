CREATE TABLE compras (
  id SERIAL NOT NULL PRIMARY KEY,
  fornecedor_id INT NOT NULL REFERENCES pessoas(id)
								ON UPDATE CASCADE
								ON DELETE RESTRICT,
  plano_pagamento_id INT NOT NULL REFERENCES planos_pagamento(id)
									ON UPDATE CASCADE
									ON DELETE RESTRICT,
  data_compra DATE NOT NULL,
  valor_total_comprado DECIMAL(14,2) NOT NULL,
  valor_total_recebido DECIMAL(14,2),
  data_recebimento DATE
);
							  
CREATE  INDEX x_compras_data_compra ON data_compra(date);
CREATE  INDEX fk_compras_plano_pagamento_idx ON plano_pagamento(id);
    
CREATE TABLE compras_itens (
  id SERIAL NOT NULL PRIMARY KEY,
  compra_id INT NOT NULL REFERENCES compras(id)
							ON UPDATE CASCADE
							ON DELETE RESTRICT,
  produto_id INT NOT NULL REFERENCES produtos(id)
							ON UPDATE CASCADE
							ON DELETE RESTRICT,
  quantidade_comprada DECIMAL(12,3) NOT NULL,
  quantidade_recebida DECIMAL(12,3) NOT NULL DEFAULT 0,
  preco_unitario DECIMAL(14,2) NOT NULL,
  total_da_linha DECIMAL(14,2) NOT NULL
);

CREATE  INDEX x_compras_itens_produto_id ON compras_itens(produto_id);
CREATE  INDEX x_compras_itens_compra_id ON compras_itens(compra_id);

CREATE TABLE pagar (
  id SERIAL NOT NULL PRIMARY KEY,
  fornecedor_id INT NOT NULL REFERENCES pessoas(id)
								ON UPDATE CASCADE
                                ON DELETE RESTRICT,
  compra_id INT NOT NULL REFERENCES compras(id)
							ON UPDATE CASCADE
    						ON DELETE RESTRICT,
  valor DECIMAL(14,2) NOT NULL,
  data_vencimento DATE NOT NULL,
  data_pagamento DATE,
  valor_pago DECIMAL(14,2)
);

CREATE INDEX x_fornecedor_id ON pagar (fornecedor_id);
CREATE INDEX x_compra_id ON pagar (compra_id);
