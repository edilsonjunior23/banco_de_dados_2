
CREATE TABLE Organizadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    contato_email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);


CREATE TABLE Eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(100) NOT NULL,
    descricao TEXT,
    tipo_evento VARCHAR(50),
    data_inicio DATE,
    data_fim DATE,
    local VARCHAR(100),
    organizador_id INT,
    FOREIGN KEY (organizador_id) REFERENCES Organizadores(id)
);


CREATE TABLE Participantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    parentesco_com_aluno VARCHAR(50),
    data_inscricao DATE
);


CREATE TABLE Inscricoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT,
    id_participante INT,
    data_inscricao DATE,
    status_pagamento ENUM('pago', 'pendente', 'cancelado') DEFAULT 'pendente',
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id),
    FOREIGN KEY (id_participante) REFERENCES Participantes(id)
);

INSERT INTO Organizadores (id, nome, contato_email, telefone, cargo) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', '11999998888', 'Coordenadora'),
(2, 'Carlos Meireles', 'carlos.m@email.com', '11988887777', 'Professor'),
(3, 'Juliana Martins', 'juliana.martins@email.com', '11987654321', 'Diretora'),
(4, 'Marcos Vinícius', 'marcos.vinicius@email.com', '11976543210', 'Professor'),
(5, 'Patrícia Souza', 'patricia.souza@email.com', '11965432109', 'Coordenadora'),
(6, 'Rafael Almeida', 'rafael.almeida@email.com', '11954321098', 'Voluntário'),
(7, 'Fernanda Lopes', 'fernanda.lopes@email.com', '11943210987', 'Administradora'),
(8, 'Eduardo Lima', 'eduardo.lima@email.com', '11932109876', 'Diretor'),
(9, 'Tatiane Rocha', 'tatiane.rocha@email.com', '11921098765', 'Professora'),
(10, 'Lucas Costa', 'lucas.costa@email.com', '11910987654', 'Voluntário'),
(11, 'Renata Dias', 'renata.dias@email.com', '11999887766', 'Administradora'),
(12, 'Diego Fernandes', 'diego.fernandes@email.com', '11988776655', 'Professor'),
(13, 'Camila Ribeiro', 'camila.ribeiro@email.com', '11977665544', 'Coordenadora'),
(14, 'Bruno Teixeira', 'bruno.teixeira@email.com', '11966554433', 'Voluntário'),
(15, 'Simone Castro', 'simone.castro@email.com', '11955443322', 'Diretora'),
(16, 'André Nascimento', 'andre.nascimento@email.com', '11944332211', 'Administrador'),
(17, 'Bianca Farias', 'bianca.farias@email.com', '11933221100', 'Professora'),
(18, 'Felipe Barros', 'felipe.barros@email.com', '11922110099', 'Voluntário'),
(19, 'Aline Pires', 'aline.pires@email.com', '11911009988', 'Coordenadora'),
(20, 'Vinícius Gomes', 'vinicius.gomes@email.com', '11900998877', 'Professor'),
(21, 'Cláudia Tavares', 'claudia.tavares@email.com', '11999889900', 'Administradora'),
(22, 'João Pedro Moreira', 'joao.pedro@email.com', '11988770011', 'Voluntário'),
(23, 'Isabela Matos', 'isabela.matos@email.com', '11977661122', 'Diretora'),
(24, 'Fábio Cunha', 'fabio.cunha@email.com', '11966552233', 'Professor'),
(25, 'Luciana Rezende', 'luciana.rezende@email.com', '11955443344', 'Coordenadora'),
(26, 'Pedro Henrique', 'pedro.henrique@email.com', '11944334455', 'Administrador'),
(27, 'Carla Mendes', 'carla.mendes@email.com', '11933225566', 'Voluntária'),
(28, 'Thiago Cardoso', 'thiago.cardoso@email.com', '11922116677', 'Diretor'),
(29, 'Gisele Moreira', 'gisele.moreira@email.com', '11911007788', 'Professora'),
(30, 'Rodrigo Bastos', 'rodrigo.bastos@email.com', '11900998822', 'Administrador'),
(31, 'Sueli Azevedo', 'sueli.azevedo@email.com', '11999881122', 'Coordenadora'),
(32, 'Danilo Freitas', 'danilo.freitas@email.com', '11988772233', 'Voluntário'),
(33, 'Natália Rocha', 'natalia.rocha@email.com', '11977663344', 'Professora'),
(34, 'Henrique Sampaio', 'henrique.sampaio@email.com', '11966554455', 'Administrador'),
(35, 'Vanessa Dias', 'vanessa.dias@email.com', '11955445566', 'Diretora'),
(36, 'Igor Martins', 'igor.martins@email.com', '11944336677', 'Voluntário'),
(37, 'Lorena Braga', 'lorena.braga@email.com', '11933227788', 'Coordenadora'),
(38, 'Bruna Ferreira', 'bruna.ferreira@email.com', '11922118899', 'Professora'),
(39, 'Leandro Campos', 'leandro.campos@email.com', '11911009911', 'Administrador'),
(40, 'Marina Assis', 'marina.assis@email.com', '11900991122', 'Voluntária');

