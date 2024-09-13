/* COEFICIENTE DE VARIAÇÃO */

SELECT MAQUINA,
    COUNT(QTD) AS "Quantidade",
    SUM(QTD) AS "Total",
    AVG(QTD) AS "Média",
    MAX(QTD) AS "Máximo",
    MIN(QTD) AS "Minímo",
    MAX(QTD) - MIN(QTD) AS "Amplitude Total",
    ROUND(VAR_POP(QTD), 2) AS "Variância",
    ROUND(STDDEV_POP(QTD),2) AS "Desvio Padrão",
    ROUND(MEDIAN(QTD),2) AS "Mediana",
    ROUND((STDDEV_POP(QTD) / AVG(QTD)) * 100,2) AS "Coeff Variação"
    FROM MAQUINAS
    GROUP BY MAQUINA
    ORDER BY 1;
