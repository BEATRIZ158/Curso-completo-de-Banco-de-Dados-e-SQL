/* Delimitador */

/*É como se o banco estive ouvindo as instruções, e não faz nada
Mas quando vê o ; ele executa, ele separa os blocos de comando*/

SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1

/*Banco fica preso, esperando o usuário terminar e colocar ;*/

/*Não precisa de ; porque NÃO É um comando SQL mas sim de insfraestrutura*/
STATUS

/*Mudar o DELIMETER*/
DELIMITER $

SELECT * FROM V_RELATORIO;

/*Banco come os espaços*/
DELIMITER  @

DELIMITER@

/*Banco só considera o primeiro caracter*/
DELIMITER @ @

DELIMITER ;
