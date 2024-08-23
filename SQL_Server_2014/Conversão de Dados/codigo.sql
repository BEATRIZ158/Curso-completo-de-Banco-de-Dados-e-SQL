/* CONVERSÃO DE DADOS 
O operador + age como operador matemático e como concatenador */

SELECT 1 + '1'
GO

SELECT '1' + '1'
GO

SELECT 'CURSO DE BANCO DE DADOS' + '1'
GO

SELECT 'CURSO DE BANCO DE DADOS' + 1
GO

/* SQL Server Tem algumas conversões automáticas 
Ele sempre tentar forçar a conversão de string para númerico
STR -> NUM   Sim!
NUM -> STR   Não!
*/

/* FUNÇÕES DE CONVERSÃO DE DADOS 
NUM + NUM = Operador Lógico */

SELECT CAST('1' AS INT) + CAST('1' AS INT)

/* CONVERSAO E CONCATENACAO 
https://msdn.microsoft.com/en-us/library/ms191530.aspx
*/

SELECT NOME,
NASCIMENTO
FROM ALUNO
GO

/* PASSO 1
ERRADO! */
SELECT NOME,
DAY(NASCIMENTO) + '/' + MONTH(NASCIMENTO) + '/' + YEAR(NASCIMENTO)
FROM ALUNO

/* ECERCÍCIO */

SELECT NOME,
CAST(DAY(NASCIMENTO) AS VARCHAR) + '/' +
CAST(MONTH(NASCIMENTO) AS VARCHAR) + '/' +
CAST(YEAR(NASCIMENTO) AS VARCHAR) AS "DATA DE NASCIMENTO"
FROM ALUNO
