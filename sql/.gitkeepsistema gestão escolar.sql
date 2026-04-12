CREATE DATABASE IF NOT EXISTS gestao_escolar;
USE gestao_escolar;


-- MÓDULO CONTATOS E LOCALIZAÇÃO (Tabelas Base)

CREATE TABLE tb_endereco (
  pk_endereco int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cep VARCHAR(9) NOT NULL,
  estado CHAR(2) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  rua VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(50)
);

CREATE TABLE tb_pessoa (
  pk_pessoa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  nome VARCHAR(50) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  dt_nascimento DATE NOT NULL,
  sexo ENUM ('Masculino', 'Feminino', 'Não informado') NOT NULL,
  dt_alteracao DATETIME DEFAULT (now())
);

CREATE TABLE tb_telefone (
  pk_telefone int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_pessoa int NOT NULL,
  numero_telefone VARCHAR(15) NOT NULL,
  tipo_telefone ENUM ('Celular', 'Fixo') NOT NULL,
  FOREIGN KEY (fk_pessoa) REFERENCES tb_pessoa(pk_pessoa)
);

CREATE TABLE tb_email (
  pk_email int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_pessoa int NOT NULL,
  email VARCHAR(150) NOT NULL,
  tipo_email ENUM ('Pessoal', 'Institucional') NOT NULL,
  FOREIGN KEY (fk_pessoa) REFERENCES tb_pessoa(pk_pessoa)
);

CREATE TABLE tb_pessoa_endereco (
  fk_pessoa INT NOT NULL,
  fk_endereco INT NOT NULL,
  principal BOOLEAN DEFAULT true,
  PRIMARY KEY (fk_pessoa, fk_endereco),
  FOREIGN KEY (fk_pessoa) REFERENCES tb_pessoa(pk_pessoa),
  FOREIGN KEY (fk_endereco) REFERENCES tb_endereco(pk_endereco)
);



-- MÓDULO ACADÊMICO (Infraestrutura)

CREATE TABLE tb_instituicao (
  pk_instituicao int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  tipo_instituicao ENUM ('Escola', 'Universidade', 'Academia', 'Igreja', 'ONG') DEFAULT 'Escola',
  tipo_categoria_adm ENUM ('Publica', 'Privada', 'Filantrópica') DEFAULT 'Publica'
);

CREATE TABLE tb_unidades (
  pk_unidade int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_instituicao int NOT NULL,
  fk_endereco int NOT NULL,
  nome_unidade varchar(150),
  cnpj_unidade varchar(18) UNIQUE,
  telefone_contata varchar(15),
  email_contato varchar(150),
  ativo BOOLEAN DEFAULT true,
  FOREIGN KEY (fk_instituicao) REFERENCES tb_instituicao(pk_instituicao),
  FOREIGN KEY (fk_endereco) REFERENCES tb_endereco(pk_endereco)
);

CREATE TABLE tb_salas (
  pk_sala int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_unidade int NOT NULL,
  nome_sala VARCHAR(50) NOT NULL,
  capacidade_sala int NOT NULL,
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade)
);

CREATE TABLE tb_turnos (
  fk_turno int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_unidade int NOT NULL,
  nome_turno VARCHAR(30) NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fim TIME NOT NULL,
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade)
);



-- MÓDULO RECURSOS HUMANOS (RH)

CREATE TABLE tb_departamento (
  pk_depto int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_unidade int NOT NULL,
  nome_depto VARCHAR(60) NOT NULL,
  responsavel VARCHAR(60) NOT NULL,
  sigla VARCHAR(10),
  ativo BOOLEAN DEFAULT true,
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade)
);

CREATE TABLE tb_cargos (
  pk_cargo int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_depto int NOT NULL,
  nome_cargo VARCHAR(70) NOT NULL,
  descricao VARCHAR(150) NOT NULL,
  salario_base DECIMAL(10,2) NOT NULL,
  carga_horaria INT NOT NULL,
  nivel_cargo VARCHAR(30) DEFAULT 'Padrão',
  ativo BOOLEAN DEFAULT true,
  FOREIGN KEY (fk_depto) REFERENCES tb_departamento (pk_depto)
);

