/* LOOPS WHILE */

DECLARE
    @I INT = 1
BEGIN
    WHILE(@I < 15)
    BEGIN
        PRINT 'VALOR DE @I = ' + CAST(@I AS VARCHAR)
    END
END
GO
