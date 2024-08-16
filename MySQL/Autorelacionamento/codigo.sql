/* A44 - AUTORELACIONAMENTO */


CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT,
	VALOR FLOAT(10,2),
	ID_PREREQ INT
);

ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(IDCURSO);

INSERT INTO CURSOS VALUES(NULL,'BD RELACIONAL',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'BUSINESS INTELLIGENCE',40,800.00,1);
INSERT INTO CURSOS VALUES(NULL,'RELATORIOS AVANCADOS',20,600.00,2);
INSERT INTO CURSOS VALUES(NULL,'LOGICA PROGRAM',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'RUBY',30,500.00,4);

SELECT * FROM CURSOS;
+---------+-----------------------+-------+--------+-----------+
| IDCURSO | NOME                  | HORAS | VALOR  | ID_PREREQ |
+---------+-----------------------+-------+--------+-----------+
|       1 | BD RELACIONAL         |    20 | 400.00 |      NULL |
|       2 | BUSINESS INTELLIGENCE |    40 | 800.00 |         1 |
|       3 | RELATORIOS AVANCADOS  |    20 | 600.00 |         2 |
|       4 | LOGICA PROGRAM        |    20 | 400.00 |      NULL |
|       5 | RUBY                  |    30 | 500.00 |         4 |
+---------+-----------------------+-------+--------+-----------+

SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQ,"SEM REQ") REQUISITO
FROM CURSOS;
+-----------------------+--------+-------+-----------+
| NOME                  | VALOR  | HORAS | REQUISITO |
+-----------------------+--------+-------+-----------+
| BD RELACIONAL         | 400.00 |    20 | SEM REQ   |
| BUSINESS INTELLIGENCE | 800.00 |    40 | 1         |
| RELATORIOS AVANCADOS  | 600.00 |    20 | 2         |
| LOGICA PROGRAM        | 400.00 |    20 | SEM REQ   |
| RUBY                  | 500.00 |    30 | 4         |
+-----------------------+--------+-------+-----------+

/* NOME, VALOR, HORAS E O NOME DO PRE REQUISITO DO CURSO */

SELECT 
C.NOME AS CURSO, 
C.VALOR AS VALOR, 
C.HORAS AS CARGA,
IFNULL(P.NOME, "-----") AS PREREQ
FROM CURSOS C 
INNER JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQ;

+-----------------------+--------+-------+-----------------------+
| CURSO                 | VALOR  | CARGA | PREREQ                |
+-----------------------+--------+-------+-----------------------+
| BUSINESS INTELLIGENCE | 800.00 |    40 | BD RELACIONAL         |
| RELATORIOS AVANCADOS  | 600.00 |    20 | BUSINESS INTELLIGENCE |
| RUBY                  | 500.00 |    30 | LOGICA PROGRAM        |
+-----------------------+--------+-------+-----------------------+

SELECT 
C.NOME AS CURSO, 
C.VALOR AS VALOR, 
C.HORAS AS CARGA, 
IFNULL(P.NOME, "---") AS PREREQ
FROM CURSOS C LEFT JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQ;
+-----------------------+--------+-------+-----------------------+
| CURSO                 | VALOR  | CARGA | PREREQ                |
+-----------------------+--------+-------+-----------------------+
| BD RELACIONAL         | 400.00 |    20 | ---                   |
| BUSINESS INTELLIGENCE | 800.00 |    40 | BD RELACIONAL         |
| RELATORIOS AVANCADOS  | 600.00 |    20 | BUSINESS INTELLIGENCE |
| LOGICA PROGRAM        | 400.00 |    20 | ---                   |
| RUBY                  | 500.00 |    30 | LOGICA PROGRAM        |
+-----------------------+--------+-------+-----------------------+

/*Esplicando ON P.IDCURSO = C.ID_PREREQ;:

Para a linha 2 (BUSINESS INTELLIGENCE):

Alias C: C.IDCURSO = 2, C.ID_PREREQ = 1
Alias P: P.IDCURSO = 1

Para a linha 1 (BD RELACIONAL):

Alias C: C.IDCURSO = 1, C.ID_PREREQ = NULL
Alias P: O banco de dados não encontra uma correspondência porque C.ID_PREREQ é NULL.


A condição ON P.IDCURSO = C.ID_PREREQ está dizendo ao banco de dados para comparar duas colunas diferentes:

P.IDCURSO: Esta é a coluna IDCURSO da tabela CURSOS que foi associada ao alias P no LEFT JOIN.
C.ID_PREREQ: Esta é a coluna ID_PREREQ da tabela CURSOS que foi associada ao alias C.
Como isso funciona:
Alias C: O alias C refere-se ao curso principal que você está consultando. Esta é a tabela à esquerda na junção (LEFT JOIN). Cada curso 
nesta tabela pode ou não ter um pré-requisito, que é indicado pelo valor na coluna ID_PREREQ.

Alias P: O alias P refere-se ao curso que pode ser um pré-requisito para o curso associado ao alias C. Esta é a tabela à direita na 
junção.

A condição P.IDCURSO = C.ID_PREREQ significa que o banco de dados deve procurar, na tabela P (que é, na verdade, a mesma tabela CURSOS),
o curso cujo IDCURSO corresponde ao valor de ID_PREREQ na tabela C.

A condição de junção ON P.IDCURSO = C.ID_PREREQ é usada para encontrar o curso que é o pré-requisito do curso atual (C). Ela faz isso 
ao verificar se o IDCURSO do curso no alias P corresponde ao ID_PREREQ do curso no alias C. Se a condição for verdadeira, o curso do 
alias P é considerado o pré-requisito do curso no alias C. Se não houver correspondência (ou seja, ID_PREREQ é NULL), o pré-requisito 
será tratado como inexistente (por exemplo, substituído por "---").
*/
