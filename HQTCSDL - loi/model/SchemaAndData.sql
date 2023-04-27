/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     3/31/2023 8:16:59 PM                         */
/*==============================================================*/


USE master
GO 
if exists (select name from SYS.databases where name = 'QLGH')
BEGIN
   ALTER DATABASE QLGH SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
   drop DATABASE QLGH
END
GO 
CREATE DATABASE QLGH 
GO 
USE QLGH
GO

/*==============================================================*/
/* Table: CHINHANH                                              */
/*==============================================================*/
create table CHINHANH (
   MACN                 char(6)              not null,
   MADT                 char(6)              null,
   MADDK                char(6)              not null,
   TENQUAN              nvarchar(50)          null,
   THOIGIANMO           datetime             null,
   THOIGIANDONG         datetime             null,
   THANHPHO             nvarchar(50)          null,
   QUAN                 nvarchar(50)          null,
   DIACHI               nvarchar(50)          null,
   constraint PK_CHINHANH primary key nonclustered (MACN)
)
go

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on CHINHANH (
MADT ASC
)
go

/*==============================================================*/
/* Index: _ANG__KY__CHI_NHA_NH_FK                               */
/*==============================================================*/
create index _ANG__KY__CHI_NHA_NH_FK on CHINHANH (
MADDK ASC
)
go

/*==============================================================*/
/* Table: CHITIET_DH_DA                                         */
/*==============================================================*/
create table CHITIET_DH_DA (
   MADH                 char(6)              not null,
   MATC_DA              char(6)              not null,
   MATD_DA              char(6)              null,
   MAMA                 char(6)              null,
   TENMA                nvarchar(50)          null,
   SL                   int                  null,
   GIA                  float                null,
   TONGGIA_CT           float                null,
   constraint PK_CHITIET_DH_DA primary key (MADH, MATC_DA)
)
go

/*==============================================================*/
/* Index: MON_AN_TRONG_CHI_TIET_DH_FK                           */
/*==============================================================*/
create index MON_AN_TRONG_CHI_TIET_DH_FK on CHITIET_DH_DA (
MATD_DA ASC,
MAMA ASC
)
go

/*==============================================================*/
/* Table: CHITIET_DH_DU                                         */
/*==============================================================*/
create table CHITIET_DH_DU (
   MADH                 char(6)              not null,
   MATC_DU              char(6)              not null,
   MATD_DU              char(6)              null,
   MADU                 char(6)              null,
   TENDU                nvarchar(50)          null,
   SIZE                 char(3)              null,
   LUONGDA              int                  null,
   LUONGDUONG           int                  null,
   SL                   int                  null,
   GIA                  float                null,
   TONGGIA_CT           FLOAT                null,
   constraint PK_CHITIET_DH_DU primary key (MADH, MATC_DU)
)
go

/*==============================================================*/
/* Index: _O_UONG_TRONG_CHI_TIET__O_UONG_FK                     */
/*==============================================================*/
create index _O_UONG_TRONG_CHI_TIET__O_UONG_FK on CHITIET_DH_DU (
MATD_DU ASC,
MADU ASC
)
go

/*==============================================================*/
/* Table: CN_NGAN_HANG                                          */
/*==============================================================*/
create table CN_NGAN_HANG (
   TENNH                nvarchar(30)          not null,
   DIACHINH             nvarchar(50)          not null,
   constraint PK_CN_NGAN_HANG primary key nonclustered (TENNH, DIACHINH)
)
go

/*==============================================================*/
/* Index: CO_NHIEU_CHI_NHANH_FK                                 */
/*==============================================================*/
create index CO_NHIEU_CHI_NHANH_FK on CN_NGAN_HANG (
TENNH ASC
)
go

/*==============================================================*/
/* Table: DANH_GIA_DON_HANG                                     */
/*==============================================================*/
create table DANH_GIA_DON_HANG (
   MAKH                 char(6)              not null,
   MADH                 char(6)              not null,
   RATE                 int                  null,
   COMMENT              nvarchar(300)         null,
   constraint PK_DANH_GIA_DON_HANG primary key (MAKH, MADH)
)
go

/*==============================================================*/
/* Index: _ANH_GIA__ON_HANG_FK                                  */
/*==============================================================*/
create index _ANH_GIA__ON_HANG_FK on DANH_GIA_DON_HANG (
MAKH ASC
)
go

/*==============================================================*/
/* Index: _ANH_GIA__ON_HANG2_FK                                 */
/*==============================================================*/
create index _ANH_GIA__ON_HANG2_FK on DANH_GIA_DON_HANG (
MADH ASC
)
go

/*==============================================================*/
/* Table: DOITAC                                                */
/*==============================================================*/
create table DOITAC (
   MADT                 char(6)              not null,
   MAHD                 char(6)              not null,
   EMAIL                nvarchar(50)          null,
   TENQUAN              nvarchar(50)          null,
   THANHPHO             nvarchar(50)          null,
   QUAN                 nvarchar(50)          null,
   SOCHINHANH           int                  null,
   LOAIAMTHUC           nvarchar(50)          null,
   DIACHI               nvarchar(50)          null,
   SDT                  nvarchar(15)          null,
   DOANHTHU             float                null,
   constraint PK_DOITAC primary key nonclustered (MADT)
)
go

/*==============================================================*/
/* Index: KI_FK                                                 */
/*==============================================================*/
create index KI_FK on DOITAC (
MAHD ASC
)
go

/*==============================================================*/
/* Table: DONHANG                                               */
/*==============================================================*/
create table DONHANG (
   MADH                 char(6)              not null,
   MAKH                 char(6)              not null,
   MACN                 char(6)              not null,
   MATX                 char(6)              null,
   NGAYLAP              datetime             null,
   HINHTHUCTHANHTOAN    nvarchar(20)          null,
   PHIVANCHUYEN         float                null,
   TONGGIADONHANG       float                null,
   GHICHU               nvarchar(100)         null,
   TINHTRANG            nvarchar(30)          null,
   THANHPHO             nvarchar(50)          null,
   QUAN                 nvarchar(50)          null,
   DIACHI               nvarchar(50)          null,
   constraint PK_DONHANG primary key nonclustered (MADH)
)
go

/*==============================================================*/
/* Index: THUOC2_FK                                             */
/*==============================================================*/
create index THUOC2_FK on DONHANG (
MACN ASC
)
go

/*==============================================================*/
/* Index: VAN_CHUYEN_FK                                         */
/*==============================================================*/
create index VAN_CHUYEN_FK on DONHANG (
MATX ASC
)
go

