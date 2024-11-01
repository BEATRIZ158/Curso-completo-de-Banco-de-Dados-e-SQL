-- 19) Liste o nome do vendedor e a faixa de comissão dos vendedores que possuem um salário fixo maior que R$4.000.

SELECT nome_vendedor, faixa_comissao, salario_fixo
FROM vendedor
WHERE salario_fixo > 4000;

-- 20) Selecione os produtos cuja a unidade do produto seja igual a KG.

SELECT descricao_produto AS "Nome do produto", unidade AS "Unidade"
FROM produto
WHERE unidade = "kg"; 

-- 21) Faça uma consulta que mostre o nome do cliente, a cidade e o estado quando o Estado for igual a SP ou cidade igual a "Londrina" da tabela cliente

SELECT nome_cliente, cidade, uf
FROM cliente
WHERE estado = 'SP' OR cidade = 'Londrina';

-- 22) Selecione os registros de clientes cujo os nomes contém as letras 'IO"

SELECT nome_cliente AS "Nome do Cliente"
FROM cliente
WHERE nome_cliente ILIKE '%io%';

-- 23) Localize os vendedores que não possuem faixa de comissão

SELECT nome_vendedor AS "Nome do Vendedor", faixa_comissao AS "Faixa de Comissão"
FROM vendedor
WHERE faixa_comissao IS NULL;

SELECT nome_vendedor AS "Nome do Vendedor", faixa_comissao AS "Faixa de Comissão"
FROM vendedor
WHERE faixa_comissao IS NOT NULL; 

-- 24) Listem os clientes que possuem inscrição estadual

SELECT nome_cliente AS "Noome do Cliente", ie AS "Inscrição Estadual"
FROM cliente
WHERE ie IS NOT NULL;

-- Testando ILIKE

INSERT INTO vendedor VALUES (120,'josé',3130.00,'C');

SELECT nome_vendedor 
FROM vendedor 
WHERE nome_vendedor ILIKE 'J%';

-- 25) Mostre o produto que possui o menor e o maior valor

SELECT MIN(val_unit) AS MENOR_VALOR, MAX(val_unit) AS MAIOR_VALOR
FROM produto;

-- 26) Encontre a quantidade de clientes que tem a inscrição não nula
-- COUNT(ie) conta somente os valores que não são nulos!
SELECT COUNT(ie) AS "Quantidade"
FROM cliente;

-- Ou

SELECT COUNT(codigo_cliente) AS "QUANTIDADE"
FROM cliente
WHERE ie IS NOT NULL;

-- 27) Mostre a descrição dos produtos quando a unidade do produto que não seja igual a 'M' e 'Kg'

SELECT descricao_produto AS "Descrição Produto", unidade AS "Unidade Produto"
FROM produto
WHERE NOT unidade = 'M' AND NOT unidade = 'Kg';
-- Ou
SELECT descricao_produto AS "Descrição Produto", unidade AS "Unidade Produto"
FROM produto
WHERE unidade != 'M' AND unidade != 'Kg';

-- 28) Façam a média e a soma do salário fixo dos vendedores

SELECT ROUND(AVG(salario_fixo), 2) AS "Média",  ROUND(SUM(salario_fixo),2) AS "Soma Salário Fixo"
FROM vendedor;

-- 29) Selecionem os vendedores que não possuem a faixa de comissão

INSERT INTO vendedor VALUES (250,'Maurício',2930.00,'C');

SELECT nome_vendedor AS "Nome do Vendedor", faixa_comissao AS "Faixa De Comissão"
FROM vendedor
WHERE faixa_comissao IS NOT NULL;

-- 30) Listem os clientes que possuem Inscrição Estadual, ou seja, Inscrição Estadual não nula

SELECT ie AS "Inscrição Estadual", nome_cliente AS "Nome do Cliente"
FROM cliente
WHERE ie IS NOT NULL;

-- 31) Crie uma consulta que exiba os clientes ordenados pelo nome do cliente

SELECT nome_cliente
FROM cliente
ORDER BY nome_cliente;

-- 32) Faça uma consulta da tebela vendedor que mostre nome do vendedor e o salário fixo dos vendedores ordenados pelo nome do vendedor

SELECT nome_vendedor, salario_fixo
FROM vendedor
ORDER BY  nome_vendedor;

