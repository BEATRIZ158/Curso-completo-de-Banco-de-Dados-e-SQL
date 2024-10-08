/* REFORMATANDO STRINGS */

-- Listando Colunas

SELECT DEPARTAMENTO 
FROM FUNCIONARIOS;

-- DISTINCT - Não repete

SELECT DISTINCT DEPARTAMENTO 
FROM FUNCIONARIOS;

-- UPPER CASE

SELECT DISTINCT UPPER(DEPARTAMENTO) 
FROM FUNCIONARIOS;

-- LOWER CASE

SELECT DISTINCT LOWER(DEPARTAMENTO) 
FROM FUNCIONARIOS;

-- Concatenando Strings
-- || PIPE PIPE
SELECT CARGO || ' - ' || DEPARTAMENTO
FROM FUNCIONARIOS;

SELECT UPPER(CARGO || ' - ' || DEPARTAMENTO) AS "Cargo Completo"
FROM FUNCIONARIOS;

-- Remover espaços
SELECT '             UNIDADOS            ';

-- Contando Caracteres
SELECT LENGTH('             UNIDADOS            ');

-- Aplicando TRIM

SELECT TRIM('             UNIDADOS            ');
SELECT LENGTH(TRIM('             UNIDADOS            '));

-- DESAFIO - CRIAR UMA COLUNA AO LADO DA COLUNA CARGO, QUE DIGA SE A PESSOA É ASSITENTE OU NÃO
SELECT * FROM FUNCIONARIOS;

SELECT NOME, CARGO, (CARGO LIKE '%Assistant%') AS "Assitente"
FROM FUNCIONARIOS;

SELECT NOME, 
	CASE WHEN(CARGO LIKE '%Assistant%') = TRUE THEN 1
		ELSE 0
		END AS "Assistente?"
		FROM FUNCIONARIOS;
