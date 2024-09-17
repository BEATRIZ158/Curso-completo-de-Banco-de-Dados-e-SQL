/* VARIÁVEIS DUMMY 

Dummy pega uma coluna com variáveis (Exemplo sexo M e F), e gera 2 colunas, 
um para Feminino e um para Masculino, 0 para Falso e 1 para Verdadeiro em ambas
as tabelas.

Algoritmos de Machine Learning trabalham por ocorrência de variáveis por coluna,
precisa de uma coluna complementar.
*/

/* UTILIZANDO  */
SELECT NOME, SEXO 
FROM FUNCIONARIOS;

SELECT NOME, CARGO,
CASE
    WHEN CARGO = 'Financial Advisor' THEN 'Condição 01'
    WHEN CARGO = 'Structural Engineer' THEN 'Condição 02'
    WHEN CARGO = 'Executive Secretary' THEN 'Condição 03'
    WHEN CARGO = 'Sales Associate' THEN 'Condição 04'
    ELSE 'OUTRAS CONDIÇÕES'
END AS "CONDIÇÕES"
FROM FUNCIONARIOS;

SELECT CARGO FROM FUNCIONARIOS;

SELECT NOME,
CASE
    WHEN SEXO = 'Masculino' THEN 'M'
    ELSE 'F'
END AS "SEXO"
FROM FUNCIONARIOS;

/* UTILIZANDO VALORES BOOLEANOS */

SELECT NOME, CARGO, (SEXO = 'Masculino' ) AS Masculino, (SEXO = 'Feminino' ) AS Feminino
FROM FUNCIONARIOS;

-- True e False é 0 e 1 em binário

/* MESCLANDO AS TÉCNICAS */

SELECT NOME, CARGO,
CASE
    WHEN (SEXO = 'Masculino') = true THEN 1
    ELSE 0
END AS "MASCULINO",
CASE
    WHEN (SEXO = 'Feminino') = true THEN 1
    ELSE 0
END AS "Feminino"
FROM FUNCIONARIOS;
