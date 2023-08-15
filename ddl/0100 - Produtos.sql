CREATE TABLE departamentos(
  id SERIAL NOT NULL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
);

CREATE TABLE produtos (
  id SERIAL NOT NULL PRIMARY KEY,
  departamento_id INT NOT NULL REFERENCES departamentos(id)
									ON UPDATE CASCADE
									DELETE RESTRICT,
  nome VARCHAR(45) NOT NULL,
  nome_abreviado VARCHAR(20) NOT NULL,
  preco_venda DECIMAL(14,2) NOT NULL,
  quantidade_em_estoque DECIMAL(12,3) NOT NULL,
  codigo_barra TEXT NOT NULL,
  ponto_pedido INT NOT NULL DEFAULT 0,
);

CREATE INDEX produto_id_idx ON produtos(id);

CREATE INDEX produto_nome_ASC_idx ON produtos(nome ASC);

CREATE INDEX produto_quantidade_estoque_idx ON produtos(quantidade_em_estoque);