/*==============================================================*/
/* Index: _AT_HANG_VA_THEO_DOI_FK                               */
/*==============================================================*/
create index _AT_HANG_VA_THEO_DOI_FK on DONHANG (
MAKH ASC
)
go

/*==============================================================*/
/* Table: DON_DK                                                */
/*==============================================================*/
create table DON_DK (
   MADDK                char(6)              not null,
   MANV                 char(6)              null,
   TENNH                nvarchar(30)          not null,
   DIACHINH             nvarchar(50)          not null,
   STK                  char(15)             not null,
   MAHD                 char(6)              null,
   EMAIL                nvarchar(50)          null,
   TENQUAN              nvarchar(50)          null,
   THANHPHO             nvarchar(50)          null,
   QUAN                 nvarchar(50)          null,
   SOCHINHANH           int                  null,
   SLDONHANGMN          int                  null,
   LOAIAMTHUC           nvarchar(50)          null,
   DIACHI               nvarchar(50)          null,
   SDT                  nvarchar(15)          null,
   NGUOIDD              nvarchar(30)          null,
   constraint PK_DON_DK primary key nonclustered (MADDK)
)
go

/*==============================================================*/
/* Index: DUYET_FK                                              */
/*==============================================================*/
create index DUYET_FK on DON_DK (
MANV ASC
)
go

/*==============================================================*/
/* Index: SO_TAI_KHOAN_NGAN_HANG_CUA__ON_DK_FK                  */
/*==============================================================*/
create index SO_TAI_KHOAN_NGAN_HANG_CUA__ON_DK_FK on DON_DK (
TENNH ASC,
DIACHINH ASC,
STK ASC
)
go

/*==============================================================*/
/* Index: CO_DON_HOP_DONG_FK                                    */
/*==============================================================*/
create index CO_DON_HOP_DONG_FK on DON_DK (
MAHD ASC
)
go

/*==============================================================*/
/* Table: DOUONG                                                */
/*==============================================================*/
create table DOUONG (
   MATD_DU              char(6)              not null,
   MADU                 char(6)              not null,
   TENDU                nvarchar(50)          null,
   MIEUTA               nvarchar(300)         null,
   GIA                  float                null,
   GHICHU               nvarchar(100)         null,
   constraint PK_DOUONG primary key nonclustered (MATD_DU, MADU)
)
go

/*==============================================================*/
/* Index: DO_UONG_THUOC_THUC_DON_FK                             */
/*==============================================================*/
create index DO_UONG_THUOC_THUC_DON_FK on DOUONG (
MATD_DU ASC
)
go

/*==============================================================*/
/* Table: HOPDONG                                               */
/*==============================================================*/
create table HOPDONG (
   MAHD                 char(6)              not null,
   TENNH                nvarchar(30)          not null,
   DIACHINH             nvarchar(50)          not null,
   STK                  char(15)             not null,
   MADDK                char(6)              not null,
   TENCUAHANG           nvarchar(50)          null,
   MASOTHUE             char(15)             null,
   THOIGIANHIEULUC      datetime             null,
   NGAYLAP              datetime             null,
   PHANTRAMHOAHONG       float                null,
   SOCHINHANHDK         int                  null,
   NGUOIDAIDIEN         nvarchar(30)          null,
   TRANGTHAI            nvarchar(50)          null,
   THANHPHO             nvarchar(50)          null,
   QUAN                 nvarchar(50)          null,
   DIACHI               nvarchar(50)          null,
   LOAIAMTHUC           nvarchar(50)          null,
   SDT                  nvarchar(15)          null,
   constraint PK_HOPDONG primary key nonclustered (MAHD)
)
go

/*==============================================================*/
/* Index: CO_DON_HOP_DONG2_FK                                   */
/*==============================================================*/
create index CO_DON_HOP_DONG2_FK on HOPDONG (
MADDK ASC
)
go

/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
create table KHACHHANG (
   MAKH                 char(6)              not null,
   HOTEN                nvarchar(50)          null,
   EMAIL                nvarchar(50)          null,
   SDT                  nvarchar(15)          null,
   TP                   nvarchar(50)          null,
   QUAN                 nvarchar(50)          null,
   DIACHI               nvarchar(50)          null,
   constraint PK_KHACHHANG primary key nonclustered (MAKH)
)
go

/*==============================================================*/
/* Table: MONAN                                                 */
/*==============================================================*/
create table MONAN (
   MATD_DA              char(6)              not null,
   MAMA                 char(6)              not null,
   TENMA                nvarchar(50)          null,
   MIEUTA               nvarchar(300)         null,
   GIA                  float                null,
   constraint PK_MONAN primary key nonclustered (MATD_DA, MAMA)
)
go

/*==============================================================*/
/* Index: MA_THUOC_FK                                           */
/*==============================================================*/
create index MA_THUOC_FK on MONAN (
MATD_DA ASC
)
go

/*==============================================================*/
/* Table: NGANHANG                                              */
/*==============================================================*/
create table NGANHANG (
   TENNH                nvarchar(30)          not null,
   constraint PK_NGANHANG primary key nonclustered (TENNH)
)
go

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN (
   MANV                 char(6)              not null,
   TENNV                nvarchar(50)          null,
   constraint PK_NHANVIEN primary key nonclustered (MANV)
)
go

/*==============================================================*/
/* Table: SOTAIKHOAN                                            */
/*==============================================================*/
create table SOTAIKHOAN (
   TENNH                nvarchar(30)          not null,
   DIACHINH             nvarchar(50)          not null,
   STK                  char(15)             not null,
   SO_DU                float                null,
   constraint PK_SOTAIKHOAN primary key nonclustered (TENNH, DIACHINH, STK)
)
go

/*==============================================================*/
/* Index: STK__UOC_CHI_NHANH_NH_QL_FK                           */
/*==============================================================*/
create index STK__UOC_CHI_NHANH_NH_QL_FK on SOTAIKHOAN (
TENNH ASC,
DIACHINH ASC
)
go

/*==============================================================*/
/* Table: TAIXE                                                 */
/*==============================================================*/
create table TAIXE (
   MATX                 char(6)              not null,
   TENNH                nvarchar(30)          not null,
   DIACHINH             nvarchar(50)          not null,
   STK                  char(15)             not null,
   HOTEN                nvarchar(50)          null,
   CMND                 char(15)             null,
   DIENTHOAI            nvarchar(15)          null,
   TP                   nvarchar(50)          null,
   QUAN                 nvarchar(50)          null,
   DIACHI               nvarchar(50)          null,
   BIENSOXE             nvarchar(15)          null,
   THUNHAPTX            float                null,
   TRANGTHAI            nvarchar(50)          null,
   KV_TP                nvarchar(50)          null,
   KV_QUAN              nvarchar(50)          null,
   constraint PK_TAIXE primary key nonclustered (MATX)
)
go

