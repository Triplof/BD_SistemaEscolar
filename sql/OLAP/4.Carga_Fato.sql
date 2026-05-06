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
  dc.sk_curso,
  m.pk_mensalidade,
  m.fk_contrato,
  ce.fk_num_matricula,
  m.valor_bruto,
  m.valor_desconto_aplicado,
  m.valor_liquido,
  m.num_parcela,
  m.status_pagamento

FROM tb_mensalidades m

JOIN dim_tempo dt
  ON dt.data_completa = m.data_vencimento

JOIN dim_aluno da
  ON da.nk_aluno_id = m.fk_aluno

JOIN dim_unidade du
  ON du.nk_unidade_id = m.fk_unidade

JOIN tb_contratos_educacionais ce
  ON ce.pk_contrato = m.fk_contrato

JOIN tb_matriculas mt
  ON mt.num_matricula = ce.fk_num_matricula

JOIN tb_turmas t
  ON t.pk_turma = mt.fk_turma

JOIN dim_curso dc
  ON dc.nk_curso_id = t.fk_curso;


