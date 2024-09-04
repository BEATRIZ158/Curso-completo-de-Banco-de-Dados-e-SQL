/* ESTATÍSTICAS */

-- Mostrando uma quantidade limitada de linhas

SELECT * FROM funcionarios
LIMIT 10;

-- Qual o gasto total de salario pago pela empresa ?

SELECT SUM(salario)
FROM funcionarios;

-- Qual o montante total que cada departamento recebe de salario

SELECT departamento AS "Departamento", SUM(salario) AS "Total"
FROM funcionarios
GROUP BY departamento;

-- Por departament, qual o total e a média paga para os funcionários 

SELECT  departamento AS "Departamento",
        SUM(salario) AS "Soma", 
        AVG(salario) 
FROM funcionarios
GROUP BY departamento;

-- ORDER BY

SELECT  departamento AS "Departamento",
        SUM(salario) AS "Soma", 
        AVG(salario)
FROM funcionarios
GROUP BY departamento
ORDER BY 3;

SELECT  departamento AS "Departamento",
        SUM(salario) AS "Soma", 
        AVG(salario)
FROM funcionarios
GROUP BY departamento
ORDER BY 3 ASC;

SELECT  departamento AS "Departamento",
        SUM(salario) AS "Soma", 
        AVG(salario)
FROM funcionarios
GROUP BY departamento
ORDER BY 3 DESC;
