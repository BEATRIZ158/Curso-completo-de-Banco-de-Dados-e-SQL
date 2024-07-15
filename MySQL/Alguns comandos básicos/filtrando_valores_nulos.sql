
/* FILTRANDO VALORES NULOS */

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE sexo = 'F';

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL = NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;
