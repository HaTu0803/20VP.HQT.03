
--12) LOI
DROP PROC IF EXISTS EX_12_READ_TOPING_PHANTOM
go

CREATE PROC EX_12_READ_TOPING_PHANTOM
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
                WAITFOR DELAY '00:00:05'
                SELECT * FROM  TOPING_DA WITH(NOLOCK)

               
        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_12_INSERT_TOPING_PHANTOM 
GO
CREATE PROC EX_12_INSERT_TOPING_PHANTOM 
   @MATD_DA                 char(6)             ,
   @MAMA                    char(6)            ,
   @TENTOPING              nvarchar(30)       ,
   @GIA               float               
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        IF NOT EXISTS(SELECT * FROM TOPING_DA  WHERE MATD_DA = @MATD_DA AND MAMA = @MAMA)
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        INSERT INTO TOPING_DA(MATD_DA,MAMA,TENTOPING,GIA)
        VALUES(@MATD_DA,@MAMA,@TENTOPING,@GIA)
    END TRY


    BEGIN CATCH
        ROLLBACK TRAN 
        RETURN 0
    END CATCH

     COMMIT TRAN  
    RETURN 1
END