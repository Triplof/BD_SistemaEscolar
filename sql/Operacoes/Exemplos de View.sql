CREATE VIEW vw_ListaAlunos as SELECT
    a.fk_pessoa                          AS id_aluno,
    CONCAT(p.nome, ' ', p.sobrenome)     AS nome_completo,
    p.dt_nascimento,
    p.sexo
FROM tb_alunos a
JOIN tb_pessoa p ON a.fk_pessoa = p.pk_pessoa
ORDER BY p.nome;

select * from vw_ListaAlunos;

CREATE VIEW vw_AlunosDevendo as SELECT
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
SELECT * FROM vw_AlunosDevendo;