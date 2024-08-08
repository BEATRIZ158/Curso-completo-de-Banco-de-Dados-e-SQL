/* A 31 - SUBQUERIES - Uma querie dentro da outra*/

/*VENDEDOR QUE VENDEU MENOS EM MARCO E O SEU NOME */

SELECT * FROM VENDEDORES;

SELECT MIN(MARCO) FROM VENDEDORES;

SELECT 
    NOME, MIN(MARCO) AS MENOR_MARCO
FROM 
    VENDEDORES
WHERE 
    MARCO =
(
    SELECT MIN(MARCO) AS MENOR_VENDA
    FROM VENDEDORES
); 

/*INNER QUERY - É resolvida primeiro*/

+-------+-------------+
| NOME  | MENOR_MARCO |
+-------+-------------+
| MARIA |     4467.90 |
+-------+-------------+

/*NOME E O VALOR QUE VENDEU MAIS EM MARCO*/

SELECT 
    NOME, MAX(MARCO) AS MAIOR_MARCO 
FROM 
    VENDEDORES
WHERE
    MARCO =
(
    SELECT MAX(MARCO) AS MAIOR_VALOR
    FROM VENDEDORES

);

+----------+-------------+
| NOME     | MAIOR_MARCO |
+----------+-------------+
| ANDERSON |   578665.88 |
+----------+-------------+

/*QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEV*/

SELECT 
    NOME, FEVEREIRO, AVG(FEVEREIRO) AS MEDIA_FEVEREIRO 
FROM 
    VENDEDORES
WHERE 
    FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

+-------+-----------+-----------------+
| NOME  | FEVEREIRO | MEDIA_FEVEREIRO |
+-------+-----------+-----------------+
| CLARA | 446886.88 |   446886.875000 |
+-------+-----------+-----------------+
