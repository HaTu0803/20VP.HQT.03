import AdminRoute from "../routes/admin.route.js";
import DoiTacRoute from "../routes/doitac.route.js";
import KhachhangRoute from "../routes/khachhang.route.js";
import NhanvienRoute from "../routes/nhanvien.route.js";
import TaixeRoute from "../routes/taixe.route.js";
import AccountRoute from "../routes/account.route.js";
import authWithRequiredPermission from "./auth.mdw.js";
import DoitacService from "../services/doitac.service.js";
import NhanvienService from "../services/nhanvien.service.js";
import TaixeService from "../services/taixe.service.js";
import KhachhangService from "../services/khachhang.service.js";
import AdminService from "../services/admin.service.js";

export default function (app) {
  app.get('/', function (req, res) {
    res.render('home', {
      layout: 'mainHome'
    })
  })

  // app.use('/account', AccountRoute)
  // app.use('/admin',authWithRequiredPermission(4), AdminRoute)
  // app.use('/doitac', authWithRequiredPermission(2), DoiTacRoute)
  // app.use('/khachhang', authWithRequiredPermission(0), KhachhangRoute)
  // app.use('/nhanvien', authWithRequiredPermission(1), NhanvienRoute)
  // app.use('/taixe', authWithRequiredPermission(3), TaixeRoute)

  app.use('/account', AccountRoute)
  app.use('/admin', AdminRoute)
  app.use('/doitac',  DoiTacRoute)
  app.use('/khachhang',  KhachhangRoute)
  app.use('/nhanvien',  NhanvienRoute)
  app.use('/taixe',  TaixeRoute)


// assuming you have an API endpoint that receives the MADT value
// and returns the corresponding MATDDA data in JSON format
  // ĐỐI TÁC---------------------------------------------------------
  app.get('/api/madt', async function (req, res) {
    const {macn} = req.query;
    const list = await DoitacService.findAllMaDoiTac(macn);
    res.send(list);
  });
  app.get('/api/matdda', async function (req, res) {
    const {madt} = req.query;
    const list = await DoitacService.findAllMaThucDon(madt);
    res.send(list);
  });
  app.get('/api/macn', async function (req, res) {
    const {madt} = req.query;
    const list = await DoitacService.findAllMaChiNhanh(madt);
    res.send(list);
  });
  app.get('/api/mama', async function (req, res) {
    const {matdda} = req.query;
    const list1 = await DoitacService.findAllMonAn_doitac(matdda);
    res.send(list1);
  });

  app.get('/api/monan', async function (req, res) {
    const {mama, matd} = req.query;
    const list2 = await DoitacService.findAllMonAn(mama, matd);
    res.send(list2);
  });
  app.get('/api/themmonan', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;

    const tenma = req.query.tenma;

    const gia = req.query.gia;
    const mieuta = req.query.mieuta
    const list = []
    await DoitacService.themMonAn(matd,mama,tenma,mieuta,gia);
    res.send(list);
  });
  app.get('/api/capnhatmonan', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;

    const tenma = req.query.tenma;

    const gia = req.query.gia;

    const list = []
    await DoitacService.CapNhatMonAn(tenma,mama,matd,gia);
    // console.log(list)
    res.send(list);
  });
  app.get('/api/capnhatgia', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;



    const gia = req.query.gia;

    const list = []
    await DoitacService.CapNhatGia(mama,matd,gia);
    // console.log(list)
    res.send(list);
  });
  app.get('/api/huycapnhatgia', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;



    const gia = req.query.gia;

    const list = []
    await DoitacService.HuyCapNhatGia(mama,matd,gia);
    // console.log(list)
    res.send(list);
  });
  app.get('/api/huycapnhatten', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;



    const tenma = req.query.tenma;

    const list = []
    await DoitacService.HuyCapNhatTen(mama,matd,tenma);
    // console.log(list)
    res.send(list);
  });
  app.get('/api/tranhchap6', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;



    const gia = req.query.gia;

    const list = []
    await DoitacService.get_TranhChap6(mama,matd,gia);
    // console.log(list)
    res.send(list);
  });
  app.get('/api/hienthimonantheogia', async function (req, res) {

    await KhachhangService.GiaMonAn();
    // console.log(list)
    const list = []
    res.send(list);
  });
  app.get('/api/hienthimonantheoten', async function (req, res) {

    await KhachhangService.TenMonAn();
    // console.log(list)
    const list = []
    res.send(list);
  });
  app.get('/api/set_tranhchap6', async function (req, res) {

    await KhachhangService.setTranhChap6();
    // console.log(list)
    const list = []
    res.send(list);
  });
  app.get('/api/hienthimonan_tranhchap4', async function (req, res) {

    await KhachhangService.getTranhChap4();
    // console.log(list)
    const list = []
    res.send(list);
  });

  app.get('/api/hienthimonan', async function (req, res) {

    await KhachhangService.getTranhChap9();
    // console.log(list)
    const list = []
    res.send(list);
  });

  app.get('/api/themdondk', async function (req, res) {
    const nguoidd = req.query.nguoidd;
    const email = req.query.email;
    const sdt = req.query.sdt;

    const tennh = req.query.tennh;
    const diachinh = req.query.diachinh;

    const stk = req.query.stk;
    const tenquan = req.query.tenquan;

    const thanhpho = req.query.thanhpho;
    const quan = req.query.quan;

    const diachi = req.query.diachi;
    const loaiamthuc = req.query.loaiamthuc;
    const sldonhangmn = req.query.sldonhangmn;

    const list = []
    await DoitacService.themDonDangKy(nguoidd,email,sdt,tennh,diachinh,stk,
        tenquan,thanhpho,quan,diachi,loaiamthuc,sldonhangmn);
    res.send(list);
    // res.status(200).send({ message: 'Don dang ky da duoc them thanh cong.' });

  });
  app.get('/api/tranhchap11', async function (req, res) {
    const nguoidd = req.query.nguoidd;
    const email = req.query.email;
    const sdt = req.query.sdt;

    const tennh = req.query.tennh;
    const diachinh = req.query.diachinh;

    const stk = req.query.stk;
    const tenquan = req.query.tenquan;

    const thanhpho = req.query.thanhpho;
    const quan = req.query.quan;

    const diachi = req.query.diachi;
    const loaiamthuc = req.query.loaiamthuc;
    const sldonhangmn = req.query.sldonhangmn;

    const list = []
    await DoitacService.getTranhChap11(nguoidd,email,sdt,tennh,diachinh,stk,
        tenquan,thanhpho,quan,diachi,loaiamthuc,sldonhangmn);
    res.send(list);
    // res.status(200).send({ message: 'Don dang ky da duoc them thanh cong.' });

  });
  // NHÂN VIÊN ---------------------------------------------------------

  app.get('/api/ddky', async function (req, res) {
    const {maddk} = req.query;
    const list = await NhanvienService.findAllHopDongChuaKyTheoMa(maddk);
    res.send(list);
  });
  app.get('/api/allddky', async function (req, res) {
    const {maddk} = req.query;
    const list = await NhanvienService.findAllHopDongChuaKy();
    res.send(list);
  });

  app.get('/api/nv', async function (req, res) {
    const {manv} = req.query;
    const list = await NhanvienService.findAllNhanVienTheoMa(manv);
    res.send(list);
  });
  app.get('/api/allnv', async function (req, res) {
    const {manv} = req.query;
    const list = await NhanvienService.findAllNhanVien();
    res.send(list);
  });

  app.get('/api/nhanvienduyetdondk', async function (req, res) {


    const maddk = req.query.maddk;
    const manv = req.query.manv;
    console.log(maddk)
    const list = await NhanvienService.NhanVienNhanDonDK(maddk,manv);
    res.send(list);

  });
  // TÀI XẾ---------------------------------------------------------

  app.get('/api/dh', async function (req, res) {
    const {madh} = req.query;
    const list = await TaixeService.findAllDonHangTheoMa(madh);
    res.send(list);
  });
  // app.get('/api/alldh', async function (req, res) {
  //   const {madh} = req.query;
  //   const list = await TaixeService.findAllDonHang();
  //   res.send(list);
  // });
  app.get('/api/alldh', async function (req, res) {
    const {madh} = req.query;
    const list = await TaixeService.findAllDonHang();
    res.send(list);
  });
  app.get('/api/txnhandon', async function (req, res) {
    // const matx = req.query.matx;

    const madh = req.query.madh;
    const tinhtrang = req.query.tinhtrang
    const matx = req.query.matx;
console.log(matx)
    const list = await TaixeService.Taxixenhandon(matx,madh);
    res.send(list);

  });
  // KHÁCH HÀNG ---------------------------------------------------------

  app.get('/api/tinhtrang', async function (req, res) {
    const madh = req.query.madh;
    const tinhtrang = await KhachhangService.findAllDonHang(madh);
    res.json({ TINHTRANG: tinhtrang });
  });
  app.get('/api/allmonan', async function (req, res) {
    // const {madh} = req.query;
    const list = await KhachhangService.findAllDanhSach();
    res.send(list);
  });
  app.get('/api/allmama', async function (req, res) {
    const list1 = await KhachhangService.findAllMonAn();
    res.send(list1);
  });

  app.get('/api/mamamacnmatd', async function (req, res) {
     const {macn,matdda} = req.query;
    const list = await KhachhangService.findAllMonAnTheoCNTD(macn,matdda);
    res.send(list);
  });
  app.get('/api/monanmamamatdmacn', async function (req, res) {
    const {mama,macn,matd} = req.query;
    const list = await KhachhangService.findAllMonAnTheoCNTDMA(macn,matd,mama);
    res.send(list);
  });
  app.get('/api/monanmamamacn', async function (req, res) {
    const {mama,macn} = req.query;
    const list = await KhachhangService.findAllMonAnTheoCNMA(macn,mama);
    res.send(list);
  });
  app.get('/api/monantenma', async function (req, res) {
    const {tenma} = req.query;
    const list = await KhachhangService.findAllMonAnTheoTMA(tenma);
    res.send(list);
  });
  app.get('/api/mamamacn', async function (req, res) {
    const {macn} = req.query;
    const list = await KhachhangService.findAllMonAnTheoCN(macn);
    res.send(list);
  });
  app.get('/api/mamamatd', async function (req, res) {
    const {matdda} = req.query;
    const list = await KhachhangService.findAllMonAnTheoTD(matdda);
    res.send(list);
  });


  app.get('/api/themmonhang', async function (req, res) {
    const macn = req.query.macn;
    const makh = res.locals.authUser.username

    const matdda = req.query.matdda;
    const mama = req.query.mama;
    const tenma = req.query.tenma;
    // const matcda = req.query.matcda;

    const sl = req.query.sl;
    const gia = req.query.gia;
    // const mieuta = req.query.mieuta
    const list = []
    await KhachhangService.Themmondonhang(macn,makh,matdda,mama,tenma,sl,gia);
    console.log(list)
    res.send(list);
  });
  app.get('/api/khachhangdathang', async function (req, res) {
    const madh = req.query.madh;

    const hinhthucthanhtoan = req.query.hinhthucthanhtoan;
    const ghichu = req.query.ghichu;
    const thanhpho = req.query.thanhpho;
    const quan = req.query.quan;

    const diachi = req.query.diachi;

    const list = []
    await KhachhangService.Khachhangdathang(madh,hinhthucthanhtoan,ghichu,thanhpho,quan,diachi) ;
    console.log(list)
    res.send(list);
  });

  // ADMIN ---------------------------------------------------------

  app.get('/api/themnhanvien', async function (req, res) {
    const manv = req.query.manv;

    const tennv = req.query.tennv;
    console.log(manv)
    const list = []
    await AdminService.themNhanVien(manv,tennv);
    res.send(list);
  });
  app.get('/api/suanhanvien', async function (req, res) {
    const manv = req.query.manv;

    const tennv = req.query.tennv;
    console.log(manv)
    const list = []
    await AdminService.suaNhanVien(manv,tennv);
    res.send(list);
  });
  app.get('/api/huycapnhatnv', async function (req, res) {
    const manv = req.query.manv;

    const tennv = req.query.tennv;
    console.log(manv)
    await AdminService.huyCapNhatNV(manv,tennv);
    // console.log(list)
    const list = []
    res.send(list);
  });
  app.get('/api/tranhchap9', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;

    const tenma = req.query.tenma;

    const gia = req.query.gia;
    const mieuta = req.query.mieuta
    const list = []
    await DoitacService.tranhchap9(matd,mama,tenma,mieuta,gia);
    res.send(list);
  });
  app.get('/api/tranhchap4', async function (req, res) {
    const matd = req.query.matd;

    const mama = req.query.mama;

    const tenma = req.query.tenma;

    const gia = req.query.gia;
    const mieuta = req.query.mieuta
    const list = []
    await DoitacService.tranhchap4(matd,mama,tenma,mieuta,gia);
    res.send(list);
  });
}