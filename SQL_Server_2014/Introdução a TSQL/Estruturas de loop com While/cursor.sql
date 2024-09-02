/* CURSOR LOOP */

CREATE DATABASE PRODUTO;
GO

-- Acessando o Banco
USE PRODUTO;
GO

-- CRIANDO TABELA
CREATE TABLE PRODUTOS(
    IDPRODUTO INT PRIMARY KEY IDENTITY,
    NOME VARCHAR(50) NOT NULL,
    VALOR MONEY NOT NULL,
    DESCRICAO VARCHAR(30)
);
GO

INSERT INTO PRODUTOS VALUES('MOLHO DE TOMATE', 13.56, 'MOLHOS');
INSERT INTO PRODUTOS VALUES('MILHO VERDE', 3.80, 'LEGUMES');
INSERT INTO PRODUTOS VALUES('CHOCOLATE', 6.50, 'DOCES');
INSERT INTO PRODUTOS VALUES('GOIABADA', 7.50, 'DOCES');
INSERT INTO PRODUTOS VALUES('LEITE CONDENSADO', 8.00, 'DOCES');
GO

SELECT * FROM PRODUTOS;
GO

-- USANDO O CURSOR
DECLARE 
    @V_IDPRODUTO INT,
    @V_VALOR MONEY;

-- DECLARANDO O CURSOR E ESPECIFICANDO AS COLUNAS RETORNADAS
DECLARE cursorProdutos CURSOR STATIC
FOR
SELECT IDPRODUTO, VALOR FROM PRODUTOS;

-- ABERTURA DO CURSOR PARA QUE ELE POSSA COMEÇAR A BUSCAR DADOS
OPEN cursorProdutos;

-- O 'FETCH NEXT' PELA PRIMEIRA VEZ, ELE TRAZ A PRIMEIRA LINHA DO CONJUNTO DE RESULTADOS
-- DEFINIDO PELO 'CURSOR' E ARMAZENA OS VALORES DAS COLUNAS NAS VARIÁVEIS DECLARADAS
FETCH NEXT FROM cursorProdutos INTO @V_IDPRODUTO, @V_VALOR;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- ATUALIZA O VALOR DO PRODUTO NA TABELA, AUMENTANDO-O EM 10%
    UPDATE PRODUTOS
    SET VALOR = @V_VALOR * 1.10
    WHERE IDPRODUTO = @V_IDPRODUTO;
    
    -- BUSCA A PRÓXIMA LINHA DO CONJUNTO DE RESULTADOS E ARMAZENA OS VALORES NAS VARIÁVEIS NOVAMENTE
    FETCH NEXT FROM cursorProdutos INTO @V_IDPRODUTO, @V_VALOR;
END;
GO

-- FECHANDO O CURSOR - QUANDO TODOS OS DADOS FORAM PROCESSADOS
CLOSE cursorProdutos;

-- REMOVE O CURSOR DA MEMÓRIA, IMPORTANTE PARA EVITAR VAZAMENTOS DE MEMÓRIA E MANTER O DESEMPENHO
DEALLOCATE cursorProdutos;

-- SELECIONANDO OS DADOS ATUALIZADOS PARA VERIFICAÇÃO
SELECT * FROM PRODUTOS;
GO
