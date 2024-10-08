/* BLOCOS IF E ELSE 

Posso ter vários IFs */


DECLARE
    @NUMERO INT = 5

BEGIN
    IF @NUMERO = 5 -- EXPRESSÂO BOOLEANA - SÓ RETORNA 1 ou 0, VERDADEIRO ou FALSO
        PRINT 'O VALOR É VERDADEIRO'
    ELSE
        PRINT 'O VALOR É FALSO'
END
GO

/* CASE - FUNÇÃO 
Pode ser usado Dentro ou Fora do Bloco, é independente 
Posso ter mais de um CASE */

DECLARE
    @CONTADOR INT
BEGIN
    SELECT -- O CASE REPRESENTA UMA COLUNA
    CASE
        WHEN FABRICANTE = 'FIAT' THEN 'FAIXA 1'
        WHEN FABRICANTE = 'CHEVROLET' THEN 'FAIXA 2'
        ELSE 'OUTRAS FAIXAS'
    END AS 'INFORMAÇÕES',
    *
    FROM CARROS
END
GO
