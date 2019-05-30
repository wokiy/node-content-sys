let express = require("express");
let User = require("../schemas/User");
let router = express.Router();
let markdown = require('markdown-js');
let  moment = require("moment");
let Content = require("../schemas/Content");
let Category = require("../schemas/Category");
const  fs = require("fs");
const pathLib=require('path');
let newName2='';
router.use(function (req , res , next) {
    res.locals.msg = {};
    next();
});
function checklogin(req,res,next) {
//    判断是否登陆
    if(!req.session.loginUser){
        //    用户没有登陆，跳转登陆页面
        res.render("node-admin-sys-login",{msg:{err:"请登录后再访问该页面！！！"}});
    }else{
        next();
    }
}
//========================================about.ejs页面跳转 ==================================================================================
router.get("/about",function (req,res) {
   res.render('about');
});

//个人中心页面
router.get('/topCenter',function (req,res) {
    //查询所有帖子
    Content.find({}).populate(['category','user']).then(function (contents) {
        res.render('node-content-sys-pCenter', {
            //遍历所有的contents双层遍历
            contents: contents
        });
    });
});
//上传用户新头像
router.post('/ChangeImages',function (req,res) {
    //上传图片解析问题
    console.log(req.files);
    //新文件名字
    let newName  = req.files[0].path + pathLib.parse(req.files[0].originalname).ext;
    newName2 = newName.substring(6);
    //{"imgName":newName2} 定义个空数组
    console.log(req.files);
    //获取用户ID
    let userID = req.session.loginUser._id;
    fs.rename(req.files[0].path,newName,function(err){
        if(err){
            res.err = "上传失败！！";
        }else {
            //更新user文档中的imgage字段
            User.update({_id:userID},{$set:{images:newName2}},function () {
                //ID重新查找user 将user新添加到session
                User.findOne({_id:userID},function (err,user) {
                    //删除旧的loginUser
                    delete req.session.loginUser;
                    //新的user存到session里面
                    req.session.loginUser = user;
                    //重定向到添加页面
                    res.redirect("/topCenter");
                });


            });
        }
    });
});


//—————————————————————查询博文展示和分页实现—————————————————————————————————————————

//首页博文展示的问题   分页显示

router.get("/",function (req,res) {
    res.redirect("/index");
});
router.get("/index",function (req,res,next) {
    //分类排序
    Category.find({}).sort({_id:1}).then(function (categorys) {
        res.categorys = categorys;
        next();
    });
});
router.get("/index",function (req,res) {
    //分页展示前台的内容
    //每页显示的条数
    let limit = 6;
    //页数
    let page = Number(req.query.page||1);
    //过滤数目
    let skip = (page-1)*limit;
    //总页数初始化
    let pages = 0;
    Content.count().then(function (count) {
        //页数
        pages = Math.ceil(count/limit);
        //最大page
        res.page = Math.min(page,pages-1);
        //设置最小
        res.page = Math.max(page,1);
        if(page<1 ){
            page=1;
        }else if(page>pages){
            page=page-1;
        }
        res.page=page;
        Content.find({}).limit(limit).skip(skip).sort({_id:-1}).populate(['category','user']).then(function (contents) {
            let arr =[];
            for(let i=0;i<contents.length;i++){
                let nowT = contents[i].addTime;
                let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
                arr.push(now);
            }
            res.render("index",{
                contents:contents,
                categorys:res.categorys,
                count:count,
                pages:pages,
                page:res.page,
                arr:arr
            });
        });
    });
});
//—————————————————————————————————————————————————————————————————————————
//点击博文的详细信息，显示所有文章的分类
router.get("/views",function (req,res,next) {
    /*分类排序*/
    Category.find({}).sort({_id:1}).then(function (categorys) {
        res.categorys = categorys;
        next();
    });
});
//加载views时候查询评论数点击查询views时候views字段加一

