import db from '../utils/db.js';

export default {
    async findAllDoitac() {
        const sql = `select * from DOITAC`
        try {
            const list = await db.raw(sql)
            return list
        } catch (error) {
            console.log(error);
        }
    },

    async GiaMonAn() {
        const sql = `exec EX_1_READ_INFO_UNCOMMITTED_READ`
        try {
            const list = await db.raw(sql)
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async TenMonAn() {
        // Lúc sửa lõi thì đổi cái này thôi
        const sql = `exec EX_5_READ_MENU_UNREPEATABLE_READ`
        try {
            const list = await db.raw(sql)
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async getTranhChap9() {
        const sql = `exec EX_9_READ_MONAN_PHANTOM`
        try {
            const list = await db.raw(sql);
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async getTranhChap4() {
        const sql = `exec EX_4_READ_MONAN_UNCOMMITTED_READ`
        try {
            const list = await db.raw(sql);
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async setTranhChap6() {
        const sql = `exec EX_6_READ_MONAN_UNREPEATABLE_READ`
        try {
            const list = await db.raw(sql);
            return list
        } catch (error) {
            console.log(error);
        }
    },

    async findAllMonAn_doitac(matdda) {
        const sql = `select * from MONAN where MATD_DA = '${matdda}'`
        try {
            const list1 = await db.raw(sql)
            return list1
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMaDoiTac(macn) {
        const sql = `select * from DOITAC where MACN = '${macn}'`
        try {
            const list = await db.raw(sql)
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMaThucDon(madt) {
        const sql = `select * from THUCDON_DA where MADT = '${madt}'`
        try {
            const list = await db.raw(sql)
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMonAn() {
        const sql = `select TT_MA_CN.MACN,TT_MA_CN.MATD_DA,TT_MA_CN.MAMA,SOLUONG,TENMA,MIEUTA,GIA from MONAN JOIN TT_MA_CN 
                    ON MONAN.MATD_DA = TT_MA_CN.MATD_DA AND MONAN.MAMA = TT_MA_CN.MAMA`
        try {
            const list1 = await db.raw(sql)
            return list1
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMonAnTheoCNTD(macn,matd) {
        const sql = `select TT_MA_CN.MACN,TT_MA_CN.MATD_DA,TT_MA_CN.MAMA,SOLUONG,TENMA,MIEUTA,GIA from MONAN JOIN TT_MA_CN 
                    ON MONAN.MATD_DA = TT_MA_CN.MATD_DA AND MONAN.MAMA = TT_MA_CN.MAMA WHERE TT_MA_CN.MACN='${macn}' and TT_MA_CN.MATD_DA='${matd}'`
        try {
            const list1 = await db.raw(sql)
            return list1
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMonAnTheoCNTDMA(macn,matd,mama) {
        const sql = `select TT_MA_CN.MACN,TT_MA_CN.MATD_DA,TT_MA_CN.MAMA,SOLUONG,TENMA,MIEUTA,GIA from MONAN JOIN TT_MA_CN 
                    ON MONAN.MATD_DA = TT_MA_CN.MATD_DA AND MONAN.MAMA = TT_MA_CN.MAMA WHERE TT_MA_CN.MACN='${macn}' and TT_MA_CN.MATD_DA='${matd}' and TT_MA_CN.MAMA='${mama}'`
        try {
            const list1 = await db.raw(sql)
            return list1
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMonAnTheoCNMA(macn,mama) {
        const sql = `select TT_MA_CN.MACN,TT_MA_CN.MATD_DA,TT_MA_CN.MAMA,SOLUONG,TENMA,MIEUTA,GIA from MONAN JOIN TT_MA_CN 
                    ON MONAN.MATD_DA = TT_MA_CN.MATD_DA AND MONAN.MAMA = TT_MA_CN.MAMA WHERE TT_MA_CN.MACN='${macn}' and TT_MA_CN.MAMA='${mama}'`
        try {
            const list1 = await db.raw(sql)
            return list1
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMonAnTheoTMA(tenma) {
        const sql = `select TT_MA_CN.MACN,TT_MA_CN.MATD_DA,TT_MA_CN.MAMA,SOLUONG,TENMA,MIEUTA,GIA from MONAN JOIN TT_MA_CN 
                    ON MONAN.MATD_DA = TT_MA_CN.MATD_DA AND MONAN.MAMA = TT_MA_CN.MAMA WHERE MONAN.TENMA='${tenma}'`
        console.log(sql)
        try {
            const list1 = await db.raw(sql)
            console.log(list1)
            return list1
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMonAnTheoCN(macn) {
        const sql = `select TT_MA_CN.MACN,TT_MA_CN.MATD_DA,TT_MA_CN.MAMA,SOLUONG,TENMA,MIEUTA,GIA from MONAN JOIN TT_MA_CN 
                    ON MONAN.MATD_DA = TT_MA_CN.MATD_DA AND MONAN.MAMA = TT_MA_CN.MAMA WHERE TT_MA_CN.MACN='${macn}'`
        try {
            const list1 = await db.raw(sql)
            return list1
        } catch (error) {
            console.log(error);
        }
    },
    async findAllMonAnTheoTD(matd) {
        const sql = `select TT_MA_CN.MACN,TT_MA_CN.MATD_DA,TT_MA_CN.MAMA,SOLUONG,TENMA,MIEUTA,GIA from MONAN JOIN TT_MA_CN 
                    ON MONAN.MATD_DA = TT_MA_CN.MATD_DA AND MONAN.MAMA = TT_MA_CN.MAMA WHERE TT_MA_CN.MATD_DA='${matd}'`
        try {
            const list1 = await db.raw(sql)
            return list1
        } catch (error) {
            console.log(error);
        }
    },

    // async findAllMonAn(mama,matd) {
    //     const sql = `select * from MONAN where MAMA = '${mama}' and MATD_DA='${matd}'`
    //     try {
    //         const list1 = await db.raw(sql)
    //         return list1
    //     } catch (error) {
    //         console.log(error);
    //     }
    // },
    async findAllDonHang(madh) {
        const sql = `select TINHTRANG from DONHANG where MADH = '${madh}'`

        try {
            const list = await db.raw(sql);
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async findAllDanhSach() {
        const sql = `select * from MONAN`

        try {
            const list = await db.raw(sql);
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async Themmondonhang(macn,makh,matdda,mama,tenma,sl,gia) {
        const sql = `exec P_THEM_CHITIET_DH_DA '${macn}','${makh}','${matdda}','${mama}',N'${tenma}',${sl},${gia}`
        console.log(sql)
        try {
            await db.raw(sql)
        } catch (error) {
            console.log(error);
        }
    },
    async Khachhangdathang(madh,hinhthucthanhtoan,ghichu,thanhpho,quan,diachi) {
        const sql = `exec KH_DATHANG '${madh}',N'${hinhthucthanhtoan}',N'${ghichu}',N'${thanhpho}',N'${quan}',N'${diachi}'`
        try {
            await db.raw(sql)
        } catch (error) {
            console.log(error);
        }
    },

}
