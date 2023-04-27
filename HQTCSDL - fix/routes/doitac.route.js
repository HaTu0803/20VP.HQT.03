import express from "express";
import DoitacService from "../services/doitac.service.js";

const router = express.Router();

router.get('/signin', function (req, res) {
    res.render('vwDoiTac/signin', {
        layout: 'DoiTac/main'
    })
})

router.post('/signin', function (req, res) {
    const username = req.body.username
    const password = req.body.password

    // Check dang nhap


    res.redirect("/doitac/home")
})

router.get('/signup', function (req, res) {
    res.render('vwDoiTac/signup', {
        layout: 'DoiTac/main'
    })
})

router.post('/signup', function (req, res) {
    const username = req.body.username
    const password = req.body.password

    // Check dang nhap


    res.redirect("/doitac/home")
})
router.get('/home', function (req, res) {
    res.render('vwDoiTac/home', {
        layout: 'DoiTac/main1'
    })
})
router.get('/dangkyhopdong', function (req, res) {
    res.render('vwDoiTac/dangkyhopdong', {
        layout: 'DoiTac/main1'
    })
})
router.get('/thongtincanhan', function (req, res) {
    res.render('vwDoiTac/thongtincanhan', {
        layout: 'DoiTac/main1'
    })
})
router.get('/chinhanh', function (req, res) {
    res.render('vwDoiTac/chinhanh', {
        layout: 'DoiTac/main1'
    })
})

router.get('/tranhchap1', async function (req, res) {
    const list = await DoitacService.findAllDoitac()
    const list1 = await DoitacService.findAllMaThucDon()
    const list2 = await DoitacService.findAllMonAn()

    res.render('vwDoiTac/tranhchap1', {
        layout: 'DoiTac/main1',
        // empty: list.length === 0,
        list : list,
        list1: list1,
        list2: list2,


    })
})
router.get('/tranhchap5', async function (req, res) {
    const list = await DoitacService.findAllDoitac()
    const list1 = await DoitacService.findAllMaThucDon()
    const list2 = await DoitacService.findAllMonAn()

    res.render('vwDoiTac/tranhchap5', {
        layout: 'DoiTac/main1',
        // empty: list.length === 0,
        list : list,
        list1: list1,
        list2: list2,


    })
})
router.get('/tranhchap4', async function (req, res) {
    const list = await DoitacService.findAllDoitac()
    const list1 = await DoitacService.findAllMaThucDon()
    const list2 = await DoitacService.findAllMonAn()

    res.render('vwDoiTac/tranhchap4', {
        layout: 'DoiTac/main1',
        // empty: list.length === 0,
        list : list,
        list1: list1,
        list2: list2,


    })
})
router.get('/tranhchap6', async function (req, res) {
    const list = await DoitacService.findAllDoitac()
    const list1 = await DoitacService.findAllMaThucDon()
    const list2 = await DoitacService.findAllMonAn()

    res.render('vwDoiTac/tranhchap6', {
        layout: 'DoiTac/main1',
        // empty: list.length === 0,
        list : list,
        list1: list1,
        list2: list2,


    })
})
router.get('/tranhchap9', async function (req, res) {
    const list = await DoitacService.findAllDoitac()
    const list1 = await DoitacService.findAllMaThucDon()
    const list2 = await DoitacService.findAllMonAn()

    res.render('vwDoiTac/tranhchap9', {
        layout: 'DoiTac/main1',
        // empty: list.length === 0,
        list : list,
        list1: list1,
        list2: list2,


    })
})
router.get('/doanhthu', function (req, res) {
    // tui thu test o day nha
    DoitacService.insertHopDong('HD_02', 'DT_02','DDK_02', 'NV_01', 'MT_02')

    res.render('vwDoiTac/doanhthu', {
        layout: 'DoiTac/main1'
    })
})
export default router