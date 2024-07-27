/*Função é um bloco de código que executa algo*/

/*Função que retorna Data e Hora, função sem paramêtro*/
SELECT NOW(); 

/*IFNULL*/

SHOW DATABASE;

SHOW TABLE;

/* nome, email, numero, estado */
SELECT C.NOME, C.EMAIL, 
        T.NUMERO, 
        E.ESTADO
FROM CLIENTE C 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-------------------+----------+--------+
| JORGE   | JORGE@IG.COM      | 78458743 | ES     |
| JORGE   | JORGE@IG.COM      | 56576876 | ES     |
| JOAO    | JOAOA@IG.COM      | 87866896 | RJ     |
| CARLOS  | CARLOSA@IG.COM    | 54768899 | RJ     |
| JOAO    | JOAOA@IG.COM      | 99667587 | RJ     |
| ANA     | ANA@IG.COM        | 78989765 | SP     |
| ANA     | ANA@IG.COM        | 99766676 | SP     |
| JOAO    | JOAOA@IG.COM      | 66687899 | RJ     |
| JORGE   | JORGE@IG.COM      | 89986668 | ES     |
| CARLOS  | CARLOSA@IG.COM    | 88687909 | RJ     |
| ANDRE   | ANDRE@GLOBO.COM   | 68976565 | MG     |
| ANDRE   | ANDRE@GLOBO.COM   | 99656675 | MG     |
| KARLA   | KARLA@GMAIL.COM   | 33567765 | RJ     |
| KARLA   | KARLA@GMAIL.COM   | 88668786 | RJ     |
| KARLA   | KARLA@GMAIL.COM   | 55689654 | RJ     |
| DANIELE | DANIELE@GMAIL.COM | 88687979 | RJ     |
| LORENA  | NULL              | 88965676 | ES     |
| ANTONIO | ANTONIO@IG.COM    | 89966809 | PR     |
| ANTONIO | ANTONIO@UOL.COM   | 88679978 | SP     |
| ELAINE  | ELAINE@GLOBO.COM  | 99655768 | PR     |
| CARMEM  | CARMEM@IG.COM     | 89955665 | SP     |
| ADRIANA | ADRIANA@GMAIL.COM | 77455786 | RJ     |
| ADRIANA | ADRIANA@GMAIL.COM | 89766554 | RJ     |
| JOICE   | JOICE@GMAIL.COM   | 77755785 | RJ     |
| JOICE   | JOICE@GMAIL.COM   | 44522578 | RJ     |
+---------+-------------------+----------+--------+

/*IFNULL() é uma função para retirar valores NULOS, 
precisa de paramêtros, uma coluna e uma string para mostra
para o usuário*/

SELECT  C.NOME, 
        IFNULL(C.EMAIL, 'NÃO TEM EMAIL'), 
        T.NUMERO, 
        E.ESTADO
FROM CLIENTE C 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-----------------------------------+----------+--------+
| NOME    | IFNULL(C.EMAIL, 'NÃO TEM EMAIL')  | NUMERO   | ESTADO |
+---------+-----------------------------------+----------+--------+
| JORGE   | JORGE@IG.COM                      | 78458743 | ES     |
| JORGE   | JORGE@IG.COM                      | 56576876 | ES     |
| JOAO    | JOAOA@IG.COM                      | 87866896 | RJ     |
| CARLOS  | CARLOSA@IG.COM                    | 54768899 | RJ     |
| JOAO    | JOAOA@IG.COM                      | 99667587 | RJ     |
| ANA     | ANA@IG.COM                        | 78989765 | SP     |
| ANA     | ANA@IG.COM                        | 99766676 | SP     |
| JOAO    | JOAOA@IG.COM                      | 66687899 | RJ     |
| JORGE   | JORGE@IG.COM                      | 89986668 | ES     |
| CARLOS  | CARLOSA@IG.COM                    | 88687909 | RJ     |
| ANDRE   | ANDRE@GLOBO.COM                   | 68976565 | MG     |
| ANDRE   | ANDRE@GLOBO.COM                   | 99656675 | MG     |
| KARLA   | KARLA@GMAIL.COM                   | 33567765 | RJ     |
| KARLA   | KARLA@GMAIL.COM                   | 88668786 | RJ     |
| KARLA   | KARLA@GMAIL.COM                   | 55689654 | RJ     |
| DANIELE | DANIELE@GMAIL.COM                 | 88687979 | RJ     |
| LORENA  | NÃO TEM EMAIL                     | 88965676 | ES     |
| ANTONIO | ANTONIO@IG.COM                    | 89966809 | PR     |
| ANTONIO | ANTONIO@UOL.COM                   | 88679978 | SP     |
| ELAINE  | ELAINE@GLOBO.COM                  | 99655768 | PR     |
| CARMEM  | CARMEM@IG.COM                     | 89955665 | SP     |
| ADRIANA | ADRIANA@GMAIL.COM                 | 77455786 | RJ     |
| ADRIANA | ADRIANA@GMAIL.COM                 | 89766554 | RJ     |
| JOICE   | JOICE@GMAIL.COM                   | 77755785 | RJ     |
| JOICE   | JOICE@GMAIL.COM                   | 44522578 | RJ     |
+---------+-----------------------------------+----------+--------+

