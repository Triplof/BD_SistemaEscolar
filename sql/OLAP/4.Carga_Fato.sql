-- 4_Carga_Fato.sql  —  Carga da fato_pagamento



TRUNCATE TABLE fato_pagamento;

SELECT
  COUNT(*)                       AS mensalidades_sem_contrato,
  SUM(valor_bruto)               AS total_bruto_descartado,
  SUM(valor_liquido)             AS total_liquido_descartado
FROM tb_mensalidades
WHERE fk_contrato IS NULL;




SELECT
  m.pk_mensalidade,
  COUNT(DISTINCT t.fk_curso) AS qtd_cursos
FROM tb_mensalidades m
JOIN tb_contratos_educacionais ce ON ce.pk_contrato       = m.fk_contrato
JOIN tb_matriculas             mt ON mt.num_matricula      = ce.fk_num_matricula
JOIN tb_turmas                 t  ON t.pk_turma            = mt.fk_turma
WHERE m.fk_contrato IS NOT NULL
GROUP BY m.pk_mensalidade
HAVING qtd_cursos > 1;


-- ── Carga principal 
-- O curso é resolvido via subquery correlacionada a partir do
-- contrato → matrícula → turma, com LIMIT 1 para proteger
-- contra eventuais duplicações residuais no OLTP.

INSERT INTO fato_pagamento (
  sk_tempo, sk_aluno, sk_unidade, sk_curso,
  nk_mensalidade_id, nk_contrato_id, nk_matricula_num,
  valor_bruto, valor_desconto_aplicado, valor_liquido,
  num_parcela, status_pagamento
)
SELECT
  dt.sk_tempo,
  da.sk_aluno,
  du.sk_unidade,

  -- Curso resolvido via subquery: contrato → matrícula → turma → curso
  -- LIMIT 1 garante no máximo uma linha mesmo se houver inconsistência no OLTP
  (
    SELECT dc2.sk_curso
    FROM   tb_contratos_educacionais ce2
    JOIN   tb_matriculas             mt2 ON mt2.num_matricula = ce2.fk_num_matricula
    JOIN   tb_turmas                 t2  ON t2.pk_turma       = mt2.fk_turma
    JOIN   dim_curso                 dc2 ON dc2.nk_curso_id   = t2.fk_curso
    WHERE  ce2.pk_contrato = m.fk_contrato
    ORDER BY ce2.pk_contrato    -- desempate determinístico
    LIMIT 1
  )                              AS sk_curso,

  m.pk_mensalidade               AS nk_mensalidade_id,
  m.fk_contrato                  AS nk_contrato_id,

  -- Número de matrícula resolvido diretamente pelo contrato
  (
    SELECT ce3.fk_num_matricula
    FROM   tb_contratos_educacionais ce3
    WHERE  ce3.pk_contrato = m.fk_contrato
    LIMIT 1
  )                              AS nk_matricula_num,

  m.valor_bruto,
  m.valor_desconto_aplicado,
  m.valor_liquido,
  m.num_parcela,
  m.status_pagamento

FROM tb_mensalidades m

-- dim_tempo: resolve pela data de vencimento da mensalidade
JOIN dim_tempo   dt ON dt.data_completa = m.data_vencimento

-- dim_aluno: resolve pelo fk_aluno da mensalidade (= tb_alunos.fk_pessoa)
JOIN dim_aluno   da ON da.nk_aluno_id   = m.fk_aluno

-- dim_unidade: resolve pela unidade da mensalidade
JOIN dim_unidade du ON du.nk_unidade_id = m.fk_unidade

-- Exclui mensalidades sem contrato (não têm caminho para sk_curso)
WHERE m.fk_contrato IS NOT NULL;


-- Verificação pós-carga 
SELECT COUNT(*) AS total_linhas_fato FROM fato_pagamento;

-- Nenhuma linha deve ter sk_curso NULL (subquery não encontrou curso)
SELECT COUNT(*) AS linhas_sem_curso
FROM   fato_pagamento
WHERE  sk_curso IS NULL;
