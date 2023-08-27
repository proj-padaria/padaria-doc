INSERT INTO empresa (razao_social, nome_fantasia, db_versao)
VALUES 
('SKR DA SILVA PADARIA E CONFEITARIA', 'DELICIA ALFREDENSE', 'v.545.0.0'),
('BEATRIZ CHIDEROLI LTDA', 'CHIDEROLI FERRARI', 'v.540.0.0'),
('TOLEDO E TORRES EIRELI ME', 'TOLEDO E TORRES', 'v.540.0.1');

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

INSERT INTO planos_pagamento (descricao, prazo_medio)
VALUES
('30 dias', 30),
('30 - 60 dias', 45),
('30 - 60 - 90 dias', 60),
('45 dias', 45),
('15 - 30 - 45 - 60 dias', 38); -- Prazo médio = (15 + 30 + 45 + 60) / 4

select*from empresa;
select*from cidades;
select*from planos_pagamento;