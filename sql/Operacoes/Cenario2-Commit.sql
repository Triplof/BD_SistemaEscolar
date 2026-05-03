USE gestao_escolar;

--  CENÁRIO 2: COMMIT — Confirmação e persistência da operação
--  Objetivo: provar que a transação confirmada é persistida

-- Verificação ANTES da transação
SELECT 
    m.pk_mensalidade,
    m.fk_aluno,
    CONCAT(p.nome, ' ', p.sobrenome) AS aluno,
    m.num_parcela,
    m.valor_liquido,
    m.status_pagamento
FROM tb_mensalidades m
JOIN tb_alunos a  ON m.fk_aluno = a.fk_pessoa
JOIN tb_pessoa p  ON a.fk_pessoa = p.pk_pessoa
WHERE m.fk_aluno = 42
ORDER BY m.pk_mensalidade DESC
LIMIT 5;

START TRANSACTION;

    INSERT INTO tb_mensalidades
        (fk_aluno, fk_contrato, fk_unidade, num_parcela,
         valor_bruto, valor_desconto_aplicado, valor_liquido,
         data_vencimento, status_pagamento)
    VALUES
        (42, NULL, 1, 5,
         5858.00, 0.00, 5858.00,
         '2026-05-10', 'Pendente');

COMMIT;

ROLLBACK;
-- Verificação APÓS o COMMIT

-- ✔ Conclusão Cenário 2:
--   O COMMIT confirmou e persistiu a operação.
--   Mesmo após encerrar a sessão ou tentar dar ROLLBACK, o dado continuará gravado (Durabilidade).
