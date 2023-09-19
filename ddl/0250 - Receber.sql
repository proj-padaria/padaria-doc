CREATE TABLE receber (
  id SERIAL NOT NULL PRIMARY KEY,
  venda_id INT NOT NULL REFERENCES vendas(id)
							ON UPDATE CASCADE
   							ON DELETE RESTRICT,
  cliente_id INT NOT NULL REFERENCES clientes(pessoa_id)
							ON UPDATE CASCADE
   							ON DELETE RESTRICT,
  valor DECIMAL(14,2) NOT NULL,
  data_vencimento DATE NOT NULL,
  data_pagamento DATE
);

CREATE INDEX x_receber_venda_id ON receber(venda_id);

CREATE INDEX x_receber_cliente_id ON receber(cliente_id);

<<<<<<< HEAD
UPDATE empresa SET db_versao = "B0250";
=======
UPDATE empresa SET db_versao = 'B0250';
>>>>>>> 7db97820f1fd01cf096ce5de27f2d4e32f81a9b6
    