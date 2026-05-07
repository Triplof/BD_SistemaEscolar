
-- 5_Validacao.sql  —  Comparação OLTP × OLAP


SELECT 'OLTP' AS origem,
  COUNT(*)                       AS qtd_registros,
  SUM(valor_bruto)               AS total_bruto,
  SUM(valor_desconto_aplicado)   AS total_desconto,
  SUM(valor_liquido)             AS total_liquido
FROM tb_mensalidades
WHERE fk_contrato IS NOT NULL;


SELECT 'OLAP' AS origem,
  COUNT(*)                       AS qtd_registros,
  SUM(valor_bruto)               AS total_bruto,
  SUM(valor_desconto_aplicado)   AS total_desconto,
  SUM(valor_liquido)             AS total_liquido
FROM fato_pagamento;
