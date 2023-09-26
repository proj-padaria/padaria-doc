CREATE TABLE planos_pagamento (
  id SERIAL PRIMARY KEY,
  descricao VARCHAR(30) NOT NULL,
  prazo_medio INT NOT NULL
);

CREATE TABLE planos_pagamento_dias(
  id SERIAL PRIMARY KEY,
  plano_pagamento_id INT NOT NULL REFERENCES planos_pagamento(id)
										ON UPDATE CASCADE
										ON DELETE RESTRICT,
  dias_do_vencimento INT NOT NULL,
  percentual_pagamento INT NOT NULL
);

CREATE INDEX x_planos_pagamentos_dias_plano_pagamento_id ON planos_pagamento_dias(plano_pagamento_id);


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
  data_faturamento DATE
);
							  
CREATE  INDEX x_compras_data_compra ON compras(data_compra);
CREATE  INDEX x_compras_plano_pagamento_id ON compras(plano_pagamento_id);
CREATE INDEX x_compras_fornecedor_id ON compras(fornecedor_id);
	

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

CREATE INDEX x_pagar_fornecedor_id ON pagar (fornecedor_id);
CREATE INDEX x_pagar_compra_id ON pagar (compra_id);


UPDATE empresa SET db_versao = 'B0150';
