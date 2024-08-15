/* A 43 - TRIGGER DE AUDITORIA */

DELIMITER ;

DROP DATABASE LOJA;

DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',100.00);

/*QUANDO*/
SELECT NOW();
/*QUEM*/
SELECT CURRENT_USER();

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);

USE LOJA;

SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+

DELIMITER $

CREATE TRIGGER AUDIT_PROD
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,
	OLD.VALOR,NEW.VALOR,NOW(),CURRENT_USER(),'U');
	
END
$

DELIMITER ;

/*Faz alteração*/

UPDATE PRODUTO SET VALOR = 110.00
WHERE IDPRODUTO = 4;

SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 110.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;
+----------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+
| IDBACKUP | IDPRODUTO | NOME             | VALOR_ORIGINAL | VALOR_ALTERADO | DATA                | USUARIO        | EVENTO |
+----------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+
|        1 |         4 | LIVRO SQL SERVER |         100.00 |         110.00 | 2024-08-15 15:22:57 | root@localhost | U      |
+----------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+
