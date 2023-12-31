-- INSERT PRODUTOS E DEPARTAMENTOS 0620 PELO MENOS 50 PRODUTOS E 6 DEPARTAMENTOS

-- ESTA PARTE É PARA ADICIONAR OS DEPARTAMENTOS

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
('Rotisseria'),
('Refrigerados'),
('Gerais');

-- COMECAR A ADICIONAR DE CIMA PARA BAIXO NESTA ORDEM

ALTER SEQUENCE produtos_id_seq RESTART WITH 1;

INSERT INTO produtos (departamento_id, nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra,
						 ponto_pedido)
VALUES (11, 'Diversos', 'Diversos', 0.00, 0, 'N/D', 0);
    
-- ESTA PARTE É PARA ADICIONAR NO SETOR DE AÇOUGUE	

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(1,'BACON DEFUMADO AURORA KG','BAC. DEF. AURORA KG',29.90,'0','0237360000000',10),
(1,'BACON SADIA KG','BACON SADIA KG',29.90,'0','0203130000000',10),
(1,'COXA DE FRANGO','COXA FRANGO',10.9,'0','0246180000000',50),
(1,'LAGARTO FRIBOI RESERVA KG','LAGAR. FRIB. RES. KG',38.90,'0','0204090000000',20),
(1,'PEITO DE FRANGO SEM PELE E SEM OSSO','PEITO FRANGO S/P S/O',12.90,'0','0246170000000',50);


-- ESTA PARTE É PARA ADICIONAR NO SETOR DE LATICÍNIOS

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(5,'PRESUNTO SADIA KG','PRES. SADIA KG',34.90,0,'0237770000000',10),
(5,'QJ. MUSSURELA FRESCO SERRAMAR KG','QJ. MUSS. FR. S. KG',43.90,0,'0215560000000',10),
(5,'QJ. MUSSARELA SCALA KG','QJ. MUSS. SCALA KG',59.90,0,'0245240000000',10),
(5,'QJ. PARMESAO SCALA KG','QJ. PARM. SCALA KG',119.90,0,'0245240000000',10);

-- ESTA PARTE É PARA ADICIONAR NO SETOR DE HORTALÍCIAS 

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(7,'ALHO COMUM KG ','ALHO COM. KG ',27.90,0,'0201760000000',10),
(7,'BANANA PRATA KG','BAN. PRATA KG',7.99,0,'0202400000000',20),
(7,'CEBOLA KG','CEBOLA KG',4.99,0,'0202430000000',20),
(7,'COUVE FLOR B. NIN. 400G','COUVE FL B. 400G',11.90,0,'7898188331718',15),
(7,'LIMAO TAHITI KG','LIMAO TAHITI KG',3.99,0,'0201120000000',20),
(7,'MACA PINK LADY KG','MACA PINK LADY KG',6.99,0,'0298900000000',20),
(7,'MACA GALA KG','MACA GALA KG',8.99,0,'0206250000000',10),
(7,'MANGA PALMER KG','MANGA PALMER KG',3.99,0,'0259610000000',10),
(7,'PEPINO JAPONES','PEPINO JAPONES',4.99,0,'0200590000000',20),
(7,'PERA WILLIANS KG ','PERA WILLIANS KG',8.99,0,'0283400000000',10),
(7,'TOMATE ITALIANO KG','TOMATE ITALIANO KG',5.99,0,'0203540000000',20),
(7,'TOMATE TIPO GRAPE 300G','TOMATE TP GRA. 300G',6.99,0,'0736532167750',20),
(7,'RABANETE VERDE CIA 350G','RABAN. VER. CIA 350G',6.99,0,'7898188331626',10);

-- ESTA PARTE É PARA ADICIONAR NO SETOR DA PADARIA

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(8,'PAO DOCE KG','PAO DOCE KG',6.90,0,'02201500000',20),
(8,'PAO DE QUEIJO KG','PAO DE QUEIJO KG',15.90,0,'02201600000',50), 
(8,'PAO FRANCES KG','PAO FRANCES KG',19.90,0,'02201700000',50),
(8,'PAO ITALIANO KG','PAO ITALIANO KG',16.90,0,'02201800000',20);

-- ESTA PARTE É PARA ADICIONAR NO SETOR ROTISSERIA

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(9,'FRANGO ASSADO KG','FRANGO ASSADO KG',35.00,0,'0246171010000',10),
(9,'MAMINHA ASSADA KG','MAMINHA ASSADA KG',55.90,0,'0246171020000',5),
(9,'LINGUICA ASSADA KG','LINGUICA ASSADA KG',15.90,0,'0246171030000',20);


ALTER SEQUENCE produtos_id_seq RESTART WITH 10000;

