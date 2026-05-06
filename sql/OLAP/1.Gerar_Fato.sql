
-- 1_Gerar_Fato.sql  —  Criação do modelo dimensional (Star Schema)

-- Ordem de criação: dimensões primeiro (sem FKs entre si),
-- tabela fato por último (referencia todas as dimensões).
-- 1 linha = 1 mensalidade paga por aluno por data de vencimento


CREATE TABLE dim_tempo (
  sk_tempo       INT AUTO_INCREMENT PRIMARY KEY,
  data_completa  DATE        NOT NULL,
  dia            INT,
  mes            INT,
  nome_mes       VARCHAR(20),
  trimestre      INT,
  semestre       INT,
  ano            INT,
  dia_semana     VARCHAR(15),
  eh_fim_semana  BOOLEAN,
  UNIQUE (data_completa)
);

CREATE TABLE dim_aluno (
  sk_aluno         INT AUTO_INCREMENT PRIMARY KEY,
  nk_aluno_id      INT         NOT NULL,   -- = tb_alunos.fk_pessoa
  ra_aluno         VARCHAR(20),
  nome_completo    VARCHAR(160),
  cpf              VARCHAR(11),
  dt_nascimento    DATE,
  sexo             VARCHAR(20),
  cidade           VARCHAR(50),
  estado           CHAR(2),
  status_matricula VARCHAR(20)
);

CREATE TABLE dim_unidade (
  sk_unidade    INT AUTO_INCREMENT PRIMARY KEY,
  nk_unidade_id INT         NOT NULL,   -- = tb_unidades.pk_unidade
  nome_unidade  VARCHAR(150),
  cnpj          VARCHAR(18),
  cidade        VARCHAR(50),
  estado        CHAR(2),
  ativo         BOOLEAN
);

CREATE TABLE dim_curso (
  sk_curso         INT AUTO_INCREMENT PRIMARY KEY,
  nk_curso_id      INT         NOT NULL,   -- = tb_cursos.pk_curso
  nome_curso       VARCHAR(50),
  tipo_instituicao VARCHAR(30),
  categoria_adm    VARCHAR(30)
);



-- FATO


CREATE TABLE fato_pagamento (
  sk_pagamento            BIGINT AUTO_INCREMENT PRIMARY KEY,
  sk_tempo                INT    NOT NULL,
  sk_aluno                INT    NOT NULL,
  sk_unidade              INT    NOT NULL,
  sk_curso                INT    NOT NULL,
  nk_mensalidade_id       INT    NOT NULL,
  nk_contrato_id          INT,
  nk_matricula_num        INT,
  valor_bruto             DECIMAL(10,2),
  valor_desconto_aplicado DECIMAL(10,2),
  valor_liquido           DECIMAL(10,2),
  num_parcela             INT,
  status_pagamento        VARCHAR(20),

  FOREIGN KEY (sk_tempo)    REFERENCES dim_tempo(sk_tempo),
  FOREIGN KEY (sk_aluno)    REFERENCES dim_aluno(sk_aluno),
  FOREIGN KEY (sk_unidade)  REFERENCES dim_unidade(sk_unidade),
  FOREIGN KEY (sk_curso)    REFERENCES dim_curso(sk_curso)
);