CREATE TABLE tb_funcionarios (
  fk_pessoa int PRIMARY KEY NOT NULL,
  fk_cargo int NOT NULL,
  fk_unidade int NOT NULL,
  data_admissao DATE NOT NULL,
  data_demissao DATE NULL,
  salario DECIMAL(10,2) NOT NULL,
  status_funcionario ENUM('Ativo', 'Afastado', 'Férias', 'Desligado') NOT NULL,
  ctps VARCHAR(20) UNIQUE,
  FOREIGN KEY (fk_pessoa) REFERENCES tb_pessoa(pk_pessoa),
  FOREIGN KEY (fk_cargo) REFERENCES tb_cargos(pk_cargo),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade)
);

CREATE TABLE tb_professor (
  fk_pessoa int PRIMARY KEY NOT NULL,
  registro_magisteria VARCHAR(30) NOT NULL,
  nivel_academico ENUM('Graduado', 'Mestrado', 'Doutorado') NOT NULL,
  disponibilidade ENUM('Manhã', 'Tarde', 'Noite') NOT NULL,
  status_docente ENUM('Ativo', 'Licença', 'Substituto') NOT NULL,
  FOREIGN KEY (fk_pessoa) REFERENCES tb_pessoa(pk_pessoa)
);



-- MÓDULO ACADÊMICO (Operacional)

CREATE TABLE tb_cursos (
  pk_curso int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_instituicao int NOT NULL,
  nome_curso varchar(50) NOT NULL,
  FOREIGN KEY (fk_instituicao) REFERENCES tb_instituicao(pk_instituicao),
  UNIQUE (fk_instituicao, nome_curso)
);

CREATE TABLE tb_disciplina (
  pk_disciplina int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome_disciplina varchar(100),
  sigla varchar(10) UNIQUE NOT NULL,
  carga_horaria_atual int NOT NULL,
  tipo_componente ENUM('Obrigatoria', 'Optativa', 'Eletiva', 'ExtraCurricular') NOT NULL DEFAULT 'Obrigatoria',
  ativo BOOLEAN DEFAULT true
);

CREATE TABLE tb_unidades_cursos (
  fk_curso int NOT NULL,
  fk_unidade int NOT NULL,
  fk_coordenador int NOT NULL,
  ativo BOOLEAN,
  PRIMARY KEY (fk_curso, fk_unidade),
  FOREIGN KEY (fk_curso) REFERENCES tb_cursos(pk_curso),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade),
  FOREIGN KEY (fk_coordenador) REFERENCES tb_professor(fk_pessoa)
);

CREATE TABLE tb_alunos (
  fk_pessoa INT PRIMARY KEY NOT NULL,
  fk_unidade int NOT NULL,
  ra_aluno VARCHAR(20) UNIQUE NOT NULL,
  observacao VARCHAR(300),
  FOREIGN KEY (fk_pessoa) REFERENCES tb_pessoa(pk_pessoa),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade)
);

CREATE TABLE tb_grade_horaria (
  pk_horario int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_sala int NOT NULL,
  fk_disciplina int NOT NULL,
  fk_professor int NOT NULL,
  dias_semana ENUM('Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom') NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fim TIME NOT NULL,
  FOREIGN KEY (fk_sala) REFERENCES tb_salas(pk_sala),
  FOREIGN KEY (fk_disciplina) REFERENCES tb_disciplina(pk_disciplina),
  FOREIGN KEY (fk_professor) REFERENCES tb_professor(fk_pessoa),
  -- Regras de Negócio: Impede choque de horário para professor e para a sala
  UNIQUE (fk_professor, dias_semana, hora_inicio),
  UNIQUE (fk_sala, dias_semana, hora_inicio)
);

