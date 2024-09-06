/* Funções de String 

São muito úteis para manipulação de textos em consultas SQL
*/

/* LEN() 

- Retorna o comprimento de uma string, ou seja, o número de caracteres na string
- LEN(string)

*/

SELECT LEN('Beatriz Mesquita') AS TamanhoString;

/* SUBSTRING() 

- Extrai uma substring de uma string, começando de uma posição especificada e com um
comprimento especificado
- SUBSTRING(string, start_position, length)
*/

SELECT SUBSTRING('Beatriz Mesquita', 9, 8) AS Sobrenome; -- Retorna: Mesquita

/* CHARINDEX()

- Retorna a posição de uma substring dentro de uma string. Se a substring não for encontrada,
retorna 0
- CHARINDEX(substring, string)
*/

SELECT CHARINDEX('Mesquita', 'Beatriz Mesquita') AS PosicaoSobrenome;

/* REPLACE() 


*/
