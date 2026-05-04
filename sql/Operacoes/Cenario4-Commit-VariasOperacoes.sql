USE gestao_escolar;

--  CENÁRIO 4 (COMPLEMENTAR): COMMIT com múltiplas operações
--  O mesmo cenário real, mas agora confirmado com COMMIT.

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

	SELECT status_pagamento, valor_liquido
		FROM tb_mensalidades
		WHERE pk_mensalidade = 3;

		SELECT COUNT(*) AS entradas_caixa_antes
		FROM tb_fluxo_caixa
		WHERE fk_unidade = 1 AND DATE(data_movimento) = CURDATE();
        
        COMMIT;

-- Verificação APÓS o ROLLBACK
-- Resultado esperado: status_pagamento permanece 
-- e um novo fluxo de caixa foi registrada
SELECT status_pagamento, valor_liquido
FROM tb_mensalidades
WHERE pk_mensalidade = 3;

SELECT COUNT(*) AS entradas_caixa_depois
FROM tb_fluxo_caixa
WHERE fk_unidade = 1 AND DATE(data_movimento) = CURDATE();

--   Conclusão Cenário 4:
--   Ambas as operações foram persistidas com o COMMIT.
--   A Durabilidade garante que o dado permanece mesmo após
--   encerrar a sessão ou reiniciar o servidor.
