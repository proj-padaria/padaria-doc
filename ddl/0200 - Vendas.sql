CREATE TABLE vendas(
  id SERIAL NOT NULL PRIMARY KEY,
  cliente_id INT NOT NULL REFERENCES clientes(pessoa_id)
							ON UPDATE CASCADE
							ON DELETE RESTRICT,
  data DATE NOT NULL,
  valor_total DECIMAL(14,2) NOT NULL,
  pago_dinheiro DECIMAL(14,2) NOT NULL DEFAULT 0.00,
  pago_cartao DECIMAL(14,2) NOT NULL DEFAULT 0.00,
  fiado DECIMAL(14,2) NOT NULL DEFAULT 0.00
);

CREATE INDEX x_vendas_data ON vendas(data);
CREATE INDEX x_vendas_cliente_id ON vendas(cliente_id);

CREATE TABLE vendas_itens(
  id SERIAL NOT NULL PRIMARY KEY,
  venda_id INT NOT NULL REFERENCES vendas(id)
    					    	ON UPDATE CASCADE
								ON DELETE RESTRICT,
  produto_id INT NOT NULL REFERENCES produtos(id)
    							ON UPDATE CASCADE							
								ON DELETE RESTRICT,
  quantidade DECIMAL(12,3) NOT NULL,
  preco_venda DECIMAL(14,2) NOT NULL,
  total_da_linha DECIMAL(14,2) NOT NULL
);

CREATE INDEX x_vendas_itens_venda_id ON vendas_itens(venda_id);

CREATE INDEX x_vendas_itens_produto_id ON vendas_itens(produto_id);

UPDATE empresa SET db_versao = 'B0200';

  
  
