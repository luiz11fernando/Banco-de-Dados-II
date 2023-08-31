CREATE DATABASE IF NOT EXISTS siteSimulado;
USE siteSimulado;

CREATE TABLE  IF NOT EXISTS usuario(
id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
email_usu VARCHAR (210) NOT NULL UNIQUE,
nome_usu VARCHAR (210) NOT NULL,
data_cadastro DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS banca(
id_banca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_ban VARCHAR (200) NOT NULL,
sigla_ban VARCHAR (50)
);

CREATE TABLE IF NOT EXISTS disciplina(
id_disciplina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_dis VARCHAR (200) NOT NULL
);

CREATE TABLE IF NOT EXISTS assunto(
id_assunto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
texto_ass VARCHAR(200) NOT NULL,
fk_id_disciplina INT NOT NULL,
FOREIGN KEY (fk_id_disciplina) REFERENCES disciplina (id_disciplina)
);

CREATE TABLE IF NOT EXISTS questao(
id_questao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
enunciado VARCHAR(1000) NOT NULL,
modalidade VARCHAR(100) NOT NULL,
nivel VARCHAR(100) NOT NULL,
fk_id_banca INT NOT NULL,
FOREIGN KEY (fk_id_banca) REFERENCES banca (id_banca),
fk_id_assunto INT NOT NULL,
FOREIGN KEY (fk_id_assunto) REFERENCES assunto (id_assunto)
);

CREATE TABLE IF NOT EXISTS responde(
id_responde INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_res DATE,
resultado BOOLEAN NOT NULL,
resposta_usu VARCHAR(1),
fk_id_usuario INT NOT NULL,
FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
fk_id_questao INT NOT NULL,
FOREIGN KEY (fk_id_questao) REFERENCES questao (id_questao)
);

CREATE TABLE IF NOT EXISTS alternativas(
id_alternativa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
texto_alter VARCHAR(300) NOT NULL,
gabarito_alter VARCHAR(10),
fk_id_questao INT NOT NULL,
FOREIGN KEY (fk_id_questao) REFERENCES questao (id_questao)
);

CREATE TABLE IF NOT EXISTS professor(
id_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
email_prof VARCHAR (200) NOT NULL UNIQUE,
nome_prof VARCHAR (200) NOT NULL,
telefone_prof VARCHAR (11) NOT NULL
);

CREATE TABLE IF NOT EXISTS comenta(
id_comentario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
texto_com VARCHAR(1000) NOT NULL,
data_com DATE NOT NULL,
fk_id_questao INT NOT NULL,
FOREIGN KEY (fk_id_questao) REFERENCES questao (id_questao),
fk_id_professor INT NOT NULL,
FOREIGN KEY (fk_id_professor) REFERENCES professor (id_professor)
);

ALTER TABLE usuario ADD data_nascimento DATE;
ALTER TABLE usuario ADD data_cadastro DATE;

INSERT INTO usuario (nome_usu, email_usu, data_cadastro)
VALUES ('Luiz Fernando','luiz11fernando@hotmail.com','2023-08-23');

INSERT INTO usuario (nome_usu, email_usu, data_cadastro)
VALUES ('Fernando','luiz11fernando','2025-08-25');

SELECT * FROM usuario;

DESC professor;

INSERT INTO professor (email_prof, nome_prof, telefone_prof)
VALUES('professor1@ensina.com', 'Professor 1', '69992247150');

INSERT INTO professor (email_prof, nome_prof, telefone_prof)
VALUES('professor2@ensina.com', 'Professor 2', '69992247150');

INSERT INTO professor (email_prof, nome_prof, telefone_prof)
VALUES('professor3@ensina.com', 'Professor 3', '69992247150');

INSERT INTO professor (email_prof, nome_prof, telefone_prof)
VALUES('professor4@ensina.com', 'Professor 4', '69992247150');

INSERT INTO professor (email_prof, nome_prof, telefone_prof)
VALUES('professor5@ensina.com', 'Professor 5', '69992247150');

SELECT * FROM professor;

desc usuario; 

INSERT INTO usuario(email_usu, nome_usu, data_cadastro, data_nascimento)
VALUES ('usuario10@gmail.com', 'usuario 1', '2023-08-23','2000-11-16');

INSERT INTO usuario(email_usu, nome_usu, data_cadastro, data_nascimento)
VALUES ('usuario2@gmail.com', 'usuario 2', '2023-09-10','2000-11-14');

INSERT INTO usuario(email_usu, nome_usu, data_cadastro, data_nascimento)
VALUES ('usuario3@gmail.com', 'usuario 3', '2023-08-07','2000-11-26');

INSERT INTO usuario(email_usu, nome_usu, data_cadastro, data_nascimento)
VALUES ('usuario4@gmail.com', 'usuario 4', '2023-08-11','2000-11-30');

INSERT INTO usuario(email_usu, nome_usu, data_cadastro, data_nascimento)
VALUES ('usuario5@gmail.com', 'usuario 5', '2023-08-20','2000-11-12');

SELECT * FROM usuario;

DESC disciplina;

INSERT INTO disciplina(nome_dis)
VALUES('BANCO DE DADOS'),
('POO'),
('LÓGICA DE PROGRAMAÇÃO');

SELECT * FROM disciplina;

DESC assunto;

INSERT INTO assunto(texto_ass, fk_id_disciplina)
VALUES('ENCAPSULAMENTO', 2),
('CLASSE ESTÁTICAS', 2),
('LISTAS', 2);

INSERT INTO assunto(texto_ass, fk_id_disciplina)
VALUES('DML', 1),
('DDL', 1),
('INSERT', 1);

INSERT INTO assunto(texto_ass, fk_id_disciplina)
VALUES('NADA', 3),
('BLABLA', 3),
('FROZEN', 3);


SELECT * FROM assunto;

UPDATE disciplina SET nome_dis = 'Programação Orientada a Ojetos'
WHERE id_disciplina = 2;

UPDATE disciplina SET nome_dis = 'Programação Orientada a Ojetos'
WHERE id_disciplina = 5;

SELECT * FROM disciplina;

INSERT INTO banca (nome_ban, sigla_ban)
VALUES ('BANCA 1','BAN1');

INSERT INTO banca (nome_ban, sigla_ban)
VALUES ('BANCA 2','BAN2');

INSERT INTO banca (nome_ban, sigla_ban)
VALUES ('BANCA 3','BAN3');

SELECT * FROM banca;


DESC banca;

INSERT INTO questao (enunciado, modalidade, nivel, fk_id_banca, fk_id_assunto)
VALUES ('Some 2+2', 'multipla escolha', 'fácil', 1, 36),
('Quanto é 2*5', 'multipla escolha', 'facil', 2, 34), 
('Quanto é 12346-3456', 'multipla escolha', 'facil', 3, 30);

SELECT * FROM questao;

DESC alternativa;


INSERT INTO alternativas(texto_alter, gabarito_alter, fk_id_questao)
VALUES ('a) 4', true, 1),
('b) 5', false, 1),
('c) 6', false, 1),
('d) 7', true, 1),
('e) 5', false, 1);

INSERT INTO alternativas(texto_alter, gabarito_alter, fk_id_questao)
VALUES ('a) 10', true, 2),
('b) 5', false, 2),
('c) 6', false, 2),
('d) 10', true, 2),
('e) 2', false, 2);

INSERT INTO alternativas(texto_alter, gabarito_alter, fk_id_questao)
VALUES ('a) 120.000', true, 3),
('b) 5', false, 3),
('c) 6', false, 3),
('d) 120.000', true, 3),
('e) 2', false, 3);

DELETE FROM alternativas;
SELECT * FROM alternativas;