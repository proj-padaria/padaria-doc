delete from planos_pagamento_dias;

delete from planos_pagamento;

delete from clientes;

delete from fornecedores;

delete from pessoas;

delete from cidades;

delete from ufs;

delete from empresa;

delete from produtos;

delete from departamentos;

delete from telefones;

delete from receber;

delete from vendas;

delete from vendas_itens;

delete from pagar;

delete from compras;


ALTER SEQUENCE ufs_id_seq RESTART WITH 1;

INSERT INTO ufs (sigla , nome)	

VALUES
('AC','Acre'),
('AL','Alagoas'),
('AP','Amapá'),
('AM','Amazonas'),
('BA','Bahia'),
('CE','Ceará'),
('ES','Espírito Santo'),
('GO','Goiás'),
('MA','Maranhão'),
('MT','Mato Grosso'),
('MS','Mato Grosso do Sul'),
('MG','Minas Gerais'),
('PA','Pará'),
('PB','Paraíba'),
('PR','Paraná'),
('PE','Pernambuco'),
('PI','Piauí'),
('RJ','Rio de Janeiro'),
('RN','Rio Grande do Norte'),
('RS','Rio Grande do Sul'),
('RO','Rondônia'),
('RR','Roraima'),
('SC','Santa Catarina'),
('SP','São Paulo'),
('SE','Sergipe'),
('TO','Tocantins');

UPDATE empresa SET db_versao = 'B0015';