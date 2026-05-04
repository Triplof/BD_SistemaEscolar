USE gestao_escolar;

--  CENÁRIO 1: ROLLBACK — Simulação de erro / desfazer operação
--  Objetivo: provar que o banco consegue desfazer operações
--            que não foram confirmadas.

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

-- Simulando erro
ROLLBACK;

-- Depois
SELECT COUNT(*) 
FROM tb_mensalidades 
WHERE fk_aluno = 41;
-- Resultado esperado: A tabela deve estar idêntica ao estado anterior

-- ✔ Conclusão Cenário 1:
--   O ROLLBACK garantiu que a operação foi completamente desfeita.
--   A atomicidade do banco foi preservada — nenhum dado parcial ficou gravado.