-- 33) Selecione o número do pedido dos pedidos que possuem o prazo de entrega igual a 20 dias classificado em ordem descrescente pelo número do pedido

SELECT num_pedido AS "Número do Pedido", prazo_entrega AS "Prazo De Entrega"
FROM pedido
WHERE prazo_entrega = 20
ORDER BY num_pedido DESC;

-- 34) Exiba o maior valor e a soma do salário fixo dos vendedore que possuem a faixa de comissão 'A'

SELECT MAX(salario_fixo) AS "Maior Valor", SUM(salario_fixo)
FROM vendedor
WHERE faixa_comissao = 'A';

-- 35) Mostre a quantidade total pedida, para o produto ‘papel’ de código ‘77’ na tabela item do pedido.

SELECT COUNT(num_pedido) AS "Total Pedido Papel" 
FROM item_do_pedido
WHERE codigo_produto = 77;

-- 36) Quantos produtos possuem um valor unitário menor que R$ 2,00.

SELECT COUNT(*)
FROM produto
WHERE val_unit < 2.00;

-- 37) Liste a quantide de clientes que cada estado contém

SELECT COUNT(*) AS "Total", uf AS "Estado"
FROM cliente
GROUP BY uf;

-- 38) Selecione da tabela item_do_pedido o campo numero do pedido quando a quantidade for maior ou igaul a 30 e eliminar as linhas duplicadas

SELECT num_pedido AS "Número Pedido", COUNT(num_pedido) FILTER(WHERE quantidade >= 30)  AS "Quantidade"
FROM item_do_pedido
GROUP BY num_pedido;

SELECT num_pedido, COUNT(num_pedido) AS "Quantidade"
FROM item_do_pedido
WHERE quantidade >= 30
GROUP BY num_pedido;

-- 39) Selecione os campos número dos pedidos e prazo de entrega de todos os pedidos que possuem o prazo de entrega 
-- que esteja entre 15 a 25 dias.
SELECT num_pedido AS "Número do pedido", prazo_entrega AS "Prazo de entrega"
FROM pedido
WHERE prazo_entrega BETWEEN 15 AND 25;

-- 40) Liste a quantidade de pedidos que tem o prazo de entrega maior que 7, agrupados pelo código do vendedor

SELECT COUNT(num_pedido) AS "Total", prazo_entrega AS "Prazo de entrega"
FROM pedido
WHERE prazo_entrega > 7
GROUP BY prazo_entrega; 
-- Ou
SELECT COUNT(num_pedido) AS "Total"
FROM pedido
WHERE prazo_entrega > 7; 


-- 41) Exiba a quantidade de clientes que cada estado contém, menos os clientes do estado de SP

SELECT COUNT(codigo_cliente), uf AS "Estado"
FROM cliente
WHERE uf != 'SP'
GROUP BY uf;
-- Ou
SELECT COUNT(*), uf AS "Estado"
FROM cliente
WHERE uf != 'SP'
GROUP BY uf;

-- 42) Selecione os pedidos que têm mais do que 3 produtos na 
tabela item do pedido

SELECT COUNT(codigo_produto) AS "Total Produtos", num_pedido
FROM item_do_pedido
GROUP BY num_pedido
HAVING (COUNT(*)> 3);

-- 43) Liste da tabela item do pedido os produtos que contenha a soma das quantidade maior igual a 50

SELECT     codigo_produto, SUM(quantidade) AS Quatidade
FROM         Item_do_Pedido
GROUP BY codigo_produto
HAVING      (SUM(quantidade) >= 50)

-- 44) Mostre os produtos cuja média do valor unitário agrupados pela unidade seja menor que R$1,50

SELECT     unidade, AVG(val_unit) AS “Média”
FROM         Produto
GROUP BY unidade
HAVING      (AVG(val_unit) < 1.5)

-- 45) Selecione o nome e a cidade dos clientes que possuem pedido com prazo de entrega maior do que 25 dias
 
-- Usando INNER JOIN

SELECT C.nome_cliente, C.cidade, P.prazo_entrega
FROM cliente C
INNER JOIN pedido p
ON C.codigo_cliente = P.codigo_cliente
WHERE P.prazo_entrega > 25;
 
-- 46) Apresente a descrição, a unidade e a quantidade dos produtos pedidos que possuem a quantidade maior do que 40

