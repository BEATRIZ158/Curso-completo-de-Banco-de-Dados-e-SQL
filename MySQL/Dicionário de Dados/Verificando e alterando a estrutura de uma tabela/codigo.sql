/* A33 - ALTERANDO TABELAS */

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

/*Criando Tabela com PK*/
CREATE TABLE TABELA(
	COLUNA1 INT PRIMARY KEY AUTO_INCREMENT
);

--ADICIONANDO UMA PK
ALTER TABLE TABELA 
ADD PRIMARY KEY (COLUNA1);

/*DIFERENÇA - Incremento, não é possível colocar o 
AUTO_INCREMENT se colocar a PK fora da criação*/

--ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO
ALTER TABLE TABELA 
ADD COLUNA varchar(30);

DESC TABELA;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2 | varchar(30) | YES  |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
| COLUNA  | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

ALTER TABLE TABELA 
ADD COLUNA100 INT;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| COLUNA1   | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2   | varchar(30) | YES  |     | NULL    |       |
| COLUNA3   | varchar(30) | YES  |     | NULL    |       |
| COLUNA    | varchar(30) | YES  |     | NULL    |       |
| COLUNA100 | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

--ADICIONANDO UMA COLUNA COM POSICAO
ALTER TABLE TABELA 
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3; /*Depois da coluna COLUNA3*/

DESC TABELA;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| COLUNA1   | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2   | varchar(30) | YES  |     | NULL    |       |
| COLUNA3   | varchar(30) | YES  |     | NULL    |       |
| COLUNA4   | varchar(30) | NO   | UNI | NULL    |       |
| COLUNA    | varchar(30) | YES  |     | NULL    |       |
| COLUNA100 | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

--MODIFICANDO O TIPO DE UM CAMPO, SE A TABELA TIVER DADOS, OS DADOS PRECISAM SER COMPATIVEIS
ALTER TABLE TABELA
 MODIFY COLUNA2 DATE NOT NULL;

DESC TABELA;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| COLUNA1   | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2   | date        | NO   |     | NULL    |       |
| COLUNA3   | varchar(30) | YES  |     | NULL    |       |
| COLUNA4   | varchar(30) | NO   | UNI | NULL    |       |
| COLUNA    | varchar(30) | YES  |     | NULL    |       |
| COLUNA100 | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

--RENOMEANDO O NOME DA TABELA
ALTER TABLE TABELA 
RENAME PESSOA;

CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

--Foreign key
ALTER TABLE TIME 
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

DESC TIME;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDTIME    | int(11)     | NO   | PRI | NULL    | auto_increment |
| TIME      | varchar(30) | YES  |     | NULL    |                |
| ID_PESSOA | varchar(30) | YES  | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

/* VERIFICAR AS CHAVES */
SHOW CREATE TABLE TIME;
