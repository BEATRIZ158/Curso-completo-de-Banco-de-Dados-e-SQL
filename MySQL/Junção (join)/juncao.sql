/* JUNCAO -> JOIN */
/*Junção de 2 ou mais tabelas*/

/*Projetando a query (Consulta)*/
SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

+--------+----------------+-----------+
| NOME   | EMAIL          | IDCLIENTE |
+--------+----------------+-----------+
| JOAO   | JOAOA@IG.COM   |         1 |
| CARLOS | CARLOSA@IG.COM |         2 |
| ANA    | ANA@IG.COM     |         3 |
| CLARA  | NULL           |         4 |
| JORGE  | JORGE@IG.COM   |         5 |
| CELIA  | JCELIA@IG.COM  |         6 |
+--------+----------------+-----------+

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | BELO HORIZONTE |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE, ENDERECO /*ORIGEM */
WHERE IDCLIENTE = ID_CLIENTE; /* JUNCAO */

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* WHERE = SELECAO */
/*Utilizando tabela verdade, usando operador lógico AND*/

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO 
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; 

+-------+------+---------+----------------+
| NOME  | SEXO | BAIRRO  | CIDADE         |
+-------+------+---------+----------------+
| ANA   | F    | JARDINS | SAO PAULO      |
| CLARA | F    | CENTRO  | BELO HORIZONTE |
+-------+------+---------+----------------+

/* WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; -> TABELA VERDADE */

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',15);

/*Não tem como entrar em ENDERECO um cliente que não existe!*/

SELECT NOME, SEXO, BAIRRO, CIDADE /*Projeção*/
FROM CLIENTE /*Origem*/
INNER JOIN ENDERECO /*INNER é de Dentro, só traz quem atende a condição*/
ON IDCLIENTE = ID_CLIENTE; /*Onde IDCLIENTE é igual a ID_CLIENTE*/

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | BELO HORIZONTE |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/*Query Completa*/

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */ 
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /*JUNCAO */
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELECAO */

/* NOME, SEXO, EMAIL, TIPO, NUMERO */
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE 
    INNER JOIN TELEFONE
    ON IDCLIENTE = ID_CLIENTE;

+--------+------+----------------+------+----------+
| NOME   | SEXO | EMAIL          | TIPO | NUMERO   |
+--------+------+----------------+------+----------+
| JORGE  | M    | JORGE@IG.COM   | CEL  | 78458743 |
| JORGE  | M    | JORGE@IG.COM   | RES  | 56576876 |
| JOAO   | M    | JOAOA@IG.COM   | CEL  | 87866896 |
| CARLOS | M    | CARLOSA@IG.COM | COM  | 54768899 |
| JOAO   | M    | JOAOA@IG.COM   | RES  | 99667587 |
| ANA    | F    | ANA@IG.COM     | CEL  | 78989765 |
| ANA    | F    | ANA@IG.COM     | CEL  | 99766676 |
| JOAO   | M    | JOAOA@IG.COM   | COM  | 66687899 |
| JORGE  | M    | JORGE@IG.COM   | RES  | 89986668 |
| CARLOS | M    | CARLOSA@IG.COM | CEL  | 88687909 |
+--------+------+----------------+------+----------+

/*INNER JOIN - Junção de Mais de 2 tabelas*/

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

