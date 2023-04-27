
--18 FIX
DROP PROC IF EXISTS EX_18_READ_MONAN_DEADLOCK_FIX
go

CREATE PROC EX_18_READ_MONAN_DEADLOCK_FIX
AS
BEGIN

    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM  THUCDON_DA 

                WAITFOR DELAY '00:00:13'

                SELECT * FROM  THUCDON_DA 
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 

GO
DROP PROC IF EXISTS EX_18_UPDATE_TDB_DEADLOCK_FIX 
GO
CREATE PROC EX_18_UPDATE_TDB_DEADLOCK_FIX 
    @MATD_DA_1    char(6),
    @MADT_1          char(6),
    @TENTDDA_1      nvarchar(30) ,
    @MATD_DA_2    char(6),
    @MADT_2          char(6),
    @TENTDDA_2      nvarchar(30) 
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL   SERIALIZABLE
    BEGIN TRAN
    BEGIN TRY

        IF NOT EXISTS (SELECT * FROM THUCDON_DA WHERE MATD_DA = @MATD_DA_1 AND MADT = @MADT_1 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

          IF NOT EXISTS (SELECT * FROM THUCDON_DA WHERE MATD_DA = @MATD_DA_2 AND MADT = @MADT_2 )
        BEGIN
            ROLLBACK TRAN
            RETURN 1
        END

        SELECT * FROM THUCDON_DA  
        UPDATE THUCDON_DA SET TENTDDA = @TENTDDA_1 WHERE MATD_DA = @MATD_DA_1 AND MADT = @MADT_1 
        WAITFOR DELAY '00:00:05'
        UPDATE THUCDON_DA SET TENTDDA = @TENTDDA_2 WHERE MATD_DA = @MATD_DA_2 AND MADT = @MADT_2
        SELECT * FROM THUCDON_DA  
    END TRY

    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END
