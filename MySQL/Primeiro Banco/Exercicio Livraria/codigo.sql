/*CRAINDO O BANCO DE DADOS*/

CREATE DATABASE livraria;

/*CONECTANDO-SE AO BANCO */

USE livraria;

/*CRIANDO A TABELA LIVROS */

CREATE TABLE livros(
    nome_livro VARCHAR(100),
    nome_autor VARCHAR(100),
    sexo_autor VARCHAR(50),
    numero_paginas INT,
    nome_editora VARCHAR(100),
    valor_livro NUMERIC,
    uf_editora CHAR(2),
    ano_publicacao INT
);

INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('Cavaleiro Real', 'Ana Claudia', 'Feminino', 465, 'Atlas', 49.9, 'RJ',  2009)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('SQL para leigos', 'João Nunes', 'Masculino', 450, 'Addison', 98, 'SP',  2018)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('Receitas Caseiras', 'Celia Tavares', 'Feminino', 210, 'Atlas', 45, 'RJ',  2008)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('Pessoas Efetivas', 'Eduardo Santos', 'Masculino', 390, 'Beta', 78.99, 'RJ',  2018)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('Habitos Saudáveis', 'Eduardo Santos', 'Masculino', 630, 'Beta', 150.98, 'RJ',  2019)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('A Casa Marrom', 'Hermes Macedo', 'Masculino', 250, 'Bubba', 60, 'MG',  2016)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('Estacio Querido', 'Geraldo Fonseca', 'Masculino', 310, 'Insignia', 100, 'ES',  2015)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('Pra sempre amigas', 'Leda Silva', 'Feminino', 510, 'Insignia', 78.98, 'ES',  2013)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('Copas Inesqueciveis', 'Marcos Alcantara', 'Masculino', 200, 'Larson', 130.98, 'RS',  2018)
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) VALUES('O poder da mente', 'Clara Mafra', 'Feminino', 120, 'Continental', 56.58, 'RS',  2017)

SELECT * FROM livros; /*1 - Trazer todos os dados*/