//详细文章查询 + markdown格式转义
router.get("/views",function (req,res) {
    //获取文章的id查询
    let id = req.query.id;
    Content.findOne({_id:id}).populate(['category','user']).then(function (content) {
        let nowT = content.addTime;
        let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
        //阅读数views ; 每次点开始阅读数目 ; 自动添加一
        content.views++;
        //添加后保存 阅读数的添加
        content.save();
        //获取markdown内容
        let text = content.content;
        let html = markdown.makeHtml(text);
        let arr =[];
        for(let i=0;i<content.comments.length;i++){
            let nowT = content.comments[i].postTime;
            let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
            arr.push(now);
        }
        res.render("views",{
            categorys:res.categorys,
            content:content,
            now:now,
            arr:arr,
            contentHtml:html
        });
    });
});
//———————————————————————---添加评论实现——————————————————————————————————————————
/*评论模块*/
//评论原理   根据文章的ID 去添加 去update content 文章的表内容
router.post("/addComments",checklogin,function (req,res) {
    //获取文章的id
    let id = req.body.id;
    let username = req.session.loginUser.username;
    let comments = req.body.comments.trim();
    //随机id函数
    function GenNonDuplicateID(randomLength){
        return Number(Math.random().toString().substr(3,randomLength) + Date.now()).toString(36)
    }
    //GenNonDuplicateID()将生成 rfmipbs8ag0kgkcogc 类似的ID
    // GenNonDuplicateID()
    //获取当前用户的头像地址的引用
    var picaddresss =  req.session.loginUser.images;
    let postData ={
        user :req.session.loginUser.username,
        postTime:new Date(),
        comments:req.body.comments.trim(),
        live:true,
        id:GenNonDuplicateID(3),
        images:picaddresss
    };
    //判断评论是否空值
    //更具id 跟新文章的 评论数目 db.blog.update({"title":"A"},{$push:{"comments":{"testAdd":"T"}}});
    Content.update({_id:id},{$push:{comments:postData}},function (err) {
        if(!err) {
            res.redirect("/views?id=" + id + "");
        }
    });
});
//------------------------------------------分类查询实现 和分页实现-------------------------------------------------------------------------
//分类
router.get("/contents",function (req,res,next) {
    /*分类排序*/
    Category.find({}).sort({_id:1}).then(function (categorys) {
        res.categorys = categorys;
        next();
    });
});
//点击分类查询该分类的所有文章
router.get("/contents",function (req,res) {
    //获取该文章分类的id
    let id = req.query.id;
    //分页实现
    //每页显示的条数
    let limit = 4;
    //页数
    let page = Number(req.query.page || 1);
    res.page=page;
    //过滤数目
    let skip = (page - 1) * limit;
    //总页数初始化
    let pages = 0;
    Content.find({category: id}).then(function (blogs) {
        let count = blogs.length;
        //页数
        pages = Math.ceil(count / limit);
        //最大page
        page = Math.min(page, pages-1);
        //设置最小
        page = Math.max(page,1);
        Content.find({category: id}).limit(limit).skip(skip).sort({_id: -1}).populate(['category', 'user']).then(function (contents) {
            let arr = [];
            for (let i = 0; i < contents.length; i++) {
                let nowT = contents[i].addTime;
                let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
                arr.push(now);
            }
            //判断分类点击查询有没有文章列表
            if (contents.length>0){
                res.render("pageIndex", {
                    contents: contents,
                    categorys: res.categorys,
                    count: count,
                    pages: pages,
                    page: res.page,
                    arr: arr
                })
            }else{
                res.render("nothing")
            }
        })
    })
});
//------------------------------------------------------------------------------------------------------------------------------------------
router.get("/register",function (req,res) {
    res.render("node-admin-sys-register");
});
//------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------跳转登陆页面---------------------------------------------------------------------------------
router.get("/login",function (req,res) {
    res.render("node-admin-sys-login");
});
//------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------退出登录----------------------------------------------------------------------------------
router.get("/logout",function (req,res) {
        req.session.destroy();
        res.redirect("/");
});
//------------------------------------------------------------------------------------------------------------------------------------------
module.exports = router;
