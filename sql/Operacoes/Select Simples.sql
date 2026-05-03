USE gestao_escolar;

-- PARTE 1: SELECT SIMPLES — Listagens básicas


-- 1.1 Listagem de todos os alunos com nome completo

SELECT
    a.fk_pessoa                          AS id_aluno,
    CONCAT(p.nome, ' ', p.sobrenome)     AS nome_completo,
    p.dt_nascimento,
    p.sexo
FROM tb_alunos a
JOIN tb_pessoa p ON a.fk_pessoa = p.pk_pessoa
ORDER BY p.nome;


-- 1.2 Listagem de professores com cargo e departamento

SELECT
    f.fk_pessoa                          AS id_professor,
    CONCAT(p.nome, ' ', p.sobrenome)     AS professor,
    c.nome_cargo,
    d.nome_depto,
    f.salario
FROM tb_professor pr
JOIN tb_funcionarios f  ON pr.fk_pessoa = f.fk_pessoa
JOIN tb_pessoa p        ON f.fk_pessoa = p.pk_pessoa
JOIN tb_cargos c        ON f.fk_cargo = c.pk_cargo
JOIN tb_departamento d  ON c.fk_depto = d.pk_depto
ORDER BY f.salario DESC;

-- 1.3 Situação financeira das mensalidades (visão geral)

SELECT
    CONCAT(p.nome, ' ', p.sobrenome)     AS aluno,
    m.num_parcela,
    m.valor_bruto,
    m.valor_desconto_aplicado,
    m.valor_liquido,
    m.data_vencimento,
    m.status_pagamento
FROM tb_mensalidades m
JOIN tb_alunos a  ON m.fk_aluno = a.fk_pessoa
JOIN tb_pessoa p  ON a.fk_pessoa = p.pk_pessoa
ORDER BY m.data_vencimento, p.nome;

-- 1.4 Turmas abertas com curso e unidade

SELECT
    t.pk_turma,
    t.nome_turma,
    cu.nome_curso,
    u.nome_unidade,
    t.capacidade_turma,
    t.status_turma
FROM tb_turmas t
JOIN tb_cursos cu         ON t.fk_curso = cu.pk_curso
JOIN tb_unidades u        ON t.fk_unidade = u.pk_unidade
WHERE t.status_turma IN ('Aberta', 'Em curso')
ORDER BY u.nome_unidade, t.nome_turma;


-- 1.5 Resumo da folha de pagamento — Março 2026

SELECT
    CONCAT(p.nome, ' ', p.sobrenome) AS funcionario,
    fp.mes_referencia,
    fp.ano_referencia,
    fp.salario_base_atual,
    fp.total_proventos,
    fp.total_descontos,
    fp.valor_liquido,
    fp.status_folha
FROM tb_folha_pagamento fp
JOIN tb_funcionarios f ON fp.fk_funcionario = f.fk_pessoa
JOIN tb_pessoa p       ON f.fk_pessoa = p.pk_pessoa
WHERE fp.mes_referencia = 3 AND fp.ano_referencia = 2026
ORDER BY fp.valor_liquido DESC;



-- PARTE 2: SUBSELECTS 



-- 2.1 Alunos que pagaram mais de R$ 5.000 em mensalidades

SELECT
    CONCAT(p.nome, ' ', p.sobrenome) AS aluno,
    p.cpf
FROM tb_pessoa p
WHERE p.pk_pessoa IN (
    SELECT m.fk_aluno
    FROM tb_mensalidades m
    WHERE m.status_pagamento = 'Pago'
    GROUP BY m.fk_aluno
    HAVING SUM(m.valor_liquido) > 5000
);


-- 2.2 Alunos com pelo menos uma mensalidade em atraso
--     (Subselect correlacionado — referencia tabela externa)

SELECT
    CONCAT(p.nome, ' ', p.sobrenome) AS aluno,
    a.fk_pessoa                       AS id_aluno
FROM tb_alunos a
JOIN tb_pessoa p ON a.fk_pessoa = p.pk_pessoa
WHERE EXISTS (
    SELECT 1
    FROM tb_mensalidades m
    WHERE m.fk_aluno = a.fk_pessoa       -- correlação com tabela externa
      AND m.status_pagamento = 'Atrasado'
);


-- 2.3 Professores com salário acima da média geral
--     (Subselect escalar — retorna um único valor)

SELECT
    CONCAT(p.nome, ' ', p.sobrenome) AS professor,
    f.salario
FROM tb_funcionarios f
JOIN tb_pessoa p ON f.fk_pessoa = p.pk_pessoa
WHERE f.fk_pessoa IN (
    SELECT pr.fk_pessoa FROM tb_professor pr
)
AND f.salario > (
    SELECT AVG(salario) FROM tb_funcionarios
);


-- 2.4 Alunos matriculados em mais de 2 disciplinas
--     (Subselect com agregação na cláusula HAVING)

SELECT
    CONCAT(p.nome, ' ', p.sobrenome) AS aluno,
    sub.total_disciplinas
FROM tb_pessoa p
JOIN (
    SELECT mat.fk_pessoa, COUNT(mc.pk_vinculo) AS total_disciplinas
    FROM tb_matriculas mat
    JOIN tb_matricula_componentes mc ON mat.num_matricula = mc.num_matricula
    GROUP BY mat.fk_pessoa
    HAVING COUNT(mc.pk_vinculo) > 2
) AS sub ON p.pk_pessoa = sub.fk_pessoa
ORDER BY sub.total_disciplinas DESC;


-- 2.5 Cursos que têm mais alunos matriculados do que a média
--     (Subselect com agregação dupla — avançado)

SELECT
    cu.nome_curso,
    COUNT(mat.num_matricula) AS total_matriculados
FROM tb_cursos cu
JOIN tb_turmas t   ON cu.pk_curso = t.fk_curso
JOIN tb_matriculas mat ON t.pk_turma = mat.fk_turma
GROUP BY cu.pk_curso, cu.nome_curso
HAVING COUNT(mat.num_matricula) > (
    SELECT AVG(qtd)
    FROM (
        SELECT COUNT(m2.num_matricula) AS qtd
        FROM tb_turmas t2
        JOIN tb_matriculas m2 ON t2.pk_turma = m2.fk_turma
        GROUP BY t2.fk_curso
    ) AS media_cursos
);