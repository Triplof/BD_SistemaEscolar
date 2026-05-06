-- 6_Consulta_Analitica.sql — Consulta Analítica OLAP

SELECT
  d.nome_mes,
  SUM(f.valor_liquido) AS faturamento
FROM fato_pagamento f
JOIN dim_tempo d ON f.sk_tempo = d.sk_tempo
GROUP BY d.nome_mes
ORDER BY faturamento DESC;