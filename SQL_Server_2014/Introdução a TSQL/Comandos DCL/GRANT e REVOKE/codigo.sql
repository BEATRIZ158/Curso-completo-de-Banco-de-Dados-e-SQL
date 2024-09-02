/* ESTES SÃO ESTUDOS EXTRAS. NÃO FAZEM PARTE DO CURSO! */

/*
GRANT e REVOKE -> Utilizado para gerenciar permissões de acesso e controle
sobre os objetos do banco. São essenciais para manter a segurança e a integridade
dos bancos, garantindo que apenas usuários autorizados possam acessar ou modificar
informações.
*/

/* GRANT 

É usado para conceder permissões a um usuário ou a um papel para realizar ações 
específicas em objetos de banco de dados, como tabelas, views, stored procedures, 
e outros.
*/

-- SIMULANDO UM AMBIENTE COM DIFERENTES USUÁRIOS E ROLES (PAPÉIS)

-- Criando um novo login e um usuário de banco para o qual vou conceder permissões

CREATE LOGIN UsuarioTeste WITH PASSWORD = 'SenhaTeste1';

CREATE USER UsuarioTeste FOR LOGIN UsuarioTeste;

-- Criando tabela de teste

CREATE TABLE dbo.TabelaTeste(
    ID INT PRIMARY KEY,
    NOME NVARCHAR(50)
);

-- Concedendo Permissões ao Novo Usuário

-- Conceder permissão de SELECT
GRANT SELECT ON dbo.TabelaTeste TO UsuarioTeste;

-- Conceder permissão de INSERT
GRANT INSERT ON dbo.TabelaTeste TO UsuarioTeste;


-- Verica se existe o login no servidor
SELECT name FROM sys.sql_logins WHERE name = 'UsuarioTeste';

-- Verifica se existe um usuário de banco de dados
SELECT name FROM sys.database_principals WHERE name = 'UsuarioTeste';
