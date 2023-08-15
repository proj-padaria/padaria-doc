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
	
CREATE INDEX cliente_id_idx ON telefones(pessoa_id);

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

CREATE INDEX cidade_id_idx ON pessoas(cidade_id);
CREATE INDEX x_pessoas_nome ON pessoas(nome);