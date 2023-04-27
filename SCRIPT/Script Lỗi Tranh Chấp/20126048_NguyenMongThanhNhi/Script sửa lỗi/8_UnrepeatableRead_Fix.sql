
--8) FIX

DROP PROC IF EXISTS EX_8_READ_DOUONG_UNREPEATABLE_READ_FIX 
go

CREATE PROC EX_8_READ_DOUONG_UNREPEATABLE_READ_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM DOUONG

                WAITFOR DELAY '00:00:05'

                SELECT * FROM DOUONG
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_8_UPDATE_DOUONG_UNREPEATABLE_READ_FIX  
GO
CREATE PROC EX_8_UPDATE_DOUONG_UNREPEATABLE_READ_FIX  
        @MATD_DU CHAR(6),
        @MA_DU NVARCHAR(50),
        @GIA FLOAT
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS(SELECT * FROM DOUONG WHERE MATD_DU = @MATD_DU AND MADU = @MA_DU)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        UPDATE DOUONG SET GIA = @GIA WHERE MATD_DU = @MATD_DU AND MADU = @MA_DU
    COMMIT TRAN 
    RETURN 1
END