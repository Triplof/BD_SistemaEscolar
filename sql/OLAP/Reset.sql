-- 1. Limpa tudo
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE fato_pagamento;
TRUNCATE TABLE dim_curso;
TRUNCATE TABLE dim_unidade;
TRUNCATE TABLE dim_aluno;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Recarrega dim_unidade
INSERT INTO dim_unidade (nk_unidade_id, nome_unidade, cnpj, cidade, estado, ativo)
SELECT u.pk_unidade, u.nome_unidade, u.cnpj_unidade, e.cidade, e.estado, u.ativo
FROM tb_unidades u
JOIN tb_endereco e ON e.pk_endereco = u.fk_endereco;

-- 3. Recarrega dim_curso
INSERT INTO dim_curso (nk_curso_id, nome_curso, tipo_instituicao, categoria_adm)
SELECT c.pk_curso, c.nome_curso, i.tipo_instituicao, i.tipo_categoria_adm
FROM tb_cursos c
JOIN tb_instituicao i ON i.pk_instituicao = c.fk_instituicao;

-- 4. Recarrega dim_aluno
INSERT INTO dim_aluno (
  nk_aluno_id, ra_aluno, nome_completo, cpf,
  dt_nascimento, sexo, cidade, estado, status_matricula
)
SELECT
  a.fk_pessoa, a.ra_aluno, CONCAT(p.nome, ' ', p.sobrenome),
  p.cpf, p.dt_nascimento, p.sexo, e.cidade, e.estado,
  (SELECT m.situacao FROM tb_matriculas m
   WHERE m.fk_pessoa = a.fk_pessoa
   ORDER BY m.data_matricula DESC LIMIT 1)
FROM tb_alunos a
JOIN tb_pessoa p ON p.pk_pessoa = a.fk_pessoa
LEFT JOIN tb_pessoa_endereco pe ON pe.fk_pessoa = a.fk_pessoa AND pe.principal = true
LEFT JOIN tb_endereco e ON e.pk_endereco = pe.fk_endereco;

-- 5. Confirma dimensões
SELECT 'dim_unidade' AS tabela, COUNT(*) AS total FROM dim_unidade
UNION ALL SELECT 'dim_curso', COUNT(*) FROM dim_curso
UNION ALL SELECT 'dim_aluno', COUNT(*) FROM dim_aluno;