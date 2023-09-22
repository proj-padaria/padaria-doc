delete from fornecedores;

delete from clientes;

delete from pessoas;

ALTER SEQUENCE pessoas_id_seq RESTART WITH 1;

INSERT INTO pessoas (cidade_id,nome,logradouro,logradouro_numero,bairro,cep,email,data_cadastro)					

VALUES 
(8,'Usina Minas','R. das energias',420,'Canavial','10556710','usiminhas@energia.com','2023-01-15'),
(8,'Frutaria Avenida','R. das frutas',080,'Carmen Miranda','10153980','avefruta@frutaria.com','2023-01-10'),
(8,'Paulo Peixoto','R. dos peixes',222,'Aquarios','10233481','ppeixoto@gmail.com','2023-02-20'),
(1,'Antolena Luz','R. dos iluminados',310,'Escuro','11230481','antoluz@gmail.com','2023-02-21');

INSERT INTO clientes (pessoa_id, data_nascimento, renda_mensal,documento,limite_de_credito,dia_vencimento_fiado)

VALUES
(2,null,12000,null,2000,10),
(3,'15/08/1991',1250.00,35687454,375.00,10),
(4,'27/11/1994',3250.00,null,975.00,15);

INSERT INTO fornecedores(pessoa_id,cnpj)

VALUES
(1,12345678000100),
(2,32445677382100);

UPDATE empresa SET db_versao = 'B0610';