INSERT INTO Eventos (id, nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES
(1, 'Workshop de Robótica', 'Aprenda a montar robôs com Arduino.', '2025-05-10', '2025-05-11', 'Auditório A', 1, 'Workshop'),
(2, 'Palestra de Carreiras', 'Conheça as possibilidades após o ensino médio.', '2025-05-12', '2025-05-12', 'Sala 1', 2, 'Palestra'),
(3, 'Oficina de Programação', 'Lógica de programação para iniciantes.', '2025-05-14', '2025-05-15', 'Sala 2', 3, 'Oficina'),
(4, 'Conferência de Educação', 'Discussão sobre o futuro da educação.', '2025-05-16', '2025-05-17', 'Teatro', 4, 'Conferência'),
(5, 'Seminário de Matemática', 'Novas metodologias de ensino.', '2025-05-18', '2025-05-19', 'Auditório A', 5, 'Seminário'),
(6, 'Feira de Ciências', 'Apresentação de projetos dos alunos.', '2025-05-20', '2025-05-20', 'Ginásio', 6, 'Workshop'),
(7, 'Palestra sobre Meio Ambiente', 'Sustentabilidade e ecologia.', '2025-05-22', '2025-05-22', 'Sala 3', 7, 'Palestra'),
(8, 'Oficina de Teatro', 'Expressão corporal e atuação.', '2025-05-23', '2025-05-24', 'Teatro', 8, 'Oficina'),
(9, 'Encontro de Pais', 'Integração entre escola e família.', '2025-05-25', '2025-05-25', 'Auditório A', 9, 'Seminário'),
(10, 'Debate sobre Tecnologia', 'Tecnologia na educação.', '2025-05-26', '2025-05-26', 'Sala 1', 10, 'Conferência'),
(11, 'Workshop de Fotografia', 'Dicas de fotografia com celular.', '2025-05-27', '2025-05-28', 'Sala 2', 11, 'Workshop'),
(12, 'Palestra de Saúde Mental', 'Cuidando do bem-estar emocional.', '2025-05-29', '2025-05-29', 'Auditório A', 12, 'Palestra'),
(13, 'Oficina de Desenho', 'Técnicas básicas de desenho artístico.', '2025-05-30', '2025-05-31', 'Sala 3', 13, 'Oficina'),
(14, 'Seminário de Física', 'Física na prática escolar.', '2025-06-01', '2025-06-02', 'Auditório A', 14, 'Seminário'),
(15, 'Palestra sobre Profissões', 'O que ser quando crescer?', '2025-06-03', '2025-06-03', 'Sala 1', 15, 'Palestra'),
(16, 'Encontro de Voluntários', 'Planejamento de ações sociais.', '2025-06-04', '2025-06-04', 'Sala 2', 16, 'Conferência'),
(17, 'Oficina de Empreendedorismo', 'Como começar um negócio na escola.', '2025-06-05', '2025-06-06', 'Sala 3', 17, 'Oficina'),
(18, 'Workshop de Excel', 'Planilhas para a vida profissional.', '2025-06-07', '2025-06-08', 'Laboratório', 18, 'Workshop'),
(19, 'Palestra sobre Redes Sociais', 'Impactos das mídias digitais.', '2025-06-09', '2025-06-09', 'Sala 1', 19, 'Palestra'),
(20, 'Conferência de Tecnologia', 'Novas ferramentas digitais.', '2025-06-10', '2025-06-11', 'Auditório A', 20, 'Conferência'),
(21, 'Feira de Literatura', 'Exposição de livros e autores.', '2025-06-12', '2025-06-12', 'Ginásio', 21, 'Seminário'),
(22, 'Workshop de Inglês', 'Inglês para o dia a dia.', '2025-06-13', '2025-06-14', 'Sala 2', 22, 'Workshop'),
(23, 'Palestra sobre Ética', 'Ética e cidadania.', '2025-06-15', '2025-06-15', 'Sala 1', 23, 'Palestra'),
(24, 'Oficina de Canto Coral', 'Aprenda a cantar em grupo.', '2025-06-16', '2025-06-17', 'Sala 3', 24, 'Oficina'),
(25, 'Seminário de História', 'História do Brasil com música.', '2025-06-18', '2025-06-18', 'Auditório A', 25, 'Seminário'),
(26, 'Palestra de Segurança Digital', 'Proteja seus dados online.', '2025-06-19', '2025-06-19', 'Laboratório', 26, 'Palestra'),
(27, 'Oficina de Astronomia', 'Observação de estrelas.', '2025-06-20', '2025-06-21', 'Teatro', 27, 'Oficina'),
(28, 'Conferência de Ciências Sociais', 'Sociologia e juventude.', '2025-06-22', '2025-06-23', 'Sala 2', 28, 'Conferência'),
(29, 'Palestra sobre Inclusão', 'Educação inclusiva na prática.', '2025-06-24', '2025-06-24', 'Sala 1', 29, 'Palestra'),
(30, 'Workshop de Marketing Digital', 'Conceitos básicos de marketing.', '2025-06-25', '2025-06-26', 'Sala 3', 30, 'Workshop'),
(31, 'Seminário de Filosofia', 'Questões contemporâneas.', '2025-06-27', '2025-06-28', 'Auditório A', 31, 'Seminário'),
(32, 'Oficina de Leitura Dramática', 'Leitura e interpretação de textos.', '2025-06-29', '2025-06-30', 'Sala 2', 32, 'Oficina'),
(33, 'Palestra sobre Inteligência Artificial', 'Impactos da IA no cotidiano.', '2025-07-01', '2025-07-01', 'Laboratório', 33, 'Palestra'),
(34, 'Workshop de Música', 'Prática com instrumentos.', '2025-07-02', '2025-07-03', 'Sala 3', 34, 'Workshop'),
(35, 'Encontro de Líderes Estudantis', 'Discussão de projetos escolares.', '2025-07-04', '2025-07-04', 'Sala 1', 35, 'Conferência'),
(36, 'Feira Cultural', 'Diversidade e tradições.', '2025-07-05', '2025-07-06', 'Ginásio', 36, 'Seminário'),
(37, 'Palestra de Finanças Pessoais', 'Como organizar seu dinheiro.', '2025-07-07', '2025-07-07', 'Auditório A', 37, 'Palestra'),
(38, 'Oficina de Jornalismo', 'Técnicas básicas de reportagem.', '2025-07-08', '2025-07-09', 'Sala 2', 38, 'Oficina'),
(39, 'Conferência de Artes Visuais', 'Arte contemporânea na escola.', '2025-07-10', '2025-07-11', 'Sala 1', 39, 'Conferência'),
(40, 'Workshop de Design Gráfico', 'Criação com Canva e Figma.', '2025-07-12', '2025-07-13', 'Laboratório', 40, 'Workshop');

INSERT INTO Participantes (id, nome, email, telefone, data_inscricao, vinculo_familiar) VALUES
(1, 'João Souza', 'joao.souza@email.com', '11987654321', '2025-04-01', 'Aluno'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', '11987654322', '2025-04-02', 'Aluno'),
(3, 'Lucas Martins', 'lucas.martins@email.com', '11987654323', '2025-04-03', 'Aluno'),
(4, 'Ana Costa', 'ana.costa@email.com', '11987654324', '2025-04-04', 'Aluno'),
(5, 'Carlos Silva', 'carlos.silva@email.com', '11987654325', '2025-04-05', 'Pai'),
(6, 'Fernanda Rocha', 'fernanda.rocha@email.com', '11987654326', '2025-04-06', 'Mãe'),
(7, 'Beatriz Lima', 'beatriz.lima@email.com', '11987654327', '2025-04-07', 'Aluno'),
(8, 'Rafael Pereira', 'rafael.pereira@email.com', '11987654328', '2025-04-08', 'Aluno'),
(9, 'Juliana Santos', 'juliana.santos@email.com', '11987654329', '2025-04-09', 'Aluno'),
(10, 'Gabriel Almeida', 'gabriel.almeida@email.com', '11987654330', '2025-04-10', 'Pai'),
(11, 'Mariana Silva', 'mariana.silva@email.com', '11987654331', '2025-04-11', 'Aluno'),
(12, 'Felipe Gomes', 'felipe.gomes@email.com', '11987654332', '2025-04-12', 'Mãe'),
(13, 'Laura Costa', 'laura.costa@email.com', '11987654333', '2025-04-13', 'Aluno'),
(14, 'Paulo Fernandes', 'paulo.fernandes@email.com', '11987654334', '2025-04-14', 'Aluno'),
(15, 'Roberta Souza', 'roberta.souza@email.com', '11987654335', '2025-04-15', 'Mãe'),
(16, 'Thiago Pereira', 'thiago.pereira@email.com', '11987654336', '2025-04-16', 'Aluno'),
(17, 'Juliana Ribeiro', 'juliana.ribeiro@email.com', '11987654337', '2025-04-17', 'Aluno'),
(18, 'Gabriel Lima', 'gabriel.lima@email.com', '11987654338', '2025-04-18', 'Aluno'),
(19, 'Alice Martins', 'alice.martins@email.com', '11987654339', '2025-04-19', 'Mãe'),
(20, 'Renato Alves', 'renato.alves@email.com', '11987654340', '2025-04-20', 'Aluno'),
(21, 'Daniela Souza', 'daniela.souza@email.com', '11987654341', '2025-04-21', 'Mãe'),
(22, 'Clara Costa', 'clara.costa@email.com', '11987654342', '2025-04-22', 'Aluno'),
(23, 'Felipe Martins', 'felipe.martins@email.com', '11987654343', '2025-04-23', 'Aluno'),
(24, 'Lucas Ferreira', 'lucas.ferreira@email.com', '11987654344', '2025-04-24', 'Aluno'),
(25, 'Marcelo Oliveira', 'marcelo.oliveira@email.com', '11987654345', '2025-04-25', 'Pai'),
(26, 'Viviane Almeida', 'viviane.almeida@email.com', '11987654346', '2025-04-26', 'Mãe'),
(27, 'Renata Costa', 'renata.costa@email.com', '11987654347', '2025-04-27', 'Aluno'),
(28, 'Ricardo Gomes', 'ricardo.gomes@email.com', '11987654348', '2025-04-28', 'Aluno'),
(29, 'Sofia Lima', 'sofia.lima@email.com', '11987654349', '2025-04-29', 'Aluno'),
(30, 'Gustavo Santos', 'gustavo.santos@email.com', '11987654350', '2025-04-30', 'Pai'),
(31, 'Marcela Costa', 'marcela.costa@email.com', '11987654351', '2025-05-01', 'Mãe'),
(32, 'Eduardo Ribeiro', 'eduardo.ribeiro@email.com', '11987654352', '2025-05-02', 'Aluno'),
(33, 'Carla Ferreira', 'carla.ferreira@email.com', '11987654353', '2025-05-03', 'Aluno'),
(34, 'Fabiano Oliveira', 'fabiano.oliveira@email.com', '11987654354', '2025-05-04', 'Pai'),
(35, 'Luciana Ribeiro', 'luciana.ribeiro@email.com', '11987654355', '2025-05-05', 'Mãe'),
(36, 'Vitor Martins', 'vitor.martins@email.com', '11987654356', '2025-05-06', 'Aluno'),
(37, 'Larissa Souza', 'larissa.souza@email.com', '11987654357', '2025-05-07', 'Aluno'),
(38, 'Marcos Almeida', 'marcos.almeida@email.com', '11987654358', '2025-05-08', 'Pai'),
(39, 'Carolina Costa', 'carolina.costa@email.com', '11987654359', '2025-05-09', 'Aluno'),
(40, 'Fernando Silva', 'fernando.silva@email.com', '11987654360', '2025-05-10', 'Aluno');


INSERT INTO Participantes (nome, email, telefone, data_inscricao, vinculo_familiar) VALUES
('Pedro Souza', 'pedro.souza@email.com', '11987654360', '2025-04-25', 'Aluno');

-- Inserindo o Pai
INSERT INTO Participantes (nome, email, telefone, data_inscricao, vinculo_familiar) VALUES
('Carlos Souza', 'carlos.souza@email.com', '11987654361', '2025-04-25', 'Pai');




