-- Active: 1787005437140@@127.0.0.1@5432@bd_aula@public
CREATE TABLE curso(
    id_curso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE aluno(
    id_aluno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    id_curso INTEGER NOT NULL REFERENCES curso(id_curso)
);

SELECT * FROM curso;

SELECT * FROM aluno;

INSERT INTO curso(nome) VALUES
('Sistemas de Informacao'),
('Adiministracao'),
('Direito'),
('Ciencia da Computacao');

INSERT INTO aluno(nome, id_curso) VALUES
('Ana Beatriz Souza', 1),
('Carlos Henrique Lima', 1),
('Daniela Martins', 2),
('Eduardo Pereira', 3),
('Fernanda Rocha', 1)

SELECT 
    id_aluno,
    nome,
    id_curso
FROM
    aluno
ORDER BY
    id_aluno ASC;
