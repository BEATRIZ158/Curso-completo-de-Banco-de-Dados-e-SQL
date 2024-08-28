/*SQL Server tem uma Lista de erros com Nível e Estado 
categorizados, como um dicionário de erros.
Nível 16, Estado 1 = Erro de Usuário (Fez algo errado) */

/* SALARIO ANTIGO, NOVO, DATA E NOME DO EMPREGO 

RAISERROR - > Mensagem de Erro na tela
ROLLBACK -> Semelhante ao Ctrl-Z, arquivos de Log e arquivos
de dados, tudo que é feito é armazenado primeiro no Log e depois
para os dado, só passa quando está OK/Confirmado
O ROLLBACK elimina a informação do Log e ela não 
persista no Banco, o Log foi anulado, não chegou a acontecer*/

CREATE TABLE SALARIO_RANGE(
    MINSAL MONEY,
    MAXSAL MONEY
)
GO

INSERT INTO SALARIO_RANGE VALUES(3000.00, 6000.00)
GO

CREATE TRIGGER TG_RANGE
ON DBO.EMPREGADO
FOR INSERT, UPDATE
AS 
    DECLARE
        @MINSAL MONEY,
        @MAXSAL MONEY,
        @ATUALSAL MONEY

    SELECT @MINSAL = MINSAL, @MAXSAL = MAXSAL FROM SALARIO_RANGE

    SELECT @ATUALSAL = I.SALARIO
    FROM INSERTED I 
    
    IF(@ATUALSAL < @MINSAL)
    BEGIN
        RAISERROR('SALARIO MENOR QUE O PISO', 16,1)
        ROLLBACK TRANSACTION
    END

    IF(@ATUALSAL > @MAXSAL)
    BEGIN
        RAISERROR('SALARIO MAIOR QUE O TETO', 16,1)
        ROLLBACK TRANSACTION
    END
GO

UPDATE EMPREGADO SET SALARIO = 9000.00
WHERE IDEMPREGADO = 1

UPDATE EMPREGADO SET SALARIO = 1000.00
WHERE IDEMPREGADO = 1
GO

/* VERIFICANDO O TEXTO DE UMA TRIGGER */

SP_HELPTEXT TG_RANGE
GO
