import express from "express";
import AdminService from "../services/khachhang.service.js";
import KhachhangService from "../services/khachhang.service.js";
import DoitacService from "../services/doitac.service.js";

const router = express.Router();

router.get('/signin', function (req, res) {
    res.render('vwKhachHang/signin', {
        layout: 'KhachHang/main'
    })
})

router.post('/signin', function (req, res) {
    const username = req.body.username
    const password = req.body.password

    // Check dang nhap


    res.redirect("/khachhang/home")
})
router.get('/home', function (req, res) {
    res.render('vwKhachHang/home', {
        layout: 'KhachHang/main1'
    })
})
router.get('/theodoidonhang', async function (req, res) {
    const list = await KhachhangService.findAllDonHang()
    res.render('vwKhachHang/follow', {
        layout: 'KhachHang/main1',
        list: list
    })
})
router.get('/timkiem', async function (req, res) {
    const list = await KhachhangService.findAllDoitac()
    const list1 = await KhachhangService.findAllMaThucDon()
    const list2 = await KhachhangService.findAllMonAn()


    console.log(list)
    res.render('vwKhachHang/news', {
        layout: 'KhachHang/main1',
        // empty: list.length === 0,
        list : list,
        list1: list1,
        list2: list2


    })
})

router.get('/tranhchap1', async function (req, res) {
    const list = await KhachhangService.GiaMonAn()

    console.log(list)
    res.render('vwKhachHang/tranhchap1', {
        layout: 'KhachHang/main1',
        // empty: list.length === 0,
        list : list,
    })
})
router.get('/tranhchap5', async function (req, res) {
    const list = await KhachhangService.TenMonAn()

    console.log(list)
    res.render('vwKhachHang/tranhchap5', {
        layout: 'KhachHang/main1',
        // empty: list.length === 0,
        list : list,
    })
})
router.get('/tranhchap6', async function (req, res) {
    const list = await KhachhangService.setTranhChap6()

    console.log(list)
    res.render('vwKhachHang/tranhchap6', {
        layout: 'KhachHang/main1',
        // empty: list.length === 0,
        list : list,
    })
})
router.get('/tranhchap4', async function (req, res) {
    const list = await KhachhangService.getTranhChap9()

    res.render('vwKhachHang/tranhchap4', {
        layout: 'KhachHang/main1',
        // empty: list.length === 0,
        list : list,

    })
})
router.get('/tranhchap9', async function (req, res) {
    const list = await KhachhangService.getTranhChap9()

    res.render('vwKhachHang/tranhchap9', {
        layout: 'KhachHang/main1',
        // empty: list.length === 0,
        list : list,

    })
})
router.get('/danhgiadonhang', function (req, res) {
    res.render('vwKhachHang/rate', {
        layout: 'KhachHang/main1'
    })
})
router.get('/dathang', async function (req, res) {
    const list = await KhachhangService.findAllDoitac()
    const list1 = await KhachhangService.findAllMaThucDon()
    const list2 = await KhachhangService.findAllMonAn()
    res.render('vwKhachHang/order', {
        layout: 'KhachHang/main1',
        list: list,
        list1: list1,
        list2: list2
    })
})

export default router