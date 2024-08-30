-- Tabela Usuario
CREATE TABLE usuario(
    idUsuario SERIAL,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (idUsuario)
);

-- Tabela Emprestimo
CREATE TABLE emprestimo(
    idEmprestimo SERIAL,
    descricao VARCHAR(50),
    id_usuario INT NOT NULL, /* CHAVE ESTRANGEIRA */
    data DATE NOT NULL,
    CONSTRAINT pk_emprestimo PRIMARY KEY (idEmprestimo),
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(idUsuario)
);

-- Tabela Sessao
CREATE TABLE sessao(
    idSessao SERIAL,
    descricao VARCHAR(50),
    CONSTRAINT pk_sessao PRIMARY KEY (idSessao)
);

-- Tabela Livro
CREATE TABLE livro(
    idLivro SERIAL,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    id_sessao INT NOT NULL,  /* CHAVE ESTRANGEIRA */
    CONSTRAINT pk_livro PRIMARY KEY (idLivro),
    CONSTRAINT fk_sessao_livro FOREIGN KEY (id_sessao) REFERENCES sessao(idSessao)
);

DROP TABLE livro;

-- Tabela Associativa rel_livro_emprestimo
CREATE TABLE rel_livro_emprestimo(
    id_Livro INT NOT NULL, /* CHAVE ESTRANGEIRA */
    id_Emprestimo INT NOT NULL, /* CHAVE ESTRANGEIRA */
    CONSTRAINT pk_rel_livro_emprestimo PRIMARY KEY (id_Livro, id_Emprestimo),
    CONSTRAINT fk_livro FOREIGN KEY (id_Livro) REFERENCES livro(idLivro),
    CONSTRAINT fk_emprestimo FOREIGN KEY (id_Emprestimo) REFERENCES emprestimo(idEmprestimo)
);

-- Exercícios de Alterações 

-- 1) Altere o ID do usuario para "Id_Cli" OK

ALTER TABLE usuario RENAME COLUMN idUsuario TO Id_Cli;

-- 2) Altere o Tipo de dado do campo "nome_livro" para Varchar de 100; OK

ALTER TABLE livro ALTER nome TYPE VARCHAR(100); 

-- 3) Inclua o campo "Valor" na tabela Livro do tipo numeric; OK

ALTER TABLE livro
ADD COLUMN valor numeric(10, 2);

-- 4) Inclua Data_Emprestimo" no relacionamento "contem" OK

ALTER TABLE rel_livro_emprestimo ADD COLUMN Data_Emprestimo DATE;

-- 5) Exclua o campo "Valor"; OK

ALTER TABLE livro DROP COLUMN valor;