/*==============================================================*/
/* Index: TAI_XE_SO_HUU_STK_FK                                  */
/*==============================================================*/
create index TAI_XE_SO_HUU_STK_FK on TAIXE (
TENNH ASC,
DIACHINH ASC,
STK ASC
)
go

/*==============================================================*/
/* Table: THUCDON_DA                                            */
/*==============================================================*/
create table THUCDON_DA (
   MATD_DA              char(6)              not null,
   MADT                 char(6)              not null,
   TENTDDA              nvarchar(50)          null,
   SOLUONGMON           int                  null,
   constraint PK_THUCDON_DA primary key nonclustered (MATD_DA)
)
go

/*==============================================================*/
/* Index: DUOC_CO_FK                                            */
/*==============================================================*/
create index DUOC_CO_FK on THUCDON_DA (
MADT ASC
)
go

/*==============================================================*/
/* Table: THUCDON_DU                                            */
/*==============================================================*/
create table THUCDON_DU (
   MATD_DU              char(6)              not null,
   MADT                 char(6)              not null,
   TENTDDU              char(30)             null,
   SL                   int                  null,
   constraint PK_THUCDON_DU primary key nonclustered (MATD_DU)
)
go

/*==============================================================*/
/* Index: THUC_DON_DU_FK                                        */
/*==============================================================*/
create index THUC_DON_DU_FK on THUCDON_DU (
MADT ASC
)
go

/*==============================================================*/
/* Table: TOPING_DA                                             */
/*==============================================================*/
create table TOPING_DA (
   MATD_DA              char(6)              not null,
   MAMA                 char(6)              not null,
   TENTOPING            nvarchar(30)          not null,
   GIA                  float                null,
   constraint PK_TOPING_DA primary key nonclustered (MATD_DA, MAMA, TENTOPING)
)
go

/*==============================================================*/
/* Index: TOPPING_DANH_RIENG_CHO_MON_AN_FK                      */
/*==============================================================*/
create index TOPPING_DANH_RIENG_CHO_MON_AN_FK on TOPING_DA (
MATD_DA ASC,
MAMA ASC
)
go

/*==============================================================*/
/* Table: TOPING_DU                                             */
/*==============================================================*/
create table TOPING_DU (
   MATD_DU              char(6)              not null,
   MADU                 char(6)              not null,
   TENTOPPING           nvarchar(50)          not null,
   GIA                  float                null,
   constraint PK_TOPING_DU primary key nonclustered (MATD_DU, MADU, TENTOPPING)
)
go

/*==============================================================*/
/* Index: TOPPING_DU_FK                                         */
/*==============================================================*/
create index TOPPING_DU_FK on TOPING_DU (
MATD_DU ASC,
MADU ASC
)
go

/*==============================================================*/
/* Table: TT_DU_CN                                              */
/*==============================================================*/
create table TT_DU_CN (
   MACN                 char(6)              not null,
   MATD_DU              char(6)              not null,
   MADU                 char(6)              not null,
   TRANG_THAI           nvarchar(20)          null,
   constraint PK_TT_DU_CN primary key (MATD_DU, MACN, MADU)
)
go

/*==============================================================*/
/* Index: TT_DU_CN_FK                                           */
/*==============================================================*/
create index TT_DU_CN_FK on TT_DU_CN (
MACN ASC
)
go

/*==============================================================*/
/* Index: TT_DU_CN2_FK                                          */
/*==============================================================*/
create index TT_DU_CN2_FK on TT_DU_CN (
MATD_DU ASC,
MADU ASC
)
go

/*==============================================================*/
/* Table: TT_MA_CN                                              */
/*==============================================================*/
create table TT_MA_CN (
   MACN                 char(6)              not null,
   MATD_DA              char(6)              not null,
   MAMA                 char(6)              not null,
   TRANG_THAI           nvarchar(20)          null,
   constraint PK_TT_MA_CN primary key (MATD_DA, MACN, MAMA)
)
go

/*==============================================================*/
/* Index: TT_MA_CN_FK                                           */
/*==============================================================*/
create index TT_MA_CN_FK on TT_MA_CN (
MACN ASC
)
go

/*==============================================================*/
/* Index: TT_MA_CN2_FK                                          */
/*==============================================================*/
create index TT_MA_CN2_FK on TT_MA_CN (
MATD_DA ASC,
MAMA ASC
)
go

/*==============================================================*/
/* Table: TUYCHON_DA_DH                                         */
/*==============================================================*/
create table TUYCHON_DA_DH (
   MADH                 char(6)              not null,
   MATC_DA              char(6)              not null,
   TOPPING              nvarchar(30)          null,
   GIA_TC               float                null,
   constraint PK_TUYCHON_DA_DH primary key (MADH, MATC_DA)
)
go

/*==============================================================*/
/* Table: TUYCHON_DU_DH                                         */
/*==============================================================*/
create table TUYCHON_DU_DH (
   MADH                 char(6)              not null,
   MATC_DU              char(6)              not null,
   TOPPING              nvarchar(30)          null,
   GIA_TC               float                null,
   constraint PK_TUYCHON_DU_DH primary key (MADH, MATC_DU)
)
go

alter table CHINHANH
   add constraint FK_CHINHANH_DOI_TAC_C_DOITAC foreign key (MADT)
      references DOITAC (MADT)
go

alter table CHINHANH
   add constraint FK_CHINHANH__ANG__KY__DON_DK foreign key (MADDK)
      references DON_DK (MADDK)
go

alter table CHITIET_DH_DA
   add constraint FK_CHITIET__CHI_TIET__DONHANG foreign key (MADH)
      references DONHANG (MADH)
go

alter table CHITIET_DH_DA
   add constraint FK_CHITIET__THUOC_MON_MONAN foreign key (MATD_DA, MAMA)
      references MONAN (MATD_DA, MAMA)
go

alter table CHITIET_DH_DU
   add constraint FK_CHITIET__THUOC_DO__DOUONG foreign key (MATD_DU, MADU)
      references DOUONG (MATD_DU, MADU)
go

alter table CHITIET_DH_DU
   add constraint FK_CHITIET___O_UONG_T_DONHANG foreign key (MADH)
      references DONHANG (MADH)
go