CREATE TABLE tb_grade_curricular (
  pk_grade int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_curso int NOT NULL,
  fk_disciplina int NOT NULL,
  periodo_grade int,
  obrigatoria BOOLEAN DEFAULT true,
  FOREIGN KEY (fk_curso) REFERENCES tb_cursos(pk_curso),
  FOREIGN KEY (fk_disciplina) REFERENCES tb_disciplina(pk_disciplina)
);

CREATE TABLE tb_responsaveis (
  pk_responsavel int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_pessoa int NOT NULL,
  profissao VARCHAR(100) NOT NULL,
  renda_mensal DECIMAL(10,2) NULL,
  FOREIGN KEY (fk_pessoa) REFERENCES tb_pessoa(pk_pessoa)
);

CREATE TABLE tb_responsaveis_alunos (
  fk_aluno int NOT NULL,
  fk_responsavel int NOT NULL,
  parentesco ENUM('Pai', 'Mãe', 'Tio', 'Tia', 'Outro') NOT NULL,
  financeira BOOLEAN DEFAULT false,
  PRIMARY KEY (fk_aluno, fk_responsavel),
  FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(fk_pessoa),
  FOREIGN KEY (fk_responsavel) REFERENCES tb_responsaveis(pk_responsavel)
);

CREATE TABLE tb_periodos_letivos (
  pk_periodo int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_unidade int NOT NULL,
  ano_referencia int NOT NULL,
  identificador_periodo VARCHAR(20) NOT NULL,
  dt_inicio DATE NOT NULL,
  dt_fim DATE NOT NULL,
  status_periodo ENUM('Aberto', 'Fechado') DEFAULT 'Aberto',
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade),
  UNIQUE (fk_unidade, ano_referencia, identificador_periodo)
);

CREATE TABLE tb_turmas (
  pk_turma int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_periodo_letivo int NOT NULL,
  fk_curso int NOT NULL,
  fk_unidade int NOT NULL,
  fk_sala int NOT NULL,
  nome_turma VARCHAR(60) NOT NULL,
  capacidade_turma int NOT NULL,
  status_turma ENUM('Planejamento', 'Aberta', 'Em curso', 'Encerrada') DEFAULT 'Aberta',
  FOREIGN KEY (fk_periodo_letivo) REFERENCES tb_periodos_letivos(pk_periodo),
  FOREIGN KEY (fk_curso) REFERENCES tb_cursos(pk_curso),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade),
  FOREIGN KEY (fk_sala) REFERENCES tb_salas(pk_sala)
);

CREATE TABLE tb_matriculas (
  num_matricula int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_pessoa int NOT NULL,
  fk_unidade int NOT NULL,
  fk_turma int NOT NULL,
  data_matricula DATE NOT NULL,
  situacao ENUM('Ativo', 'Trancado', 'Concluido', 'Cancelado', 'Transferido', 'Abandono') DEFAULT 'Ativo',
  FOREIGN KEY (fk_pessoa) REFERENCES tb_alunos(fk_pessoa),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade),
  FOREIGN KEY (fk_turma) REFERENCES tb_turmas(pk_turma)
);

CREATE TABLE tb_matricula_componentes (
  pk_vinculo int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_disciplina int NOT NULL,
  fk_turma int NOT NULL,
  num_matricula int NOT NULL,
  data_solicitacao datetime DEFAULT (now()),
  situacao_comp ENUM('Solicitado', 'Confirmado', 'Excluido', 'Trancado') DEFAULT 'Solicitado',
  situacao_vinculo ENUM('Regular', 'Dependecia', 'Adaptação') DEFAULT 'Regular',
  valor_ajustado DECIMAL(10,2) DEFAULT '0.00',
  FOREIGN KEY (fk_disciplina) REFERENCES tb_disciplina (pk_disciplina),
  FOREIGN KEY (fk_turma) REFERENCES tb_turmas (pk_turma),
  FOREIGN KEY (num_matricula) REFERENCES tb_matriculas (num_matricula),
  UNIQUE (fk_disciplina, fk_turma, num_matricula)
);

