var express = require("express");
var app = express();
require("./tools/db");
var bodyParser = require("body-parser");
let session = require("express-session");
let MongoStore = require("connect-mongo")(session);
let mongoose = require("mongoose");
let multer = require("multer");
var path = require('path');
const fs=require('fs');
//req.file文件  接受上传的文件

//登陆拦截

//设置中间件
app.use(session({
    resave:false,
    saveUninitialized:false,
    secret:"blog2",
    cookie:{
        maxAge: 1000*60*60 // default session expiration is set to 1 hour
    },
    store: new MongoStore({ mongooseConnection: mongoose.connection })
}));

/*加载模板文件*/
app.set("view engine","ejs");
app.set("views","views");
app.set("admin","admin");

/*加载静态文件*/
app.use(express.static("public"));
/*中间件必须在路由之前 不然加载不到中间件*/
app.use(bodyParser.urlencoded({extended:false}));
app.use(multer({dest: './public/upload'}).any());
//创建一个路由处理session
app.use(function (req,res,next) {
    res.locals.session = req.session;
    next();
});
app.use(function (req,res,next) {
    res.locals.msg = {};
    next();
});
/*路由加载*/
app.use("/admin",require("./routers/admin"));
app.use("/api",require("./routers/api"));
app.use("/",require("./routers/main"));
/*body-parser 中间件*/
app.listen(8083,function (err) {
    if(!err){
        console.log("服务器成功启动！！！！！");
    }
});