USE gestao_escolar;

--  CENÁRIO 3 (DIFERENCIAL): Transação com múltiplas operações
--  Simula um caso real: pagamento de mensalidade + registro
--  no fluxo de caixa + atualização de status.
--  Um erro no meio desfaz TUDO (Atomicidade total).

-- Verificação do estado ANTES

SELECT status_pagamento, valor_liquido
FROM tb_mensalidades
WHERE pk_mensalidade = 3;

SELECT COUNT(*) AS entradas_caixa_antes
FROM tb_fluxo_caixa
WHERE fk_unidade = 1 AND DATE(data_movimento) = CURDATE();

START TRANSACTION;

    -- Operação 1: Marcar mensalidade como paga
    UPDATE tb_mensalidades
    SET status_pagamento = 'Pago'
    WHERE pk_mensalidade = 3
      AND status_pagamento IN ('Pendente', 'Atrasado');

    -- Operação 2: Registrar a entrada no fluxo de caixa
    INSERT INTO tb_fluxo_caixa
        (fk_instituicao, fk_unidade, fk_categoria,
         tipo_movimento, valor, data_movimento, saldo_momento)
    VALUES
        (1, 1, 1,
         'Entrada', 9999.00, NOW(), 0.00);
         -- saldo_momento seria calculado dinamicamente em produção

    --  Simulação de erro: suponha que neste ponto o sistema
    --  detecta que o contrato está rescindido. O correto é ROLLBACK de TUDO. 

	SELECT status_pagamento, valor_liquido
		FROM tb_mensalidades
		WHERE pk_mensalidade = 3;

		SELECT COUNT(*) AS entradas_caixa_antes
		FROM tb_fluxo_caixa
		WHERE fk_unidade = 1 AND DATE(data_movimento) = CURDATE();
        
		ROLLBACK;

-- Verificação APÓS o ROLLBACK
-- Resultado esperado: status_pagamento permanece INALTERADO
-- e nenhuma entrada nova no fluxo de caixa foi registrada
SELECT status_pagamento, valor_liquido
FROM tb_mensalidades
WHERE pk_mensalidade = 3;

SELECT COUNT(*) AS entradas_caixa_depois
FROM tb_fluxo_caixa
WHERE fk_unidade = 1 AND DATE(data_movimento) = CURDATE();

-- ✔ Conclusão Cenário 3 (Diferencial):
--   As duas operações (UPDATE + INSERT) foram desfeitas juntas.
--   Nem a mensalidade teve seu status alterado,
--   nem o fluxo de caixa registrou a entrada.
--   Isso demonstra a Atomicidade em um cenário real de pagamento.