alter table CN_NGAN_HANG
   add constraint FK_CN_NGAN__CO_NHIEU__NGANHANG foreign key (TENNH)
      references NGANHANG (TENNH)
go

alter table DANH_GIA_DON_HANG
   add constraint FK_DANH_GIA_DANHGIA_D_KHACHHAN foreign key (MAKH)
      references KHACHHANG (MAKH)
go

alter table DANH_GIA_DON_HANG
   add constraint FK_DANH_GIA_DANHGIA_D_DONHANG foreign key (MADH)
      references DONHANG (MADH)
go

alter table DOITAC
   add constraint FK_DOITAC_KI_HOPDONG foreign key (MAHD)
      references HOPDONG (MAHD)
go

alter table DONHANG
   add constraint FK_DONHANG_CO_CHINHANH foreign key (MACN)
      references CHINHANH (MACN)
go

alter table DONHANG
   add constraint FK_DONHANG_VAN_CHUYE_TAIXE foreign key (MATX)
      references TAIXE (MATX)
go

alter table DONHANG
   add constraint FK_DONHANG__AT_HANG__KHACHHAN foreign key (MAKH)
      references KHACHHANG (MAKH)
go

alter table DON_DK
   add constraint FK_DON_DK_CO_DON_HO_HOPDONG foreign key (MAHD)
      references HOPDONG (MAHD)
go

alter table DON_DK
   add constraint FK_DON_DK_DOI_TAC_P_SOTAIKHO foreign key (TENNH, DIACHINH, STK)
      references SOTAIKHOAN (TENNH, DIACHINH, STK)
go

alter table DON_DK
   add constraint FK_DON_DK_DUYET_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table DOUONG
   add constraint FK_DOUONG_THUC_DON__THUCDON_ foreign key (MATD_DU)
      references THUCDON_DU (MATD_DU)
go

alter table HOPDONG
   add constraint FK_HOPDONG_CO_DON_HO_DON_DK foreign key (MADDK)
      references DON_DK (MADDK)
go

alter table HOPDONG
   add constraint FK_HOPDONG_MOI_HOP___SOTAIKHO foreign key (TENNH, DIACHINH, STK)
      references SOTAIKHOAN (TENNH, DIACHINH, STK)
go

alter table MONAN
   add constraint FK_MONAN_THUOC_THUCDON_ foreign key (MATD_DA)
      references THUCDON_DA (MATD_DA)
go

alter table SOTAIKHOAN
   add constraint FK_SOTAIKHO_STK__UOC__CN_NGAN_ foreign key (TENNH, DIACHINH)
      references CN_NGAN_HANG (TENNH, DIACHINH)
go

alter table TAIXE
   add constraint FK_TAIXE_TAI_XE_SO_SOTAIKHO foreign key (TENNH, DIACHINH, STK)
      references SOTAIKHOAN (TENNH, DIACHINH, STK)
go

alter table THUCDON_DA
   add constraint FK_THUCDON__DT_CO_THU_DOITAC foreign key (MADT)
      references DOITAC (MADT)
go

alter table THUCDON_DU
   add constraint FK_THUCDON__CO_NHIEU__DOITAC foreign key (MADT)
      references DOITAC (MADT)
go

alter table TOPING_DA
   add constraint FK_TOPING_D_TOPPING_D_MONAN foreign key (MATD_DA, MAMA)
      references MONAN (MATD_DA, MAMA)
go

alter table TOPING_DU
   add constraint FK_TOPING_D_TOPPING_D_DOUONG foreign key (MATD_DU, MADU)
      references DOUONG (MATD_DU, MADU)
go

alter table TT_DU_CN
   add constraint FK_TT_DU_CN_TT_DU_CN_CHINHANH foreign key (MACN)
      references CHINHANH (MACN)
go

alter table TT_DU_CN
   add constraint FK_TT_DU_CN_TT_DU_CN2_DOUONG foreign key (MATD_DU, MADU)
      references DOUONG (MATD_DU, MADU)
go

alter table TT_MA_CN
   add constraint FK_TT_MA_CN_TT_MA_CN_CHINHANH foreign key (MACN)
      references CHINHANH (MACN)
go

alter table TT_MA_CN
   add constraint FK_TT_MA_CN_TT_MA_CN2_MONAN foreign key (MATD_DA, MAMA)
      references MONAN (MATD_DA, MAMA)
go

alter table TUYCHON_DA_DH
   add constraint FK_TUYCHON__TUY_CHON__CHITIET_ foreign key (MADH, MATC_DA)
      references CHITIET_DH_DA (MADH, MATC_DA)
go

alter table TUYCHON_DU_DH
   add constraint FK_TUYCHON__TUYCHON_D_CHITIET_ foreign key (MADH, MATC_DU)
      references CHITIET_DH_DU (MADH, MATC_DU)
go



