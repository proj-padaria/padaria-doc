ALTER SEQUENCE compras_id_seq RESTART WITH 1;

INSERT INTO compras (fornecedor_id, plano_pagamento_id, data_compra, valor_total_comprado,
						valor_total_recebido)
VALUES
(2, 1, '13/08/2023', 3250.00, 0.00),
(1, 2, '15/08/2023', 2540.75, 0.00),
(2, 3, '19/08/2023', 1250.89, 0.00),
(1, 4, '01/09/2023', 4520.00, 0.00),
(2, 5, '12/09/2023', 3000.00, 0.00),
(3, 5, '15/09/2023', 6000.00, 0.00);

ALTER SEQUENCE compras_itens_id_seq RESTART WITH 1;

INSERT INTO compras_itens (compra_id, produto_id, quantidade_comprada, quantidade_recebida,
						  	preco_unitario, total_da_linha)
VALUES
(1, 1, 350, 310, 4.76, 1475.45),
(1, 2, 280, 280, 5.27, 1475.45),
(2, 3, 110, 110, 5.68, 625.19),
(2, 4, 87, 87, 7.19, 625.19),
(2, 5, 153, 153,4.09, 625.19),
(2, 6, 98, 90,6.95, 625.19),
(3, 7, 60, 60, 20.85, 1250.89),
(4, 8, 1310, 759, 3.41, 2590),
(4, 9, 380, 380, 7.90, 3000);

UPDATE empresa SET db_versao = 'RC 1.00';