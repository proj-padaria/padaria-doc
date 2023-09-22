delete from produtos;

delete from departamentos;

ALTER SEQUENCE departamentos_id_seq RESTART WITH 1;

INSERT INTO departamentos (nome)					

VALUES 
('Açougue'),
('Adega e bebidas'),
('Cereais'),
('Enlatados'),
('Frios e laticínios'),
('Higiene e limpeza'),
('Hortifruti e mercearia'),
('Padaria'),
('Rotisseria');

UPDATE empresa SET db_versao = 'B0126';
