/* Explicando a função _final_median:

Criar ou substitui uma função chamada _final_median, que recebe um array
de valores do tipp NUMERIC e retorna um valor do tipo NUMERIC

Define que a função retornará um número do tipo NUMERIC



*/

CREATE OR REPLACE FUNCTION _final_median(NUMERIC[])
   RETURNS NUMERIC AS
$$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;
								 
CREATE AGGREGATE median(NUMERIC) (
  SFUNC=array_append,
  STYPE=NUMERIC[],
  FINALFUNC=_final_median,
  INITCOND='{}'
);
									 
SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS;

SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 01';
								
SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 02';
										 
SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 03';							 

INSERT INTO MAQUINAS VALUES('Maquina 01',11,15.9);
INSERT INTO MAQUINAS VALUES('Maquina 02',11,15.4);
INSERT INTO MAQUINAS VALUES('Maquina 03',11,15.7);
INSERT INTO MAQUINAS VALUES('Maquina 01',12,30);
INSERT INTO MAQUINAS VALUES('Maquina 02',12,24);
INSERT INTO MAQUINAS VALUES('Maquina 03',12,45);
										 
delete from maquinas where dia = 11 or dia = 12;
