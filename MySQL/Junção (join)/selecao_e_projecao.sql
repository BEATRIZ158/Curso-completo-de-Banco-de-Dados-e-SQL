/* PROJECAO -> É TUDO QUE VOCE QUER VER NA TELA */

/*Coluna que função que projeta Data e hora atual*/
SELECT NOW() AS DATA_ATUAL;

/*Projetando uma coluna cálculada, projetada*/
SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

/* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE
*/

SELECT NOME, SEXO, EMAIL /* PROJECAO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELECAO */

SELECT NUMERO /* PROJECAO */
FROM TELEFONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELECAO */
