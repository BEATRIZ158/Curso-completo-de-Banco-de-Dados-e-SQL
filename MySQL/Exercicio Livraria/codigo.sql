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
    
valor_livro DECIMAL(10, 2),
    
uf_editora CHAR(2),
    
ano_publicacao VARCHAR(10)

);

INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('Cavaleiro Real', 'Ana Claudia', 'Feminino', 465, 'Atlas', 49.9, 'RJ',  '2009');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('SQL para leigos', 'João Nunes', 'Masculino', 450, 'Addison', 98, 'SP',  '2018');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('Receitas Caseiras', 'Celia Tavares', 'Feminino', 210, 'Atlas', 45, 'RJ',  '2008');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('Pessoas Efetivas', 'Eduardo Santos', 'Masculino', 390, 'Beta', 78.99, 'RJ',  '2018');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('Habitos Saudáveis', 'Eduardo Santos', 'Masculino', 630, 'Beta', 150.98, 'RJ', '2019');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('A Casa Marrom', 'Hermes Macedo', 'Masculino', 250, 'Bubba', 60, 'MG',  '2016');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('Estacio Querido', 'Geraldo Fonseca', 'Masculino', 310, 'Insignia', 100, 'ES', '2015');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('Pra sempre amigas', 'Leda Silva', 'Feminino', 510, 'Insignia', 78.98, 'ES', '2013');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('Copas Inesqueciveis', 'Marcos Alcantara', 'Masculino', 200, 'Larson', 130.98, 'RS', '2018');
INSERT INTO livros(nome_livro, nome_autor, sexo_autor, numero_paginas, nome_editora, valor_livro, uf_editora, ano_publicacao) 
VALUES('O poder da mente', 'Clara Mafra', 'Feminino', 120, 'Continental', 56.58, 'RS', '2017');

SELECT * FROM livros; /*1 - Trazer todos os dados*/
SELECT nome_livro AS 'Nome do Livro', nome_editora AS 'Nome da Editora' FROM livros; /*2 - – Trazer o nome do livro e o nome da editora*/
SELECT nome_livro AS 'Nome do Livro', uf_editora AS 'Estado da Editora' FROM livros WHERE sexo_autor = 'Masculino'; /*3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.*/
SELECT nome_livro AS 'Nome do Livro', numero_paginas AS 'Número de Paginas' FROM livros WHERE sexo_autor = 'Feminino'; /*4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.*/
SELECT valor_livro AS 'Valor do Livro' FROM livros WHERE uf_editora = 'SP'; /*5 – Trazer os valores dos livros das editoras de São Paulo.*/
SELECT 
	nome_livro AS 'Nome do Livro', 
	nome_autor AS 'Nome do Autor', 
	sexo_autor AS 'Sexo do Autor', 
	nome_editora AS 'Nome da Editora', 
	numero_paginas AS 'Nr de Paginas', 
	valor_livro AS 'Valor do Livro', 
	uf_editora AS 'UF da Editora'
FROM livros 
WHERE sexo_autor = 'Masculino' 
    AND (uf_editora = 'SP' OR uf_editora = 'RJ'); /*6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio)*/
