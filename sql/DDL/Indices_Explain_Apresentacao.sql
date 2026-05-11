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
--  2.1 MÓDULO CONTATOS 

-- tb_telefone
CREATE INDEX idx_telefone_pessoa
    ON tb_telefone (fk_pessoa);

-- tb_email
CREATE INDEX idx_email_pessoa
    ON tb_email (fk_pessoa);

-- tb_pessoa_endereco (tabela N:N – ambas as FKs)
CREATE INDEX idx_pessoa_end_endereco
    ON tb_pessoa_endereco (fk_endereco);

--  2.2 MÓDULO ACADÊMICO – INFRAESTRUTURA


-- tb_unidades
CREATE INDEX idx_unidade_instituicao
    ON tb_unidades (fk_instituicao);

CREATE INDEX idx_unidade_endereco
    ON tb_unidades (fk_endereco);

-- tb_salas
CREATE INDEX idx_sala_unidade
    ON tb_salas (fk_unidade);

-- tb_turnos
CREATE INDEX idx_turno_unidade
    ON tb_turnos (fk_unidade);

--  2.3 MÓDULO RH

-- tb_departamento
CREATE INDEX idx_depto_unidade
    ON tb_departamento (fk_unidade);

-- tb_cargos
CREATE INDEX idx_cargo_depto
    ON tb_cargos (fk_depto);

-- tb_funcionarios
CREATE INDEX idx_func_cargo
    ON tb_funcionarios (fk_cargo);

CREATE INDEX idx_func_unidade
    ON tb_funcionarios (fk_unidade);

--  2.4 OPERACIONAL

-- tb_cursos
CREATE INDEX idx_curso_instituicao
    ON tb_cursos (fk_instituicao);

-- tb_unidades_cursos (N:N)
CREATE INDEX idx_uc_coordenador
    ON tb_unidades_cursos (fk_coordenador);

-- tb_alunos
CREATE INDEX idx_aluno_unidade
    ON tb_alunos (fk_unidade);

-- tb_grade_horaria  (colunas de JOIN + filtros frequentes)
CREATE INDEX idx_grade_sala
    ON tb_grade_horaria (fk_sala);

CREATE INDEX idx_grade_disciplina
    ON tb_grade_horaria (fk_disciplina);

CREATE INDEX idx_grade_professor
    ON tb_grade_horaria (fk_professor);

-- tb_grade_curricular
CREATE INDEX idx_gc_curso
    ON tb_grade_curricular (fk_curso);

CREATE INDEX idx_gc_disciplina
    ON tb_grade_curricular (fk_disciplina);

-- tb_responsaveis
CREATE INDEX idx_resp_pessoa
    ON tb_responsaveis (fk_pessoa);

-- tb_responsaveis_alunos (N:N)
CREATE INDEX idx_ra_responsavel
    ON tb_responsaveis_alunos (fk_responsavel);

-- tb_periodos_letivos
CREATE INDEX idx_periodo_unidade
    ON tb_periodos_letivos (fk_unidade);

-- tb_turmas  (JOINs e filtros por unidade/período/curso)
CREATE INDEX idx_turma_periodo
    ON tb_turmas (fk_periodo_letivo);

CREATE INDEX idx_turma_curso
    ON tb_turmas (fk_curso);

CREATE INDEX idx_turma_unidade
    ON tb_turmas (fk_unidade);

CREATE INDEX idx_turma_sala
    ON tb_turmas (fk_sala);

-- tb_matriculas  (JOIN mais frequente do sistema)
CREATE INDEX idx_matricula_pessoa
    ON tb_matriculas (fk_pessoa);

CREATE INDEX idx_matricula_turma
    ON tb_matriculas (fk_turma);

CREATE INDEX idx_matricula_unidade
    ON tb_matriculas (fk_unidade);

-- tb_matricula_componentes  (JOIN central de notas e faltas)
CREATE INDEX idx_mc_disciplina
    ON tb_matricula_componentes (fk_disciplina);

CREATE INDEX idx_mc_turma
    ON tb_matricula_componentes (fk_turma);

