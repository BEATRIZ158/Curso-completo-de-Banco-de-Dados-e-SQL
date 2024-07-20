/*Modelagem Física*/

/*Criando Banco de Dados*/
CREATE DATABASE COMERCIO;

/*Puxar os nomes dos Bancos já criados*/
SHOW DATABASES;

/*Apagar a tabela*/
DROP TABLE CLIENTE;

/*Acessando Banco de Dados*/
USE COMERCIO;

/*; É um delimitador*/
CREATE TABLE CLIENTE(
    /*Chave Primárias, deve ser ÚNICA, cada registro tem uma chave*/
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, /*O número da chave vai se auto incrementar, 1 - 2 - 3 ...., o banco controla*/
    NOME VARCHAR(30) NOT NULL, /*Valor não pode ser NULO (Vasio)*/
    SEXO ENUM('M', 'F') NOT NULL,/*Dominío, uma combo box, tem informações fixas, não mudam é algo definido*/
    EMAIL VARCHAR(50) UNIQUE, /*Garante que todos os valores em uma coluna sejam diferentes*/
    CPF VARCHAR(15) UNIQUE
);

/*Visualizar todas as tabelas criadas no Banco*/
SHOW TABLES;

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

/*Endereço - OBRIGATÓRIO 
CADASTRO DE SOMENTE UM

TELEFONE - NÃO OBRIGATÓRIO
CADASTRO DE MAIS DE UM (OPCIONAL)
*/

/*CHAVE ESTRANGEIRA É A CHAVE PRIMÁRIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERÊNCIA ENTRE
REGISTROS*/

/*EM RELACIONAMENTOS 1 X 1 - 
A CHAVE EXTRANGEIRA FICA NA TABELA MAIS FRACA
EM RELACIONAMENTOS 1 X N -
A CAHVE EXTRANGEIRA FICA SEMPRE 
*/

/*Inserindo Dados*/

INSERT INTO CLIENTE(IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE(IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE(IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE(IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE(IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE(IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

SELECT * FROM CLIENTE;

+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+

/*Descreve os tipos das colunas*/
DESC CLIENTE;

/*Inserções em Relacionamentos 1 X 1*/
INSERT INTO ENDERECO VALUES(NULL,'RUA ANTÔNIO SA','CENTRO','BELO HORIZONTE', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

SELECT * FROM ENDERECO;

+------------+--------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA ANTÔNIO SA     | CENTRO   | BELO HORIZONTE | MG     |          4 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |          5 |
+------------+--------------------+----------+----------------+--------+------------+

