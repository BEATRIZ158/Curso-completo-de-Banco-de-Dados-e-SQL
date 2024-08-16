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
    -> FROM CURSOS;
+-----------------------+--------+-------+-----------+
| NOME                  | VALOR  | HORAS | REQUISITO |
+-----------------------+--------+-------+-----------+
| BD RELACIONAL         | 400.00 |    20 | SEM REQ   |
| BUSINESS INTELLIGENCE | 800.00 |    40 | 1         |
| RELATORIOS AVANCADOS  | 600.00 |    20 | 2         |
| LOGICA PROGRAM        | 400.00 |    20 | SEM REQ   |
| RUBY                  | 500.00 |    30 | 4         |
+-----------------------+--------+-------+-----------+
