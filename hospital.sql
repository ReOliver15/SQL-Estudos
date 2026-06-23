USE Hospital

SELECT *
FROM bebes;

-- Tabela: partos
-- Recriar a tabela partos com ON DELETE NO ACTION para id_bebe
CREATE TABLE partos (
    id_parto INT IDENTITY(1,1) PRIMARY KEY,
    id_mae INT NOT NULL,
    id_medico INT NOT NULL,
    data_parto DATETIME NOT NULL,
    tipo_parto NVARCHAR(10) NOT NULL CHECK (tipo_parto IN ('Normal', 'Cesárea')),
    id_bebe INT UNIQUE NOT NULL,
    FOREIGN KEY (id_mae) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE,
    FOREIGN KEY (id_bebe) REFERENCES bebes(id_bebe) ON DELETE NO ACTION
);
GO

-- Inserir dados na tabela bebes
INSERT INTO bebes (nome)
VALUES 
('Lucas Silva'),
('Mariana Costa'),
('João Pedro'),
('Ana Beatriz');
GO

CREATE TABLE maes (
    id_mae INT PRIMARY KEY IDENTITY(1,1),   -- Identificador único para a mãe
    nome_mae VARCHAR(100),                    -- Nome da mãe
    data_nascimento DATE,                     -- Data de nascimento da mãe
    cpf CHAR(11),                             -- CPF da mãe
    endereco VARCHAR(255),                    -- Endereço da mãe
    telefone VARCHAR(15),                     -- Número de telefone
    email VARCHAR(100)                        -- Endereço de email
);

INSERT INTO maes (nome_mae)
VALUES
('Joana');

INSERT INTO maes (nome_mae)
VALUES 
('Julia')

SELECT *
FROM maes

UPDATE maes
SET data_nascimento = '2000-11-21'
WHERE id_mae = 2;

UPDATE Maes
SET email = 'maria12@hotmail.com'
WHERE id_mae = 1;


SET endereco = 'Rua do ajuricaba'

INSERT INTO maes (data_nascimento, cpf, endereco, telefone, email)
VALUES
('21-12-1986', '09898889', 'Rua do pica pau', '9999999', 'maria@gmail.com')

SELECT * FROM bebes

INSERT INTO bebes (nome_bebes, data_nascimento, id_mae)
VALUES
('João Silva', '2025-01-15', 1),  -- Referência ao id_mae da tabela maes
('Liz Ferreira', '2025-01-16', 2);  -- Referência ao id_mae da tabela maes

INSERT INTO bebes (data_nascimento, peso, altura, id_mae)
VALUES 
('2025-02-12', '2.2', '1.9', 1);



