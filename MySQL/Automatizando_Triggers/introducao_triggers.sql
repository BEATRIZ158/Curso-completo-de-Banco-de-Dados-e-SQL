/* A 39 ENTENDENDO TRIGGERS 

TRIGGER é um gatilho que dispara um comando antes ou depois de acontecer uma dada ação*/

/* ESTRUTURA DE UMA TRIGGER */

/*MUDAR O DELIMITADOR ANTES*/
CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		QUALQUER COMANDO SQL

END -> FIM

CREATE DATABASE AULA40;

USE AULA40;

CREATE TABLE USUARIO(
    IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

/*Tabela de Backup*/
CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

/*Não posso colocar duas triggers olhando para a mesma 
tabela disparando ao mesmo tempo

Conceito de NEW (NOVO) e OLD(VELHO)

INSERT valor novo na tabela-> NEW (NOVO)
DELETE valor que já está na tabela-> OLD(VELHO)
UPDATE -> Entra o valor NEW e sai o valor OLD
*/

/* CRIANDO A TRIGGER */

DELIMITER $

CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN
    INSERT INTO BKP_USUARIO VALUES
	(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);
END
$

INSERT INTO USUARIO VALUES(NULL,'ANDRADE','ANDRADE2009','HEXACAMPEAO');

SELECT * FROM USUARIO;
+-----------+---------+-------------+-------------+
| IDUSUARIO | NOME    | LOGIN       | SENHA       |
+-----------+---------+-------------+-------------+
|         1 | ANDRADE | ANDRADE2009 | HEXACAMPEAO |
+-----------+---------+-------------+-------------+

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

SELECT * FROM BKP_USUARIO;
+----------+-----------+---------+-------------+
| IDBACKUP | IDUSUARIO | NOME    | LOGIN       |
+----------+-----------+---------+-------------+
|        1 |         1 | ANDRADE | ANDRADE2009 |
+----------+-----------+---------+-------------+