SELECT  C.NOME, 
		IFNULL(C.EMAIL,'************'), 
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+--------------------------------+--------+----------+
| JORGE   | JORGE@IG.COM                   | ES     | 78458743 |
| JORGE   | JORGE@IG.COM                   | ES     | 56576876 |
| JOAO    | JOAOA@IG.COM                   | RJ     | 87866896 |
| CARLOS  | CARLOSA@IG.COM                 | RJ     | 54768899 |
| JOAO    | JOAOA@IG.COM                   | RJ     | 99667587 |
| ANA     | ANA@IG.COM                     | SP     | 78989765 |
| ANA     | ANA@IG.COM                     | SP     | 99766676 |
| JOAO    | JOAOA@IG.COM                   | RJ     | 66687899 |
| JORGE   | JORGE@IG.COM                   | ES     | 89986668 |
| CARLOS  | CARLOSA@IG.COM                 | RJ     | 88687909 |
| ANDRE   | ANDRE@GLOBO.COM                | MG     | 68976565 |
| ANDRE   | ANDRE@GLOBO.COM                | MG     | 99656675 |
| KARLA   | KARLA@GMAIL.COM                | RJ     | 33567765 |
| KARLA   | KARLA@GMAIL.COM                | RJ     | 88668786 |
| KARLA   | KARLA@GMAIL.COM                | RJ     | 55689654 |
| DANIELE | DANIELE@GMAIL.COM              | RJ     | 88687979 |
| LORENA  | ************                   | ES     | 88965676 |
| ANTONIO | ANTONIO@IG.COM                 | PR     | 89966809 |
| ANTONIO | ANTONIO@UOL.COM                | SP     | 88679978 |
| ELAINE  | ELAINE@GLOBO.COM               | PR     | 99655768 |
| CARMEM  | CARMEM@IG.COM                  | SP     | 89955665 |
| ADRIANA | ADRIANA@GMAIL.COM              | RJ     | 77455786 |
| ADRIANA | ADRIANA@GMAIL.COM              | RJ     | 89766554 |
| JOICE   | JOICE@GMAIL.COM                | RJ     | 77755785 |
| JOICE   | JOICE@GMAIL.COM                | RJ     | 44522578 |
+---------+--------------------------------+--------+----------+

SELECT  C.NOME, 
		IFNULL(C.EMAIL,'************') AS "E-MAIL", 
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-------------------+--------+----------+
| NOME    | E-MAIL            | ESTADO | NUMERO   |
+---------+-------------------+--------+----------+
| JORGE   | JORGE@IG.COM      | ES     | 78458743 |
| JORGE   | JORGE@IG.COM      | ES     | 56576876 |
| JOAO    | JOAOA@IG.COM      | RJ     | 87866896 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 54768899 |
| JOAO    | JOAOA@IG.COM      | RJ     | 99667587 |
| ANA     | ANA@IG.COM        | SP     | 78989765 |
| ANA     | ANA@IG.COM        | SP     | 99766676 |
| JOAO    | JOAOA@IG.COM      | RJ     | 66687899 |
| JORGE   | JORGE@IG.COM      | ES     | 89986668 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 88687909 |
| ANDRE   | ANDRE@GLOBO.COM   | MG     | 68976565 |
| ANDRE   | ANDRE@GLOBO.COM   | MG     | 99656675 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 33567765 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88668786 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 55689654 |
| DANIELE | DANIELE@GMAIL.COM | RJ     | 88687979 |
| LORENA  | ************      | ES     | 88965676 |
| ANTONIO | ANTONIO@IG.COM    | PR     | 89966809 |
| ANTONIO | ANTONIO@UOL.COM   | SP     | 88679978 |
| ELAINE  | ELAINE@GLOBO.COM  | PR     | 99655768 |
| CARMEM  | CARMEM@IG.COM     | SP     | 89955665 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77455786 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 89766554 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 77755785 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 44522578 |
+---------+-------------------+--------+----------+
