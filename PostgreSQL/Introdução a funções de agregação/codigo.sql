/* FUNÇÕES DE AGREGAÇÃO 
Algumas funções são: COUNT, MAX, MIN, SUM ... */


-- Querys simples

SELECT * FROM localizacao;
SELECT * FROM departamento;
SELECT * FROM localizacao;

-- Contando o número de ocorrêcias

SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM departamentos;
SELECT COUNT(*) FROM localizacao;

-- Agrupando por sexo com Group By

SELECT COUNT(*) FROM funcionarios
GROUP BY sexo;

-- Colocando o nome da coluna

SELECT sexo, COUNT(*) AS "Quantidade" FROM funcionarios
GROUP BY sexo;

-- Mostrando o número de funcionários em cada departamento

SELECT departamento, COUNT(*)
FROM funcionarios
GROUP BY departamento;

-- Exibindo o máximo de salários 149929

SELECT MAX(salario) AS "Salário Máximo" FROM funcionarios;

-- Exibindo o minimo de salários - 40138

SELECT MIN(salario) AS "Salário Minímo"

-- Exibindo o máximo e o minímo juntos

SELECT MAX(salario) AS "Salário Máximo" , MIN(salario) AS "Salário Minímo" 
FROM funcionarios;

-- Exibindo o máximo e o minímo de cada departamento

SELECT departamento, MAX(salario) AS "Salário Máximo" , MIN(salario) AS "Salário Minímo"
FROM funcionarios
GROUP BY departamento;

-- Exibindo o máximo e o minímo de cada sexo

SELECT sexo, MAX(salario) AS "Salário Máximo" , MIN(salario) AS "Salário Minímo"
FROM funcionarios
GROUP BY sexo;
