
--10) LOI
DROP PROC IF EXISTS EX_10_READ_NHANVIEN_PHANTOM
go

CREATE PROC EX_10_READ_NHANVIEN_PHANTOM
AS
BEGIN
    BEGIN TRAN 
        BEGIN TRY 
                    WAITFOR DELAY '00:00:05'
                SELECT * FROM NHANVIEN WITH (NOLOCK)

        END TRY 

        BEGIN CATCH 
            ROLLBACK 
            RETURN 0
        END CATCH
    COMMIT TRAN
    RETURN 1
END 


GO
DROP PROC IF EXISTS EX_10_INSERT_NHANVIEN_PHANTOM 
GO
CREATE PROC EX_10_INSERT_NHANVIEN_PHANTOM 
        @MANV CHAR(6),
        @TENNV nvarchar(50)
       
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        IF  EXISTS(SELECT * FROM NHANVIEN WHERE MANV = @MANV )
        BEGIN
            ROLLBACK  
            RETURN 0
        END
        INSERT INTO NHANVIEN(MANV, TENNV) VALUES (@MANV, @TENNV)     
    END TRY


    BEGIN CATCH
        ROLLBACK  
        RETURN 0
    END CATCH

    COMMIT TRAN
    RETURN 1
END
