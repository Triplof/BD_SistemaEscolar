USE gestao_escolar;

-- PARTE 3: CONTROLE TRANSACIONAL
-- Objetivo: Demonstrar ACID — Atomicidade, Consistência,
--           Isolamento e Durabilidade



--  CENÁRIO 1: ROLLBACK — Simulação de erro / desfazer operação
--  Objetivo: provar que o banco consegue desfazer operações
--            que não foram confirmadas.

-- Verificação ANTES da transação
-- (resultado esperado: sem registro novo para o aluno 41)
SELECT pk_mensalidade, fk_aluno, num_parcela, valor_liquido, status_pagamento
FROM tb_mensalidades
WHERE fk_aluno = 41
ORDER BY pk_mensalidade DESC
LIMIT 5;

START TRANSACTION;

    -- Operação 1: Inserir mensalidade para o aluno 41
    INSERT INTO tb_mensalidades
        (fk_aluno, fk_contrato, fk_unidade, num_parcela,
         valor_bruto, valor_desconto_aplicado, valor_liquido,
         data_vencimento, status_pagamento)
    VALUES
        (41, NULL, 1, 99,
         1500.00, 0.00, 1500.00,
         '2026-05-10', 'Pendente');

    -- Simulando erro de negócio detectado pelo sistema
    -- (ex: parcela duplicada, contrato inválido, regra violada)
    -- Em vez de deixar o dado inconsistente, fazemos ROLLBACK:

ROLLBACK;

-- Verificação APÓS o ROLLBACK
-- Resultado esperado: O registro inserido NÃO deve existir
-- (a tabela deve estar idêntica ao estado anterior)

-- ✔ Conclusão Cenário 1:
--   O ROLLBACK garantiu que a operação foi completamente desfeita.
--   A atomicidade do banco foi preservada — nenhum dado parcial ficou gravado.