USE [QLGH]
GO
INSERT [dbo].[NGANHANG] ([TENNH]) VALUES (N'ACB')
INSERT [dbo].[NGANHANG] ([TENNH]) VALUES (N'Agribank')
INSERT [dbo].[NGANHANG] ([TENNH]) VALUES (N'BIDV')
INSERT [dbo].[NGANHANG] ([TENNH]) VALUES (N'VIB')
INSERT [dbo].[NGANHANG] ([TENNH]) VALUES (N'VietcomBank')
GO
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'ACB', N'Bình Chiểu')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'ACB', N'Bình Trưng Tây')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'ACB', N'Hiệp Bình Chánh')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'Agribank', N'Linh Đông')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'Agribank', N'Linh Tây')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'Agribank', N'Linh Trung')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'Agribank', N'Quận 1')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'Agribank', N'Quận 3')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'BIDV', N'Hiệp Phú')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'BIDV', N'Long Trường')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'BIDV', N'Phước Bình')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'VIB', N'Tăng Nhơn Phú B')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'VIB', N'Trường Thạnh')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'VIB', N'Trường Thọ')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'VietcomBank', N'Long Phước')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'VietcomBank', N'Quận 5')
INSERT [dbo].[CN_NGAN_HANG] ([TENNH], [DIACHINH]) VALUES (N'VietcomBank', N'Quận Phú Nhuận')
GO
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Trung', N'6380205558111  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Trung', N'6380205558112  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Trung', N'6380205558113  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Quận 1', N'6380205558221  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Quận 1', N'6380205558222  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Quận 1', N'6380205558223  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Quận 3', N'6380205558331  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Quận 3', N'6380205558332  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Quận 3', N'6380205558333  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Đông', N'6380205558441  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Đông', N'6380205558442  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Đông', N'6380205558443  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Đông', N'6380205558444  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Tây', N'6380205558551  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Tây', N'6380205558552  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Tây', N'6380205558553  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'Agribank', N'Linh Tây', N'6380205558554  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Bình Chiểu', N'6380205582111  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Bình Chiểu', N'6380205582112  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Bình Chiểu', N'6380205582113  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582221  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582222  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582223  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582224  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576032  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576031  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576033  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576034  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561111  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561112  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561113  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561114  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Long Trường', N'6380205561221  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Long Trường', N'6380205561222  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Long Trường', N'6380205561223  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Long Trường', N'6380205561224  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Phước Bình', N'6380205561331  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Phước Bình', N'6380205561332  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Phước Bình', N'6380205561333  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'BIDV', N'Phước Bình', N'6380205561334  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thạnh', N'6380205575111  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thạnh', N'6380205575112  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thạnh', N'6380205575113  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thạnh', N'6380205575114  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thọ', N'6380205575221  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thọ', N'6380205575222  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thọ', N'6380205575223  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Trường Thọ', N'6380205575224  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575331  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575332  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575333  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575334  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận 5', N'6380205582111  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận 5', N'6380205582112  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận 5', N'6380205582113  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận 5', N'6380205582114  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận Phú Nhuận', N'6380205582221  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận Phú Nhuận', N'6380205582222  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận Phú Nhuận', N'6380205582223  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Quận Phú Nhuận', N'6380205582224  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Long Phước', N'6380205582331  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Long Phước', N'6380205582332  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Long Phước', N'6380205582333  ', 100000)
INSERT [dbo].[SOTAIKHOAN] ([TENNH], [DIACHINH], [STK], [SO_DU]) VALUES (N'VietcomBank', N'Long Phước', N'6380205582334  ', 100000)
GO
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV]) VALUES (N'NV_01 ', N'Phạm Thiên An')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV]) VALUES (N'NV_02 ', N'Trần Ngọc Bảo')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV]) VALUES (N'NV_03 ', N'Nguyễn Thanh Danh')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV]) VALUES (N'NV_04 ', N'Nguyễn Trần Quốc Duy')
INSERT [dbo].[NHANVIEN] ([MANV], [TENNV]) VALUES (N'NV_05 ', N'Hứa Tuấn Hữu')
GO

-- INSERT DON_DK

INSERT INTO DON_DK(MADDK,NGUOIDD,TENNH,DIACHINH, STK, EMAIL, TENQUAN, THANHPHO,QUAN,DIACHI ,SLDONHANGMN, LOAIAMTHUC,SDT,SOCHINHANH)
VALUES('DDK_01',N'Long Phước',N'Agribank',N'Linh Trung','6380205558112', 'cinema@yahoo.com', N'Phúc Long', N'TP HCM', N'Quận 1', N'Phường Bến Nghé', 50, N'cafe', '0377092166',0)

INSERT INTO DON_DK(MADDK,NGUOIDD,TENNH,DIACHINH, STK, EMAIL, TENQUAN, THANHPHO,QUAN,DIACHI ,SLDONHANGMN, LOAIAMTHUC,SDT,SOCHINHANH)
VALUES('DDK_02',N'Vũ Trung Kiên',N'ACB',N'Bình Chiểu','6380205582113', 'lian27111985@.com', N'KFC', N'TP HCM', N'Quận 5', N'Phường 02', 100, N'Đồ ắn nhanh', '0933888337',0)

INSERT INTO DON_DK(MADDK,MANV,NGUOIDD,TENNH,DIACHINH, STK, EMAIL, TENQUAN, THANHPHO,QUAN,DIACHI ,SLDONHANGMN, LOAIAMTHUC,SDT,SOCHINHANH)
VALUES('DDK_03','NV_02', N'Nguyễn Đình Lộc',N'VIB',N'Trường Thạnh','6380205575111', 'phamloc842002@gmail.com', N'Highland ', N'TP HCM', N'Quận 3', N'Phường 01', 50, N'cafe', '0915467229',0)

INSERT INTO DON_DK(MADDK,NGUOIDD,TENNH,DIACHINH, STK, EMAIL, TENQUAN, THANHPHO,QUAN,DIACHI ,SLDONHANGMN, LOAIAMTHUC,SDT,SOCHINHANH)
VALUES('DDK_04', N'Đặng Hoàng Phi',N'VIB',N'Trường Thọ','6380205575222', 'kieuan08@yahoo.com', N'bánh mì Hòa Mã', N'TP HCM', N'Quận 4', N'Phường 05', 200, N'Bánh mì', '0989676871',0)

INSERT INTO DON_DK(MADDK,MANV,NGUOIDD,TENNH,DIACHINH, STK, EMAIL, TENQUAN, THANHPHO,QUAN,DIACHI ,SLDONHANGMN, LOAIAMTHUC,SDT,SOCHINHANH)
VALUES('DDK_05', 'NV_03', N'Huỳnh Xuân Tín',N'VietcomBank',N'Long Phước','6380205582331', 'mimian2003@yahoo.com', N'Family mart', N'TP HCM', N'Quận 6', N'Phường 02', 100, N'Đồ ắn nhanh', '0914252492',0)

GO
INSERT [dbo].[HOPDONG] ([MAHD], [TENNH], [DIACHINH], [STK], [MADDK], [TENCUAHANG], [MASOTHUE], [THOIGIANHIEULUC], [NGAYLAP], [PHANTRAMHOAHONG], [SOCHINHANHDK], [NGUOIDAIDIEN], [TRANGTHAI], [THANHPHO], [QUAN], [DIACHI], [LOAIAMTHUC], [SDT]) VALUES (N'HD_01 ', N'Agribank', N'Linh Trung', N'6380205558112  ', N'DDK_01', N'Phúc Long', N'MT_01          ', CAST(N'2024-04-03T13:54:16.170' AS DateTime), CAST(N'2023-04-04T13:54:16.170' AS DateTime), 10, 2, N'Long Phước', N'Còn hiệu lực', N'TP HCM', N'Quận 1', N'Phường Bến Nghé', N'cafe', N'0377092166')
INSERT [dbo].[HOPDONG] ([MAHD], [TENNH], [DIACHINH], [STK], [MADDK], [TENCUAHANG], [MASOTHUE], [THOIGIANHIEULUC], [NGAYLAP], [PHANTRAMHOAHONG], [SOCHINHANHDK], [NGUOIDAIDIEN], [TRANGTHAI], [THANHPHO], [QUAN], [DIACHI], [LOAIAMTHUC], [SDT]) VALUES (N'HD_02 ', N'ACB', N'Bình Chiểu', N'6380205582113  ', N'DDK_02', N'KFC', N'MT_02          ', CAST(N'2024-04-03T13:54:16.267' AS DateTime), CAST(N'2023-04-04T13:54:16.267' AS DateTime), 10, 2, N'Vũ Trung Kiên', N'Còn hiệu lực', N'TP HCM', N'Quận 5', N'Phường 02', N'Đồ ắn nhanh', N'0933888337')

