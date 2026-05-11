--  BLOCO 1: EXPLAIN ANTES DOS ÍNDICES (baseline)
--  Execute este bloco ANTES de criar os índices para
--  registrar o custo original de cada consulta.

-- Mensalidades em aberto por unidade
EXPLAIN SELECT
    p.nome, p.sobrenome,
    ms.num_parcela, ms.valor_liquido, ms.data_vencimento, ms.status_pagamento
FROM tb_mensalidades ms
JOIN tb_alunos    a  ON a.fk_pessoa   = ms.fk_aluno
JOIN tb_pessoa    p  ON p.pk_pessoa   = a.fk_pessoa
JOIN tb_unidades  u  ON u.pk_unidade  = ms.fk_unidade
WHERE ms.fk_unidade = 1
  AND ms.status_pagamento IN ('Pendente', 'Atrasado');

--  BLOCO 2: CRIAÇÃO DOS ÍNDICES

CREATE INDEX idx_mens_unidade_status
    ON tb_mensalidades (fk_unidade, status_pagamento);

--  BLOCO 3: EXPLAIN APÓS OS ÍNDICES (melhoria)
--  Execute este bloco DEPOIS de criar todos os índices acima.
--  Compare as colunas "type", "key" e "rows" com o Bloco 1.

-- Mensalidades em aberto (espera: key=idx_mens_unidade_status)
EXPLAIN SELECT
    p.nome, p.sobrenome,
    ms.num_parcela, ms.valor_liquido, ms.data_vencimento, ms.status_pagamento
FROM tb_mensalidades ms
JOIN tb_alunos    a  ON a.fk_pessoa   = ms.fk_aluno
JOIN tb_pessoa    p  ON p.pk_pessoa   = a.fk_pessoa
JOIN tb_unidades  u  ON u.pk_unidade  = ms.fk_unidade
WHERE ms.fk_unidade = 1
  AND ms.status_pagamento IN ('Pendente', 'Atrasado');
