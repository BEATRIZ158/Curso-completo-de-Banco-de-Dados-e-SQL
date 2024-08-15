/* A 41 - COMUNICACAO ENTRE BANCOS */

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

STATUS


CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

USE LOJA;

STATUS

INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,'TESTE',0.0);

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+-------+-------+
| IDBKP | IDPRODUTO | NOME  | VALOR |
+-------+-----------+-------+-------+
|     1 |      1000 | TESTE |  0.00 |
+-------+-----------+-------+-------+

/* BACKUP LÓGICO */

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,
	NEW.NOME,NEW.VALOR);

END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',100.00);

SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |      1000 | TESTE            |   0.00 |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 |
|     3 |         0 | LIVRO BI         |  80.00 |
|     4 |         0 | LIVRO ORACLE     |  70.00 |
|     5 |         0 | LIVRO SQL SERVER | 100.00 |
+-------+-----------+------------------+--------+


DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,
	OLD.NOME,OLD.VALOR);

END
$

DELIMITER ;

DELETE FROM PRODUTO WHERE IDPRODUTO = 2;

SELECT * FROM BACKUP.BKP_PRODUTO;
+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |      1000 | TESTE            |   0.00 |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 |
|     3 |         0 | LIVRO BI         |  80.00 |
|     4 |         0 | LIVRO ORACLE     |  70.00 |
|     5 |         0 | LIVRO SQL SERVER | 100.00 |
|     6 |         2 | LIVRO BI         |  80.00 |
+-------+-----------+------------------+--------+

DROP TRIGGER BACKUP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,
	NEW.NOME,NEW.VALOR);

END
$


DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO C#',100.00);

SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
|         5 | LIVRO C#         | 100.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;
+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |      1000 | TESTE            |   0.00 |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 |
|     3 |         0 | LIVRO BI         |  80.00 |
|     4 |         0 | LIVRO ORACLE     |  70.00 |
|     5 |         0 | LIVRO SQL SERVER | 100.00 |
|     6 |         2 | LIVRO BI         |  80.00 |
|     7 |         5 | LIVRO C#         | 100.00 |
+-------+-----------+------------------+--------+

ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

DROP TRIGGER BACKUP_PRODUTO_DEL;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,
	OLD.NOME,OLD.VALOR,'D');

END
$

DELIMITER ;

DELETE FROM PRODUTO WHERE IDPRODUTO = 4;

SELECT * FROM BACKUP.BKP_PRODUTO;
+-------+-----------+------------------+--------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  | EVENTO |
+-------+-----------+------------------+--------+--------+
|     1 |      1000 | TESTE            |   0.00 | NULL   |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 | NULL   |
|     3 |         0 | LIVRO BI         |  80.00 | NULL   |
|     4 |         0 | LIVRO ORACLE     |  70.00 | NULL   |
|     5 |         0 | LIVRO SQL SERVER | 100.00 | NULL   |
|     6 |         2 | LIVRO BI         |  80.00 | NULL   |
|     7 |         5 | LIVRO C#         | 100.00 | NULL   |
|     8 |         4 | LIVRO SQL SERVER | 100.00 | D      |
+-------+-----------+------------------+--------+--------+
