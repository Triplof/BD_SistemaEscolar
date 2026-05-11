# 🏫 Sistema de Gestão Escolar — Banco de Dados

> Modelo relacional completo para gestão de instituições de ensino — com camada analítica OLAP (Star Schema) para relatórios de faturamento. Do cadastro de alunos ao fluxo de caixa, passando por RH, folha de pagamento, controle acadêmico e BI.

---

## 📋 Sumário

- [Visão Geral](#-visão-geral)
- [Arquitetura: OLTP + OLAP](#-arquitetura-oltp--olap)
- [Estrutura do Banco OLTP](#-estrutura-do-banco-oltp)
- [Módulos OLTP](#-módulos-oltp)
- [Camada OLAP — Star Schema](#-camada-olap--star-schema)
- [Arquivos do Projeto](#-arquivos-do-projeto)
- [Como Usar](#-como-usar)
- [Índices e Otimização](#-índices-e-otimização)
- [Diagrama Simplificado](#-diagrama-simplificado)
- [Diagrama de Entidade e Relacionamento](https://dbdiagram.io/d/Sistema_Academico-69fd3d5254a51d93d3c67726)
---

## 🎯 Visão Geral

O **Sistema de Gestão Escolar** é um banco de dados relacional modelado em **MySQL**, projetado para suportar as operações completas de uma ou mais instituições de ensino. A arquitetura suporta múltiplas unidades sob uma mesma instituição, com isolamento de dados por unidade e compartilhamento de recursos onde necessário.

O projeto vai além do OLTP tradicional: inclui uma **camada analítica OLAP** com Star Schema para consolidação e análise de dados financeiros via Data Warehouse.

| Atributo | Detalhe |
|---|---|
| **SGBD** | MySQL 8+ |
| **Banco OLTP** | `gestao_escolar` |
| **Total de tabelas OLTP** | 43 |
| **Módulos OLTP** | 6 |
| **Camada OLAP** | Star Schema (1 fato + 4 dimensões) |
| **Suporte multi-unidade** | ✅ |
| **Dados de massa incluídos** | ✅ |
| **Índices de performance** | ✅ 40+ índices |
| **SCD Tipo 2** | ✅ `dim_aluno` com histórico de mudanças |

---

## 🏗 Arquitetura: OLTP + OLAP

O projeto implementa duas camadas de banco de dados com propósitos distintos:

```
┌─────────────────────────────────────────────────────────┐
│                    OLTP (Operacional)                   │
│           gestao_escolar — 43 tabelas normalizadas      │
│   Matrículas │ Notas │ Mensalidades │ RH │ Financeiro   │
└──────────────────────────┬──────────────────────────────┘
                           │  ETL (scripts 3 e 4)
                           │  extrai, transforma e carrega
                           ▼
┌─────────────────────────────────────────────────────────┐
│                    OLAP (Analítico)                     │
│              Star Schema — 1 fato + 4 dimensões         │
│                                                         │
│   dim_tempo ──┐                                         │
│   dim_aluno ──┤──▶ fato_pagamento                       │
│   dim_unidade─┤     (1 linha = 1 mensalidade)           │
│   dim_curso ──┘                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 🗂 Estrutura do Banco OLTP

O banco é dividido em **6 módulos funcionais**, cada um responsável por um domínio específico da instituição:

```
gestao_escolar
├── 📍 Contatos & Localização   (5 tabelas)
├── 🏛  Acadêmico – Infraestrutura (4 tabelas)
├── 👥 Recursos Humanos          (4 tabelas)
├── 🎓 Acadêmico – Operacional  (15 tabelas)
├── 💰 Financeiro                (8 tabelas)
└── 🧾 Folha de Pagamento        (5 tabelas)
                               ─────────────
                               43 tabelas no total
```

---

## 📦 Módulos OLTP

### 📍 Contatos & Localização
Base compartilhada por todas as pessoas do sistema (alunos, professores, funcionários, responsáveis).

| Tabela | Descrição |
|---|---|
| `tb_pessoa` | Dados pessoais: CPF, nome, data de nascimento, sexo |
| `tb_endereco` | Logradouros com CEP, cidade, estado |
| `tb_pessoa_endereco` | Relacionamento N:N pessoa ↔ endereço |
| `tb_telefone` | Telefones (celular/fixo) vinculados à pessoa |
| `tb_email` | E-mails (pessoal/institucional) vinculados à pessoa |

---

### 🏛 Acadêmico – Infraestrutura
Estrutura física e organizacional da instituição.

| Tabela | Descrição |
|---|---|
| `tb_instituicao` | Tipo de instituição (Escola, Universidade, ONG...) e categoria administrativa |
| `tb_unidades` | Unidades/campi com CNPJ, contato e endereço próprios |
| `tb_salas` | Salas por unidade com capacidade |
| `tb_turnos` | Turnos de funcionamento por unidade |

---

### 👥 Recursos Humanos
Gestão de colaboradores, cargos e estrutura organizacional.

| Tabela | Descrição |
|---|---|
| `tb_departamento` | Departamentos por unidade |
| `tb_cargos` | Cargos vinculados a departamentos, com CBO e faixa salarial |
| `tb_funcionarios` | Funcionários: matrícula, PIS, regime CLT/PJ, salário, situação |
| `tb_professor` | Especialização de funcionário como professor, com formação e registro MEC |

---

### 🎓 Acadêmico – Operacional
O coração do sistema: cursos, turmas, matrículas, notas e faltas.

| Tabela | Descrição |
|---|---|
| `tb_cursos` | Cursos oferecidos pela instituição |
| `tb_disciplina` | Disciplinas com carga horária e ementa |
| `tb_unidades_cursos` | Associação unidade ↔ curso com coordenador responsável |
| `tb_alunos` | Alunos com RA, situação e dados de ingresso |
| `tb_responsaveis` | Responsáveis legais dos alunos |
| `tb_responsaveis_alunos` | Vínculo N:N responsável ↔ aluno com grau de parentesco |
| `tb_grade_curricular` | Disciplinas obrigatórias/optativas por curso e semestre |
| `tb_grade_horaria` | Aulas: professor, sala, disciplina, dias e horários |
| `tb_periodos_letivos` | Períodos (semestres, anos) por unidade |
| `tb_turmas` | Turmas: turno, sala, período, curso e capacidade |
| `tb_matriculas` | Matrículas de alunos nas turmas |
| `tb_matricula_componentes` | Componentes curriculares de cada matrícula |
| `tb_avaliacoes` | Avaliações definidas por turma/disciplina |
| `tb_notas` | Notas dos alunos por avaliação |
| `tb_faltas` | Registro de faltas por vínculo e data |

---

### 💰 Financeiro
Contratos, mensalidades, descontos e fluxo de caixa.

| Tabela | Descrição |
|---|---|
| `tb_forma_pagamento` | Formas de pagamento aceitas |
| `tb_descontos` | Políticas de desconto (bolsa, convênio, pontualidade) |
| `tb_contratos_educacionais` | Contrato financeiro da matrícula |
| `tb_mensalidades` | Parcelas mensais com status (Pago/Pendente/Atrasado) |
| `tb_categorias_financeiras` | Categorias de receitas e despesas |
| `tb_fluxo_caixa` | Movimentações financeiras com saldo em tempo real |

---

### 🧾 Folha de Pagamento
Remuneração, benefícios, eventos e ponto eletrônico.

| Tabela | Descrição |
|---|---|
| `tb_beneficio` | Benefícios disponíveis (vale-transporte, plano de saúde...) |
| `tb_func_beneficio` | Benefícios ativos por funcionário |
| `tb_folha_pagamento` | Folha mensal: salário base, proventos, descontos, líquido |
| `tb_eventos_folha` | Eventos individuais que compõem a folha |
| `tb_ponto_eletronico` | Registro de entrada/saída por funcionário |

---

## 🔭 Camada OLAP — Star Schema

### Modelo dimensional

A tabela fato e suas dimensões foram projetadas para análises de **faturamento e inadimplência**, com granularidade de uma linha por mensalidade.

#### `fato_pagamento`
Tabela central do Star Schema. Cada linha representa uma mensalidade vinculada ao seu contexto dimensional completo.

| Coluna | Tipo | Descrição |
|---|---|---|
| `sk_pagamento` | BIGINT PK | Surrogate key da fato |
| `sk_tempo` | INT FK | Data de vencimento da parcela |
| `sk_aluno` | INT FK | Aluno responsável pelo pagamento |
| `sk_unidade` | INT FK | Unidade que gerou a mensalidade |
| `sk_curso` | INT FK | Curso vinculado ao contrato |
| `nk_mensalidade_id` | INT | Natural key (referência ao OLTP) |
| `valor_bruto` | DECIMAL | Valor original sem descontos |
| `valor_desconto_aplicado` | DECIMAL | Total de descontos aplicados |
| `valor_liquido` | DECIMAL | Valor final cobrado |
| `num_parcela` | INT | Número da parcela no contrato |
| `status_pagamento` | VARCHAR | Pago / Pendente / Atrasado |

#### Dimensões

| Dimensão | Chave Natural | Destaques |
|---|---|---|
| `dim_tempo` | `data_completa` | 2020–2030 pré-gerado; dia, mês, trimestre, semestre, dia da semana, fim de semana |
| `dim_aluno` | `nk_aluno_id` | **SCD Tipo 2** — histórico de mudanças em cidade, estado e status de matrícula |
| `dim_unidade` | `nk_unidade_id` | CNPJ, cidade, estado, flag `ativo` |
| `dim_curso` | `nk_curso_id` | Tipo e categoria administrativa da instituição |

### SCD Tipo 2 — `dim_aluno`

A dimensão aluno implementa **Slowly Changing Dimension Tipo 2**: cada vez que cidade, estado ou status de matrícula mudam, uma nova linha é inserida com `dt_inicio` atual e `dt_fim` nulo. A linha anterior recebe `dt_fim` preenchido e `eh_corrente = FALSE`.

```sql
-- Consulta apenas o registro vigente de cada aluno
SELECT * FROM dim_aluno
WHERE eh_corrente = TRUE;
```

### Exemplo de consulta analítica

```sql
-- Faturamento líquido por mês (maior para menor)
SELECT
  d.nome_mes,
  SUM(f.valor_liquido) AS faturamento
FROM fato_pagamento f
JOIN dim_tempo d ON f.sk_tempo = d.sk_tempo
GROUP BY d.nome_mes
ORDER BY faturamento DESC;
```

### Validação OLTP × OLAP

O script `5_Validacao.sql` compara os totais entre as duas camadas para garantir integridade da carga:

```sql
SELECT 'OLTP' AS origem, COUNT(*), SUM(valor_bruto), SUM(valor_liquido)
FROM tb_mensalidades WHERE fk_contrato IS NOT NULL
UNION ALL
SELECT 'OLAP' AS origem, COUNT(*), SUM(valor_bruto), SUM(valor_liquido)
FROM fato_pagamento;
-- Os números devem ser idênticos ✅
```

---

## 📁 Arquivos do Projeto

### OLTP — Banco Operacional

| Arquivo | Descrição |
|---|---|
| `sistema_gestao_escolar.sql` | DDL completo: criação de todas as 43 tabelas com FK e constraints |
| `seed_dados_massivos.sql` | Carga de dados realistas em volume para testes e desenvolvimento |
| `Indices_Explain.sql` | Criação de 40+ índices + comparativo EXPLAIN antes/depois |
| `Reset_BD.sql` | Limpa todas as tabelas preservando a estrutura (TRUNCATE com FK check off) |

### OLAP — Data Warehouse

| Arquivo | Ordem | Descrição |
|---|---|---|
| `1_Gerar_Fato.sql` | 1º | DDL do Star Schema: `dim_tempo`, `dim_aluno`, `dim_unidade`, `dim_curso` e `fato_pagamento` |
| `2_Seed_Dados.sql` | 2º | Popula `dim_tempo` com todos os dias de 2020 a 2030 via CTE recursiva |
| `3_Carga_OLAP.sql` | 3º | ETL das dimensões: extrai dados do OLTP e carrega `dim_unidade`, `dim_curso` e `dim_aluno` |
| `4_Carga_Fato.sql` | 4º | ETL da fato: carrega `fato_pagamento` resolvendo todas as SKs via JOIN/subquery |
| `5_Validacao.sql` | 5º | Compara totais OLTP × OLAP (qtd, bruto, desconto, líquido) |
| `6_Consulta_Analitica.sql` | 6º | Exemplo de consulta analítica: faturamento por mês |
| `Reset.sql` | — | Limpa e recarrega todas as dimensões e a fato |

---

## 🚀 Como Usar

### É possivel utilizar o "run_all.sql" diretamente no terminal com 'mysql -u root -p < run_all.sql' para realizar toda criação do DDL e OLAP ou pode ser realizado manualmente seguindo esses passos:

### Parte 1 — OLTP (Banco Operacional)

**1. Criar o banco e as tabelas**
```sql
SOURCE sistema_gestao_escolar.sql;
```

**2. Popular com dados de teste**
```sql
SOURCE seed_dados_massivos.sql;
```

**3. Aplicar índices de performance**
```sql
SOURCE Indices_Explain.sql;
```

**4. Resetar o banco (quando necessário)**
```sql
SOURCE Reset_BD.sql;
```

---

### Parte 2 — OLAP (Data Warehouse)

> ⚠️ Execute obrigatoriamente nesta ordem. O OLTP deve estar populado antes.

**1. Criar o Star Schema**
```sql
SOURCE 1_Gerar_Fato.sql;
```

**2. Popular dim_tempo (2020–2030)**
```sql
SOURCE 2_Seed_Dados.sql;
-- Resultado esperado: 4018 linhas
```

**3. Carregar as dimensões (ETL)**
```sql
SOURCE 3_Carga_OLAP.sql;
-- Valida: total_unidades, total_cursos, total_alunos
```

**4. Carregar a tabela fato (ETL)**
```sql
SOURCE 4_Carga_Fato.sql;
-- Valida: total_linhas_fato e linhas_sem_curso (deve ser 0)
```

**5. Validar integridade OLTP × OLAP**
```sql
SOURCE 5_Validacao.sql;
-- Totais devem ser idênticos entre as duas origens
```

**6. Executar consultas analíticas**
```sql
SOURCE 6_Consulta_Analitica.sql;
```

**Resetar o DW (quando necessário)**
```sql
SOURCE Reset.sql;
```

---

## ⚡ Índices e Otimização

O projeto inclui uma estratégia de indexação detalhada, organizada por módulo, com comparação de performance usando `EXPLAIN` antes e depois da criação dos índices.

### Consultas otimizadas

| Consulta | Índice utilizado | Melhoria esperada |
|---|---|---|
| Alunos de uma turma | `idx_matricula_turma` | `type: ALL` → `type: ref` |
| Notas de um aluno | `idx_mc_matricula`, `idx_nota_vinculo` | Evita full scan em notas |
| Faltas por disciplina | `idx_falta_vinculo` | Redução drástica de linhas lidas |
| Grade de professor | `idx_grade_professor` | Acesso direto por FK |
| Mensalidades em aberto | `idx_mens_unidade_status` | Índice composto filtra 2 colunas |
| Folha de pagamento | `idx_folha_unidade_periodo` | Índice composto (unidade + ano + mês) |
| Fluxo de caixa | `idx_fluxo_unidade_data` | Range scan eficiente por data |

### Índices compostos estratégicos

```sql
-- Inadimplência: filtra por unidade + status de pagamento
idx_mens_unidade_status   ON tb_mensalidades (fk_unidade, status_pagamento)

-- Vencimentos: busca por aluno + data
idx_mens_aluno_vencimento ON tb_mensalidades (fk_aluno, data_vencimento)

-- Relatório de caixa: unidade + período
idx_fluxo_unidade_data    ON tb_fluxo_caixa (fk_unidade, data_movimento)

-- Folha mensal: unidade + ano + mês
idx_folha_unidade_periodo ON tb_folha_pagamento (fk_unidade, ano_referencia, mes_referencia)

-- Ponto eletrônico: funcionário + data
idx_ponto_func_data       ON tb_ponto_eletronico (fk_funcionario, data_registro)
```

---

## 🗺 Diagrama Simplificado

```
tb_instituicao
    └── tb_unidades ──── tb_salas
    │       └── tb_turnos
    │       └── tb_departamento ── tb_cargos ── tb_funcionarios
    │                                                   └── tb_professor
    └── tb_cursos
            └── tb_unidades_cursos
            └── tb_grade_curricular ── tb_disciplina
                                              └── tb_grade_horaria
                                              └── tb_avaliacoes
                                              
tb_pessoa ── tb_alunos ── tb_matriculas ── tb_matricula_componentes
   │                                              └── tb_notas
   │                                              └── tb_faltas
   └── tb_responsaveis ── tb_responsaveis_alunos

tb_matriculas ── tb_contratos_educacionais ── tb_mensalidades
                                                   └── tb_fluxo_caixa

tb_funcionarios ── tb_folha_pagamento ── tb_eventos_folha
               └── tb_func_beneficio
               └── tb_ponto_eletronico
```

---

## 📄 Licença

Projeto acadêmico. Sinta-se livre para usar, adaptar e estudar.