CREATE TABLE tb_avaliacoes (
  pk_avaliacao int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_turma int NOT NULL,
  fk_disciplina int NOT NULL,
  descricao VARCHAR(150),
  data_prevista DATE NOT NULL,
  peso_nota DECIMAL(5,2),
  FOREIGN KEY (fk_turma) REFERENCES tb_turmas(pk_turma),
  FOREIGN KEY (fk_disciplina) REFERENCES tb_disciplina(pk_disciplina)
);

CREATE TABLE tb_notas (
  pk_nota int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_vinculo int NOT NULL,
  fk_avaliacao int NOT NULL,
  valor_notas DECIMAL(5,2),
  FOREIGN KEY (fk_vinculo) REFERENCES tb_matricula_componentes(pk_vinculo),
  FOREIGN KEY (fk_avaliacao) REFERENCES tb_avaliacoes(pk_avaliacao),
  UNIQUE (fk_vinculo, fk_avaliacao)
);



-- MÓDULO FINANCEIRO

CREATE TABLE tb_forma_pagamento (
  pk_forma_pag int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  tipo_pagamento ENUM('Dinheiro', 'Pix', 'Boleto', 'Cartão de Crédito', 'Cartão de Débito') NOT NULL,
  qtd_dias_receber INT DEFAULT 0,
  ativo BOOLEAN DEFAULT true
);

CREATE TABLE tb_descontos (
  pk_desconto int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_instituicao int NOT NULL,
  nome_desconto VARCHAR(60) NOT NULL,
  tipo_desconto ENUM('Porcentagem', 'Valor fixo') NOT NULL,
  valor_desconto DECIMAL(10,2) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  ativo BOOLEAN DEFAULT true,
  FOREIGN KEY (fk_instituicao) REFERENCES tb_instituicao(pk_instituicao)
);

CREATE TABLE tb_contratos_educacionais (
  pk_contrato int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_num_matricula int NOT NULL,
  fk_unidade int NOT NULL,
  fk_desconto int NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  qtd_parcelas int DEFAULT 12,
  dia_vencimento int NOT NULL,
  data_assinatura DATE NOT NULL,
  status_contrato ENUM('Ativo', 'Encerrado', 'Rescindido', 'Anulado') DEFAULT 'Ativo',
  FOREIGN KEY (fk_num_matricula) REFERENCES tb_matriculas(num_matricula),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade),
  FOREIGN KEY (fk_desconto) REFERENCES tb_descontos(pk_desconto)
);

CREATE TABLE tb_mensalidades (
  pk_mensalidade int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_aluno int NOT NULL,
  fk_contrato int NULL,
  fk_unidade int NOT NULL,
  num_parcela int NOT NULL,
  valor_bruto DECIMAL(10,2) NOT NULL,
  valor_desconto_aplicado DECIMAL(10,2) NOT NULL,
  valor_liquido DECIMAL(10,2) NOT NULL,
  data_vencimento DATE NOT NULL,
  status_pagamento ENUM('Pendente', 'Pago', 'Atrasado', 'Cancelado', 'Acordo', 'Isento') DEFAULT 'Pendente',
  FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(fk_pessoa),
  FOREIGN KEY (fk_contrato) REFERENCES tb_contratos_educacionais(pk_contrato),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade)
);

CREATE TABLE tb_categorias_financeiras (
  pk_categoria int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_instituicao int NOT NULL,
  nome_categoria VARCHAR(100) NOT NULL,
  tipo_movimentacao ENUM('Receita', 'Despesa') NOT NULL,
  FOREIGN KEY (fk_instituicao) REFERENCES tb_instituicao(pk_instituicao)
);

