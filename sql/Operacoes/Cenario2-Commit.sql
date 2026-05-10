USE gestao_escolar;

--  CENÁRIO 2: COMMIT — Confirmação e persistência da operação
--  Objetivo: provar que a transação confirmada é persistida

-- Verificação ANTES da transação
SELECT COUNT(*) 
FROM tb_mensalidades 
WHERE fk_aluno = 41;

START TRANSACTION;

INSERT INTO tb_mensalidades
    (fk_aluno, fk_unidade, num_parcela,
     valor_bruto, valor_desconto_aplicado, valor_liquido,
     data_vencimento, status_pagamento)
VALUES
    (41, 1, 99, 1000.00, 0.00, 1000.00, '2026-05-10', 'Pendente');

-- Durante

SELECT COUNT(*) 
FROM tb_mensalidades 
WHERE fk_aluno = 41;

COMMIT;

-- Rollback para provar que após o comit a operação vai manter 

ROLLBACK;

-- Depois
SELECT COUNT(*) 
FROM tb_mensalidades 
WHERE fk_aluno = 41;
-- Resultado esperado: A tabela deve manter novo dado

--   Conclusão Cenário 2:
--   O COMMIT confirmou e persistiu a operação.
--   Mesmo após encerrar a sessão ou tentar dar ROLLBACK, o dado continuará gravado (Durabilidade).