-- Usando INNER JOIN
SELECT P.descricao_produto, P.unidade, I.quantidade
FROM produto P
INNER JOIN item_do_pedido I
ON P.codigo_produto = I.codigo_produto
WHERE I.quantidade > 40;
SELECT P.descricao_produto, P.unidade, I.quantidade
FROM produto P, item_do_pedido I
WHERE P.codigo_produto = I.codigo_produto
AND I.quantidade > 40;
 
-- 47) Encontre nome dos clientes atendidos pelo vendedor João

-- Usando INNER JOIN
SELECT DISTINCT C.nome_cliente, V.nome_vendedor
FROM cliente C
INNER JOIN pedido P
ON C.codigo_cliente = P.codigo_cliente
INNER JOIN vendedor V
ON P.codigo_vendedor = V.codigo_vendedor
WHERE V.nome_vendedor = 'João';
 
-- Sem

SELECT DISTINCT C.nome_cliente, V.nome_vendedor
FROM cliente C, pedido P, vendedor V
WHERE C.codigo_cliente = P.codigo_cliente
AND P.codigo_vendedor = V.codigo_vendedor
AND V.nome_vendedor = 'João';
 
-- 48) Exiba os nomes dos vendedor que atenderam a cliente Ana de código 720
 
SELECT DISTINCT V.nome_vendedor, C.nome_cliente
FROM cliente C
INNER JOIN pedido P
ON C.codigo_cliente = P.codigo_cliente
INNER JOIN vendedor V
ON P.codigo_vendedor = V.codigo_vendedor
WHERE P.codigo_cliente = 720;
SELECT DISTINCT V.nome_vendedor, C.nome_cliente
FROM cliente C, pedido P, vendedor V
WHERE C.codigo_cliente = P.codigo_cliente
AND P.codigo_vendedor = V.codigo_vendedor
AND P.codigo_cliente = 720;
 
-- 49) Liste os clientes e seus respectivos prazos de entrega ordenados pelo nome do cliente em ordem decrescente
 
SELECT C.nome_cliente, P.prazo_entrega
FROM cliente C
INNER JOIN pedido P
ON C.codigo_cliente = P.codigo_cliente
ORDER BY C.nome_cliente DESC;

-- 50) Mostre os vendedores (Ordenados) que emitiram pedidos com prazos superiores a 15 dias e tenham salários iguais ou superiores a R$1000,00
 
SELECT V.nome_vendedor, P.prazo_entrega, V.salario_fixo
FROM vendedor V
INNER JOIN pedido P
ON P.codigo_vendedor = V.codigo_vendedor
WHERE P.prazo_entrega > 15 AND V.salario_fixo >= 1000.00
ORDER BY V.nome_vendedor;

-- 51) Quais clientes tem prazo de entrega superior a 15 dias e pertencem aos estados de SP ou RJ?

SELECT C.nome_cliente AS "Nome do Cliente", P.prazo_entrega AS "Prazo de entrega", C.uf AS "Estado"
FROM cliente C 
INNER JOIN pedido P 
ON C.codigo_cliente = P.codigo_cliente
WHERE P.prazo_entrega > 15 AND (C.uf = 'SP' OR C.uf = 'RJ')
ORDER BY C.uf;

-- 52) Selecione o nome dos clientes de qualquer pedido cujo o prazo de entrega seja maior que 25 dias. Resolva utilizando subconsultas

SELECT C.nome_cliente AS "Nome do Cliente", P.prazo_entrega AS "Prazo de entrega"
FROM cliente C, pedido P
WHERE P.codigo_cliente
IN
(SELECT P.codigo_cliente
FROM pedido P
WHERE P.prazo_entrega > 25);

--ou

SELECT C.nome_cliente, P.prazo_entrega AS "Prazo de entraga"
FROM cliente C, pedido P
WHERE P.prazo_entrega > 25;

-- 55) Liste os clientes que não fizeram nenhum pedido

SELECT nome_cliente
FROM cliente
WHERE codigo_cliente NOT IN
(
    SELECT codigo_cliente
    FROM pedido
)

-- 56) Selecione a descrição dos produtos que possuem o valor unitário abaixo da média

SELECT descricao_produto, val_unit
FROM produto
WHERE (val_unit <
(
    SELECT AVG(val_unit)
    FROM Produto
));

