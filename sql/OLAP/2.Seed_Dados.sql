
-- 2_Seed_Dados.sql  —  Carga da dim_tempo (2020–2030)

-- Gera uma linha por dia usando CTE recursiva.
SET SESSION cte_max_recursion_depth = 10000;

-- se for mariaDB faz SET max_recursive_iterations = 10000;
INSERT INTO dim_tempo (
  data_completa, dia, mes, nome_mes,
  trimestre, semestre, ano, dia_semana, eh_fim_semana
)
WITH RECURSIVE datas AS (
  SELECT DATE('2020-01-01') AS dt
  UNION ALL
  SELECT DATE_ADD(dt, INTERVAL 1 DAY)
  FROM   datas
  WHERE  dt < DATE('2030-12-31')
)
SELECT
  dt,
  DAY(dt),
  MONTH(dt),
  CASE MONTH(dt)
    WHEN 1  THEN 'Janeiro'
    WHEN 2  THEN 'Fevereiro'
    WHEN 3  THEN 'Março'
    WHEN 4  THEN 'Abril'
    WHEN 5  THEN 'Maio'
    WHEN 6  THEN 'Junho'
    WHEN 7  THEN 'Julho'
    WHEN 8  THEN 'Agosto'
    WHEN 9  THEN 'Setembro'
    WHEN 10 THEN 'Outubro'
    WHEN 11 THEN 'Novembro'
    WHEN 12 THEN 'Dezembro'
  END                                AS nome_mes,
  QUARTER(dt)                        AS trimestre,
  IF(MONTH(dt) <= 6, 1, 2)           AS semestre,
  YEAR(dt)                           AS ano,
  CASE DAYOFWEEK(dt)
    WHEN 1 THEN 'Domingo'
    WHEN 2 THEN 'Segunda'
    WHEN 3 THEN 'Terça'
    WHEN 4 THEN 'Quarta'
    WHEN 5 THEN 'Quinta'
    WHEN 6 THEN 'Sexta'
    WHEN 7 THEN 'Sábado'
  END                                AS dia_semana,
  DAYOFWEEK(dt) IN (1, 7)            AS eh_fim_semana
FROM datas;


SELECT COUNT(*) AS total_dias FROM dim_tempo;                          -- esperado: 4018
SELECT * FROM dim_tempo ORDER BY sk_tempo ASC  LIMIT 5;               -- primeiras linhas
SELECT * FROM dim_tempo ORDER BY sk_tempo DESC LIMIT 5;               -- últimas linhas
