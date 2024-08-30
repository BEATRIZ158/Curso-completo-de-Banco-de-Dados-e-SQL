/* TRAZ TODOS OS REGISTROS DA TABELA cliente */
SELECT * FROM cliente;

/* PROJETA codigo_produto, quantidade */
SELECT codigo_produto, quantidade
FROM item_do_pedido;

/* Selecione os campos codigo_produto, descrição_do_produto e valor_unitario alterando a linha de cabeçalho dos campos selecionados */

SELECT codigo_produto AS "Código Produto", descricao_produto AS "Descriçao do Produto", val_unit AS "Valor Unitario"
FROM produto;

/* Quais são as cidades que a empresa possui clientes? 
Traz valores apenas 1 vez, sem duplicar! */

SELECT DISTINCT cidade
FROM cliente

/* Liste da tabela produto o campo descricao_produto e faça do valor unitário um acrescimo de 30%. Os campos
de dificíl leitura, fala a alteração no nome dos campos. */

SELECT descricao_produto AS "Descriçao do Produto", (val_unit * 3.0) AS "Valor Unitário"
FROM produto
