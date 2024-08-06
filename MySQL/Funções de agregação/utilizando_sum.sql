/* A30 - AGREGANDO COM SUM() */

SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

+-----------+
| TOTAL_JAN |
+-----------+
| 995439.21 |
+-----------+

SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEV,
	   SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

+-----------+-----------+-----------+
| TOTAL_JAN | TOTAL_FEV | TOTAL_MAR |
+-----------+-----------+-----------+
| 995439.21 | 795141.96 | 685831.17 |
+-----------+-----------+-----------+

/* VENDAS POR SEXO - Somou o total do MÊS de Março, e agrupou por SEXO*/

SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;

+------+-------------+
| SEXO | TOTAL_MARCO |
+------+-------------+
| F    |    87855.60 |
| M    |   597975.57 |
+------+-------------+
