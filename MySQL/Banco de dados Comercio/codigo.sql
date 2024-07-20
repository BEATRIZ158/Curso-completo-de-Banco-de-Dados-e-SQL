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
    IDENDERECO INT PRIMARY KEY AUTO_INCREMENT;
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    ID_CLIENTE INT UNIQUE, /*Impede que apareça mais de uma vez, porque o relacionamento é 1 X 1*/
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
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