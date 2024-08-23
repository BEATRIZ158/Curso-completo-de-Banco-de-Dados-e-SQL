/* CHARINDEX - RETORNA UM INTEIRO, RETORNA O ÍNDICE ONDE OCORRE A PRIMEIRA OCORRENCIA DO QUE PROCURA
Parametros: O que estou procurando, onde estou procurando, A partir de que ocorrência
retorna um INT
Quando não passo o 3 parametro: A CONTAGEM DEFAULT - INICIA EM 01
*/

SELECT NOME, CHARINDEX('A', NOME) AS INDICE
FROM ALUNO
GO

/* PASSANDO O 3 PARAMETRO */
SELECT NOME, CHARINDEX('A', NOME, 2) AS INDICE
FROM ALUNO
GO

/*NOME	INDICE
 ANDRE	  0
 ANA	  3
 RUI	  0
 JOAO	  3 */
