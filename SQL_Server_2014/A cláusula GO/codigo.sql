/*SQL Server tem algo chamado processamento Assíncrono 
Ou seja não tem ordem, para tentar otimizar ele vai tentar
sempre fazer o mais rápido primeiro, entre criar uma database
ou se conectar a uma database, ele tenta se conectar antes de 
criar o banco.
Para resolver isso, nós temos o comando GO, o ; funciona, mas é 
mais comum usar o GO
Tudo que é feito dentro do Client vira pacote, o GO é utilizado
para quebrar os comando em pacotes diferentes, de acordo com a orddem
do GO.
C ------------------------------------------------------------- S
*/
/* Criando o Banco e Usando o GO */
create database BANCO04
go

use BANCO04
go

create table teste(

)
