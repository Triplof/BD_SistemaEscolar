-- ============================================================
-- SEED DE DADOS MASSIVOS - Sistema de Gestão Escolar
-- Gerado para testes de performance e funcionalidade
-- ============================================================

USE gestao_escolar;

SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';

-- ============================================================
-- MÓDULO: ENDEREÇOS (50 registros)
-- ============================================================

INSERT INTO tb_endereco (cep, estado, cidade, bairro, rua, numero, complemento) VALUES
('01310-100', 'SP', 'São Paulo', 'Bela Vista', 'Av. Paulista', '1000', 'Bloco A'),
('01310-200', 'SP', 'São Paulo', 'Consolação', 'Rua Augusta', '250', NULL),
('04038-001', 'SP', 'São Paulo', 'Vila Clementino', 'Rua Napoleão de Barros', '321', 'Apto 12'),
('20040-020', 'RJ', 'Rio de Janeiro', 'Centro', 'Av. Rio Branco', '156', NULL),
('30130-110', 'MG', 'Belo Horizonte', 'Centro', 'Av. Afonso Pena', '750', 'Sala 5'),
('41820-021', 'BA', 'Salvador', 'Pituba', 'Av. Tancredo Neves', '805', NULL),
('80020-180', 'PR', 'Curitiba', 'Centro', 'Rua XV de Novembro', '500', NULL),
('90010-272', 'RS', 'Porto Alegre', 'Centro Histórico', 'Rua dos Andradas', '1234', NULL),
('69005-140', 'AM', 'Manaus', 'Centro', 'Av. Sete de Setembro', '400', NULL),
('60160-120', 'CE', 'Fortaleza', 'Aldeota', 'Av. Santos Dumont', '1700', 'Bloco B'),
('01001-000', 'SP', 'São Paulo', 'Sé', 'Praça da Sé', '1', NULL),
('04520-000', 'SP', 'São Paulo', 'Brooklin', 'Av. Engenheiro Luís Carlos Berrini', '100', NULL),
('04571-000', 'SP', 'São Paulo', 'Granja Julieta', 'Av. das Nações Unidas', '12901', NULL),
('05002-020', 'SP', 'São Paulo', 'Perdizes', 'Rua Turiassu', '200', NULL),
('08411-120', 'SP', 'São Paulo', 'Itaquera', 'Rua Padre Estevão Pernet', '50', NULL),
('01153-000', 'SP', 'São Paulo', 'Barra Funda', 'Av. Marquês de São Vicente', '89', NULL),
('04094-050', 'SP', 'São Paulo', 'Jabaquara', 'Rua Jabaquara', '600', NULL),
('09040-000', 'SP', 'Santo André', 'Centro', 'Rua Coronel Oliveira Lima', '22', NULL),
('09190-615', 'SP', 'Santo André', 'Vila Luzita', 'Av. Industrial', '300', NULL),
('09750-730', 'SP', 'São Bernardo do Campo', 'Centro', 'Rua Marechal Deodoro', '50', NULL),
('13013-001', 'SP', 'Campinas', 'Centro', 'Av. Campos Sales', '800', NULL),
('13087-080', 'SP', 'Campinas', 'Jardim Paraíso', 'Rua José Paulino', '350', NULL),
('14015-000', 'SP', 'Ribeirão Preto', 'Centro', 'Av. Jerônimo Gonçalves', '55', NULL),
('12220-000', 'SP', 'São José dos Campos', 'Centro', 'Rua Sete de Setembro', '400', NULL),
('11015-201', 'SP', 'Santos', 'Centro', 'Rua XV de Novembro', '95', 'Cobertura'),
('20050-060', 'RJ', 'Rio de Janeiro', 'Centro', 'Rua do Catete', '341', NULL),
('22071-900', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Av. Atlântica', '2200', NULL),
('22290-160', 'RJ', 'Rio de Janeiro', 'Botafogo', 'Rua Voluntários da Pátria', '190', NULL),
('24020-005', 'RJ', 'Niterói', 'Centro', 'Rua Visconde do Rio Branco', '710', NULL),
('25655-000', 'RJ', 'Petrópolis', 'Centro', 'Rua do Imperador', '300', NULL),
('31270-010', 'MG', 'Belo Horizonte', 'Santa Efigênia', 'Av. Cristóvão Colombo', '910', NULL),
('32600-000', 'MG', 'Betim', 'Centro', 'Praça Juiz Nelson', '150', NULL),
('36036-110', 'MG', 'Juiz de Fora', 'Centro', 'Av. Barão do Rio Branco', '2000', NULL),
('40301-000', 'BA', 'Salvador', 'Barra', 'Av. Oceânica', '111', NULL),
('44001-000', 'BA', 'Feira de Santana', 'Centro', 'Rua 15 de Novembro', '300', NULL),
('49010-000', 'SE', 'Aracaju', 'Centro', 'Av. Ivo do Prado', '500', NULL),
('51020-220', 'PE', 'Recife', 'Boa Viagem', 'Av. Conselheiro Aguiar', '900', NULL),
('58013-000', 'PB', 'João Pessoa', 'Tambaú', 'Av. Epitácio Pessoa', '1200', NULL),
('59025-000', 'RN', 'Natal', 'Tirol', 'Av. Hermes da Fonseca', '800', NULL),
('64000-000', 'PI', 'Teresina', 'Centro', 'Av. Frei Serafim', '2300', NULL),
('65010-000', 'MA', 'São Luís', 'Centro', 'Av. Dom Pedro II', '180', NULL),
('66040-080', 'PA', 'Belém', 'Nazaré', 'Tv. Padre Eutíquio', '220', NULL),
('68906-441', 'AP', 'Macapá', 'Central', 'Av. Mendonça Furtado', '3650', NULL),
('76801-059', 'RO', 'Porto Velho', 'Centro', 'Av. Sete de Setembro', '674', NULL),
('79002-200', 'MS', 'Campo Grande', 'Centro', 'Av. Afonso Pena', '1234', NULL),
('74005-010', 'GO', 'Goiânia', 'Setor Central', 'Av. Goiás', '250', NULL),
('70040-010', 'DF', 'Brasília', 'Asa Norte', 'SQN 208', 'Bloco K', 'Apt 302'),
('72015-810', 'DF', 'Brasília', 'Taguatinga', 'QNG 11', '5', NULL),
('77020-014', 'TO', 'Palmas', 'Centro', 'Av. JK', '400', NULL),
('69900-010', 'AC', 'Rio Branco', 'Centro', 'Av. Getúlio Vargas', '300', NULL);


-- ============================================================
-- MÓDULO: PESSOAS (120 registros)
-- ============================================================

INSERT INTO tb_pessoa (cpf, nome, sobrenome, dt_nascimento, sexo) VALUES
-- Funcionários / Professores (1-40)
('11122233301', 'Carlos', 'Andrade Silva', '1975-03-15', 'Masculino'),
('22233344402', 'Maria', 'Oliveira Santos', '1980-07-22', 'Feminino'),
('33344455503', 'João', 'Ferreira Costa', '1968-11-08', 'Masculino'),
('44455566604', 'Ana', 'Rodrigues Lima', '1985-04-30', 'Feminino'),
('55566677705', 'Pedro', 'Almeida Souza', '1972-09-14', 'Masculino'),
('66677788806', 'Juliana', 'Pereira Martins', '1990-01-25', 'Feminino'),
('77788899907', 'Roberto', 'Nascimento Cruz', '1978-06-03', 'Masculino'),
('88899900008', 'Fernanda', 'Barbosa Gomes', '1983-12-17', 'Feminino'),
('99900011109', 'Marcelo', 'Carvalho Dias', '1965-08-09', 'Masculino'),
('10011122210', 'Patrícia', 'Melo Araújo', '1987-02-28', 'Feminino'),
('10122233311', 'Lucas', 'Teixeira Mendes', '1991-05-12', 'Masculino'),
('10233344412', 'Camila', 'Ribeiro Cardoso', '1979-10-07', 'Feminino'),
('10344455513', 'Rafael', 'Lopes Freitas', '1984-03-21', 'Masculino'),
('10455566614', 'Beatriz', 'Marques Torres', '1992-08-14', 'Feminino'),
('10566677715', 'Daniel', 'Moura Figueiredo', '1970-12-05', 'Masculino'),
('10677788816', 'Larissa', 'Pinto Correia', '1988-06-19', 'Feminino'),
('10788899917', 'Eduardo', 'Rocha Miranda', '1975-01-11', 'Masculino'),
('10899900018', 'Vanessa', 'Azevedo Campos', '1982-04-03', 'Feminino'),
('10900011119', 'Thiago', 'Cavalcante Pacheco', '1993-09-27', 'Masculino'),
('11011122220', 'Isabela', 'Nunes Cunha', '1977-07-16', 'Feminino'),
('11122233321', 'Fábio', 'Monteiro Vieira', '1969-02-08', 'Masculino'),
('11233344422', 'Aline', 'Sampaio Braga', '1986-11-23', 'Feminino'),
('11344455523', 'Gustavo', 'Vieira Nogueira', '1974-05-31', 'Masculino'),
('11455566624', 'Tatiana', 'Borges Macedo', '1981-10-14', 'Feminino'),
('11566677725', 'Rodrigo', 'Peixoto Farias', '1995-03-07', 'Masculino'),
('11677788826', 'Priscila', 'Castro Paiva', '1983-08-22', 'Feminino'),
('11788899927', 'Alexandre', 'Siqueira Ramos', '1967-01-30', 'Masculino'),
('11899900028', 'Renata', 'Franco Guimarães', '1989-06-13', 'Feminino'),
('11900011129', 'Henrique', 'Batista Coelho', '1971-11-09', 'Masculino'),
('12011122230', 'Mariana', 'Lacerda Medeiros', '1994-04-25', 'Feminino'),
('12122233331', 'Vitor', 'Andrade Santana', '1976-09-18', 'Masculino'),
('12233344432', 'Amanda', 'Leite Carneiro', '1985-02-10', 'Feminino'),
('12344455533', 'Marcos', 'Cunha Tavares', '1980-07-03', 'Masculino'),
('12455566634', 'Cristina', 'Valente Queiroz', '1973-12-27', 'Feminino'),
('12566677735', 'Felipe', 'Duarte Matos', '1990-05-16', 'Masculino'),
('12677788836', 'Elaine', 'Neves Xavier', '1978-10-09', 'Feminino'),
('12788899937', 'Sérgio', 'Fontes Dantas', '1963-03-02', 'Masculino'),
('12899900038', 'Cláudia', 'Esteves Prado', '1987-08-15', 'Feminino'),
('12900011139', 'Leonardo', 'Bezerra Moraes', '1992-01-28', 'Masculino'),
('13011122240', 'Adriana', 'Sousa Vasconcelos', '1982-06-20', 'Feminino'),
-- Alunos (41-120)
('13122233341', 'Mateus', 'Oliveira Azevedo', '2005-04-11', 'Masculino'),
('13233344442', 'Sophia', 'Santos Barbosa', '2006-09-03', 'Feminino'),
('13344455543', 'Enzo', 'Ferreira Carvalho', '2005-01-17', 'Masculino'),
('13455566644', 'Emily', 'Costa Corrêa', '2007-05-29', 'Feminino'),
('13566677745', 'Gabriel', 'Almeida Dias', '2006-11-08', 'Masculino'),
('13677788846', 'Valentina', 'Souza Fonseca', '2005-03-22', 'Feminino'),
('13788899947', 'Arthur', 'Lima Gomes', '2007-07-14', 'Masculino'),
('13899900048', 'Isabella', 'Martins Guimarães', '2006-12-01', 'Feminino'),
('13900011149', 'Davi', 'Rodrigues Leal', '2005-06-19', 'Masculino'),
('14011122250', 'Alice', 'Cruz Macedo', '2007-02-07', 'Feminino'),
('14122233351', 'Pedro', 'Gomes Matos', '2005-08-25', 'Masculino'),
('14233344452', 'Manuela', 'Araújo Medeiros', '2006-04-13', 'Feminino'),
('14344455553', 'Lucas', 'Barros Mendes', '2007-10-31', 'Masculino'),
('14455566654', 'Júlia', 'Melo Miranda', '2005-12-18', 'Feminino'),
('14566677755', 'Miguel', 'Nascimento Moraes', '2006-07-06', 'Masculino'),
('14677788856', 'Laura', 'Cardoso Moreno', '2007-01-24', 'Feminino'),
('14788899957', 'Bernardo', 'Dias Neves', '2005-09-11', 'Masculino'),
('14899900058', 'Luísa', 'Freitas Nogueira', '2006-03-29', 'Feminino'),
('14900011159', 'Samuel', 'Torres Oliveira', '2007-08-16', 'Masculino'),
('15011122260', 'Heloísa', 'Mendes Paiva', '2005-05-04', 'Feminino'),
('15122233361', 'Nicolas', 'Rocha Pereira', '2006-10-22', 'Masculino'),
('15233344462', 'Maria', 'Pinto Ramos', '2007-04-09', 'Feminino'),
('15344455563', 'João', 'Siqueira Ribeiro', '2005-02-27', 'Masculino'),
('15455566664', 'Lara', 'Soares Rodrigues', '2006-06-14', 'Feminino'),
('15566677765', 'Guilherme', 'Tavares Santana', '2007-12-02', 'Masculino'),
('15677788866', 'Yasmin', 'Alves Santos', '2005-07-20', 'Feminino'),
('15788899967', 'Cauã', 'Braga Silva', '2006-01-07', 'Masculino'),
('15899900068', 'Mariana', 'Castro Sousa', '2007-05-25', 'Feminino'),
('15900011169', 'Vinicius', 'Carvalho Teixeira', '2005-11-12', 'Masculino'),
('16011122270', 'Bianca', 'Coelho Torres', '2006-08-30', 'Feminino'),
('16122233371', 'Rafael', 'Corrêa Valente', '2007-03-17', 'Masculino'),
('16233344472', 'Clara', 'Costa Vieira', '2005-10-05', 'Feminino'),
('16344455573', 'Felipe', 'Cunha Xavier', '2006-02-22', 'Masculino'),
('16455566674', 'Letícia', 'Dantas Barbosa', '2007-09-10', 'Feminino'),
('16566677775', 'Thiago', 'Esteves Batista', '2005-04-28', 'Masculino'),
('16677788876', 'Fernanda', 'Farias Bezerra', '2006-11-15', 'Feminino'),
('16788899977', 'Breno', 'Fonseca Borges', '2007-06-02', 'Masculino'),
('16899900078', 'Isadora', 'Franco Campos', '2005-08-20', 'Feminino'),
('16900011179', 'Diego', 'Freitas Carneiro', '2006-03-07', 'Masculino'),
('17011122280', 'Ana', 'Gomes Castro', '2007-10-25', 'Feminino'),
('17122233381', 'André', 'Guimarães Coelho', '2005-05-13', 'Masculino'),
('17233344482', 'Nathalia', 'Lacerda Corrêa', '2006-12-30', 'Feminino'),
('17344455583', 'Igor', 'Leal Cunha', '2007-07-18', 'Masculino'),
('17455566684', 'Pamela', 'Leite Dantas', '2005-01-05', 'Feminino'),
('17566677785', 'Kaue', 'Lima Dias', '2006-06-23', 'Masculino'),
('17677788886', 'Rebeca', 'Lopes Duarte', '2007-02-10', 'Feminino'),
('17788899987', 'Nathan', 'Macedo Esteves', '2005-09-28', 'Masculino'),
('17899900088', 'Gabriela', 'Marques Farias', '2006-04-15', 'Feminino'),
('17900011189', 'Leonardo', 'Medeiros Fonseca', '2007-11-03', 'Masculino'),
('18011122290', 'Camila', 'Mendes Franco', '2005-06-21', 'Feminino'),
-- Responsáveis (101-120)
('18122233391', 'Roberto', 'Azevedo Oliveira', '1970-02-14', 'Masculino'),
('18233344492', 'Sandra', 'Borges Santos', '1972-08-30', 'Feminino'),
('18344455593', 'Paulo', 'Carvalho Ferreira', '1968-05-19', 'Masculino'),
('18455566694', 'Vera', 'Corrêa Costa', '1975-11-07', 'Feminino'),
('18566677795', 'Antônio', 'Dias Almeida', '1965-03-25', 'Masculino'),
('18677788896', 'Lúcia', 'Duarte Souza', '1978-09-12', 'Feminino'),
('18788899997', 'Francisco', 'Esteves Lima', '1962-12-01', 'Masculino'),
('18899900098', 'Tereza', 'Farias Rodrigues', '1980-04-18', 'Feminino'),
('18900011199', 'Manoel', 'Fonseca Cruz', '1967-10-06', 'Masculino'),
('19011122200', 'Marta', 'Franco Gomes', '1973-06-24', 'Feminino'),
('19122233301', 'José', 'Guimarães Araújo', '1960-01-11', 'Masculino'),
('19233344402', 'Rosana', 'Lacerda Melo', '1976-07-29', 'Feminino'),
('19344455503', 'Carlos', 'Leal Pereira', '1969-02-16', 'Masculino'),
('19455566604', 'Mônica', 'Leite Nascimento', '1971-08-04', 'Feminino'),
('19566677705', 'Flávio', 'Lima Rocha', '1974-12-22', 'Masculino'),
('19677788806', 'Solange', 'Lopes Pinto', '1979-05-10', 'Feminino'),
('19788899907', 'Edson', 'Macedo Siqueira', '1963-11-28', 'Masculino'),
('19899900008', 'Sueli', 'Marques Soares', '1981-03-15', 'Feminino'),
('19900011109', 'Valmir', 'Medeiros Tavares', '1966-09-02', 'Masculino'),
('20011122210', 'Elza', 'Mendes Alves', '1977-04-20', 'Feminino');


-- ============================================================
-- MÓDULO: TELEFONES
-- ============================================================

INSERT INTO tb_telefone (fk_pessoa, numero_telefone, tipo_telefone) VALUES
(1, '(11) 98765-4321', 'Celular'), (1, '(11) 3456-7890', 'Fixo'),
(2, '(11) 97654-3210', 'Celular'), (3, '(11) 96543-2109', 'Celular'),
(4, '(21) 98765-1234', 'Celular'), (5, '(31) 97890-5678', 'Celular'),
(6, '(11) 95432-1098', 'Celular'), (7, '(11) 94321-0987', 'Celular'),
(8, '(41) 93210-9876', 'Celular'), (9, '(51) 92109-8765', 'Celular'),
(10, '(85) 91098-7654', 'Celular'), (11, '(11) 90987-6543', 'Celular'),
(12, '(11) 99876-5432', 'Celular'), (13, '(21) 98765-4321', 'Celular'),
(14, '(31) 97654-3210', 'Celular'), (15, '(11) 96543-2109', 'Celular'),
(16, '(11) 95432-1098', 'Celular'), (17, '(41) 94321-0987', 'Celular'),
(18, '(51) 93210-9876', 'Celular'), (19, '(11) 92109-8765', 'Celular'),
(20, '(11) 91098-7654', 'Celular'), (21, '(11) 90987-6543', 'Celular'),
(22, '(85) 99876-5432', 'Celular'), (23, '(11) 98765-9876', 'Celular'),
(24, '(21) 97654-8765', 'Celular'), (25, '(11) 96543-7654', 'Celular'),
(41, '(11) 98001-0001', 'Celular'), (42, '(11) 98002-0002', 'Celular'),
(43, '(11) 98003-0003', 'Celular'), (44, '(11) 98004-0004', 'Celular'),
(45, '(11) 98005-0005', 'Celular'), (46, '(11) 98006-0006', 'Celular'),
(47, '(11) 98007-0007', 'Celular'), (48, '(11) 98008-0008', 'Celular'),
(49, '(11) 98009-0009', 'Celular'), (50, '(11) 98010-0010', 'Celular'),
(101, '(11) 99101-0101', 'Celular'), (102, '(11) 99102-0102', 'Celular'),
(103, '(11) 99103-0103', 'Celular'), (104, '(11) 99104-0104', 'Celular'),
(105, '(11) 99105-0105', 'Celular'), (106, '(11) 99106-0106', 'Celular'),
(107, '(11) 99107-0107', 'Celular'), (108, '(11) 99108-0108', 'Celular'),
(109, '(11) 99109-0109', 'Celular'), (110, '(11) 99110-0110', 'Celular');


-- ============================================================
-- MÓDULO: E-MAILS
-- ============================================================

INSERT INTO tb_email (fk_pessoa, email, tipo_email) VALUES
(1, 'carlos.andrade@escola.edu.br', 'Institucional'), (1, 'carlos.andrade@gmail.com', 'Pessoal'),
(2, 'maria.oliveira@escola.edu.br', 'Institucional'), (2, 'maria.oliveira@gmail.com', 'Pessoal'),
(3, 'joao.ferreira@escola.edu.br', 'Institucional'),
(4, 'ana.rodrigues@escola.edu.br', 'Institucional'),
(5, 'pedro.almeida@escola.edu.br', 'Institucional'),
(6, 'juliana.pereira@escola.edu.br', 'Institucional'),
(7, 'roberto.nascimento@escola.edu.br', 'Institucional'),
(8, 'fernanda.barbosa@escola.edu.br', 'Institucional'),
(9, 'marcelo.carvalho@escola.edu.br', 'Institucional'),
(10, 'patricia.melo@escola.edu.br', 'Institucional'),
(11, 'lucas.teixeira@escola.edu.br', 'Institucional'),
(12, 'camila.ribeiro@escola.edu.br', 'Institucional'),
(13, 'rafael.lopes@escola.edu.br', 'Institucional'),
(14, 'beatriz.marques@escola.edu.br', 'Institucional'),
(15, 'daniel.moura@escola.edu.br', 'Institucional'),
(16, 'larissa.pinto@escola.edu.br', 'Institucional'),
(17, 'eduardo.rocha@escola.edu.br', 'Institucional'),
(18, 'vanessa.azevedo@escola.edu.br', 'Institucional'),
(19, 'thiago.cavalcante@escola.edu.br', 'Institucional'),
(20, 'isabela.nunes@escola.edu.br', 'Institucional'),
(41, 'mateus.oliveira@aluno.escola.edu.br', 'Institucional'),
(42, 'sophia.santos@aluno.escola.edu.br', 'Institucional'),
(43, 'enzo.ferreira@aluno.escola.edu.br', 'Institucional'),
(44, 'emily.costa@aluno.escola.edu.br', 'Institucional'),
(45, 'gabriel.almeida@aluno.escola.edu.br', 'Institucional'),
(46, 'valentina.souza@aluno.escola.edu.br', 'Institucional'),
(47, 'arthur.lima@aluno.escola.edu.br', 'Institucional'),
(48, 'isabella.martins@aluno.escola.edu.br', 'Institucional'),
(49, 'davi.rodrigues@aluno.escola.edu.br', 'Institucional'),
(50, 'alice.cruz@aluno.escola.edu.br', 'Institucional');


-- ============================================================
-- MÓDULO: PESSOA ENDEREÇO
-- ============================================================

INSERT INTO tb_pessoa_endereco (fk_pessoa, fk_endereco, principal) VALUES
(1, 1, true), (2, 2, true), (3, 3, true), (4, 4, true), (5, 5, true),
(6, 6, true), (7, 7, true), (8, 8, true), (9, 9, true), (10, 10, true),
(11, 11, true), (12, 12, true), (13, 13, true), (14, 14, true), (15, 15, true),
(16, 16, true), (17, 17, true), (18, 18, true), (19, 19, true), (20, 20, true),
(21, 21, true), (22, 22, true), (23, 23, true), (24, 24, true), (25, 25, true),
(26, 26, true), (27, 27, true), (28, 28, true), (29, 29, true), (30, 30, true),
(41, 1, true), (42, 2, true), (43, 3, true), (44, 4, true), (45, 5, true),
(46, 6, true), (47, 7, true), (48, 8, true), (49, 9, true), (50, 10, true),
(51, 11, true), (52, 12, true), (53, 13, true), (54, 14, true), (55, 15, true),
(56, 16, true), (57, 17, true), (58, 18, true), (59, 19, true), (60, 20, true),
(61, 1, true), (62, 2, true), (63, 3, true), (64, 4, true), (65, 5, true),
(66, 6, true), (67, 7, true), (68, 8, true), (69, 9, true), (70, 10, true),
(71, 11, true), (72, 12, true), (73, 13, true), (74, 14, true), (75, 15, true),
(76, 16, true), (77, 17, true), (78, 18, true), (79, 19, true), (80, 20, true),
(101, 21, true), (102, 22, true), (103, 23, true), (104, 24, true), (105, 25, true),
(106, 26, true), (107, 27, true), (108, 28, true), (109, 29, true), (110, 30, true);


-- ============================================================
-- MÓDULO: INSTITUIÇÃO E UNIDADES
-- ============================================================

INSERT INTO tb_instituicao (tipo_instituicao, tipo_categoria_adm) VALUES
('Escola', 'Privada'),
('Universidade', 'Privada'),
('Escola', 'Publica');

INSERT INTO tb_endereco (cep, estado, cidade, bairro, rua, numero, complemento) VALUES
('01310-300', 'SP', 'São Paulo', 'Bela Vista', 'Av. Paulista', '2000', 'Sede'),
('04020-000', 'SP', 'São Paulo', 'Vila Mariana', 'Rua Domingos de Morais', '500', NULL),
('09010-160', 'SP', 'Santo André', 'Centro', 'Av. Industrial', '1500', NULL),
('13010-050', 'SP', 'Campinas', 'Cambuí', 'Av. José de Souza Campos', '800', NULL);

INSERT INTO tb_unidades (fk_instituicao, fk_endereco, nome_unidade, cnpj_unidade, telefone_contata, email_contato, ativo) VALUES
(1, 51, 'Escola Excelência - Unidade Paulista', '12.345.678/0001-01', '(11) 3000-0001', 'paulista@escolaexcelencia.com.br', true),
(1, 52, 'Escola Excelência - Unidade Vila Mariana', '12.345.678/0002-02', '(11) 3000-0002', 'vilamariana@escolaexcelencia.com.br', true),
(2, 53, 'Universidade Progresso - Campus Santo André', '98.765.432/0001-01', '(11) 4000-0001', 'santoandre@uniprogresso.edu.br', true),
(3, 54, 'EMEF Prof. João Pessoa', '11.222.333/0001-01', '(19) 3100-0001', 'emef.joaopessoa@campinas.sp.gov.br', true);


-- ============================================================
-- MÓDULO: SALAS
-- ============================================================

INSERT INTO tb_salas (fk_unidade, nome_sala, capacidade_sala) VALUES
(1, 'Sala 101', 35), (1, 'Sala 102', 35), (1, 'Sala 103', 30),
(1, 'Sala 201', 40), (1, 'Sala 202', 40), (1, 'Laboratório de Informática', 30),
(1, 'Laboratório de Ciências', 25), (1, 'Auditório', 100),
(2, 'Sala A', 35), (2, 'Sala B', 35), (2, 'Sala C', 30),
(2, 'Laboratório de Artes', 20), (2, 'Sala de Música', 25),
(3, 'Sala 01', 50), (3, 'Sala 02', 50), (3, 'Sala 03', 45),
(3, 'Laboratório de Química', 30), (3, 'Laboratório de Física', 30),
(4, 'Sala Amarela', 30), (4, 'Sala Azul', 30), (4, 'Sala Verde', 30);


-- ============================================================
-- MÓDULO: TURNOS
-- ============================================================

INSERT INTO tb_turnos (fk_unidade, nome_turno, hora_inicio, hora_fim) VALUES
(1, 'Manhã', '07:00:00', '12:00:00'),
(1, 'Tarde', '13:00:00', '18:00:00'),
(1, 'Noite', '19:00:00', '22:30:00'),
(2, 'Manhã', '07:30:00', '11:30:00'),
(2, 'Tarde', '13:30:00', '17:30:00'),
(3, 'Manhã', '08:00:00', '12:00:00'),
(3, 'Tarde', '13:00:00', '17:00:00'),
(3, 'Noite', '19:00:00', '22:00:00'),
(4, 'Manhã', '07:00:00', '11:30:00'),
(4, 'Tarde', '13:00:00', '17:30:00');


-- ============================================================
-- MÓDULO: DEPARTAMENTOS
-- ============================================================

INSERT INTO tb_departamento (fk_unidade, nome_depto, responsavel, sigla, ativo) VALUES
(1, 'Direção Geral', 'Carlos Andrade Silva', 'DIR', true),
(1, 'Coordenação Pedagógica', 'Maria Oliveira Santos', 'CPE', true),
(1, 'Recursos Humanos', 'Ana Rodrigues Lima', 'RH', true),
(1, 'Financeiro', 'Pedro Almeida Souza', 'FIN', true),
(1, 'Secretaria Acadêmica', 'Juliana Pereira Martins', 'SEC', true),
(2, 'Direção', 'Roberto Nascimento Cruz', 'DIR', true),
(2, 'Pedagogia', 'Fernanda Barbosa Gomes', 'PED', true),
(2, 'Recursos Humanos', 'Patrícia Melo Araújo', 'RH', true),
(3, 'Reitoria', 'Marcelo Carvalho Dias', 'REI', true),
(3, 'Departamento de Exatas', 'Lucas Teixeira Mendes', 'DEX', true),
(3, 'Departamento de Humanas', 'Camila Ribeiro Cardoso', 'DH', true),
(4, 'Direção', 'Rafael Lopes Freitas', 'DIR', true),
(4, 'Coordenação', 'Beatriz Marques Torres', 'COORD', true);


-- ============================================================
-- MÓDULO: CARGOS
-- ============================================================

INSERT INTO tb_cargos (fk_depto, nome_cargo, descricao, salario_base, carga_horaria, nivel_cargo, ativo) VALUES
(1, 'Diretor', 'Responsável pela gestão geral da unidade', 12000.00, 44, 'Executivo', true),
(2, 'Coordenador Pedagógico', 'Coordena as atividades pedagógicas', 8500.00, 40, 'Gestão', true),
(3, 'Analista de RH', 'Gestão de pessoal e folha de pagamento', 4500.00, 40, 'Analista', true),
(4, 'Analista Financeiro', 'Controle financeiro e contábil', 5000.00, 40, 'Analista', true),
(5, 'Secretário Acadêmico', 'Gestão de matrículas e documentos', 3200.00, 40, 'Operacional', true),
(2, 'Professor', 'Ministrar aulas e avaliar alunos', 4800.00, 40, 'Docente', true),
(2, 'Professor Especialista', 'Docência com especialização', 6200.00, 40, 'Docente Sênior', true),
(2, 'Professor Mestre', 'Docência com mestrado', 7800.00, 40, 'Docente Pleno', true),
(2, 'Professor Doutor', 'Docência com doutorado e pesquisa', 10500.00, 40, 'Docente Titular', true),
(6, 'Diretor de Unidade', 'Gestão da unidade escolar', 11000.00, 44, 'Executivo', true),
(7, 'Coordenador', 'Coordenação pedagógica da unidade', 7500.00, 40, 'Gestão', true),
(8, 'Assistente de RH', 'Suporte às atividades de RH', 2800.00, 40, 'Assistente', true),
(9, 'Reitor', 'Gestão da instituição universitária', 20000.00, 44, 'Executivo', true),
(10, 'Professor Universitário', 'Docência no ensino superior', 8000.00, 40, 'Docente', true),
(12, 'Diretor Escolar', 'Gestão da escola pública', 6800.00, 40, 'Gestão', true),
(5, 'Auxiliar Administrativo', 'Apoio administrativo geral', 2200.00, 40, 'Operacional', true);


-- ============================================================
-- MÓDULO: FUNCIONÁRIOS (pessoas 1-40)
-- ============================================================

INSERT INTO tb_funcionarios (fk_pessoa, fk_cargo, fk_unidade, data_admissao, data_demissao, salario, status_funcionario, ctps) VALUES
(1, 1, 1, '2010-03-01', NULL, 13500.00, 'Ativo', 'CTPS-001-SP'),
(2, 2, 1, '2012-07-15', NULL, 9000.00, 'Ativo', 'CTPS-002-SP'),
(3, 6, 1, '2008-02-20', NULL, 5200.00, 'Ativo', 'CTPS-003-SP'),
(4, 3, 1, '2015-09-01', NULL, 4800.00, 'Ativo', 'CTPS-004-SP'),
(5, 4, 1, '2011-04-10', NULL, 5500.00, 'Ativo', 'CTPS-005-SP'),
(6, 7, 1, '2014-01-15', NULL, 6500.00, 'Ativo', 'CTPS-006-SP'),
(7, 8, 1, '2016-08-01', NULL, 8200.00, 'Ativo', 'CTPS-007-SP'),
(8, 9, 1, '2009-05-20', NULL, 11000.00, 'Ativo', 'CTPS-008-SP'),
(9, 6, 1, '2013-11-05', NULL, 5000.00, 'Ativo', 'CTPS-009-SP'),
(10, 7, 1, '2017-03-14', NULL, 6800.00, 'Ativo', 'CTPS-010-SP'),
(11, 8, 2, '2018-06-01', NULL, 8000.00, 'Ativo', 'CTPS-011-SP'),
(12, 6, 2, '2015-02-10', NULL, 5100.00, 'Ativo', 'CTPS-012-SP'),
(13, 7, 2, '2019-09-20', NULL, 6600.00, 'Ativo', 'CTPS-013-SP'),
(14, 9, 2, '2011-07-08', NULL, 11500.00, 'Ativo', 'CTPS-014-SP'),
(15, 6, 2, '2020-01-13', NULL, 5050.00, 'Ativo', 'CTPS-015-SP'),
(16, 8, 2, '2016-05-22', NULL, 8100.00, 'Ativo', 'CTPS-016-SP'),
(17, 14, 3, '2012-10-01', NULL, 9000.00, 'Ativo', 'CTPS-017-SP'),
(18, 14, 3, '2014-04-15', NULL, 8500.00, 'Ativo', 'CTPS-018-PR'),
(19, 6, 3, '2021-08-09', NULL, 5000.00, 'Ativo', 'CTPS-019-SP'),
(20, 14, 3, '2018-12-03', NULL, 8200.00, 'Ativo', 'CTPS-020-RS'),
(21, 15, 4, '2007-03-01', NULL, 7200.00, 'Ativo', 'CTPS-021-SP'),
(22, 6, 4, '2010-09-15', NULL, 4900.00, 'Ativo', 'CTPS-022-MG'),
(23, 7, 4, '2013-04-20', NULL, 6300.00, 'Ativo', 'CTPS-023-SP'),
(24, 8, 4, '2016-11-10', NULL, 8300.00, 'Ativo', 'CTPS-024-SP'),
(25, 9, 1, '2022-02-01', NULL, 10800.00, 'Ativo', 'CTPS-025-SP');


-- ============================================================
-- MÓDULO: PROFESSORES (subset de funcionários)
-- ============================================================

INSERT INTO tb_professor (fk_pessoa, registro_magisteria, nivel_academico, disponibilidade, status_docente) VALUES
(3, 'REG-MAG-00003', 'Graduado', 'Manhã', 'Ativo'),
(6, 'REG-MAG-00006', 'Mestrado', 'Tarde', 'Ativo'),
(7, 'REG-MAG-00007', 'Mestrado', 'Noite', 'Ativo'),
(8, 'REG-MAG-00008', 'Doutorado', 'Manhã', 'Ativo'),
(9, 'REG-MAG-00009', 'Graduado', 'Tarde', 'Ativo'),
(10, 'REG-MAG-00010', 'Mestrado', 'Manhã', 'Ativo'),
(11, 'REG-MAG-00011', 'Mestrado', 'Noite', 'Ativo'),
(12, 'REG-MAG-00012', 'Graduado', 'Tarde', 'Ativo'),
(13, 'REG-MAG-00013', 'Mestrado', 'Manhã', 'Ativo'),
(14, 'REG-MAG-00014', 'Doutorado', 'Noite', 'Ativo'),
(15, 'REG-MAG-00015', 'Graduado', 'Manhã', 'Ativo'),
(16, 'REG-MAG-00016', 'Mestrado', 'Tarde', 'Ativo'),
(17, 'REG-MAG-00017', 'Doutorado', 'Manhã', 'Ativo'),
(18, 'REG-MAG-00018', 'Mestrado', 'Tarde', 'Ativo'),
(19, 'REG-MAG-00019', 'Graduado', 'Noite', 'Ativo'),
(20, 'REG-MAG-00020', 'Mestrado', 'Manhã', 'Ativo'),
(22, 'REG-MAG-00022', 'Graduado', 'Manhã', 'Ativo'),
(23, 'REG-MAG-00023', 'Mestrado', 'Tarde', 'Licença'),
(24, 'REG-MAG-00024', 'Doutorado', 'Noite', 'Ativo'),
(25, 'REG-MAG-00025', 'Doutorado', 'Manhã', 'Ativo');


-- ============================================================
-- MÓDULO: CURSOS
-- ============================================================

INSERT INTO tb_cursos (fk_instituicao, nome_curso) VALUES
(1, 'Ensino Fundamental I'),
(1, 'Ensino Fundamental II'),
(1, 'Ensino Médio'),
(2, 'Ensino Fundamental II'),
(2, 'Ensino Médio'),
(3, 'Administração'),
(3, 'Ciências da Computação'),
(3, 'Pedagogia'),
(3, 'Direito'),
(4, 'Ensino Fundamental I'),
(4, 'Ensino Fundamental II');


-- ============================================================
-- MÓDULO: DISCIPLINAS
-- ============================================================

INSERT INTO tb_disciplina (nome_disciplina, sigla, carga_horaria_atual, tipo_componente, ativo) VALUES
('Matemática', 'MAT', 80, 'Obrigatoria', true),
('Língua Portuguesa', 'POR', 80, 'Obrigatoria', true),
('Ciências', 'CIE', 60, 'Obrigatoria', true),
('História', 'HIS', 60, 'Obrigatoria', true),
('Geografia', 'GEO', 60, 'Obrigatoria', true),
('Artes', 'ART', 40, 'Obrigatoria', true),
('Educação Física', 'EDF', 40, 'Obrigatoria', true),
('Inglês', 'ING', 60, 'Obrigatoria', true),
('Física', 'FIS', 80, 'Obrigatoria', true),
('Química', 'QUI', 80, 'Obrigatoria', true),
('Biologia', 'BIO', 80, 'Obrigatoria', true),
('Filosofia', 'FIL', 40, 'Obrigatoria', true),
('Sociologia', 'SOC', 40, 'Obrigatoria', true),
('Literatura', 'LIT', 40, 'Optativa', true),
('Espanhol', 'ESP', 40, 'Optativa', true),
('Redação', 'RED', 40, 'Obrigatoria', true),
('Cálculo I', 'CAL1', 80, 'Obrigatoria', true),
('Álgebra Linear', 'ALG', 60, 'Obrigatoria', true),
('Introdução à Computação', 'ICP', 60, 'Obrigatoria', true),
('Fundamentos de Administração', 'FAD', 60, 'Obrigatoria', true),
('Contabilidade Geral', 'CON', 60, 'Obrigatoria', true),
('Direito Constitucional', 'DCO', 80, 'Obrigatoria', true),
('Programação I', 'PRG1', 80, 'Obrigatoria', true),
('Banco de Dados', 'BD', 80, 'Obrigatoria', true),
('Robótica Educacional', 'ROB', 40, 'ExtraCurricular', true);


-- ============================================================
-- MÓDULO: UNIDADES_CURSOS (vincula curso à unidade com coordenador)
-- ============================================================

INSERT INTO tb_unidades_cursos (fk_curso, fk_unidade, fk_coordenador, ativo) VALUES
(1, 1, 8, true),
(2, 1, 10, true),
(3, 1, 8, true),
(4, 2, 16, true),
(5, 2, 14, true),
(6, 3, 17, true),
(7, 3, 25, true),
(8, 3, 20, true),
(9, 3, 17, true),
(10, 4, 22, true),
(11, 4, 22, true);


-- ============================================================
-- MÓDULO: ALUNOS (pessoas 41-90)
-- ============================================================

INSERT INTO tb_alunos (fk_pessoa, fk_unidade, ra_aluno, observacao) VALUES
(41, 1, 'RA2024001', NULL),
(42, 1, 'RA2024002', NULL),
(43, 1, 'RA2024003', 'Aluno com necessidades especiais'),
(44, 1, 'RA2024004', NULL),
(45, 1, 'RA2024005', NULL),
(46, 1, 'RA2024006', NULL),
(47, 1, 'RA2024007', NULL),
(48, 1, 'RA2024008', NULL),
(49, 1, 'RA2024009', NULL),
(50, 1, 'RA2024010', NULL),
(51, 1, 'RA2024011', NULL),
(52, 1, 'RA2024012', NULL),
(53, 1, 'RA2024013', NULL),
(54, 1, 'RA2024014', NULL),
(55, 1, 'RA2024015', NULL),
(56, 2, 'RA2024016', NULL),
(57, 2, 'RA2024017', NULL),
(58, 2, 'RA2024018', NULL),
(59, 2, 'RA2024019', NULL),
(60, 2, 'RA2024020', NULL),
(61, 2, 'RA2024021', NULL),
(62, 2, 'RA2024022', NULL),
(63, 2, 'RA2024023', NULL),
(64, 2, 'RA2024024', NULL),
(65, 2, 'RA2024025', NULL),
(66, 3, 'RA2024026', NULL),
(67, 3, 'RA2024027', NULL),
(68, 3, 'RA2024028', NULL),
(69, 3, 'RA2024029', NULL),
(70, 3, 'RA2024030', NULL),
(71, 3, 'RA2024031', NULL),
(72, 3, 'RA2024032', NULL),
(73, 3, 'RA2024033', NULL),
(74, 3, 'RA2024034', NULL),
(75, 3, 'RA2024035', NULL),
(76, 4, 'RA2024036', NULL),
(77, 4, 'RA2024037', NULL),
(78, 4, 'RA2024038', NULL),
(79, 4, 'RA2024039', NULL),
(80, 4, 'RA2024040', NULL),
(81, 1, 'RA2024041', NULL),
(82, 1, 'RA2024042', NULL),
(83, 1, 'RA2024043', NULL),
(84, 2, 'RA2024044', NULL),
(85, 2, 'RA2024045', NULL),
(86, 3, 'RA2024046', NULL),
(87, 3, 'RA2024047', NULL),
(88, 3, 'RA2024048', NULL),
(89, 4, 'RA2024049', NULL),
(90, 4, 'RA2024050', NULL);


-- ============================================================
-- MÓDULO: GRADE HORÁRIA
-- ============================================================

INSERT INTO tb_grade_horaria (fk_sala, fk_disciplina, fk_professor, dias_semana, hora_inicio, hora_fim) VALUES
(1, 1, 3, 'Seg', '07:00:00', '08:40:00'),
(1, 2, 9, 'Seg', '08:50:00', '10:30:00'),
(1, 1, 3, 'Ter', '07:00:00', '08:40:00'),
(1, 3, 12, 'Ter', '08:50:00', '10:30:00'),
(2, 4, 15, 'Seg', '07:00:00', '08:40:00'),
(2, 5, 22, 'Seg', '08:50:00', '10:30:00'),
(2, 4, 15, 'Qua', '07:00:00', '08:40:00'),
(3, 8, 10, 'Seg', '13:00:00', '14:40:00'),
(3, 9, 6, 'Ter', '13:00:00', '14:40:00'),
(3, 10, 7, 'Qua', '13:00:00', '14:40:00'),
(4, 11, 8, 'Qui', '07:00:00', '08:40:00'),
(4, 12, 25, 'Sex', '07:00:00', '08:40:00'),
(9, 1, 13, 'Seg', '07:30:00', '09:10:00'),
(9, 2, 16, 'Ter', '07:30:00', '09:10:00'),
(10, 9, 11, 'Seg', '19:00:00', '20:40:00'),
(10, 17, 17, 'Ter', '19:00:00', '20:40:00'),
(14, 17, 17, 'Seg', '08:00:00', '09:40:00'),
(14, 18, 25, 'Ter', '08:00:00', '09:40:00'),
(15, 23, 19, 'Qua', '08:00:00', '09:40:00'),
(15, 24, 24, 'Qui', '08:00:00', '09:40:00'),
(19, 1, 22, 'Seg', '07:00:00', '08:40:00'),
(19, 2, 22, 'Ter', '08:50:00', '10:30:00');


-- ============================================================
-- MÓDULO: GRADE CURRICULAR
-- ============================================================

INSERT INTO tb_grade_curricular (fk_curso, fk_disciplina, periodo_grade, obrigatoria) VALUES
-- Ensino Fundamental I (curso 1)
(1, 1, 1, true), (1, 2, 1, true), (1, 3, 1, true), (1, 4, 1, true), (1, 5, 1, true),
(1, 6, 1, true), (1, 7, 1, true),
-- Ensino Fundamental II (curso 2)
(2, 1, 1, true), (2, 2, 1, true), (2, 3, 1, true), (2, 4, 1, true), (2, 5, 1, true),
(2, 6, 1, true), (2, 7, 1, true), (2, 8, 1, true), (2, 16, 2, true),
-- Ensino Médio (curso 3)
(3, 1, 1, true), (3, 2, 1, true), (3, 9, 1, true), (3, 10, 1, true),
(3, 11, 1, true), (3, 12, 1, true), (3, 13, 1, true), (3, 8, 1, true),
(3, 16, 1, true), (3, 14, 2, false), (3, 15, 2, false),
-- Administração (curso 6)
(6, 17, 1, true), (6, 20, 1, true), (6, 21, 1, true),
-- Computação (curso 7)
(7, 17, 1, true), (7, 18, 1, true), (7, 19, 1, true), (7, 23, 2, true), (7, 24, 2, true);


-- ============================================================
-- MÓDULO: RESPONSÁVEIS (pessoas 101-120)
-- ============================================================

INSERT INTO tb_responsaveis (fk_pessoa, profissao, renda_mensal) VALUES
(101, 'Engenheiro Civil', 12000.00),
(102, 'Professora', 5500.00),
(103, 'Médico', 18000.00),
(104, 'Enfermeira', 4800.00),
(105, 'Advogado', 9500.00),
(106, 'Contadora', 6200.00),
(107, 'Empresário', 25000.00),
(108, 'Administradora', 7000.00),
(109, 'Motorista', 3500.00),
(110, 'Vendedora', 3200.00),
(111, 'Arquiteto', 11000.00),
(112, 'Psicóloga', 5800.00),
(113, 'Comerciante', 8000.00),
(114, 'Assistente Social', 4000.00),
(115, 'Policial Militar', 5500.00),
(116, 'Nutricionista', 5000.00),
(117, 'Eletricista', 4500.00),
(118, 'Recepcionista', 2800.00),
(119, 'Agricultor', 3000.00),
(120, 'Doméstica', 1800.00);


-- ============================================================
-- MÓDULO: RESPONSÁVEIS_ALUNOS
-- ============================================================

INSERT INTO tb_responsaveis_alunos (fk_aluno, fk_responsavel, parentesco, financeira) VALUES
(41, 1, 'Pai', true), (41, 2, 'Mãe', false),
(42, 3, 'Pai', true), (42, 4, 'Mãe', false),
(43, 5, 'Pai', true),
(44, 6, 'Mãe', true),
(45, 7, 'Pai', true), (45, 8, 'Mãe', false),
(46, 9, 'Pai', true),
(47, 10, 'Mãe', true),
(48, 11, 'Pai', true),
(49, 12, 'Mãe', true),
(50, 13, 'Pai', true),
(51, 14, 'Mãe', true), (51, 15, 'Pai', false),
(52, 16, 'Mãe', true),
(53, 17, 'Pai', true),
(54, 18, 'Mãe', true),
(55, 19, 'Pai', true),
(56, 20, 'Mãe', true),
(57, 1, 'Tio', true),
(58, 2, 'Tia', true),
(59, 3, 'Pai', true),
(60, 4, 'Mãe', true);


-- ============================================================
-- MÓDULO: PERÍODOS LETIVOS
-- ============================================================

INSERT INTO tb_periodos_letivos (fk_unidade, ano_referencia, identificador_periodo, dt_inicio, dt_fim, status_periodo) VALUES
(1, 2023, '2023-1', '2023-02-06', '2023-06-30', 'Fechado'),
(1, 2023, '2023-2', '2023-07-31', '2023-12-15', 'Fechado'),
(1, 2024, '2024-1', '2024-02-05', '2024-06-28', 'Fechado'),
(1, 2024, '2024-2', '2024-07-29', '2024-12-13', 'Fechado'),
(1, 2025, '2025-1', '2025-02-03', '2025-06-27', 'Fechado'),
(1, 2025, '2025-2', '2025-07-28', '2025-12-12', 'Fechado'),
(1, 2026, '2026-1', '2026-02-02', '2026-06-30', 'Aberto'),
(2, 2024, '2024-1', '2024-02-05', '2024-06-28', 'Fechado'),
(2, 2024, '2024-2', '2024-07-29', '2024-12-13', 'Fechado'),
(2, 2025, '2025-1', '2025-02-03', '2025-06-27', 'Fechado'),
(2, 2025, '2025-2', '2025-07-28', '2025-12-12', 'Fechado'),
(2, 2026, '2026-1', '2026-02-02', '2026-06-30', 'Aberto'),
(3, 2025, '2025-1', '2025-02-10', '2025-07-04', 'Fechado'),
(3, 2025, '2025-2', '2025-08-04', '2025-12-12', 'Fechado'),
(3, 2026, '2026-1', '2026-02-09', '2026-07-03', 'Aberto'),
(4, 2025, '2025-1', '2025-02-03', '2025-06-27', 'Fechado'),
(4, 2025, '2025-2', '2025-07-28', '2025-12-12', 'Fechado'),
(4, 2026, '2026-1', '2026-02-02', '2026-06-30', 'Aberto');


-- ============================================================
-- MÓDULO: TURMAS
-- ============================================================

INSERT INTO tb_turmas (fk_periodo_letivo, fk_curso, fk_unidade, fk_sala, nome_turma, capacidade_turma, status_turma) VALUES
-- Unidade 1 - 2026-1 (periodo 7)
(7, 1, 1, 1, '5º Ano A - Manhã', 35, 'Em curso'),
(7, 2, 1, 2, '7º Ano A - Manhã', 35, 'Em curso'),
(7, 3, 1, 4, '1º Médio A - Tarde', 40, 'Em curso'),
(7, 3, 1, 5, '2º Médio A - Tarde', 40, 'Em curso'),
(7, 2, 1, 3, '6º Ano A - Manhã', 30, 'Em curso'),
-- Unidade 2 - 2026-1 (periodo 12)
(12, 4, 2, 9, '8º Ano A - Manhã', 35, 'Em curso'),
(12, 5, 2, 10, '3º Médio A - Manhã', 35, 'Em curso'),
(12, 4, 2, 11, '9º Ano A - Tarde', 30, 'Em curso'),
-- Unidade 3 - 2026-1 (periodo 15)
(15, 7, 3, 14, 'CC101 - Comp. Período 1', 50, 'Em curso'),
(15, 6, 3, 15, 'ADM101 - Adm. Período 1', 50, 'Em curso'),
(15, 9, 3, 16, 'DIR101 - Direito Período 1', 45, 'Em curso'),
-- Unidade 4 - 2026-1 (periodo 18)
(18, 10, 4, 19, '4º Ano A - Manhã', 30, 'Em curso'),
(18, 11, 4, 20, '6º Ano A - Tarde', 30, 'Em curso'),
-- Turmas históricas 2025-1 (unidade 1, periodo 5)
(5, 1, 1, 1, '5º Ano A 2025 - Manhã', 35, 'Encerrada'),
(5, 3, 1, 4, '1º Médio A 2025 - Tarde', 40, 'Encerrada');


-- ============================================================
-- MÓDULO: MATRÍCULAS
-- ============================================================

INSERT INTO tb_matriculas (fk_pessoa, fk_unidade, fk_turma, data_matricula, situacao) VALUES
-- Turma 1 (5ºAno A) - alunos 41-50
(41, 1, 1, '2026-01-20', 'Ativo'),
(42, 1, 1, '2026-01-20', 'Ativo'),
(43, 1, 1, '2026-01-21', 'Ativo'),
(44, 1, 1, '2026-01-21', 'Ativo'),
(45, 1, 1, '2026-01-22', 'Ativo'),
-- Turma 2 (7ºAno A) - alunos 46-55
(46, 1, 2, '2026-01-20', 'Ativo'),
(47, 1, 2, '2026-01-20', 'Ativo'),
(48, 1, 2, '2026-01-21', 'Ativo'),
(49, 1, 2, '2026-01-21', 'Ativo'),
(50, 1, 2, '2026-01-22', 'Ativo'),
-- Turma 3 (1ºMédio A) - alunos 51-60
(51, 1, 3, '2026-01-20', 'Ativo'),
(52, 1, 3, '2026-01-20', 'Ativo'),
(53, 1, 3, '2026-01-21', 'Ativo'),
(54, 1, 3, '2026-01-21', 'Ativo'),
(55, 1, 3, '2026-01-22', 'Ativo'),
-- Turma 6 (8ºAno A - Unid 2) - alunos 56-65
(56, 2, 6, '2026-01-22', 'Ativo'),
(57, 2, 6, '2026-01-22', 'Ativo'),
(58, 2, 6, '2026-01-23', 'Ativo'),
(59, 2, 6, '2026-01-23', 'Ativo'),
(60, 2, 6, '2026-01-24', 'Ativo'),
-- Turma 9 (CC101 - Unid 3) - alunos 66-75
(66, 3, 9, '2026-01-27', 'Ativo'),
(67, 3, 9, '2026-01-27', 'Ativo'),
(68, 3, 9, '2026-01-28', 'Ativo'),
(69, 3, 9, '2026-01-28', 'Ativo'),
(70, 3, 9, '2026-01-29', 'Ativo'),
-- Turma 12 (4ºAno - Unid 4) - alunos 76-85
(76, 4, 12, '2026-01-20', 'Ativo'),
(77, 4, 12, '2026-01-20', 'Ativo'),
(78, 4, 12, '2026-01-21', 'Ativo'),
(79, 4, 12, '2026-01-21', 'Ativo'),
(80, 4, 12, '2026-01-22', 'Ativo'),
-- Matrículas históricas 2025 (turma 14)
(41, 1, 14, '2025-01-22', 'Concluido'),
(42, 1, 14, '2025-01-22', 'Concluido'),
(43, 1, 14, '2025-01-23', 'Concluido'),
(81, 1, 14, '2025-01-23', 'Trancado'),
(82, 1, 14, '2025-01-24', 'Abandono');


-- ============================================================
-- MÓDULO: MATRÍCULA COMPONENTES
-- ============================================================

INSERT INTO tb_matricula_componentes (fk_disciplina, fk_turma, num_matricula, situacao_comp, situacao_vinculo) VALUES
-- Turma 1 - alunos matriculados em disciplinas
(1, 1, 1, 'Confirmado', 'Regular'),
(2, 1, 1, 'Confirmado', 'Regular'),
(3, 1, 1, 'Confirmado', 'Regular'),
(4, 1, 1, 'Confirmado', 'Regular'),
(1, 1, 2, 'Confirmado', 'Regular'),
(2, 1, 2, 'Confirmado', 'Regular'),
(3, 1, 2, 'Confirmado', 'Regular'),
(1, 1, 3, 'Confirmado', 'Regular'),
(2, 1, 3, 'Confirmado', 'Regular'),
(3, 1, 3, 'Confirmado', 'Adaptação'),
-- Turma 3 - 1ºMédio
(1, 3, 11, 'Confirmado', 'Regular'),
(9, 3, 11, 'Confirmado', 'Regular'),
(10, 3, 11, 'Confirmado', 'Regular'),
(11, 3, 11, 'Confirmado', 'Regular'),
(1, 3, 12, 'Confirmado', 'Regular'),
(9, 3, 12, 'Confirmado', 'Regular'),
(10, 3, 12, 'Confirmado', 'Regular'),
(1, 3, 13, 'Confirmado', 'Regular'),
(9, 3, 13, 'Confirmado', 'Regular'),
-- Turma 9 - CC101
(17, 9, 21, 'Confirmado', 'Regular'),
(18, 9, 21, 'Confirmado', 'Regular'),
(19, 9, 21, 'Confirmado', 'Regular'),
(17, 9, 22, 'Confirmado', 'Regular'),
(18, 9, 22, 'Confirmado', 'Regular'),
(17, 9, 23, 'Confirmado', 'Regular'),
(19, 9, 23, 'Confirmado', 'Regular');


-- ============================================================
-- MÓDULO: AVALIAÇÕES
-- ============================================================

INSERT INTO tb_avaliacoes (fk_turma, fk_disciplina, descricao, data_prevista, peso_nota) VALUES
(1, 1, 'Prova Bimestral 1 - Matemática', '2026-03-20', 4.00),
(1, 1, 'Trabalho - Matemática', '2026-04-10', 2.00),
(1, 1, 'Prova Bimestral 2 - Matemática', '2026-05-22', 4.00),
(1, 2, 'Prova Bimestral 1 - Português', '2026-03-22', 4.00),
(1, 2, 'Redação - Português', '2026-04-15', 3.00),
(1, 2, 'Prova Bimestral 2 - Português', '2026-05-24', 3.00),
(1, 3, 'Prova Bimestral 1 - Ciências', '2026-03-25', 5.00),
(1, 3, 'Experimento Prático - Ciências', '2026-04-20', 5.00),
(3, 1, 'Prova 1 - Matemática Médio', '2026-03-19', 4.00),
(3, 1, 'Prova 2 - Matemática Médio', '2026-05-21', 4.00),
(3, 1, 'Recuperação - Matemática', '2026-06-10', 2.00),
(3, 9, 'Prova 1 - Física', '2026-03-21', 5.00),
(3, 10, 'Prova 1 - Química', '2026-03-28', 5.00),
(9, 17, 'Prova 1 - Cálculo I', '2026-03-18', 5.00),
(9, 17, 'Prova 2 - Cálculo I', '2026-05-20', 5.00),
(9, 18, 'Prova 1 - Álgebra Linear', '2026-04-02', 5.00),
(9, 19, 'Prova 1 - Intro Comp.', '2026-03-26', 5.00);


-- ============================================================
-- MÓDULO: NOTAS
-- ============================================================

INSERT INTO tb_notas (fk_vinculo, fk_avaliacao, valor_notas) VALUES
-- Aluno 1 (vínculo 1,2,3,4) - Turma 1 Mat
(1, 1, 7.50), (1, 2, 8.00), (1, 3, 6.50),
-- Aluno 1 - Português
(2, 4, 8.50), (2, 5, 9.00), (2, 6, 7.50),
-- Aluno 1 - Ciências
(3, 7, 7.00), (3, 8, 8.50),
-- Aluno 1 - História
(4, 1, NULL),
-- Aluno 2 (vínculo 5,6,7) - Turma 1
(5, 1, 9.00), (5, 2, 9.50), (5, 3, 8.50),
(6, 4, 9.00), (6, 5, 10.00), (6, 6, 8.50),
(7, 7, 9.50), (7, 8, 9.00),
-- Aluno 3 (vínculo 8,9,10)
(8, 1, 5.00), (8, 2, 6.00), (8, 3, 4.50),
(9, 4, 6.50), (9, 5, 7.00), (9, 6, 5.50),
(10, 7, 6.00),
-- Turma 3 - 1ºMédio
(11, 9, 7.00), (11, 10, 8.00),
(12, 12, 6.50),
(13, 13, 7.50),
(15, 9, 9.00), (15, 10, 8.50),
(16, 12, 8.00),
-- Turma 9 - CC101
(21, 14, 8.50), (21, 15, 7.50),
(22, 16, 9.00),
(23, 17, 7.00),
(24, 14, 6.00), (24, 15, 7.00),
(25, 16, 8.50),
(26, 17, 9.50);


-- ============================================================
-- MÓDULO: FALTAS
-- ============================================================

INSERT INTO tb_faltas (fk_vinculo, data_falta, quantidade, justificada) VALUES
(1, '2026-03-05', 1, false),
(1, '2026-03-18', 1, true),
(3, '2026-04-02', 2, false),
(5, '2026-03-12', 1, false),
(8, '2026-03-10', 2, false),
(8, '2026-03-17', 2, false),
(8, '2026-04-07', 2, false),
(11, '2026-03-08', 1, true),
(15, '2026-03-15', 1, false),
(21, '2026-03-03', 1, false),
(24, '2026-03-10', 2, false),
(24, '2026-03-17', 2, false);


-- ============================================================
-- MÓDULO: FORMAS DE PAGAMENTO
-- ============================================================

INSERT INTO tb_forma_pagamento (tipo_pagamento, qtd_dias_receber, ativo) VALUES
('Dinheiro', 0, true),
('Pix', 1, true),
('Boleto', 3, true),
('Cartão de Crédito', 30, true),
('Cartão de Débito', 2, true);


-- ============================================================
-- MÓDULO: DESCONTOS
-- ============================================================

INSERT INTO tb_descontos (fk_instituicao, nome_desconto, tipo_desconto, valor_desconto, data_inicio, data_fim, ativo) VALUES
(1, 'Desconto Irmão', 'Porcentagem', 10.00, '2024-01-01', '2026-12-31', true),
(1, 'Desconto Pontualidade', 'Porcentagem', 5.00, '2024-01-01', '2026-12-31', true),
(1, 'Bolsa Social 50%', 'Porcentagem', 50.00, '2023-01-01', '2026-12-31', true),
(1, 'Desconto Funcionário', 'Porcentagem', 30.00, '2023-01-01', '2026-12-31', true),
(2, 'Desconto Matrícula Antecipada', 'Valor fixo', 200.00, '2025-10-01', '2026-01-31', true),
(3, 'Desconto Fidelidade', 'Porcentagem', 8.00, '2024-01-01', '2026-12-31', true),
(1, 'Promoção 2024', 'Porcentagem', 15.00, '2024-01-01', '2024-12-31', false);


-- ============================================================
-- MÓDULO: CONTRATOS EDUCACIONAIS
-- ============================================================

INSERT INTO tb_contratos_educacionais (fk_num_matricula, fk_unidade, fk_desconto, valor_total, qtd_parcelas, dia_vencimento, data_assinatura, status_contrato) VALUES
(1, 1, NULL, 11400.00, 12, 10, '2026-01-20', 'Ativo'),
(2, 1, 2, 10830.00, 12, 10, '2026-01-20', 'Ativo'),
(3, 1, 3, 5700.00, 12, 15, '2026-01-21', 'Ativo'),
(4, 1, NULL, 11400.00, 12, 10, '2026-01-21', 'Ativo'),
(5, 1, 1, 10260.00, 12, 20, '2026-01-22', 'Ativo'),
(6, 2, NULL, 11400.00, 12, 10, '2026-01-22', 'Ativo'),
(7, 2, 2, 10830.00, 12, 10, '2026-01-22', 'Ativo'),
(8, 2, NULL, 11400.00, 12, 15, '2026-01-23', 'Ativo'),
(9, 2, NULL, 11400.00, 12, 10, '2026-01-23', 'Ativo'),
(10, 2, 6, 10488.00, 12, 20, '2026-01-24', 'Ativo'),
(21, 3, NULL, 19200.00, 12, 10, '2026-01-27', 'Ativo'),
(22, 3, NULL, 19200.00, 12, 10, '2026-01-27', 'Ativo'),
(26, 4, 3, 3600.00, 12, 10, '2026-01-20', 'Ativo'),
(27, 4, NULL, 7200.00, 12, 10, '2026-01-20', 'Ativo');


-- ============================================================
-- MÓDULO: MENSALIDADES (3 meses para contratos ativos)
-- ============================================================

INSERT INTO tb_mensalidades (fk_aluno, fk_contrato, fk_unidade, num_parcela, valor_bruto, valor_desconto_aplicado, valor_liquido, data_vencimento, status_pagamento) VALUES
-- Aluno 41 - Contrato 1
(41, 1, 1, 1, 950.00, 0.00, 950.00, '2026-02-10', 'Pago'),
(41, 1, 1, 2, 950.00, 0.00, 950.00, '2026-03-10', 'Pago'),
(41, 1, 1, 3, 950.00, 0.00, 950.00, '2026-04-10', 'Atrasado'),
-- Aluno 42 - Contrato 2 (5% desc pontualidade)
(42, 2, 1, 1, 950.00, 47.50, 902.50, '2026-02-10', 'Pago'),
(42, 2, 1, 2, 950.00, 47.50, 902.50, '2026-03-10', 'Pago'),
(42, 2, 1, 3, 950.00, 47.50, 902.50, '2026-04-10', 'Pago'),
-- Aluno 43 - Contrato 3 (50% bolsa)
(43, 3, 1, 1, 950.00, 475.00, 475.00, '2026-02-15', 'Pago'),
(43, 3, 1, 2, 950.00, 475.00, 475.00, '2026-03-15', 'Pago'),
(43, 3, 1, 3, 950.00, 475.00, 475.00, '2026-04-15', 'Pendente'),
-- Aluno 44 - Contrato 4
(44, 4, 1, 1, 950.00, 0.00, 950.00, '2026-02-10', 'Pago'),
(44, 4, 1, 2, 950.00, 0.00, 950.00, '2026-03-10', 'Pago'),
(44, 4, 1, 3, 950.00, 0.00, 950.00, '2026-04-10', 'Pendente'),
-- Aluno 45 - Contrato 5 (10% irmão)
(45, 5, 1, 1, 950.00, 95.00, 855.00, '2026-02-20', 'Pago'),
(45, 5, 1, 2, 950.00, 95.00, 855.00, '2026-03-20', 'Pago'),
(45, 5, 1, 3, 950.00, 95.00, 855.00, '2026-04-20', 'Pendente'),
-- Unidade 2 - Aluno 56
(56, 6, 2, 1, 950.00, 0.00, 950.00, '2026-02-10', 'Pago'),
(56, 6, 2, 2, 950.00, 0.00, 950.00, '2026-03-10', 'Atrasado'),
(56, 6, 2, 3, 950.00, 0.00, 950.00, '2026-04-10', 'Atrasado'),
-- Unidade 3 - Alunos CC101
(66, 11, 3, 1, 1600.00, 0.00, 1600.00, '2026-02-10', 'Pago'),
(66, 11, 3, 2, 1600.00, 0.00, 1600.00, '2026-03-10', 'Pago'),
(66, 11, 3, 3, 1600.00, 0.00, 1600.00, '2026-04-10', 'Pendente'),
(67, 12, 3, 1, 1600.00, 0.00, 1600.00, '2026-02-10', 'Pago'),
(67, 12, 3, 2, 1600.00, 0.00, 1600.00, '2026-03-10', 'Pago'),
-- Unidade 4
(76, 13, 4, 1, 600.00, 300.00, 300.00, '2026-02-10', 'Pago'),
(76, 13, 4, 2, 600.00, 300.00, 300.00, '2026-03-10', 'Pago'),
(77, 14, 4, 1, 600.00, 0.00, 600.00, '2026-02-10', 'Pago'),
(77, 14, 4, 2, 600.00, 0.00, 600.00, '2026-03-10', 'Pendente');


-- ============================================================
-- MÓDULO: CATEGORIAS FINANCEIRAS
-- ============================================================

INSERT INTO tb_categorias_financeiras (fk_instituicao, nome_categoria, tipo_movimentacao) VALUES
(1, 'Mensalidades', 'Receita'),
(1, 'Taxas e Matrículas', 'Receita'),
(1, 'Salários', 'Despesa'),
(1, 'Encargos Sociais', 'Despesa'),
(1, 'Manutenção Predial', 'Despesa'),
(1, 'Material Didático', 'Despesa'),
(1, 'Energia Elétrica', 'Despesa'),
(1, 'Água e Esgoto', 'Despesa'),
(1, 'Telefone e Internet', 'Despesa'),
(1, 'Eventos e Atividades', 'Receita'),
(2, 'Mensalidades', 'Receita'),
(2, 'Salários', 'Despesa'),
(3, 'Repasse Governamental', 'Receita'),
(3, 'Salários', 'Despesa');


-- ============================================================
-- MÓDULO: FLUXO DE CAIXA
-- ============================================================

INSERT INTO tb_fluxo_caixa (fk_instituicao, fk_unidade, fk_categoria, tipo_movimento, valor, data_movimento, saldo_momento) VALUES
-- Janeiro 2026
(1, 1, 2, 'Entrada', 45000.00, '2026-01-20 09:00:00', 45000.00),
(1, 1, 3, 'Saída', 85000.00, '2026-01-31 17:00:00', -40000.00),
(1, 1, 4, 'Saída', 25000.00, '2026-01-31 17:00:00', -65000.00),
-- Fevereiro 2026
(1, 1, 1, 'Entrada', 12000.00, '2026-02-10 10:00:00', -53000.00),
(1, 1, 1, 'Entrada', 8550.00, '2026-02-10 10:30:00', -44450.00),
(1, 1, 1, 'Entrada', 4750.00, '2026-02-15 09:00:00', -39700.00),
(1, 1, 5, 'Saída', 3500.00, '2026-02-15 14:00:00', -43200.00),
(1, 1, 6, 'Saída', 8000.00, '2026-02-20 11:00:00', -51200.00),
(1, 1, 7, 'Saída', 4200.00, '2026-02-28 17:00:00', -55400.00),
(1, 1, 8, 'Saída', 800.00, '2026-02-28 17:00:00', -56200.00),
-- Março 2026
(1, 1, 1, 'Entrada', 11400.00, '2026-03-10 09:00:00', -44800.00),
(1, 1, 1, 'Entrada', 9025.00, '2026-03-10 09:30:00', -35775.00),
(1, 1, 1, 'Entrada', 4750.00, '2026-03-15 09:00:00', -31025.00),
(1, 1, 3, 'Saída', 85000.00, '2026-03-31 17:00:00', -116025.00),
(1, 1, 9, 'Saída', 1500.00, '2026-03-31 17:00:00', -117525.00),
-- Unidade 2
(1, 2, 1, 'Entrada', 9500.00, '2026-02-10 10:00:00', -108025.00),
(1, 2, 1, 'Entrada', 9025.00, '2026-02-10 10:00:00', -99000.00),
-- Unidade 3
(2, 3, 11, 'Entrada', 19200.00, '2026-02-10 09:00:00', -79800.00),
(2, 3, 11, 'Entrada', 19200.00, '2026-02-10 09:30:00', -60600.00),
(2, 3, 12, 'Saída', 120000.00, '2026-02-28 17:00:00', -180600.00);


-- ============================================================
-- MÓDULO: BENEFÍCIOS
-- ============================================================

INSERT INTO tb_beneficio (fk_instituicao, nome_beneficio, tipo_evento, tipo_calculo, valor_evento) VALUES
(1, 'Vale Refeição', 'Provento', 'Valor fixo', 700.00),
(1, 'Vale Transporte', 'Provento', 'Valor fixo', 320.00),
(1, 'Plano de Saúde', 'Desconto', 'Valor fixo', 250.00),
(1, 'INSS', 'Desconto', 'Porcentagem', 11.00),
(1, 'IRRF', 'Desconto', 'Porcentagem', 15.00),
(1, 'Adicional de Titulação', 'Provento', 'Valor fixo', 500.00),
(2, 'Vale Refeição', 'Provento', 'Valor fixo', 900.00),
(2, 'Vale Transporte', 'Provento', 'Valor fixo', 400.00),
(2, 'Plano de Saúde', 'Desconto', 'Valor fixo', 350.00),
(2, 'INSS', 'Desconto', 'Porcentagem', 11.00);


-- ============================================================
-- MÓDULO: FUNCIONÁRIO BENEFÍCIO
-- ============================================================

INSERT INTO tb_func_beneficio (fk_funcionario, fk_beneficio, data_adesao, valor_diferente) VALUES
(1, 1, '2010-03-01', NULL), (1, 2, '2010-03-01', NULL), (1, 3, '2010-03-01', NULL),
(2, 1, '2012-07-15', NULL), (2, 2, '2012-07-15', NULL), (2, 3, '2012-07-15', NULL),
(3, 1, '2008-02-20', NULL), (3, 2, '2008-02-20', NULL), (3, 3, '2008-02-20', NULL),
(6, 1, '2014-01-15', NULL), (6, 2, '2014-01-15', NULL), (6, 3, '2014-01-15', NULL), (6, 6, '2020-01-01', NULL),
(7, 1, '2016-08-01', NULL), (7, 2, '2016-08-01', NULL), (7, 3, '2016-08-01', NULL), (7, 6, '2020-01-01', NULL),
(8, 1, '2009-05-20', NULL), (8, 2, '2009-05-20', NULL), (8, 3, '2009-05-20', NULL), (8, 6, '2015-01-01', NULL),
(17, 7, '2012-10-01', NULL), (17, 8, '2012-10-01', NULL), (17, 9, '2012-10-01', NULL),
(18, 7, '2014-04-15', NULL), (18, 8, '2014-04-15', NULL), (18, 9, '2014-04-15', NULL);


-- ============================================================
-- MÓDULO: FOLHA DE PAGAMENTO (Fev e Mar 2026)
-- ============================================================

INSERT INTO tb_folha_pagamento (fk_funcionario, fk_unidade, mes_referencia, ano_referencia, salario_base_atual, total_proventos, total_descontos, valor_liquido, status_folha) VALUES
-- Fevereiro 2026
(1, 1, 2, 2026, 13500.00, 15220.00, 3390.00, 11830.00, 'Pago'),
(2, 1, 2, 2026, 9000.00, 10720.00, 2405.00, 8315.00, 'Pago'),
(3, 1, 2, 2026, 5200.00, 6220.00, 1238.00, 4982.00, 'Pago'),
(6, 1, 2, 2026, 6500.00, 7720.00, 1715.00, 6005.00, 'Pago'),
(7, 1, 2, 2026, 8200.00, 9420.00, 2105.00, 7315.00, 'Pago'),
(8, 1, 2, 2026, 11000.00, 12720.00, 2960.00, 9760.00, 'Pago'),
(17, 3, 2, 2026, 9000.00, 10300.00, 2340.00, 7960.00, 'Pago'),
-- Março 2026
(1, 1, 3, 2026, 13500.00, 15220.00, 3390.00, 11830.00, 'Fechado'),
(2, 1, 3, 2026, 9000.00, 10720.00, 2405.00, 8315.00, 'Fechado'),
(3, 1, 3, 2026, 5200.00, 6220.00, 1238.00, 4982.00, 'Fechado'),
(6, 1, 3, 2026, 6500.00, 7720.00, 1715.00, 6005.00, 'Fechado'),
(7, 1, 3, 2026, 8200.00, 9420.00, 2105.00, 7315.00, 'Fechado'),
(8, 1, 3, 2026, 11000.00, 12720.00, 2960.00, 9760.00, 'Fechado'),
-- Abril 2026
(1, 1, 4, 2026, 13500.00, 15220.00, 3390.00, 11830.00, 'Aberto'),
(2, 1, 4, 2026, 9000.00, 10720.00, 2405.00, 8315.00, 'Aberto'),
(3, 1, 4, 2026, 5200.00, 6220.00, 1238.00, 4982.00, 'Aberto');


-- ============================================================
-- MÓDULO: EVENTOS DA FOLHA
-- ============================================================

INSERT INTO tb_eventos_folha (fk_folha, fk_beneficio, descricao_evento, tipo_evento, valor_evento) VALUES
-- Folha 1 (Diretor, Fev)
(1, 1, 'Vale Refeição', 'Provento', 700.00),
(1, 2, 'Vale Transporte', 'Provento', 320.00),
(1, 3, 'Plano de Saúde', 'Desconto', 250.00),
(1, 4, 'INSS (11%)', 'Desconto', 1485.00),
(1, 5, 'IRRF (15%)', 'Desconto', 1655.00),
-- Folha 2 (Coord Pedagógico, Fev)
(2, 1, 'Vale Refeição', 'Provento', 700.00),
(2, 2, 'Vale Transporte', 'Provento', 320.00),
(2, 3, 'Plano de Saúde', 'Desconto', 250.00),
(2, 4, 'INSS (11%)', 'Desconto', 990.00),
(2, 5, 'IRRF (15%)', 'Desconto', 1165.00),
-- Folha 3 (Professor, Fev)
(3, 1, 'Vale Refeição', 'Provento', 700.00),
(3, 2, 'Vale Transporte', 'Provento', 320.00),
(3, 3, 'Plano de Saúde', 'Desconto', 250.00),
(3, 4, 'INSS (11%)', 'Desconto', 572.00),
(3, NULL, 'IRRF (7,5%)', 'Desconto', 416.00);


-- ============================================================
-- MÓDULO: PONTO ELETRÔNICO (Abril 2026)
-- ============================================================

INSERT INTO tb_ponto_eletronico (fk_funcionario, data_registro, hora_entrada, saida_intervalo, volta_intervalo, hora_saida, total_hr_dias, status_ponto) VALUES
-- Funcionário 1 (Diretor)
(1, '2026-04-01', '07:55:00', '12:00:00', '13:00:00', '17:58:00', '09:03:00', 'Normal'),
(1, '2026-04-02', '08:02:00', '12:00:00', '13:00:00', '18:01:00', '08:59:00', 'Normal'),
(1, '2026-04-03', '07:50:00', '12:00:00', '13:00:00', '18:15:00', '09:25:00', 'Hora extra'),
(1, '2026-04-04', '07:58:00', '12:00:00', '13:00:00', '18:00:00', '09:02:00', 'Normal'),
(1, '2026-04-07', '08:05:00', '12:00:00', '13:00:00', '17:55:00', '08:50:00', 'Atraso'),
-- Funcionário 3 (Professor)
(3, '2026-04-01', '06:55:00', '12:00:00', '13:00:00', '17:00:00', '09:05:00', 'Normal'),
(3, '2026-04-02', '07:00:00', '12:00:00', '13:00:00', '17:00:00', '09:00:00', 'Normal'),
(3, '2026-04-03', '07:00:00', '12:00:00', '13:00:00', '17:00:00', '09:00:00', 'Normal'),
(3, '2026-04-04', '07:00:00', '12:00:00', '13:00:00', '17:00:00', '09:00:00', 'Normal'),
(3, '2026-04-05', '00:00:00', NULL, NULL, NULL, '00:00:00', 'Falta'),
-- Funcionário 6 (Prof Especialista)
(6, '2026-04-01', '12:55:00', '17:00:00', '18:00:00', '22:05:00', '09:10:00', 'Normal'),
(6, '2026-04-02', '13:00:00', '17:00:00', '18:00:00', '22:00:00', '09:00:00', 'Normal'),
(6, '2026-04-03', '13:00:00', '17:00:00', '18:00:00', '22:00:00', '09:00:00', 'Normal'),
(6, '2026-04-07', '13:10:00', '17:00:00', '18:00:00', '22:00:00', '08:50:00', 'Atraso'),
-- Funcionário 7 (Prof Mestre)
(7, '2026-04-01', '18:55:00', NULL, NULL, '22:30:00', '03:35:00', 'Normal'),
(7, '2026-04-02', '19:00:00', NULL, NULL, '22:30:00', '03:30:00', 'Normal'),
(7, '2026-04-03', '19:05:00', NULL, NULL, '22:30:00', '03:25:00', 'Normal'),
(7, '2026-04-04', '19:00:00', NULL, NULL, '22:35:00', '03:35:00', 'Hora extra');

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- RESUMO DOS DADOS INSERIDOS
-- ============================================================
-- tb_endereco .............. 54 registros
-- tb_pessoa ............... 120 registros
-- tb_telefone ..............  46 registros
-- tb_email .................  30 registros
-- tb_pessoa_endereco .......  70 registros
-- tb_instituicao ...........   3 registros
-- tb_unidades ..............   4 registros
-- tb_salas .................  21 registros
-- tb_turnos ................  10 registros
-- tb_departamento ..........  13 registros
-- tb_cargos ................  16 registros
-- tb_funcionarios ..........  25 registros
-- tb_professor .............  20 registros
-- tb_cursos ................  11 registros
-- tb_disciplina ............  25 registros
-- tb_unidades_cursos .......  11 registros
-- tb_alunos ................  50 registros
-- tb_grade_horaria .........  22 registros
-- tb_grade_curricular ......  35 registros
-- tb_responsaveis ..........  20 registros
-- tb_responsaveis_alunos ...  23 registros
-- tb_periodos_letivos ......  18 registros
-- tb_turmas ................  15 registros
-- tb_matriculas ............  37 registros
-- tb_matricula_componentes .  27 registros
-- tb_avaliacoes ............  17 registros
-- tb_notas .................  40 registros
-- tb_faltas ................  12 registros
-- tb_forma_pagamento .......   5 registros
-- tb_descontos .............   7 registros
-- tb_contratos_educacionais   14 registros
-- tb_mensalidades ..........  30 registros
-- tb_categorias_financeiras   14 registros
-- tb_fluxo_caixa ...........  19 registros
-- tb_beneficio .............  10 registros
-- tb_func_beneficio ........  25 registros
-- tb_folha_pagamento .......  16 registros
-- tb_eventos_folha .........  15 registros
-- tb_ponto_eletronico ......  19 registros
-- ============================================================
-- TOTAL APROXIMADO: ~1.000+ registros distribuídos em 38 tabelas
-- ============================================================