-- ESTA PARTE É PARA ADICIONAR NO SETOR DA ADEGA

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(2,'AGUA DE COCO SOCOCO 1L','AGUA COCO SOCOCO 1L',8.79,0,'7896004401409',20),
(2,'CERVEJA BUDWEISER CAIXA 8 LT','CERV. BUD. CX 8 LT',22.32,0,'7891991012096',20),
(2,'COCA COLA 1.5L','COCA COLA 1.5L',8.15,0,'7894900011753',50),
(2,'COCA COLA 1L','COCA COLA 1L',8.49,0,'7894900011753',50),
(2,'SUCO N.ONE LARANJA 1.5L','SUCO N.ONE LARANJA',17.90,0,'7899916900503',20),
(2,'SUCO PRATS 1,7L LARANJA','SUCO PRATS 1.7L LAR.',4.50,0,'7898953148541',20),
(2,'VINHO ARGENTINO HEREFO. 750ML','VIN. ARG. HER. 750ML',29.90,0,'7791540046506',15);

-- ESTA PARTE É PARA ADICIONAR NO SETOR DE HIGIENE E LIMPEZA

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(6,'ALCOOL TUPI 46 ZERO 1L','ALCO. T. 46 ZERO 1L',5.80,0,'7898917671153',50),
(6,'AMACIANTE R. CONFORT CONC. 1L','AMAC. CONF. C. 1L',16.90,0,'7891150063471',50),
(6,'AMACIANTE R. DOWNY CONC. 900ML','AMAC. DOWNY C. 900ML',3.5,0,'7500435156967',50),
(6,'DETERGENTE LIQUIDO YPE','DETERG. LIQ. YPE',2.95,0,'7896098902066',50),
(6,'ESPONJA MULTI USO. ANTI BACTERICIDA','ESPO. M. USO A. BAC.',5.99,0,'7891022859812',50),
(6,'LAVA LOUCA FINISH PO 450G','LAVA LOU. F. PO 450G',28.50,0,'7891035024399',20),
(6,'LAVA ROUPA URCA VD. LIQ. 1L','LAVA R. URCA LI. 1L',5.99,0,'7896056405233',20),
(6,'OMO 1,6 KG LAVAGEM PERFUMADA','OMO 1,6 KG LAV. PER.',23.97,0,'7891150064331',50),
(6,'TOALHA PAPEL KITCHEN UN','TOALHA PAPEL KIT. UN',12.99,0,'7896061920318',20);

-- ESTA PARTE É PARA ADICIONAR NO SETOR REFRIGERADOS

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(10,'DOCE GOIABA CREM 400G','DOCE GOIA. CREM 400G',6.99,0,'7898045700268',10),
(10,'HAMBURGUER AURORA PICANHA 360G','HAMB. AUR. PIC. 360G',14.9,0,'7891164020903',20),
(10,'IOGURTE SERRAMAR NATURAL 170G','IOG. SERRAMAR NAT.',2.39,0,'7897951611040',20),
(10,'LEITE FERMENTADO YAKULT 480G','L. FERM. YAKULT 480G',9.89,0,'7891156001040',20),
(10,'LEITE INTEGRAL AURORA 1L','LEITE INT. AURORA 1L',4.69,0,'7891164027339',20),
(10,'LEITE UHT PARMALAT INTTEGRAL 1L','LEITE UHT P. INT. 1L',4.75,0,'7896034610017',20),
(10,'MANTEIGA AVIACAO CSAL 500G','MANT. AVI. CSAL 500G',29.90,0,'7896331100327',20),
(10,'MANTEIGA ITAMBE POTE 500G 24,50','MANT. ITAMBE PT 500G',24.50,0,'7896041135425',20),
(10,'MARGARINA QUALY 1 KG CSAL 13,90','MARG. QUALY 1KG CSAL',13.90,0,'7893000079298',20);


-- ESTA PARTE É PARA ADICIONAR NO SETOR GERAIS

INSERT INTO produtos (departamento_id , nome, nome_abreviado, preco_venda, quantidade_em_estoque, codigo_barra, ponto_pedido)					

VALUES 
(11,'BISC. AGUA E SAL 350G','BIS. AGUA E SAL 350G',5.99,0,'7896003738636',20),
(11,'CAFE PILAO 500G','CAFE PILAO 500G',19.98,0,'7896089012019',20),
(11,'LUVA ESFREBOM M','LUVA ESFREBOM M',1.79,0,'7896001000551',20),
(11,'NESCAFE DOLCE GUSTO','NESCAFE DOLCE GUSTO',18.98,0,'7891000243787',20),
(11,'SORVETE KIBON CREME DE FLOCOS 1,5L','SORV. KIB. FL. 1,5L',33.90,0,'7891150050242',20),
(11,'VINAGRE CAST 750ML','VINAGRE CAST 750ML',2.19,0,'7896048200041',20);

UPDATE empresa SET db_versao = 'B0620';






