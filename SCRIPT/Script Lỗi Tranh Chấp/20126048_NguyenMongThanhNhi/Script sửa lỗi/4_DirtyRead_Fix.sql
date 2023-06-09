--4 FIX
DROP PROC IF EXISTS EX_4_READ_MONAN_UNCOMMITTED_READ_FIX 
go

CREATE PROC EX_4_READ_MONAN_UNCOMMITTED_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
    BEGIN TRAN 
        BEGIN TRY 
            SELECT * FROM MONAN

        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_4_INSERT_MONAN_UNCOMMITTED_READ_FIX
GO
CREATE PROC EX_4_INSERT_MONAN_UNCOMMITTED_READ_FIX
        @MATD_DA CHAR(50),
        @MAMA CHAR(6),
        @TENMA nvarchar(50),
        @MIEUTA nvarchar(300),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF EXISTS(SELECT * FROM MONAN WHERE MAMA = @MAMA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
    INSERT INTO MONAN (MATD_DA, MAMA, TENMA, MIEUTA, GIA) 
    VALUES (@MATD_DA, @MAMA, @TENMA, @MIEUTA, @GIA)        
    SELECT *  FROM MONAN
    WAITFOR DELAY '00:00:05'
    ROLLBACK TRAN 
    RETURN 1
END 

GO