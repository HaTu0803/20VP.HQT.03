
--11) FIX
DROP PROC IF EXISTS EX_11_READ_DONDK_PHANTOM_FIX
go

CREATE PROC EX_11_READ_DONDK_PHANTOM_FIX
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
    BEGIN TRAN 
        BEGIN TRY 
                SELECT * FROM DON_DK
                WAITFOR DELAY '00:00:05'
                SELECT * FROM DON_DK

        END TRY 

        BEGIN CATCH 
            ROLLBACK TRAN
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_11_INSERT_DONDK_PHANTOM_FIX 
GO
CREATE PROC EX_11_INSERT_DONDK_PHANTOM_FIX 
   @NGUOIDD              nvarchar(30)       ,      
   @TENNH                nvarchar(30)       ,
   @DIACHINH             nvarchar(50)        ,
   @STK                  char(15)           ,
   @EMAIL                nvarchar(50)      ,
   @TENQUAN              nvarchar(50)     ,
   @THANHPHO             nvarchar(50)      ,
   @QUAN                 nvarchar(50)        ,
   @DIACHI               nvarchar(50)       ,
   @SLDONHANGMN          int               ,
   @LOAIAMTHUC           nvarchar(50)       ,
   @SDT                  nvarchar(15)       ,
   @SOCHINHANH           int
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        EXEC P_DON_DK @TENNH, @DIACHINH, @STK, @EMAIL, @TENQUAN, @THANHPHO, @QUAN,@DIACHI, @SLDONHANGMN, @LOAIAMTHUC,@SDT, @NGUOIDD
    END TRY

    BEGIN CATCH
        ROLLBACK  
        RETURN 0
    END CATCH
     COMMIT TRAN  
    RETURN 1
END