-- Comparação OLTP x OLAP
-- Os três valores devem ser iguais


-- Fonte: OLTP
SELECT 'OLTP' AS origem, 
  SUM(valor_bruto)             AS total_bruto,
  SUM(valor_desconto_aplicado) AS total_desconto,
  SUM(valor_liquido)           AS total_liquido
FROM tb_mensalidades
WHERE fk_contrato IS NOT NULL;

-- Destino: OLAP
SELECT 'OLAP' AS origem,
  SUM(valor_bruto)             AS total_bruto,
  SUM(valor_desconto_aplicado) AS total_desconto,
  SUM(valor_liquido)           AS total_liquido
FROM fato_pagamento;