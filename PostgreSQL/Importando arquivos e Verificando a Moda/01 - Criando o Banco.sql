CREATE TABLE MAQUINAS(
  MAQUINA VARCHAR(20),
  DIA INT,
  QTD NUMERIC(10, 2)
);

PostgreSQL/Importando arquivos e Verificando a Moda

COPY MAQUINAS
FROM 'C:\LogMaquinas.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM MAQUINAS;

/* QUAL A MÉDIA DE CADA MÁQUINA */

SELECT MAQUINA, AVG(QTD) AS MEDIA_QUANTIDADE
FROM MAQUINAS
GROUP BY MAQUINA
ORDER BY 2 DESC;

/* ARREDONDANDO */

ROUND(COLUNA, 2)

SELECT MAQUINA, ROUND(AVG(QTD),2) AS MEDIA_QUANTIDADE
FROM MAQUINAS
GROUP BY MAQUINA
ORDER BY 2 DESC;

/* QUAL A MODA DAS QUANTIDADE */

SELECT MAQUINA, QTD, COUNT(*) AS MODA
FROM MAQUINAS
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC;

/* QUAL A MODA DAS QUANTIDADES DE CADA MAQUINA 

Traz a primeira que ele encontrar */

SELECT MAQUINA, QTD, COUNT(*)
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 01'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;

SELECT MAQUINA, QTD, COUNT(*)
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 02'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;

SELECT MAQUINA, QTD, COUNT(*)
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 03'
GROUP BY MAQUINA, QTD
ORDER BY 3 DESC
LIMIT 1;