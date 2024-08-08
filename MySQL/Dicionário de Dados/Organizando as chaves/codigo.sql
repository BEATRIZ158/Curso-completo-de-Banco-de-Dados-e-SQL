/* A34 - ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA) */

/*INTEGRIDADE REFERENCIAL - O Banco não permite que se faça um cadastro
em uma tabela que faz referência a uma PK que não existe de outra tabela*/

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

/*Quando cria a chave dentro da tabela, o banco nomeia*/
SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;
/*É recomendado criar primeiro a tabela,
depois as chaves nomeando elas.
O MySQL cria alguns bancos de dados do próprio sistema, 
dentro delas temos o Dicionário de dados, que serve para
mostrar chaves, procedures, etc*/
