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
