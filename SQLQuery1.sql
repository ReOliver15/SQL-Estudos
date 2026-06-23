USE REBECA;

CREATE TABLE Clientes (
 cliente_id INT PRIMARY KEY IDENTITY,
 nome VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT NULL,
 telefone VARCHAR(15)
 );

CREATE TABLE Regiao (
regiao_id INT PRIMARY KEY IDENTITY,
cliente_id INT,
endereco VARCHAR(255) NOT NULL,
cidade VARCHAR(100) NOT NULL,
estado VARCHAR (50) NOT NULL,
cep VARCHAR(10),
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

INSERT INTO Clientes (nome, email, telefone) VALUES
('Justin', 'justin@bieber.com', '1234-5678'),
('Hailey', 'hailey@belieber.com', '8765-4321'),
('Demi', 'demi@lovato.com', '8756-2548'),
('Gaga', 'lady@gaga.com', '7598-2144'),
('Santana', 'santana@lopes.com', '7498-2658' ),
('Rachel', 'rachel@berry.com', '4584-3256');

INSERT INTO Regiao (cliente_id, endereco, cidade, estado, cep) VALUES
(1, 'Rua A, 123', 'São Paulo', 'SP', '01000-000'),
(2, 'Avenida B, 456', 'Rio de Janeiro', 'RJ', '20000-000'),
(3, 'Travessa C, 789', 'Belo Horizonte', 'MG', '30000-000'),
(4, 'Travessa Y, 987', 'São Paulo', 'SP', '40000-000'),
(5, 'Travessa R, 98', 'Manaus', 'AM', '50000-000'),
(6, 'Etapa 5, 84', 'Manaus', 'AM', '60000-000');

SELECT c.nome, c.email, r.endereco, r.cidade, r.estado
FROM Clientes c
LEFT JOIN Regiao r ON c.cliente_id = r.cliente_id;

SELECT *
FROM Clientes;

SELECT c.cliente_id, c.nome, c.email, r.endereco, r.cidade
FROM Clientes c
INNER JOIN Regiao r ON c.cliente_id = r.cliente_id;

