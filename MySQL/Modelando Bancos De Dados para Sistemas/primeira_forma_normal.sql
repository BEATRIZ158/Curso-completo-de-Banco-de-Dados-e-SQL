/*  HISTORIA DA MODELAGEM 

DECADA DE 70, EUA - CRISE DO SOFTWARE
FOI A CRISE QUE ATINGIU NAO SOMENTE A AREA DE TECNOLOGIA
MAS TAMBÉM TODAS AS EMPRESAS QUE UTILIZAVAM DE SISTEMAS
TECNOLOGICOS PARA CONTROLAR SEUS NEGOCIOS.

NAQUELA EPOCA, PROGRAMAR ERA UM PROCESSO ARTESANAL.
BASTAVA OLHAR O CODIGO QUE VOCE SABERIA QUEM O
ESCREVEU, TAO POUCOS ERAM OS PROGRAMADORES EACHTAO ARCAICO ERAM
OS METODOS DE PROGRAMACAO. EM UM PRIMEIRO MOMENTO,
OS PROFISSIONAIS DE TI VIRAM A NECESSIDADE DE SE PROGRAMAR
E INICIARAM SUA CAMINHADA, CONSTRUINDO SISTEMAS QUE ATENDIAM
NUM PRIMEIRO MOMENTO, MAS DEPOIS TRAZIAM INFORMACOES ERRADAS,
PROVOCANDO A FALENCIA DE DIVERSAS EMPRESAS. LEMBRE-SE: INFORMACOES
ERRADAS PODEM LEVAR A SUA EMPRESA A FALENCIA, E FOI ISSO QUE ACONTECEU.
ISSO OCORRIA POIS OS PROFISSIONAIS SABIAM PROGRAMAR MAS ENTENDIAM APENAS
DO NEGOCIO DAS EMPRESAS DAS QUAIS FAZIAM PARTE. SER TER O KNOW HOW
DOS DEMAIS NEGOCIOS, OS PROGRAMADORES PROGRAMAVAM VOLTADOS PARA OS
PROCEDIMENTOS, E ESSE FOI UM ERRO MORTAL.

PETER CHEN, VENDO TODO ESSE CENARIO AFIRMOU: NAO PODEMOS CRIAR BANCOS
DE DADOS VOLTADOS PARA PROCEDIMENTOS EMPRESARIAIS, POIS OS PROCEDIMENTOS
SOFREM INTERFERENCIAS EXTERNAS E PODEM SER ALTERADOS. A UNICA COISA
QUE NAO SOFRE ALTERACAO SAO OS DADOS.

POR EXEMPLO, ARMAZENAMOS NO BANCO A VENDA DE JANEIRO, FEVEREIRO E MARCO
O TOTAL DAS VENDAS E O IMPOSTO PAGO AO GOVERNO. 
FAZEMOS ISSO DURANTE MUITO TEMPO. DE UMA HORA PRA OUTRA O GOVERNO
MUDA A ALIQUOTA DO IMPOSTO. COMO FARÁ SENTIDO OS PAGAMENTOS ARMAZENADOS
ANTERIORMENTE? AQUI NOTA-SE QUE ARMAZENAMOS DADOS E ARMAZENAMOS
INFORMACOES CORRESPONDENTES AOS PROCEDIMENTOS EXTERNOS. DEVEMOS
APENAS ARMAZENAR OS DADOS, POIS ELES SAO SUFICIENTES PARA GERAR
A INFORMACAO.

MODELAR É UMA ARTE, ALGO QUE SE APRENDE COM A PRATICA. E VOCES PODEM
SE PERGUNTAR: MAS SE É ALGO QUE SE APRENDE COM A PRATICA, COMO QUEM
ESTA COMEÇANDO, APRENDE?

ASSIM COMO PETER CHEN CRIOU O MODELO DE ENTIDADE E RELACIONAMENTO, O MER,
FORAM CRIADAS FORMAS NORMAIS, QUE SAO DIRETRIZES PARA APLICAR EM
MODELAGEM DE AMBIENTES OLTP OU AMBIENTES TRANSACIONAIS DE BANCOS
DE DADOS.

HOJE TEMOS MAIS DO QUE 3 FORMAS NORMAIS, MAS AO NORMALIZARMOS UM
BANCO ATE A SUA TERCEIRA FORMA, É O SUFICIENTE PARA TER UM
TRABALHO LIMPO E LIVRE DE ERROS. VEREMOS AS TRES FORMAS NORMAIS,
UMA A UMA, DETALHADAMENTE NAS PROXIMAS AULAS.
*/

INSERT INTO CLIENTE VALUES('CARLA','F','C.LOPES@UOL.COM',45638854,'9301-7585',
'RUA COPPER LEAF - WILLIAMSBURG - KITCHENER');

SELECT SEXO, COUNT(*) AS QTD
FROM CLIENTE
GROUP BY SEXO;

/* PRIMEIRA FORMA NORMAL */

/*
1 - TODO CAMPO VETORIZADO SE TORNAR'A OUTRA TABELA

[AMARELO, AZUL, LARANJA, VERDE] -> CORES -> Vetor
[KA, FIESTA, UNO, CIVIC]-> CARROS -> Vetor

2 - TODO CAMPO MULTIVALORADO SE TORNAR'A OUTRA TABELA.
QUANDO O CAMPO FOR DIVISÍVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE
TODO O REGISTRO COMO SENDO UNICO.
ISSO ;E O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY.

CPF Não pode ser CHAVE!!! Porque 'pertence' a federação, e pode ser mudado!
Chave Natural -> Algo que te pertece, na vida real, não tem outro igual
Chava Artificial -> É criada, coluna chamada ID, enumera os registros, 
*/
