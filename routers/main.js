let express = require("express");
let User = require("../schemas/User");
let router = express.Router();
let markdown = require('markdown-js');
let  moment = require("moment");
let Content = require("../schemas/Content");
let Category = require("../schemas/Category");


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
//============================================================================================================================================
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
//评论原理   根据文章的ID 去添加 去update content 文章的表内容 添加
router.post("/addComments",checklogin,function (req,res) {
    //获取文章的id
    let id = req.body.id;
    let username = req.session.loginUser.username;
    let comments = req.body.comments.trim();
    let postData ={
        user :req.session.loginUser.username,
        postTime:new Date(),
        comments:req.body.comments.trim()
    }
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
