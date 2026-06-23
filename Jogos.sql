CREATE DATABASE GAMES;
USE GAMES;

CREATE TABLE desenvolvedoras (
    desenvolvedora_id INT IDENTITY(1,1) PRIMARY KEY, --No sql server fica identity, no plsql ficaria SERIAL
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE plataformas (
    plataforma_id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE jogos (
    jogo_id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    ano_lancamento INT,
    nota_pessoal DECIMAL(3,1),
    finalizado BIT DEFAULT 0,  -- SQL Server usa BIT para booleanos (0 = false, 1 = true)
    plataforma_id INT,
    desenvolvedora_id INT,
    FOREIGN KEY (plataforma_id) REFERENCES plataformas(plataforma_id),
    FOREIGN KEY (desenvolvedora_id) REFERENCES desenvolvedoras(desenvolvedora_id)
);

INSERT INTO desenvolvedoras (nome) VALUES 
('CD Projekt Red'),
('Crystal Dynamics');

INSERT INTO plataformas (nome) VALUES 
('PC'),
('PlayStation');

INSERT INTO jogos (nome, genero, ano_lancamento, nota_pessoal, finalizado, plataforma_id, desenvolvedora_id) VALUES 
('The Witcher 3', 'RPG', 2015, 7.0, 1, 1, 1),
('Tomb Raider', 'Ação/Aventura', 2013, 9.0, 1, 2, 2);


BEGIN TRANSACTION;

SELECT * FROM jogos  
WITH (UPDLOCK, ROWLOCK)  --Consultando e bloqueando a linha
WHERE nome = 'The Witcher 3';

-- Agora faz a atualização
UPDATE jogos  
SET finalizado = 0  
WHERE nome = 'The Witcher 3';

COMMIT;

SELECT *
FROM jogos
WHERE jogo_id = 1

INSERT INTO desenvolvedoras (nome) VALUES 
('Dontnod Entertainment'),  -- Life is Strange
('Eidos Montréal'),         -- Shadow of the Tomb Raider
('Tarsier Studios'),        -- Little Nightmares
('Playground Games'),       -- Forza Horizon
('Rockstar Games');         -- GTA V

INSERT INTO plataformas (nome) VALUES 
('Xbox'),
('Nintendo Switch');

INSERT INTO jogos (nome, genero, ano_lancamento, nota_pessoal, finalizado, plataforma_id, desenvolvedora_id) VALUES 
('Life is Strange', 'Aventura', 2015, 9.0, 1, 1, 3), -- PC, Dontnod Entertainment
('Shadow of the Tomb Raider', 'Ação/Aventura', 2018, 8.5, 1, 2, 4), -- PlayStation, Eidos Montréal
('Little Nightmares', 'Plataforma/Terror', 2017, 8.0, 0, 3, 5), -- Nintendo Switch, Tarsier Studios
('Forza Horizon', 'Corrida', 2012, 9.5, 1, 4, 6), -- Xbox, Playground Games
('GTA V', 'Ação/Mundo Aberto', 2013, 10.0, 1, 1, 7); -- PC, Rockstar Games

SELECT *
FROM JOGOS

select *
from jogos a
WHERE ano_lancamento = 2013
group by genero


