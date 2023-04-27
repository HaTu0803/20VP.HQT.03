import express from "express";
import AdminService from "../services/admin.service.js";

const router = express.Router();

router.get('/signin', function (req, res) {
    res.render('vwAdmin/signin', {
        layout: 'Admin/main'
    })
})

router.post('/signin', function (req, res) {
    const username = req.body.username
    const password = req.body.password
    // Check dang nhap


    res.redirect("/admin/home")
})
router.get('/signup', function (req, res) {
    res.render('vwAdmin/signup', {
        layout: 'Admin/main'
    })
})
router.post('/signup', function (req, res) {
    const username = req.body.username
    const password = req.body.password
    const firstname = req.body.firstname
    const lastname = req.body.lastname

    // Check dang ky

    res.render('vwAdmin/signup', {
        layout: 'Admin/main'
    })
})
router.get('/home', function (req, res) {
    res.render('vwAdmin/home', {
        layout: 'Admin/main1'
    })
})

router.get('/dsNhanVien', async function (req, res) {
    const list = await AdminService.findAllNhanVien()
    res.render('vwAdmin/dsNhanVien', {
        list: list,
        // empty: list.length === 0,
        layout: 'Admin/main1'
    })
})
router.get('/dsAdmin', function (req, res) {
    res.render('vwAdmin/dsAdmin', {
        layout: 'Admin/main1'
    })
})

export default router