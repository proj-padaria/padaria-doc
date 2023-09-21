INSERT INTO compras (fornecedor_id, plano_pagamento_id, data_compra, valor_total_comprado,
						valor_total_recebido, data_recebimento)
VALUES
(13, 1, '13/08/2023', 3250.00, 2950.90, '27/08/2023'),
(14, 2, '15/08/2023', 2540.75, 2500.75, '17/07/2023'),
(15, 3, '19/08/2023', 1250.89, 1250.89, '23/06/2023'),
(16, 4, '01/09/2023', 4520.00, 2590.00, '19/09/2023'),
(16, 5, '12/09/2023', 3000.00, 3000.00, '19/09/2023');

INSERT INTO compras_itens (compra_id, produto_id, quantidade_comprada, quantidade_recebida,
						  	preco_unitario, total_da_linha)
VALUES
(1, 55, 350, 310, 4.76, 1475.45),
(1, 56, 280, 280, 5.27, 1475.45),
(2, 57, 110, 110, 5.68, 625.19),
(2, 58, 87, 87, 7.19, 625.19),
(2, 59, 153, 153,4.09, 625.19),
(2, 60, 98, 90,6.95, 625.19),
(3, 61, 60, 60, 20.85, 1250.89),
(4, 62, 1310, 759, 3.41, 2590),
(4, 63, 380, 380, 7.90, 3000);


INSERT INTO pagar (fornecedor_id, compra_id, valor, data_vencimento, data_pagamento, valor_pago)

VALUES
(13, 1, 2950.90,'13/09/2023', null, null),                			--30
(14, 2, 2540.75,'15/08/2023', '17/09/2023', 1270.37),					--30,60,
(14, 2, 2540.75,'15/10/2023', null, null),
(15, 3, 1250.89,'19/07/2023', '23/07/2023', 416.96),						--30,60,90
(15, 3, 1250.89,'19/08/2023', '25/08/2023', 416.96),
(15, 3, 1250.89,'19/09/2023', null, null),
(16, 4, 2590.00,'16/11/2023', null, null),							--45
(16, 5, 3000.00,'27/09/2023', '12/09/2023',750.00),					--15,30,45,60
(16, 5, 3000.00,'12/10/2023', null, null),
(16, 5, 3000.00,'27/10/2023', null, null),
(16, 5, 3000.00,'12/11/2023', null, null);


UPDATE empresa SET db_versao = 'B0630';