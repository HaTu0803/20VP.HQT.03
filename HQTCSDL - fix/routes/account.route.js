import express from "express";

const router = express.Router();

router.get('/signin', async function(req, res){
    req.session.retUrl = req.headers.referer
    res.render('vwAccount/signin', {
        layout: 'main'
    })
});

router.post('/signin', async (req,res)=>{
    const username = req.body.username
    const password = req.body.password
    let permission = -1

    if (username == "KH_01" && password == "123456") {
        permission = 0
    }
    if (username == "KH_02" && password == "123456") {
        permission = 0
    }
    if (username == "NV_01" && password == "123456") {
        permission = 1
    }
    if (username == "DT_01" && password == "123456") {
        permission = 2
    }
    if (username == "TX_01" && password == "123456") {
        permission = 3

    }
    if (username == "TX_02" && password == "123456") {
        permission = 3

    }
    if (username == "NV_02" && password == "123456") {
        permission = 1
    }
    if (username == "AD_01" && password == "123456") {
        permission = 4
    }



    if (permission != -1) {
        const user = {
            username: username,
            password: password,
            permission: permission,
        }
        req.session.auth = true;
        req.session.authUser = user;
    }



    if (username == "KH_01" && password == "123456") {
        res.redirect("/khachhang/home");
    }
    else if (username == "KH_02" && password == "123456") {
        res.redirect("/khachhang/home");
    }
    else if (username == "NV_01" && password == "123456") {
        res.redirect("/nhanvien/home");
    }
    else if (username == "NV_02" && password == "123456") {
        res.redirect("/nhanvien/home");
    }
    else if (username == "DT_01" && password == "123456") {
        res.redirect("/doitac/home");
    }
    else if (username == "TX_01" && password == "123456") {
        res.redirect("/taixe/home");
    }
    else if (username == "TX_02" && password == "123456") {
        res.redirect("/taixe/home");
    }
    else if (username == "AD_01" && password == "123456") {
        res.redirect("/admin/home");
    }
    else {
        res.redirect("/account/signin");
    }
});

router.get('/logout', function (req, res) {
    req.session.auth = false;
    req.session.authUser = null;

    res.redirect("/account/signin");
});

export default router