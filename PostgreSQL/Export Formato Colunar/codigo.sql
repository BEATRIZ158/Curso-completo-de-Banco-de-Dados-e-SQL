/* create table as select */

/*Podemos criar uma tabela com o resultado de uma querie
e essa é a forma de realizar uma modelagem colunar 
CREATE TABLE AS SELECT
*/

/* CRIANDO UM BANCO - LOCADORA */

-- Criando Tabela GENERO
CREATE TABLE GENERO(
	IDGENERO INT PRIMARY KEY,
	NOME VARCHAR(30)
);

INSERT INTO GENERO VALUES(1,'FANTASIA');
INSERT INTO GENERO VALUES(2,'AVENTURA');
INSERT INTO GENERO VALUES(3,'SUSPENSE');
INSERT INTO GENERO VALUES(4,'AÇÃO');
INSERT INTO GENERO VALUES(5,'DRAMA');

-- Criando Tabela FILME
CREATE TABLE FILME(
	IDFILME INT PRIMARY KEY,
	NOME VARCHAR(50),
	ANO INT,
    ID_GENERO INT,
	FOREIGN KEY(ID_GENERO)
	REFERENCES GENERO(IDGENERO)
);

INSERT INTO FILME VALUES(100,'KILL BILL I',2007,2);
INSERT INTO FILME VALUES(200,'DRACULA',1998,3);
INSERT INTO FILME VALUES(300,'SENHOR DOS ANEIS',2008,1);
INSERT INTO FILME VALUES(400,'UM SONHO DE LIBERDADE',2008,5);
INSERT INTO FILME VALUES(500,'OS BAD BOYS',2008,4);
INSERT INTO FILME VALUES(600,'GUERRA CIVIL',2016,2);
INSERT INTO FILME VALUES(700,'CADILLAC RECORDS',2009,5);
INSERT INTO FILME VALUES(800,'O HOBBIT',2008,1);
INSERT INTO FILME VALUES(900,'TOMATES VERDES FRITOS',2008,5);
INSERT INTO FILME VALUES(1000,'CORRIDA MORTAL',2008,4);

-- Criando Tabela LOCACAO
CREATE TABLE LOCACAO(
	IDLOCACAO INT PRIMARY KEY,
	DATA DATE,
	MIDIA INT,
	DIAS INT,
	ID_FILME INT,
	FOREIGN KEY(ID_FILME)
	REFERENCES FILME(IDFILME)

);

select * from locacao

INSERT INTO LOCACAO VALUES(1,'01/08/2019',23,3,100);
INSERT INTO LOCACAO VALUES(2,'01/02/2019',56,1,400);
INSERT INTO LOCACAO VALUES(3,'02/07/2019',23,3,400);
INSERT INTO LOCACAO VALUES(4,'02/02/2019',43,1,500);
INSERT INTO LOCACAO VALUES(5,'02/02/2019',23,2,100);
INSERT INTO LOCACAO VALUES(6,'03/07/2019',76,3,700);
INSERT INTO LOCACAO VALUES(7,'03/02/2019',45,1,700);
INSERT INTO LOCACAO VALUES(8,'04/08/2019',89,3,100);
INSERT INTO LOCACAO VALUES(9,'04/02/2019',23,3,800);
INSERT INTO LOCACAO VALUES(10,'05/07/2019',23,3,500);
INSERT INTO LOCACAO VALUES(11,'05/02/2019',38,3,800);
INSERT INTO LOCACAO VALUES(12,'01/10/2019',56,1,100);
INSERT INTO LOCACAO VALUES(13,'06/12/2019',23,3,400);
INSERT INTO LOCACAO VALUES(14,'01/02/2019',56,2,300);
INSERT INTO LOCACAO VALUES(15,'04/10/2019',76,3,300);
INSERT INTO LOCACAO VALUES(16,'01/09/2019',32,2,400);
INSERT INTO LOCACAO VALUES(17,'08/02/2019',89,3,100);
INSERT INTO LOCACAO VALUES(18,'01/02/2019',23,1,200);
INSERT INTO LOCACAO VALUES(19,'08/09/2019',45,3,300);
INSERT INTO LOCACAO VALUES(20,'01/12/2019',89,1,400);
INSERT INTO LOCACAO VALUES(21,'09/07/2019',23,3,1000);
INSERT INTO LOCACAO VALUES(22,'01/12/2019',21,3,1000);
INSERT INTO LOCACAO VALUES(23,'01/02/2019',34,2,100);
INSERT INTO LOCACAO VALUES(24,'09/08/2019',67,1,1000);
INSERT INTO LOCACAO VALUES(25,'01/02/2019',76,3,1000);
INSERT INTO LOCACAO VALUES(26,'01/02/2019',66,3,200);
INSERT INTO LOCACAO VALUES(27,'09/12/2019',90,1,400);
INSERT INTO LOCACAO VALUES(28,'03/02/2019',23,3,100);
INSERT INTO LOCACAO VALUES(29,'01/12/2019',65,5,1000);
INSERT INTO LOCACAO VALUES(30,'03/08/2019',43,1,1000);
INSERT INTO LOCACAO VALUES(31,'01/02/2019',27,31,200);


SELECT F.NOME, G.NOME, L.DATA, L.DIAS, L.MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO -- Chave Primária de Genero == a chave Extrangeira de Filme
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME; -- ChaveExtrangeira de Filme em Locação == a chave primária de Filme

-- Organizar a Query, precisa colocar ALIAS. Cria um relatório
CREATE TABLE REL_LOCADORA AS
SELECT F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME;

SELECT * FROM REL_LOCADORA;

COPY REL_LOCADORA TO
'caminho\REL_LOCADORA.csv'
DELIMITER ';'
CSV HEADER;
