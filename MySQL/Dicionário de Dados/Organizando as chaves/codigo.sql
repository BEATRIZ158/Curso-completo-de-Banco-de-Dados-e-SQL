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

/* A35 - ORGANIZANDO CHAVES
E ACOES DE CONSTRAINTS
 */

SHOW TABLES;

DROP TABLE TIME;
DROP TABLE PESSOA;
DROP TABLE VENDEDORES;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

/*ADICIONE CONSTRAINT(REGRA)*/
ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;
/*
| TELEFONE | CREATE TABLE `telefone` (
  `IDTELEFONE` int(11) DEFAULT NULL,
  `TIPO` char(3) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  KEY `FK_CLIENTE_TELEFONE` (`ID_CLIENTE`),
  CONSTRAINT `FK_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
*/

/* DICIONARIO DE DADOS - Guarda os METADADOS (Dados dos Dados) 
dados organizadores: nome, data de criação, autor, etc*/

SHOW DATABASES;

USE INFORMATION_SCHEMA;

STATUS;

SHOW TABLES;

+---------------------------------------+
| Tables_in_information_schema          |
+---------------------------------------+
| CHARACTER_SETS                        |
| COLLATIONS                            |
| COLLATION_CHARACTER_SET_APPLICABILITY |
| COLUMNS                               |
| COLUMN_PRIVILEGES                     |
| ENGINES                               |
| EVENTS                                |
| FILES                                 |
| GLOBAL_STATUS                         |
| GLOBAL_VARIABLES                      |
| KEY_COLUMN_USAGE                      |
| OPTIMIZER_TRACE                       |
| PARAMETERS                            |
| PARTITIONS                            |
| PLUGINS                               |
| PROCESSLIST                           |
| PROFILING                             |
| REFERENTIAL_CONSTRAINTS               |
| ROUTINES                              |
| SCHEMATA                              |
| SCHEMA_PRIVILEGES                     |
| SESSION_STATUS                        |
| SESSION_VARIABLES                     |
| STATISTICS                            |
| TABLES                                |
| TABLESPACES                           |
| TABLE_CONSTRAINTS                     |
| TABLE_PRIVILEGES                      |
| TRIGGERS                              |
| USER_PRIVILEGES                       |
| VIEWS                                 |
| INNODB_LOCKS                          |
| INNODB_TRX                            |
| INNODB_SYS_DATAFILES                  |
| INNODB_FT_CONFIG                      |
| INNODB_SYS_VIRTUAL                    |
| INNODB_CMP                            |
| INNODB_FT_BEING_DELETED               |
| INNODB_CMP_RESET                      |
| INNODB_CMP_PER_INDEX                  |
| INNODB_CMPMEM_RESET                   |
| INNODB_FT_DELETED                     |
| INNODB_BUFFER_PAGE_LRU                |
| INNODB_LOCK_WAITS                     |
| INNODB_TEMP_TABLE_INFO                |
| INNODB_SYS_INDEXES                    |
| INNODB_SYS_TABLES                     |
| INNODB_SYS_FIELDS                     |
| INNODB_CMP_PER_INDEX_RESET            |
| INNODB_BUFFER_PAGE                    |
| INNODB_FT_DEFAULT_STOPWORD            |
| INNODB_FT_INDEX_TABLE                 |
| INNODB_FT_INDEX_CACHE                 |
| INNODB_SYS_TABLESPACES                |
| INNODB_METRICS                        |
| INNODB_SYS_FOREIGN_COLS               |
| INNODB_CMPMEM                         |
| INNODB_BUFFER_POOL_STATS              |
| INNODB_SYS_COLUMNS                    |
| INNODB_SYS_FOREIGN                    |
| INNODB_SYS_TABLESTATS                 |
+---------------------------------------+

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	TABLE_NAME AS "TABELA",
	CONSTRAINT_NAME AS "NOME REGRA",
	CONSTRAINT_TYPE AS "TIPO"
	FROM TABLE_CONSTRAINTS
	WHERE CONSTRAINT_SCHEMA = "AGREGACAO";

+-----------+----------+---------------------+-------------+
| BANCO     | TABELA   | NOME REGRA          | TIPO        |
+-----------+----------+---------------------+-------------+
| agregacao | cliente  | PRIMARY             | PRIMARY KEY |
| agregacao | jogador  | PRIMARY             | PRIMARY KEY |
| agregacao | telefone | FK_CLIENTE_TELEFONE | FOREIGN KEY |
| agregacao | times    | PRIMARY             | PRIMARY KEY |
| agregacao | times    | times_ibfk_1        | FOREIGN KEY |
+-----------+----------+---------------------+-------------+

/* APAGANDO CONSTRAINTS */

USE AGREGACAO;

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);
