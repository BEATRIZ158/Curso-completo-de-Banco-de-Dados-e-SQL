/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE /*Alterou todos os EMAIL dos registros*/
SET EMAIL = 'LILIAN@HOTMAIL.COM';

SELECT NOME, EMAIL
FROM CLIENTE;

/* WHERE - VAI SER O SEU MELHOR AMIGO DA VIDA
PRA VIDA INTEIRA */

SELECT * FROM CLIENTE
WHERE NOME = 'LILIAN';

UPDATE CLIENTE
SET EMAIL = 'JOAOA@IG.COM.BR'
WHERE NOME = 'JOAO';

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'JORGE@IG.COM.BR'
WHERE NOME = 'JORGE';

SELECT NOME, EMAIL
FROM CLIENTE;