CREATE TABLE tb_fluxo_caixa (
  pk_fluxo bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_instituicao int NOT NULL,
  fk_unidade int NOT NULL,
  fk_categoria int NOT NULL,
  tipo_movimento ENUM('Entrada', 'Saída') NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  data_movimento DATETIME DEFAULT (now()),
  saldo_momento DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (fk_instituicao) REFERENCES tb_instituicao(pk_instituicao),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade),
  FOREIGN KEY (fk_categoria) REFERENCES tb_categorias_financeiras (pk_categoria)
);



-- TABELAS DE DETALHE

CREATE TABLE tb_faltas (
  pk_falta int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_vinculo int NOT NULL,
  data_falta DATE NOT NULL,
  quantidade INT DEFAULT 1,
  justificada BOOLEAN DEFAULT false,
  FOREIGN KEY (fk_vinculo) REFERENCES tb_matricula_componentes(pk_vinculo)
);

CREATE TABLE tb_beneficio (
  pk_beneficio int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_instituicao int NOT NULL,
  nome_beneficio VARCHAR(50),
  tipo_evento ENUM('Provento', 'Desconto') NOT NULL,
  tipo_calculo ENUM('Porcentagem', 'Valor fixo') NOT NULL,
  valor_evento DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (fk_instituicao) REFERENCES tb_instituicao(pk_instituicao)
);

CREATE TABLE tb_func_beneficio (
  fk_funcionario int NOT NULL,
  fk_beneficio int NOT NULL,
  data_adesao DATE NOT NULL,
  valor_diferente DECIMAL(10,2) NULL,
  PRIMARY KEY (fk_funcionario, fk_beneficio),
  FOREIGN KEY (fk_funcionario) REFERENCES tb_funcionarios(fk_pessoa),
  FOREIGN KEY (fk_beneficio) REFERENCES tb_beneficio(pk_beneficio)
);

CREATE TABLE tb_folha_pagamento (
  pk_folha int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_funcionario int NOT NULL,
  fk_unidade int NOT NULL,
  mes_referencia int NOT NULL,
  ano_referencia int NOT NULL,
  salario_base_atual DECIMAL(10,2) NOT NULL,
  total_proventos DECIMAL(10,2) NOT NULL,
  total_descontos DECIMAL(10,2) NOT NULL,
  valor_liquido DECIMAL(10,2) NOT NULL,
  status_folha ENUM('Aberto', 'Fechado', 'Pago', 'Cancelado') DEFAULT 'Aberto',
  FOREIGN KEY (fk_funcionario) REFERENCES tb_funcionarios(fk_pessoa),
  FOREIGN KEY (fk_unidade) REFERENCES tb_unidades(pk_unidade),
  UNIQUE (fk_funcionario, mes_referencia, ano_referencia)
);

CREATE TABLE tb_eventos_folha (
  pk_eventos int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_folha int NOT NULL,
  fk_beneficio int NULL,
  descricao_evento VARCHAR(130) NOT NULL,
  tipo_evento ENUM('Provento', 'Desconto') NOT NULL,
  valor_evento DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (fk_folha) REFERENCES tb_folha_pagamento(pk_folha),
  FOREIGN KEY (fk_beneficio) REFERENCES tb_beneficio(pk_beneficio)
);


CREATE TABLE tb_ponto_eletronico (
  fk_funcionario int NOT NULL,
  data_registro DATE NOT NULL,
  hora_entrada TIME NOT NULL,
  saida_intervalo TIME NULL,
  volta_intervalo TIME NULL,
  hora_saida TIME NULL,
  total_hr_dias TIME NOT NULL DEFAULT '00:00:00',
  status_ponto ENUM('Normal', 'Falta', 'Atraso', 'Hora extra', 'Justificado') DEFAULT 'Normal',
  observacao VARCHAR(150),
  PRIMARY KEY (fk_funcionario, data_registro),
  FOREIGN KEY (fk_funcionario) REFERENCES tb_funcionarios(fk_pessoa)
);