CREATE INDEX idx_mc_matricula
    ON tb_matricula_componentes (num_matricula);

-- tb_avaliacoes
CREATE INDEX idx_aval_turma
    ON tb_avaliacoes (fk_turma);

CREATE INDEX idx_aval_disciplina
    ON tb_avaliacoes (fk_disciplina);

-- tb_notas  (JOIN duplo: vinculo + avaliação)
CREATE INDEX idx_nota_vinculo
    ON tb_notas (fk_vinculo);

CREATE INDEX idx_nota_avaliacao
    ON tb_notas (fk_avaliacao);

-- tb_faltas
CREATE INDEX idx_falta_vinculo
    ON tb_faltas (fk_vinculo);

-- Índice composto para relatório de faltas por data
CREATE INDEX idx_falta_vinculo_data
    ON tb_faltas (fk_vinculo, data_falta);

--  2.5 FINANCEIRO

-- tb_descontos
CREATE INDEX idx_desconto_instituicao
    ON tb_descontos (fk_instituicao);

-- tb_contratos_educacionais
CREATE INDEX idx_contrato_matricula
    ON tb_contratos_educacionais (fk_num_matricula);

CREATE INDEX idx_contrato_unidade
    ON tb_contratos_educacionais (fk_unidade);

CREATE INDEX idx_contrato_desconto
    ON tb_contratos_educacionais (fk_desconto);

-- tb_mensalidades  (filtros por status e vencimento são frequentes)
CREATE INDEX idx_mens_aluno
    ON tb_mensalidades (fk_aluno);

CREATE INDEX idx_mens_contrato
    ON tb_mensalidades (fk_contrato);

CREATE INDEX idx_mens_unidade
    ON tb_mensalidades (fk_unidade);

-- Índice composto: consultas de inadimplência por unidade + status
CREATE INDEX idx_mens_unidade_status
    ON tb_mensalidades (fk_unidade, status_pagamento);

-- Índice composto: consultas de vencimento por aluno + data
CREATE INDEX idx_mens_aluno_vencimento
    ON tb_mensalidades (fk_aluno, data_vencimento);

-- tb_categorias_financeiras
CREATE INDEX idx_catfin_instituicao
    ON tb_categorias_financeiras (fk_instituicao);

-- tb_fluxo_caixa  (relatórios por período são intensivos)
CREATE INDEX idx_fluxo_instituicao
    ON tb_fluxo_caixa (fk_instituicao);

CREATE INDEX idx_fluxo_unidade
    ON tb_fluxo_caixa (fk_unidade);

CREATE INDEX idx_fluxo_categoria
    ON tb_fluxo_caixa (fk_categoria);

-- Índice composto para relatório de caixa por unidade + período
CREATE INDEX idx_fluxo_unidade_data
    ON tb_fluxo_caixa (fk_unidade, data_movimento);

--  2.6 FOLHA DE PAGAMENTO

-- tb_beneficio
CREATE INDEX idx_benef_instituicao
    ON tb_beneficio (fk_instituicao);

-- tb_func_beneficio (N:N)
CREATE INDEX idx_fb_beneficio
    ON tb_func_beneficio (fk_beneficio);
-- fk_funcionario compõe o PK

-- tb_folha_pagamento
CREATE INDEX idx_folha_funcionario
    ON tb_folha_pagamento (fk_funcionario);

CREATE INDEX idx_folha_unidade
    ON tb_folha_pagamento (fk_unidade);

-- Índice composto: consulta de folha por unidade + período
CREATE INDEX idx_folha_unidade_periodo
    ON tb_folha_pagamento (fk_unidade, ano_referencia, mes_referencia);

-- tb_eventos_folha
CREATE INDEX idx_evento_folha
    ON tb_eventos_folha (fk_folha);

CREATE INDEX idx_evento_beneficio
    ON tb_eventos_folha (fk_beneficio);

-- tb_ponto_eletronico  (fk_funcionario compõe o PK → já indexado)
-- Índice composto para relatório de ponto por funcionário + período
CREATE INDEX idx_ponto_func_data
    ON tb_ponto_eletronico (fk_funcionario, data_registro);


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
