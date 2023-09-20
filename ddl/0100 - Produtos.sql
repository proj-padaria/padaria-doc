CREATE TABLE departamentos(
  id SERIAL NOT NULL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL
);

CREATE TABLE produtos (
  id SERIAL NOT NULL PRIMARY KEY,
  departamento_id INT NOT NULL REFERENCES departamentos(id)
									ON UPDATE CASCADE
									ON DELETE RESTRICT,
  nome VARCHAR(45) NOT NULL,
  nome_abreviado VARCHAR(20) NOT NULL,
  preco_venda DECIMAL(14,2) NOT NULL,
  quantidade_em_estoque DECIMAL(12,3) NOT NULL,
  codigo_barra TEXT NOT NULL,
  ponto_pedido INT NOT NULL DEFAULT 0
);

CREATE INDEX x_produtos_departamento_id ON produtos(departamento_id);

CREATE INDEX x_produtos_nome ON produtos(UPPER(nome));

CREATE INDEX x_produtos_quantidade_em_estoque ON produtos(quantidade_em_estoque);

UPDATE empresa SET db_versao = 'B0100';
