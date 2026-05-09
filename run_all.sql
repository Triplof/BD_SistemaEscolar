-- Script unificado de instalação do projeto
-- Execute a partir da raiz: mysql -u root -p < install.sql


-- FASE 1: DDL - Estrutura e Dados
SOURCE DDL/sistema_gestao_escolar.sql;
SOURCE DDL/seed_dados_massivos.sql;
SOURCE DDL/indices_explain.sql;


-- FASE 2: OLAP - OLAP
SOURCE OLAP/1.Gerar_Fato.sql;
SOURCE OLAP/2.Seed_Dados.sql;
SOURCE OLAP/3.Carga_OLAP.sql;
SOURCE OLAP/4.Carga_Fato.sql;
SOURCE OLAP/5.Validacao.sql;
SOURCE OLAP/6.Consulta_Analitica.sql;