CREATE TABLE instituicao (
    id INTEGER,
    nome CHAR(50),
    id_usuario INTEGER,
    id_sala INTEGER,
    PRIMARY KEY (id, id_usuario)
);

CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome CHAR(50),
    data_nascimento TIMESTAMP
);

CREATE TABLE aluno (
    id_usuario INTEGER PRIMARY KEY
);

CREATE TABLE professor (
    id_usuario INTEGER PRIMARY KEY
);

CREATE TABLE sala (
    id INTEGER PRIMARY KEY,
    id_turma INTEGER
);

CREATE TABLE departamento (
    id INTEGER PRIMARY KEY,
    id_disciplina INTEGER
);

CREATE TABLE disciplina (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    horario TIME,
    id_professor INTEGER
);

CREATE TABLE grade (
    id INTEGER PRIMARY KEY,
    id_disciplina INTEGER,
    dia_semana INTEGER
);

CREATE TABLE turma (
    id INTEGER PRIMARY KEY
);

CREATE TABLE semestre  (
    id_turma INTEGER,
    id_aluno INTEGER,
    id_professor INTEGER
);
 
ALTER TABLE instituicao ADD CONSTRAINT FK_instituicao_2
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id);

ALTER TABLE instituicao ADD CONSTRAINT FK_instituicao_3
    FOREIGN KEY ( id_sala)
    REFERENCES sala (id);
 
ALTER TABLE aluno ADD CONSTRAINT FK_aluno_2
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id)
    ON DELETE CASCADE;
 
ALTER TABLE professor ADD CONSTRAINT FK_professor_2
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id)
    ON DELETE CASCADE;
 
ALTER TABLE sala ADD CONSTRAINT FK_sala_2
    FOREIGN KEY (id_instituicao)
    REFERENCES instituicao (id)
    ON DELETE RESTRICT;

ALTER TABLE sala ADD CONSTRAINT FK_sala_3
    FOREIGN KEY (id_turma)
    REFERENCES turma (id)
    ON DELETE RESTRICT;
 
ALTER TABLE departamento ADD CONSTRAINT FK_departamento_2
    FOREIGN KEY (id_disciplina)
    REFERENCES disciplina (id);
 
ALTER TABLE disciplina ADD CONSTRAINT FK_disciplina_2
    FOREIGN KEY (id_professor)
    REFERENCES professor (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE grade ADD CONSTRAINT FK_grade_2
    FOREIGN KEY (id_disciplina)
    REFERENCES disciplina (id);
 

 
ALTER TABLE semestre  ADD CONSTRAINT FK_semestre_1
    FOREIGN KEY (id_turma)
    REFERENCES turma (id)
    ON DELETE RESTRICT;
 
ALTER TABLE semestre  ADD CONSTRAINT FK_semestre_2
    FOREIGN KEY (id_aluno)
    REFERENCES aluno (id_usuario)
    ON DELETE NO ACTION;
 
ALTER TABLE semestre  ADD CONSTRAINT FK_semestre_3
    FOREIGN KEY (id_professor)
    REFERENCES professor (id_usuario)
    ON DELETE RESTRICT;