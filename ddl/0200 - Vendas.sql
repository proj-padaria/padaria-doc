CREATE TABLE vendas_itens(
  id SERIAL NOT PRIMARY KEY,
  venda_id INT NOT NULL REFERENCES vendas(id)
    					    	ON UPDATE CASCADE
								DELETE RESTRICT,
  produto_id INT NOT NULL REFERENCES produtos(id)
    							ON UPDATE CASCADE							
								DELETE RESTRICT,
  quantidade DECIMAL(12,3) NOT NULL,
  preco_venda DECIMAL(14,2) NOT NULL,
  total_da_linha DECIMAL(14,2) NOT NULL,
);

CREATE INDEX vendas_itens_id_idx ON vendas_itens(id);

CREATE INDEX vendas_quantidade_idx ON vendas_itens(quantidade);

CREATE TABLE vendas(
  id SERIAL NOT NULL PRIMARY KEY,
  cliente_id INT NOT NULL REFERENCES clientes(id)
							ON UPDATE CASCADE
							DELETE RESTRIC,
  data DATE NOT NULL,
  valor_total DECIMAL(14,2) NOT NULL,
  pago_dinheiro DECIMAL(14,2) NOT NULL DEFAULT 0.00,
  pago_cartao DECIMAL(14,2) NOT NULL DEFAULT 0.00,
  fiado DECIMAL(14,2) NOT NULL DEFAULT 0.00,
);

CREATE INDEX data_venda_idx ON vendas(data);
  
  
