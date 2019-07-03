var express = require("express");
var app = express();
require("./tools/db");
var bodyParser = require("body-parser");
var ueditor = require("ueditor");
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
//跨域设置
/*加载模板文件*/
app.set("view engine","ejs");
app.set("views","views");
app.set("admin","admin");

/*加载静态文件*/
app.use(express.static("public"));
/*中间件必须在路由之前 不然加载不到中间件*/
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());

// /ueditor 入口地址配置 https://github.com/netpi/ueditor/blob/master/example/public/ueditor/ueditor.config.js
// 官方例子是这样的 serverUrl: URL + "php/controller.php"
// 我们要把它改成 serverUrl: URL + 'ue'
app.use("/ueditor/ue", ueditor(path.join(__dirname, 'public'), function(req, res, next) {

    // ueditor 客户发起上传图片请求
    if(req.query.action === 'uploadimage'){
  
      // 这里你可以获得上传图片的信息
      var foo = req.ueditor;
      console.log(foo.filename); // exp.png
      console.log(foo.encoding); // 7bit
      console.log(foo.mimetype); // image/png
  
      // 下面填写你要把图片保存到的路径 （ 以 path.join(__dirname, 'public') 作为根路径）
      var img_url = '/images/ueditor/';
      res.ue_up(img_url); //你只要输入要保存的地址 。保存操作交给ueditor来做
    }
    //  客户端发起图片列表请求
    else if (req.query.action === 'listimage'){
      var dir_url = '/images/ueditor/'; // 要展示给客户端的文件夹路径
      res.ue_list(dir_url) // 客户端会列出 dir_url 目录下的所有图片
    }
    // 客户端发起其它请求
    else {
      res.setHeader('Content-Type', 'application/json');
      // 这里填写 ueditor.config.json 这个文件的路径
      // res.redirect('/ueditor/ueditor.config.json')
      res.redirect('/ueditor/nodejs/config.json');
  }}));
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

// 跨域设置
app.all("*", function(req, res, next) {
  res.header("Access-Control-Allow-Credentials", true);
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
  res.header("Content-Type", "application/json;charset=utf-8");
  next();
});
/*body-parser 中间件*/
app.listen(3000,function (err) {
    if(!err){
        console.log("服务器成功启动！！！！！");
    }
});