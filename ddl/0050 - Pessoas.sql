CREATE TABLE pessoas (
  id SERIAL NOT NULL PRIMARY KEY,
  cidade_id INT NOT NULL REFERENCES cidades(id)
							ON UPDATE CASCADE
							ON DELETE RESTRICT,
  nome VARCHAR(40) NOT NULL,
  logradouro VARCHAR(40) NOT NULL,
  logradouro_numero VARCHAR(10) NOT NULL,
  bairro VARCHAR(30) NOT NULL,
  cep VARCHAR(45) NOT NULL,
  email TEXT,
  data_cadastro DATE NOT NULL DEFAULT current_date
);

CREATE INDEX x_pessoas_cidade_id ON pessoas(cidade_id);
CREATE INDEX x_pessoas_nome ON pessoas(nome);

CREATE TABLE telefones (
  id SERIAL NOT NULL PRIMARY KEY,
  pessoa_id INT NOT NULL REFERENCES pessoas(id)
							ON UPDATE CASCADE
    						DELETE RESTRICT,
  ddd VARCHAR(3) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  tipo VARCHAR(3) NOT NULL DEFAULT 'CEL'
					CHECK (tipo IN('CEL', 'FIX', 'COM'))
);
	
CREATE INDEX x_telefones_pessoa_id ON telefones(pessoa_id);

CREATE TABLE fornecedores (
  pessoa_id INT NOT NULL PRIMARY KEY
						 REFERENCES pessoas (id)
    						ON DELETE RESTRICT
    						ON UPDATE CASCADE,
  cnpj VARCHAR(15) NOT NULL
);

CREATE INDEX fk_fornecedor_pessoa_id ON fornecedores (pessoa_id);
CREATE INDEX x_fornecedores_cnpj ON fornecedores (cnpj);

CREATE TABLE IF NOT EXISTS clientes (
  pessoa_id INT NOT NULL PRIMARY KEY
						 REFERENCES pessoas (id)
    						ON DELETE RESTRICT
    						ON UPDATE CASCADE,
  data_nascimento DATE NULL,
  renda_mensal DECIMAL(14,2) NOT NULL DEFAULT 0,
  documento VARCHAR(20) NULL,
  limite_de_credito DECIMAL(14,2) NOT NULL DEFAULT 0,
  dia_vencimento_fiado INT NOT NULL DEFAULT 10
);

CREATE INDEX pessoas_id_idx ON clientes (pessoa_id);


