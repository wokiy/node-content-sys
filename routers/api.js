var express = require("express");
var User = require("../schemas/User");
var sms_util = require('./sms_util');
var router = express.Router();
var sha1 = require("sha1");
/*统一返回数据格式 */
//向res.locals中添加一个msg对象
router.use(function (req , res , next) {
    res.locals.msg = {};
    next();
});
var users = {};
router.post("/register",function (req,res) {
    var username = req.body.username.trim();
    var password = req.body.password.trim();
    var repassword = req.body.repassword.trim();
    //创建对象保存错误信息
    var msg = {
        username: username,
        err: "",
        succeed: ""
    };
    //插入数据库
    User.create({
        username:username,
        password: sha1(password),
    }, function (err) {
        if (err) {
            msg.err = "用户名已经存在";
            res.render("node-admin-sys-register",{msg:msg});
        } else {
            msg.succeed = "注册成功";
            res.render("node-admin-sys-login",{msg:msg});
        }
    });
});
//发送手机验证码
router.get('/sendcode', function (req, res, next) {
    //1. 获取请求参数数据
    var phone = req.query.phone;
    //2. 处理数据
    //生成验证码(6位随机数)
    var code = sms_util.randomCode(6);
    //发送给指定的手机号
    console.log(`向${phone}发送验证码短信: ${code}`);
    sms_util.sendCode(phone, code, function (success) {//success表示是否成功
        if(success) {
            //存储数据
            users[phone] = code;
            console.log('保存验证码: ', phone, code)
        }
    });
    //3. 返回响应数据
    res.send({"code": 0})
});
/*登陆方法实现*/
router.post("/login",function (req,res) {
    let username = req.body.username.trim();
    let password = req.body.password.trim();
    //数据查询用户 和密码正确
    User.findOne({username:username},function (err,user) {
        if(!err && user && user.password ==sha1(password)&&user.isBigadmin==true){
                req.session.loginUser = user;
                //删除session当中的登陆提示信息
                delete req.session.loginError;
                res.render("node-admin-sys-index");
                // res.redirect("/admin/admin?page=1");
        }else if(!err && user && user.password ==sha1(password)){
                req.session.loginUser = user;
                //删除session当中的登陆提示信息
                delete req.session.loginError;
                res.redirect("/index");
        }else {
            //删除session当中的登陆提示信息
            delete req.session.loginError;
            res.render("node-admin-sys-login", {msg: {err: "用户名或密码错误！！！！"}, username: username});
        }
    });
});
//node-admin-sys index  iframe 路由加载内容


//加载后台首页显示的页面
router.get('/index_v3',checklogin,function (req,res,next) { 
    Content.count().then(function (count1) {
        res.count1 = count1
        next();
    })
 })
 router.get('/index_v3',checklogin,function (req,res,next) { 
    User.count().then(function (count2) {
        res.count2 = count2
        next();
    })
})

router.get("/index_v3",checklogin,function (req,res) {
    // 查询评论表最新消息
    let limit = 10;
    Comment.find().limit(limit).populate(['userID','contentID']).then(function (comments) { 
        let arr =[];
        for(let i=0;i<comments.length;i++){
            let nowT = comments[i].addTime;
            let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
            arr.push(now);
        }
         res.render("node-admin-sys-index_v3",
         {
            comments:comments,
            count1:res.count1,
            count2:res.count2,
            arr:arr
         }
         );
     })
});

// router.get("/index_v3",function (req,res) {
//    //iframe 路由添加内容
//    res.render("node-admin-sys-index_v3");
// });
/*判断用户是否登陆*/
function checklogin(req,res,next) {
//    判断是否登陆
        if(!req.session.loginUser){
        //    用户没有登陆，跳转登陆页面
            res.render("node-admin-sys-login",{msg:{err:"请登录后再访问该页面！！！"}});
        }else{
            next();
        }
}
module.exports = router;