GO
INSERT [dbo].[DOITAC] ([MADT], [MAHD], [EMAIL], [TENQUAN], [THANHPHO], [QUAN], [SOCHINHANH], [LOAIAMTHUC], [DIACHI], [SDT], [DOANHTHU]) VALUES (N'DT_01 ', N'HD_01 ', N'cinema@yahoo.com', N'Phúc Long', N'TP HCM', N'Quận 1', 2, N'cafe', N'Phường Bến Nghé', N'0377092166', 103500)
INSERT [dbo].[DOITAC] ([MADT], [MAHD], [EMAIL], [TENQUAN], [THANHPHO], [QUAN], [SOCHINHANH], [LOAIAMTHUC], [DIACHI], [SDT], [DOANHTHU]) VALUES (N'DT_02 ', N'HD_02 ', N'lian27111985@.com', N'KFC', N'TP HCM', N'Quận 5', 2, N'Đồ ắn nhanh', N'Phường 02', N'0933888337', 0)
GO
INSERT [dbo].[CHINHANH] ([MACN], [MADT], [MADDK], [TENQUAN], [THOIGIANMO], [THOIGIANDONG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'CN_01 ', N'DT_01 ', N'DDK_01', N'Phúc Long', CAST(N'1900-01-01T08:00:00.000' AS DateTime), CAST(N'1900-01-01T21:00:00.000' AS DateTime), N'TP HCM', N'Bình Tân', N'Bình Trị Đông')
INSERT [dbo].[CHINHANH] ([MACN], [MADT], [MADDK], [TENQUAN], [THOIGIANMO], [THOIGIANDONG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'CN_02 ', N'DT_01 ', N'DDK_01', N'Phúc Long', CAST(N'1900-01-01T08:00:00.000' AS DateTime), CAST(N'1900-01-01T21:00:00.000' AS DateTime), N'TP HCM', N'Bình Tân', N'Bình Trị Đông')
INSERT [dbo].[CHINHANH] ([MACN], [MADT], [MADDK], [TENQUAN], [THOIGIANMO], [THOIGIANDONG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'CN_03 ', N'DT_02 ', N'DDK_02', N'KFC', CAST(N'1900-01-01T08:00:00.000' AS DateTime), CAST(N'1900-01-01T21:00:00.000' AS DateTime), N'TP HCM', N'Bình Tân', N'Bình Trị Đông')
INSERT [dbo].[CHINHANH] ([MACN], [MADT], [MADDK], [TENQUAN], [THOIGIANMO], [THOIGIANDONG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'CN_04 ', N'DT_02 ', N'DDK_02', N'KFC', CAST(N'1900-01-01T08:00:00.000' AS DateTime), CAST(N'1900-01-01T21:00:00.000' AS DateTime), N'TP HCM', N'Bình Tân', N'Bình Trị Đông')
GO
INSERT [dbo].[THUCDON_DA] ([MATD_DA], [MADT], [TENTDDA], [SOLUONGMON]) VALUES (N'TDA_01', N'DT_01 ', N'Bakery', 2)
INSERT [dbo].[THUCDON_DA] ([MATD_DA], [MADT], [TENTDDA], [SOLUONGMON]) VALUES (N'TDA_03', N'DT_01 ', N'Cream', 2)
INSERT [dbo].[THUCDON_DA] ([MATD_DA], [MADT], [TENTDDA], [SOLUONGMON]) VALUES (N'TDA_02', N'DT_02 ', N'Đồ ăn nhanh', 2)
INSERT [dbo].[THUCDON_DA] ([MATD_DA], [MADT], [TENTDDA], [SOLUONGMON]) VALUES (N'TDA_04', N'DT_02 ', N'Buger', 2)
GO
INSERT [dbo].[THUCDON_DU] ([MATD_DU], [MADT], [TENTDDU], [SL]) VALUES (N'TDU_01', N'DT_01 ', N'Tea', 2)
INSERT [dbo].[THUCDON_DU] ([MATD_DU], [MADT], [TENTDDU], [SL]) VALUES (N'TDU_02', N'DT_01 ', N'Cafe', 2)
INSERT [dbo].[THUCDON_DU] ([MATD_DU], [MADT], [TENTDDU], [SL]) VALUES (N'TDU_03', N'DT_02 ', N'Nước có ga', 2)
INSERT [dbo].[THUCDON_DU] ([MATD_DU], [MADT], [TENTDDU], [SL]) VALUES (N'TDU_04', N'DT_02 ', N'Sinh tố', 2)
GO
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_01', N'MA_01 ', N'Bánh Mì Phúc Long', N'', 35000)
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_01', N'MA_02 ', N'Butter Chocolate croissant', N'', 15000)
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_02', N'MA_01 ', N'Cream Dâu', N'', 15000)
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_02', N'MA_02 ', N'Cream Chocolate', N'', 15000)
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_03', N'MA_01 ', N'Khoai Tây Chiên', N'', 15000)
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_03', N'MA_02 ', N'Phô Mai Viên', N'', 15000)
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_04', N'MA_01 ', N'Buger Zinger', N'', 15000)
INSERT [dbo].[MONAN] ([MATD_DA], [MAMA], [TENMA], [MIEUTA], [GIA]) VALUES (N'TDA_04', N'MA_02 ', N'Buger Tôm', N'', 15000)
GO
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_01', N'DU_01 ', N'Trà Tắc', N'', 15000, NULL)
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_01', N'DU_02 ', N'Trà Dâu', N'', 25000, NULL)
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_02', N'DU_01 ', N'Cafe Sữa', N'', 30000, NULL)
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_02', N'DU_02 ', N'Cafe Đen', N'', 30000, NULL)
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_03', N'DU_01 ', N'Coca', N'', 10000, NULL)
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_03', N'DU_02 ', N'Pepsi', N'', 10000, NULL)
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_04', N'DU_01 ', N'Sinh Tố Dâu', N'', 20000, NULL)
INSERT [dbo].[DOUONG] ([MATD_DU], [MADU], [TENDU], [MIEUTA], [GIA], [GHICHU]) VALUES (N'TDU_04', N'DU_02 ', N'Sinh Tố Dưa Gang', N'', 20000, NULL)
GO
INSERT [dbo].[TOPING_DA] ([MATD_DA], [MAMA], [TENTOPING], [GIA]) VALUES (N'TDA_01', N'MA_01 ', N'Xúc xích', 5000)
INSERT [dbo].[TOPING_DA] ([MATD_DA], [MAMA], [TENTOPING], [GIA]) VALUES (N'TDA_01', N'MA_01 ', N'Trứng chiên', 5000)
INSERT [dbo].[TOPING_DA] ([MATD_DA], [MAMA], [TENTOPING], [GIA]) VALUES (N'TDA_04', N'MA_01 ', N'Rau Sống', 2000)
INSERT [dbo].[TOPING_DA] ([MATD_DA], [MAMA], [TENTOPING], [GIA]) VALUES (N'TDA_04', N'MA_01 ', N'Trứng Chiên', 2000)
INSERT [dbo].[TOPING_DA] ([MATD_DA], [MAMA], [TENTOPING], [GIA]) VALUES (N'TDA_04', N'MA_02 ', N'Tôm thêm', 15000)
GO
INSERT [dbo].[TOPING_DU] ([MATD_DU], [MADU], [TENTOPPING], [GIA]) VALUES (N'TDU_01', N'DU_01 ', N'Trân Châu', 5000)
INSERT [dbo].[TOPING_DU] ([MATD_DU], [MADU], [TENTOPPING], [GIA]) VALUES (N'TDU_01', N'DU_01 ', N'Thạch', 5000)
INSERT [dbo].[TOPING_DU] ([MATD_DU], [MADU], [TENTOPPING], [GIA]) VALUES (N'TDU_01', N'DU_02 ', N'Trân Châu', 5000)
INSERT [dbo].[TOPING_DU] ([MATD_DU], [MADU], [TENTOPPING], [GIA]) VALUES (N'TDU_01', N'DU_02 ', N'Dâu', 10000)
INSERT [dbo].[TOPING_DU] ([MATD_DU], [MADU], [TENTOPPING], [GIA]) VALUES (N'TDU_04', N'DU_01 ', N'Kem Tươi', 5000)
INSERT [dbo].[TOPING_DU] ([MATD_DU], [MADU], [TENTOPPING], [GIA]) VALUES (N'TDU_04', N'DU_02 ', N'Combo hạt', 10000)
GO
GO
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [EMAIL], [SDT], [TP], [QUAN], [DIACHI]) VALUES (N'KH_01 ', N'Bùi Hứa Xuân Huy', N'thuyduonggtvt@gmail.com', N'0905243600', N'TP HCM', N'Quận 1', N'Phường Bến Nghé')
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [EMAIL], [SDT], [TP], [QUAN], [DIACHI]) VALUES (N'KH_02 ', N'Nguyễn Thị Hoàng Vinh', N'doandanghaivd@gmail.com', N'0989970469', N'TP HCM', N'Quận 3', N'Phường 01')
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [EMAIL], [SDT], [TP], [QUAN], [DIACHI]) VALUES (N'KH_03 ', N'Ngô Văn Rảnh', N'nguyenthanhhoaqb@gmai.com', N'0972755453', N'TP HCM', N'Quận 4', N'Phường 02')
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [EMAIL], [SDT], [TP], [QUAN], [DIACHI]) VALUES (N'KH_04 ', N'Võ Thị Hoa', N'holeviet@gmail.com', N'0983853567', N'TP HCM', N'Quận 5', N'Phường 06')
GO
INSERT [dbo].[TAIXE] ([MATX], [TENNH], [DIACHINH], [STK], [HOTEN], [CMND], [DIENTHOAI], [TP], [QUAN], [DIACHI], [BIENSOXE], [THUNHAPTX], [TRANGTHAI], [KV_TP], [KV_QUAN]) VALUES (N'TX_01 ', N'VietcomBank', N'Long Phước', N'6380205582331  ', N'Nguyễn Trung Thịnh', N'341641244      ', N'0377092166', N'TP HCM', N'Quận Bình Tân', N'Bình Trị Đông', N'90A167.85', 60000, N'Chưa nhận đơn', NULL, NULL)
INSERT [dbo].[TAIXE] ([MATX], [TENNH], [DIACHINH], [STK], [HOTEN], [CMND], [DIENTHOAI], [TP], [QUAN], [DIACHI], [BIENSOXE], [THUNHAPTX], [TRANGTHAI], [KV_TP], [KV_QUAN]) VALUES (N'TX_02 ', N'VietcomBank', N'Long Phước', N'6380205582332  ', N'Nguyễn Như Nhật Mẫn', N'334866870      ', N'0919723524', N'TP HCM', N'Quận 5', N'Phường 01', N'90A167.86', 30000, N'Chưa nhận đơn', NULL, NULL)
INSERT [dbo].[TAIXE] ([MATX], [TENNH], [DIACHINH], [STK], [HOTEN], [CMND], [DIENTHOAI], [TP], [QUAN], [DIACHI], [BIENSOXE], [THUNHAPTX], [TRANGTHAI], [KV_TP], [KV_QUAN]) VALUES (N'TX_03 ', N'VietcomBank', N'Long Phước', N'6380205582333  ', N'Cao Tuấn Nghĩa', N'025810945      ', N'0374799681', N'TP HCM', N'Quận 10', N'Phường 02', N'90A167.87', 30000, N'Chưa nhận đơn', NULL, NULL)
INSERT [dbo].[TAIXE] ([MATX], [TENNH], [DIACHINH], [STK], [HOTEN], [CMND], [DIENTHOAI], [TP], [QUAN], [DIACHI], [BIENSOXE], [THUNHAPTX], [TRANGTHAI], [KV_TP], [KV_QUAN]) VALUES (N'TX_04 ', N'VietcomBank', N'Long Phước', N'6380205582334  ', N' Vũ Thị Phi Giao', N'280969631      ', N'0365722364', N'TP HCM', N'Quận 11', N'Phường 01', N'90A167.88', 0, N'Chưa nhận đơn', NULL, NULL)
GO
INSERT [dbo].[DONHANG] ([MADH], [MAKH], [MACN], [MATX], [NGAYLAP], [HINHTHUCTHANHTOAN], [PHIVANCHUYEN], [TONGGIADONHANG], [GHICHU], [TINHTRANG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'DH_001', N'KH_01 ', N'CN_02 ', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONHANG] ([MADH], [MAKH], [MACN], [MATX], [NGAYLAP], [HINHTHUCTHANHTOAN], [PHIVANCHUYEN], [TONGGIADONHANG], [GHICHU], [TINHTRANG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'DH_002', N'KH_02 ', N'CN_02 ', N'TX_01 ', CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'Thanh toán trực tiếp', 30000, 70000, NULL, N'Đã giao hàng', N'TP HCM', N'Quận 1', N'Phường 1')
INSERT [dbo].[DONHANG] ([MADH], [MAKH], [MACN], [MATX], [NGAYLAP], [HINHTHUCTHANHTOAN], [PHIVANCHUYEN], [TONGGIADONHANG], [GHICHU], [TINHTRANG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'DH_003', N'KH_01 ', N'CN_01 ', N'TX_02 ', CAST(N'2023-06-05T00:00:00.000' AS DateTime), N'Momo', 30000, 15000, N'Giao vào giờ hành chính', N'Đã giao hàng', N'TP HCM', N'Quận 1', N'Phường 6')
INSERT [dbo].[DONHANG] ([MADH], [MAKH], [MACN], [MATX], [NGAYLAP], [HINHTHUCTHANHTOAN], [PHIVANCHUYEN], [TONGGIADONHANG], [GHICHU], [TINHTRANG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'DH_004', N'KH_03 ', N'CN_01 ', N'TX_03 ', CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'ZaloPay', 30000, 30000, NULL, N'Đã giao hàng', N'TP HCM', N'Quận 5', N'Phường 4')
INSERT [dbo].[DONHANG] ([MADH], [MAKH], [MACN], [MATX], [NGAYLAP], [HINHTHUCTHANHTOAN], [PHIVANCHUYEN], [TONGGIADONHANG], [GHICHU], [TINHTRANG], [THANHPHO], [QUAN], [DIACHI]) VALUES (N'DH_005', N'KH_03 ', N'CN_03 ', N'TX_01 ', CAST(N'2023-03-03T00:00:00.000' AS DateTime), N'Thanh toán trực tiếp', 30000, 55000, NULL, N'Chờ shop xác nhận', N'TP HCM', N'Quận 4', N'Phường 3')
GO
INSERT [dbo].[CHITIET_DH_DA] ([MADH], [MATC_DA], [MATD_DA], [MAMA], [TENMA], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_001', N'TCA_01', N'TDA_01', N'MA_01 ', N'Bánh Mì Phúc Long', 2, 35000, 70000)
INSERT [dbo].[CHITIET_DH_DA] ([MADH], [MATC_DA], [MATD_DA], [MAMA], [TENMA], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_001', N'TCA_02', N'TDA_01', N'MA_02 ', N'Butter Chocolate croissant', 2, 30000, 60000)
INSERT [dbo].[CHITIET_DH_DA] ([MADH], [MATC_DA], [MATD_DA], [MAMA], [TENMA], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_002', N'TCA_03', N'TDA_01', N'MA_01 ', N'Bánh Mì Phúc Long', 1, 35000, 35000)
INSERT [dbo].[CHITIET_DH_DA] ([MADH], [MATC_DA], [MATD_DA], [MAMA], [TENMA], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_003', N'TCA_04', N'TDA_02', N'MA_01 ', N'Cream Dâu', 1, 15000, 15000)
INSERT [dbo].[CHITIET_DH_DA] ([MADH], [MATC_DA], [MATD_DA], [MAMA], [TENMA], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_004', N'TCA_05', N'TDA_02', N'MA_01 ', N'Cream Dâu', 2, 15000, 30000)
INSERT [dbo].[CHITIET_DH_DA] ([MADH], [MATC_DA], [MATD_DA], [MAMA], [TENMA], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_005', N'TCA_06', N'TDA_03', N'MA_01 ', N'Khoai Tây Chiên', 3, 15000, 45000)
GO
INSERT [dbo].[CHITIET_DH_DU] ([MADH], [MATC_DU], [MATD_DU], [MADU], [TENDU], [SIZE], [LUONGDA], [LUONGDUONG], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_001', N'TCU_01', N'TDU_01', N'DU_01 ', N'Trà Tắc', N'L  ', 50, 50, 1, 15000, 15000)
INSERT [dbo].[CHITIET_DH_DU] ([MADH], [MATC_DU], [MATD_DU], [MADU], [TENDU], [SIZE], [LUONGDA], [LUONGDUONG], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_001', N'TCU_02', N'TDU_01', N'DU_02 ', N'Trà Dâu', N'L  ', 50, 30, 2, 25000, 50000)
INSERT [dbo].[CHITIET_DH_DU] ([MADH], [MATC_DU], [MATD_DU], [MADU], [TENDU], [SIZE], [LUONGDA], [LUONGDUONG], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_002', N'TCU_04', N'TDU_01', N'DU_02 ', N'Trà Dâu', N'M  ', 0, 0, 1, 25000, 35000)
INSERT [dbo].[CHITIET_DH_DU] ([MADH], [MATC_DU], [MATD_DU], [MADU], [TENDU], [SIZE], [LUONGDA], [LUONGDUONG], [SL], [GIA], [TONGGIA_CT]) VALUES (N'DH_005', N'TCU_03', N'TDU_03', N'DU_01 ', N'Coca', N'S  ', 50, 50, 1, 10000, 10000)
GO
INSERT [dbo].[TUYCHON_DA_DH] ([MADH], [MATC_DA], [TOPPING], [GIA_TC]) VALUES (N'DH_001', N'TCA_01', N'Trứng chiên', 5000)
GO
INSERT [dbo].[TUYCHON_DU_DH] ([MADH], [MATC_DU], [TOPPING], [GIA_TC]) VALUES (N'DH_002', N'TCU_04', N'Dâu', 10000)
GO
INSERT [dbo].[DANH_GIA_DON_HANG] ([MAKH], [MADH], [RATE], [COMMENT]) VALUES (N'KH_01 ', N'DH_003', 4, N'tốt')
INSERT [dbo].[DANH_GIA_DON_HANG] ([MAKH], [MADH], [RATE], [COMMENT]) VALUES (N'KH_02 ', N'DH_002', 5, N'10 Điểm')
INSERT [dbo].[DANH_GIA_DON_HANG] ([MAKH], [MADH], [RATE], [COMMENT]) VALUES (N'KH_03 ', N'DH_004', 4, N'tốt')
INSERT [dbo].[DANH_GIA_DON_HANG] ([MAKH], [MADH], [RATE], [COMMENT]) VALUES (N'KH_03 ', N'DH_005', 5, N'10 điểm')
GO