-- 57) Encontre os nomes dos clientes que possuem o prazo de entrega acima da média

SELECT C.nome_cliente, P.prazo_entrega
FROM cliente C 
INNER JOIN pedido P
ON C.codigo_cliente = P.codigo_cliente
WHERE P.prazo_entrega > 
(
SELECT AVG(prazo_entrega)
FROM pedido
);

-- 59) Selecione a descricao do produto que teve a maior quantidade de pedido

SELECT P.descricao_produto
FROM produto P
INNER JOIN item_do_pedido I
ON P.codigo_produto = I.codigo_produto
WHERE I.quantidade =
(
    SELECT MAX(quantidade)
    FROM item_do_pedido
)

-- 61) Crie uma VIEW que mostre o código e o nome dos clientes que moram nos estados SP, RJ, MS

CREATE VIEW exercico61
AS
SELECT nome_cliente, codigo_cliente, cidade
FROM cliente
WHERE uf in ('SP', 'RJ', 'MS');

--Chamando a VIEW
SELECT *
FROM exercico61;

-- 62) Crie uma VIEW que selecione todos os numeros dos pedidos, codigo_cliente, prazo_entrega dos vendedores que tenham o nome João que possui o código 11

CREATE VIEW exercicio62
AS
SELECT P.num_pedido, P.codigo_cliente, P.prazo_entrega, V.nome_vendedor
FROM pedido P
INNER JOIN vendedor V
ON P.codigo_vendedor = V.codigo_vendedor
WHERE P.codigo_vendedor = 11;

-- Ou

CREATE VIEW exercicio62
AS
SELECT P.num_pedido, P.codigo_cliente, P.prazo_entrega, V.nome_vendedor
FROM pedido P
INNER JOIN vendedor V
ON P.codigo_vendedor = V.codigo_vendedor
WHERE V.nome_vendedor ILIKE ('João%');

SELECT *
FROM exercicio62;

-- Ou

CREATE VIEW exercicio62_1
(numero, codigo, prazo) AS
SELECT num_pedido, codigo_cliente, prazo_entrega
FROM pedido P
INNER JOIN vendedor V
ON P.codigo_vendedor = V.codigo_vendedor
WHERE V.nome_vendedor ILIKE ('João%');

SELECT *
FROM exercicio62_1;

-- 66) Faça uma View que contenha o número do pedido, código e descrição do produto, quantidade, valor unitário e o total (valor unitário x quantidade)

CREATE VIEW exercicio66
(numeroPedido, codigo, descricao, quantidade, valorUni, total) AS
SELECT I.num_pedido, P.codigo_produto, P.descricao_produto, I.quantidade, P.val_unit, P.val_unit * I.quantidade AS "Total"
FROM item_do_pedido I
INNER JOIN produto P
ON I.codigo_produto = P.codigo_produto;

SELECT *
FROM exercicio66;

-- 67) Tendo referência ao exercício anterior, crie uma visualização que mostre a soma total de cada pedido

CREATE VIEW exercicio67
(numeroPedido, SomaTotal) AS
SELECT numeroPedido, SUM(total)
FROM exercicio66
GROUP BY numeroPedido;

SELECT * 
FROM exercicio67;

-- 73) Crie uma função para retornar o núemro de vendedores cadastrados

CREATE FUNCTION QUANTIDADE_VENDEDORES()
RETURNS INT AS
$$
DECLARE 
	quantidade INT;
BEGIN
	SELECT COUNT(*) INTO quantidade
	FROM vendedor
	RETURN quantidade;
END;
$$
LANGUAGE PLPGSQL;

SELECT *
FROM QUANTIDADE_VENDEDORES();

-- OU 

SELECT QUANTIDADE_VENDEDORES();

-- 74) Elabore um procedimento para retornar a quantidade de pedidos que um determinado vendedor participou

CREATE FUNCTION Exercicio74(NOME VARCHAR)
RETURNS INT AS
$$
DECLARE
	quantidade INT;
BEGIN
	SELECT COUNT(P.num_pedido) INTO quantidade
	FROM pedido P
    INNER JOIN vendedor V 
    ON P.codigo_vendedor = V.codigo_vendedor
    WHERE nome_vendedor = NOME;
	RETURN quantidade;
END;
$$
LANGUAGE PLPGSQL;

SELECT * FROM Exercicio74('João');
