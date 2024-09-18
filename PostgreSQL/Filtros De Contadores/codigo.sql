/*  MULTIPLOS CONTADORES */

SELECT COUNT(*) FROM FUNCIONARIOS;

SELECT COUNT(*) AS "Quantidade Total",
COUNT('Masculino') AS "As Masculino"
FROM FUNCIONARIOS;

SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
WHERE SEXO = 'Masculino'
GROUP BY SEXO;

SELECT COUNT(*) AS "Quantidade Total",
COUNT(
SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
WHERE SEXO = 'Masculino'
GROUP BY SEXO;
)

SELECT COUNT(*) AS "Quantidade Total",
(SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
WHERE SEXO = 'Masculino'
GROUP BY SEXO) AS "Masculino"
FROM FUNCIONARIOS;

-- Deu certo! Porém, degrada a performance do banco
SELECT COUNT(*) AS "Quantidade Total",
(SELECT COUNT(*)
FROM FUNCIONARIOS
WHERE SEXO = 'Masculino'
GROUP BY SEXO) AS "Masculino"
FROM FUNCIONARIOS;

-- Forma fácil de fazer! Retorna o mesmo resultado
-- Só funciona com o COUNT()
SELECT COUNT(*) AS "Quantidade Total",
COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS "Masculino"
FROM FUNCIONARIOS;

SELECT COUNT(*) AS "Quantidade Total",
COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS "Masculino",
COUNT(*) FILTER(WHERE DEPARTAMENTO = 'Books') AS "Books"
FROM FUNCIONARIOS;

SELECT COUNT(*) AS "Quantidade Total",
COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS "Masculino",
COUNT(*) FILTER(WHERE DEPARTAMENTO = 'Books') AS "Books",
COUNT(*) FILTER(WHERE SALARIO > 140000) AS "Salário maior que R$140.000"
FROM FUNCIONARIOS;
