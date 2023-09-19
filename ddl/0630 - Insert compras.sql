INSERT INTO compras (fornecedor_id, plano_pagamento_id, data_compra, valor_total_comprado,
						valor_total_recebido, data_recebimento)
VALUES
(3, 1, '23/07/2023', 47.40, null, null),
(4, 2, '15/07/2023', 69.40, 34.70, 15-08-2023),
(),
();

select * from planos_pagamento;
select * from compras;
select * from produtos;

INSERT INTO compras_itens (compra_id, produto_id, quantidade_comprada, quantidade_recebida,
						  	preco_unitario, total_da_linha)
VALUES
(1, 1, 10, 10, 1.25, 12.50),
(2, 3, 6, 4, 2.50, 10.00),
(),
();

INSERT INTO pagar (fornecedor_id, compra_id, valor, data_vencimento, data_pagamento, valor_pago)

VALUES
(3, 1, 47.40, 23-08-2023, null, null),
(4, 2, 69.40, 15-08-2023, 15-08-2023, 34.70),
(),
();

UPDATE empresa SET db_versao = "B0630";