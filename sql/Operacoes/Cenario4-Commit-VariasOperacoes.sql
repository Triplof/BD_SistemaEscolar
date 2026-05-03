USE gestao_escolar;


--  CENÁRIO 4 (COMPLEMENTAR): COMMIT com múltiplas operações
--  O mesmo cenário real, mas agora confirmado com COMMIT.

-- Estado antes
UPDATE tb_mensalidades
SET status_pagamento = 'Pendente'
WHERE pk_mensalidade = 2;
SELECT status_pagamento FROM tb_mensalidades WHERE pk_mensalidade = 2;
SELECT pk_fluxo, tipo_movimento, valor, data_movimento
FROM tb_fluxo_caixa
WHERE fk_unidade = 1
ORDER BY pk_fluxo DESC
LIMIT 3;


START TRANSACTION;

    -- Operação 1: Marcar mensalidade 2 como paga
    UPDATE tb_mensalidades
    SET status_pagamento = 'Pago'
    WHERE pk_mensalidade = 2
      AND status_pagamento IN ('Pendente', 'Atrasado');

    -- Operação 2: Registrar entrada no fluxo de caixa
    INSERT INTO tb_fluxo_caixa
        (fk_instituicao, fk_unidade, fk_categoria,
         tipo_movimento, valor, data_movimento, saldo_momento)
    VALUES
        (1, 1, 1,
         'Entrada', 1200.00, NOW(), 0.00);
         
	SELECT status_pagamento FROM tb_mensalidades WHERE pk_mensalidade = 2;


COMMIT;

-- Validação: mensalidade deve estar 'Pago' e fluxo de caixa deve ter nova entrada
SELECT status_pagamento FROM tb_mensalidades WHERE pk_mensalidade = 2;

SELECT pk_fluxo, tipo_movimento, valor, data_movimento
FROM tb_fluxo_caixa
WHERE fk_unidade = 1
ORDER BY pk_fluxo DESC
LIMIT 3;

-- ✔ Conclusão Cenário 4:
--   Ambas as operações foram persistidas com o COMMIT.
--   A Durabilidade garante que o dado permanece mesmo após
--   encerrar a sessão ou reiniciar o servidor.


