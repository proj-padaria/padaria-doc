INSERT INTO empresa (razao_social, nome_fantasia, db_versao)
VALUES 
('Padaria do Seu Joaquim', 'Joaquim da esquina', 'B0011');

ALTER SEQUENCE cidades_id_seq RESTART WITH 1 ;

INSERT INTO cidades (uf_id, nome)
VALUES 
(24, 'São José do Rio Preto'),
(18, 'Petrópolis'),
(20, 'Gramado'),
(23, 'Balneário Camboriú'),  
(16, 'Recife'),
(5, 'Porto Seguro'),
(15, 'Curitiba'),
(24, 'Catanduva'),
(12, 'Belo Horizonte');   

ALTER SEQUENCE planos_pagamento_id_seq RESTART WITH 1;  --rodar apartir deste insert 

INSERT INTO planos_pagamento (descricao, prazo_medio)
VALUES
('30 dias', 30),
('30 - 60 dias', 45),
('30 - 60 - 90 dias', 60),
('45 dias', 45),
('15 - 30 - 45 - 60 dias', 38); -- Prazo médio = (15 + 30 + 45 + 60) / 4

ALTER SEQUENCE planos_pagamento_dias_id_seq RESTART WITH 1;

INSERT INTO planos_pagamento_dias (plano_pagamento_id,dias_do_vencimento,percentual_pagamento)
VALUES
(1,30,100),
(2,30,50),
(2,60,50),
(3,30,33),
(3,60,33),
(3,90,34),
(4,45,100),
(5,15,25),
(5,30,25),
(5,45,25),
(5,60,25);

UPDATE empresa SET db_versao = 'B0020';