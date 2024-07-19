/*Criando Banco de Dados*/
CREATE DATABASE COMERCIO;

/*Puxar os nomes dos Bancos já criados*/
SHOW DATABASES;

/*Acessando Banco de Dados*/
USE COMERCIO;

CREATE TABLE CLIENTE(
    /*Chave Primárias, deve ser ÚNICA, cada registro tem uma chave*/
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, /*O número da chave vai se auto incrementar, 1 - 2 - 3 ...., o banco controla*/
    NOME VARCHAR(30) NOT NULL, /*Valor não pode ser NULO (Vasio)*/
    SEXO ENUM('M', 'F')  NOT NULL,/*Dominío, uma combo box, tem informações fixas, não mudam é algo definido*/
    EMAIL VARCHAR(50) UNIQUE, /*Garante que todos os valores em uma coluna sejam diferentes*/
    CPF VARCHAR(15) UNIQUE
);

