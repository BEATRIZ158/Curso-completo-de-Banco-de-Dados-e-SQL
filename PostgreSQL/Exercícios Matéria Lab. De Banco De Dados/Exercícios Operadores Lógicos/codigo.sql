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

-- Atividade FORMS

-- 1) Elabore um consulta que mostre o número do pedido e o prazo de entrega dos pedidos que tiveram o código idêntico a 720 e o código do vendedor igual a 101.
SELECT num_pedido, prazo_entrega
FROM pedido 
WHERE codigo_cliente = 720 AND codigo_vendedor = 101;

-- 2) Liste todos os vendedores, exceto os que possuem faixa de comissão igual a "C"
SELECT nome_vendedor AS "Nome do Vendedor", faixa_comissao AS "Faixa de Comissão" 
FROM vendedor 
WHERE faixa_comissao != 'C';

-- ou

SELECT nome_vendedor AS "Nome do Vendedor", faixa_comissao AS "Faixa de Comissão" 
FROM vendedor 
WHERE faixa_comissao NOT LIKE 'C';

-- 3) Liste a descrição dos produtos, exceto os que possuem tamanho = (M). e que tenham o valor maior do que R$5,00.
SELECT descricao_produto AS "Descrição produto" 
FROM produto 
WHERE unidade = 'M' AND val_unit > 5.00;

-- 4) Crie uma consulta que mostre os nomes dos vendedores que possuem faixa salarial de R$1000,00 à R$3000,00.
SELECT nome_vendedor AS "Nome Vendedor", salario_fixo AS "Salário Fixo"
FROM vendedor 
WHERE salario_fixo BETWEEN 1000 AND 3000;

-- 5) Localize os  registros de vendedores que não comecem com a décima letra do alfabeto.
SELECT nome_vendedor 
FROM vendedor 
WHERE nome_vendedor LIKE 'J%';

-- Testando ILIKE

INSERT INTO vendedor VALUES (120,'josé',3130.00,'C');

SELECT nome_vendedor 
FROM vendedor 
WHERE nome_vendedor ILIKE 'J%';
