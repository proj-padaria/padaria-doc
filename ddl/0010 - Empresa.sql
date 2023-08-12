CREATE TABLE empresa (
  razao_social VARCHAR(40) NOT NULL,
  nome_fantasia VARCHAR(20) NOT NULL,
  db_versao VARCHAR(10) NOT NULL
);


CREATE TABLE ufs (
	id SERIAL NOT NULL PRIMARY KEY,
 	sigla CHAR(2) NOT NULL,
	nome VARCHAR(25) NOT NULL
);
CREATE UNIQUE INDEX x_ufs_sigla ON ufs (UPPER(sigla));
CREATE UNIQUE INDEX x_ufs_nome ON ufs(UPPER(nome));

CREATE TABLE cidades (
  id SERIAL NOT NULL PRIMARY KEY ,
  uf_id INT NOT NULL REFERECES ufs(id)
		ON UPDATE CASCADE,
		DELETE RESTRICT,
  nome VARCHAR(35) NOT NULL
);

CREATE INDEX uf_id_idx ON cidades(uf_id),
    
