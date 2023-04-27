import db from "../utils/db.js";

export default {

    async findAllDonHangTheoMa(madh) {
        const sql = `select *
                     from DONHANG
                     where MATX is NULL
                       and MADH = '${madh}'`
        try {
            const list = await db.raw(sql)
            console.log(list);
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async findAllDonHang() {
        const sql = `exec EX_21_READ_DONHANG_LOST_UPDATE_FIX`
        try {
            const list = await db.raw(sql)
            console.log(list);
            return list
        } catch (error) {
            console.log(error);
        }
    },
    async Taxixenhandon(matx,madh) {

        const storedProcedureName = matx === 'TX_01' ? 'EX_21_UPDATE_DONHANG_TXA_LOST_UPDATE' : 'EX_21_UPDATE_DONHANG_TXB_LOST_UPDATE_FIX';

        const sql = `exec ${storedProcedureName} '${madh}','${matx}',N'Tài xế đang lấy hàng'`
        try {
            const list = await db.raw(sql)
            console.log(sql);
            return list
        } catch (error) {
            console.log(error);
        }
    },
}
