-- 3_Carga_OLAP.sql  —  Carga das dimensões (dim_unidade, dim_curso, dim_aluno)


-- dim_unidade

INSERT INTO dim_unidade (
  nk_unidade_id, nome_unidade, cnpj, cidade, estado, ativo
)
SELECT
  u.pk_unidade,
  u.nome_unidade,
  u.cnpj_unidade,
  e.cidade,
  e.estado,
  u.ativo
FROM       tb_unidades u
INNER JOIN tb_endereco  e ON e.pk_endereco = u.fk_endereco;



-- dim_curso

-- Nota de modelagem: dim_curso armazena atributos da instituição
-- (tipo e categoria administrativa). O vínculo curso × unidade
-- existe em tb_unidades_cursos, mas não é incorporado aqui porque
-- a granularidade curso × unidade já é coberta na fato_pagamento
-- pela combinação de sk_curso + sk_unidade.

INSERT INTO dim_curso (
  nk_curso_id, nome_curso, tipo_instituicao, categoria_adm
)
SELECT
  c.pk_curso,
  c.nome_curso,
  i.tipo_instituicao,
  i.tipo_categoria_adm
FROM       tb_cursos     c
INNER JOIN tb_instituicao i ON i.pk_instituicao = c.fk_instituicao;


-- dim_aluno

-- CORREÇÃO: endereço resolvido via subquery correlacionada (LIMIT 1)
-- para evitar duplicação quando há mais de um registro principal
-- na tabela tb_pessoa_endereco para o mesmo aluno.

INSERT INTO dim_aluno (
  nk_aluno_id, ra_aluno, nome_completo, cpf,
  dt_nascimento, sexo, cidade, estado, status_matricula
)
SELECT
  a.fk_pessoa                              AS nk_aluno_id,
  a.ra_aluno,
  CONCAT(p.nome, ' ', p.sobrenome)         AS nome_completo,
  p.cpf,
  p.dt_nascimento,
  p.sexo,

  -- Endereço: subquery garante 1 linha mesmo com múltiplos "principal = true"
  (
    SELECT e2.cidade
    FROM   tb_pessoa_endereco pe2
    JOIN   tb_endereco        e2  ON e2.pk_endereco = pe2.fk_endereco
    WHERE  pe2.fk_pessoa  = a.fk_pessoa
      AND  pe2.principal  = true
    ORDER BY pe2.fk_endereco   -- desempate determinístico
    LIMIT 1
  )                                        AS cidade,

  (
    SELECT e2.estado
    FROM   tb_pessoa_endereco pe2
    JOIN   tb_endereco        e2  ON e2.pk_endereco = pe2.fk_endereco
    WHERE  pe2.fk_pessoa  = a.fk_pessoa
      AND  pe2.principal  = true
    ORDER BY pe2.fk_endereco
    LIMIT 1
  )                                        AS estado,

  -- Status: matrícula mais recente do aluno
  (
    SELECT m.situacao
    FROM   tb_matriculas m
    WHERE  m.fk_pessoa = a.fk_pessoa
    ORDER BY m.data_matricula DESC
    LIMIT 1
  )                                        AS status_matricula

FROM       tb_alunos a
INNER JOIN tb_pessoa  p ON p.pk_pessoa = a.fk_pessoa;


-- ── Verificações ─────────────────────────────────────────────
SELECT COUNT(*) AS total_unidades FROM dim_unidade;
SELECT COUNT(*) AS total_cursos   FROM dim_curso;
SELECT COUNT(*) AS total_alunos   FROM dim_aluno;

-- Sanidade: não deve retornar linhas (nk duplicado = aluno inserido 2x)
SELECT nk_aluno_id, COUNT(*) AS qtd
FROM   dim_aluno
GROUP  BY nk_aluno_id
HAVING qtd > 1;
