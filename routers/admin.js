let express = require("express");
let router = express.Router();
const  fs = require("fs");
let markdown = require('markdown-js');
let User = require("../schemas/User");
let Category = require("../schemas/Category");
let Content = require("../schemas/Content");
const pathLib=require('path');
let  moment = require("moment");
let newName2='';
router.get("/user",function (req,res) {
    res.send("user 模块");
});
router.use(function (req , res , next) {
    res.locals.msg = {};
    next();
});
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
/*跳转到用户管理页面*/
router.get("/user_list",checklogin,function (req,res) {
    /*分页实先*/
//每页显示条数
    let  limit = 6;
    //页数
    let page = Number(req.query.page || 1);
    //过滤条数
    let skip = (page -1 ) *limit;
    //总页数初始值
    let pages = 0;
    User.count().then(function (count) {
        //总页数
        pages = Math.ceil(count/limit);
        //最大页数
        page = Math.min(page,pages-1);
        //最小页数
        page = Math.max(page,1);
        User.find({isBigadmin:{$ne:true},live:{$ne:false}}).skip(skip).limit(limit).then(function(users){
            res.render("user",{users:users,
                count:count,
                pages :pages,
                page:page
            });
        })
    });
});
/*检查登陆*/
router.get("/logout",checklogin,function (req,res) {
    //删除session
    req.session.destroy();
    res.redirect("/login");
});
//分类管理and分类展示 和 分类分页展示
router.get("/catagory",checklogin,function (req,res){
    //每页显示的条数
    let limit = 6;
    //页数
    let page = Number(req.query.page || 1);
    //过滤数目
    let skip = (page-1)*limit;
    //总页数初始化
    let pages = 0;
    //count
    Category.count().then(function (count) {
        //页数
        pages = Math.ceil(count/limit);
        //最大page
        page = Math.min(page,pages);
        //设置最小
        page = Math.max(page,1);
        Category.find({live:true}).skip(skip).limit(limit).then(function (categorys) {
            res.render("category",{
                categorys:categorys,
                count:count,
                pages:pages,
                page:page
            });
        });
    });
});
router.get("/addCategory",checklogin,function (req,res) {
    res.render("addCategory");
});
//添加分类
router.post("/addCategory_content",function (req,res) {
    /*分类名 输入不能为空
      判断分类名是否存在
    * */
    //获取用户填写的分类名字
    let name = req.body.name.trim();
    //分类是否为空
    if(name == ''){
        res.render("addCategory",{msg:{err:'分类不能为空!!!!'}});
    }
    //查找数据库中是否有该分类
    Category.findOne({name:name},function (err,categorys) {
        if(categorys){
            //分类存在的情况
            res.render("addCategory",{msg:{err:'该分类已经存在！！！'}});
        }else{
            //分类不存在的情况
            Category.create({name:name},function (err) {
                if(!err) {
                    res.render("addCategory", {msg: {success: '分类添加成功,可继续添加新分类!!'}})
                }else {
                    console.log("插入错误！！！");
                }
            });
        }
    });
});
//删除分类实现
router.get("/delete_category",function (req,res) {
    //根据id 修改live 变为伪删除
    let id = req.query.id;
    Category.update({_id:id},{$set:{live:false}},function (err) {
        //重定向到分类页面
        if(!err) {
            res.redirect("/admin/catagory?page=1");
        }
    });
});
//编辑修改分类
router.post("/edit_Category",function (req,res) {
    let id = req.body.id;
    let name = req.body.name;

    //修改不能为空值
    if(name==""){
        res.render("category",{msg:{err:"修改的类名字不能为空值!!!!!"}});
    }
    Category.update({_id:id},{$set:{name:name}},function (err) {

        if(!err){
            res.redirect("/admin/catagory?page=1");
        }
    });
});
/*跳转到文章发表页面*/
router.get("/addContent",checklogin,function (req,res) {
    //查询分类显示
    Category.find({live:{$ne:false}},function (err,categorys) {
        res.render("content_post",{categorys:categorys});
    });
});
//上传图片
router.post("/add/images",function (req,res) {
    //上传图片解析问题
    console.log(req.files);
    //新文件名字
     let newName  = req.files[0].path + pathLib.parse(req.files[0].originalname).ext;
      newName2 = newName.substring(6);
     var img = {"imgName":newName2};

    console.log(req.files);
    fs.rename(req.files[0].path,newName,function (err) {
        if(err){
            res.err = "上传失败！！";
        }else {
            req.session.img = img;
            res.redirect("/admin/addContent");
        }
    });
})
/*发布文章页面-表单*/
router.post("/add",checklogin,function (req,res) {
    let category = req.body.category;
    let title = req.body.title.trim();
    let user = req.session.loginUser._id;
    let description = req.body.description;
    let content = req.body.content;
    let image = {
        name:newName2
    };
    delete req.session.img;
    Content.create({category:category,title:title,user:user,description:description,content:content,images:newName2}).then(function (err) {
        res.render("success",{msg:{success:'内容保存成功过!!!!!'}});
    }).then(() =>{
        newName2=null
    });
    /*Content.create(category: category, title:title,user:user,description:description,content:content,images:image).then(function (err) {
        //newName2 置为空.
        res.render("success",{msg:{success:'内容保存成功!!!!!'}});
    }).then(newName2 =>newName2=null);*/
});
/*跳转到文章管理页面*/
router.get("/admin",function (req,res) {
    //每页显示的条数
    let limit = 6;
    //页数
    let page = Number(req.query.page || 1);
    //过滤数目
    let skip = (page-1)*limit;
    //总页数初始化
    let pages = 0;
    //count
    //查询所有的博文
    Content.count().then(function (count) {
        //页数
        pages = Math.ceil(count/limit);
        //最大page
        page = Math.min(page,pages-1);
        //设置最小
        page = Math.max(page,1);
        Content.find().limit(limit).skip(skip).populate(['category', 'user']).then(function (contents) {
            let arr =[];
            for(let i=0;i<contents.length;i++){
                let nowT = contents[i].addTime;
                let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
                arr.push(now);
            }
            res.render("admin",{
                contents:contents,
                count:count,
                pages:pages,
                page:page,
                arr:arr
            })
        })
    })
});
//-----------------------------------------------------（node-admin-sys）新后台mongodb数据CRUD操作-----------------------------------------------------------------
//加载后台首页显示的页面
router.get("/index_v3",function (req,res) {
    res.render("node-admin-sys-index_v3");
});
//用户列表查询显示
router.get("/userList",function (req,res) {
    //每页显示条数
    let  limit = 6;
    //页数
    let page = Number(req.query.page || 1);
    //过滤条数
    let skip = (page -1 ) *limit;
    //总页数初始值
    let pages = 0;
    let userType = '';
    User.count().then(function (count) {
        //总页数
        pages = Math.ceil(count/limit);
        //最大页数
        page = Math.min(page,pages-1);
        //最小页数
        page = Math.max(page,1);
        userType = 'user';
        //查询所有用户数据User.find({isBigadmin:{$ne:true},live:{$ne:false}})
        //相对应结构化SQL而言 "$ne"===================>"!="
        User.find({isBigadmin:{$ne:true},live:{$ne:false}}).skip(skip).limit(limit).then(function(users){
            let arr = [];
            for(let i=0;i<users.length;i++){
                let addT = users[i].addTime;
                let now = moment(addT).format("YYYY-MM-DD HH:mm:ss");
                arr.push(now);
            }
            res.render("node-admin-sys-userList",{users:users,
                count:count,
                pages :pages,
                page:page,
                userType:userType,
                arr:arr
            });
        });
    });
});
//查询admin 管理员
router.get("/adminList",function (req,res) {
    //每页显示条数
    let limit = 6;
    //页数
    let page = Number(req.query.page || 1);
    //过滤条数
    let skip = (page -1) * limit;
    //总页数初始值
    let pages = 0;
    //用户类型
    let userType = '';
    User.count().then(function (count) {
        //用户类型
        userType = 'admin';
        //总页数
        pages = Math.ceil(count/limit);
        console.log(count);
        //最大页数
        page = Math.min(page,pages-1);
        //最小页数
        page = Math.max(page,1);
        //相对应结构化SQL而言 "$ne"===================>"!="
        User.find({isBigadmin:{$ne:false},live:{$ne:false}}).skip(skip).limit(limit).then(function(users){
            let arr = [];
            for(let i = 0;i<users.length;i++){
                let addT = users[i].addTime;
                let now = moment(addT).format("YYYY-MM-DD HH:mm:ss");
                arr.push(now);
            }
            res.render("node-admin-sys-userList",{users:users,
                count:count,
                pages :pages,
                page:page,
                userType:userType,
                arr:arr
            });
        });
    });
});
//用户删除
router.get("/delete_user",function (req,res) {
    //根据id 修改live 变为伪删除
    let id = req.query.id;
    User.update({_id:id},{$set:{live:false}},function (err) {
        //重定向到用户列表页
        if (!err){
            //没出现出error 重定向
            res.redirect("/admin/userList");
        }
    })
});
//查询分类上
//跳转到容文章发布页面 + 查询所属分类
router.get("/contentEdit",function (req,res) {
    //查询所有类目跳转完成并显示
    Category.find({live:{$ne:false}},function (err,categorys) {
        res.render("node-admin-sys-markdown",{categorys:categorys});
    });
});
//添加内容
router.post("/addContent",function (req,res) {
    //标题
    let title  = req.body.title.trim();
    //所属类目
    let category = req.body.category;
    //用户ID 从session 中获取
    let userID = req.session.loginUser._id;
    //简介
    let description = req.body.description;
    //内容
    let content = req.body.content;
    //数据库操作 数据保存成功
    Content.create({category:category,title:title,user:userID,description:description,content:content}).then(function (err) {
        // res.render("node-admin-sys-contentList",{msg:{success:'内容保存成功过!!!!!'}});
        res.redirect('/admin/blog');
    })
});
//全部博文测试展示demo
router.get("/blog",function (req,res) {
    Content.find({}).sort({_id:-1}).populate(['category','user']).then(function (contents) {
        //空数组 存储过滤处理好的时间数据
        let arr =[];
        //遍历内容中的 博文时间过滤处理
        for(let i=0;i<contents.length;i++){
            let nowT = contents[i].addTime;
            let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
            arr.push(now);
        }

        let comments = contents.length;
        //阅读数目
        let views= contents.views;
        res.render("node-admin-sys-blog",{contents:contents,comments:comments,views:views,arr:arr})
    });

    //mongodb sort : -1是降序排序
    });
//博文全部列表
router.get("/contentList",function (req,res) {
    //每页显示的条数
    let limit = 6;
    //页数
    let page = Number(req.query.page || 1);
    //过滤数目
    let skip = (page-1)*limit;
    //总页数初始化
    let pages = 0;
    //count
    //查询所有的博文
    Content.count().then(function (count){
        //页数
        pages = Math.ceil(count/limit);
        //最大page
        page = Math.min(page,pages-1);
        //设置最小
        page = Math.max(page,1);
        Content.find().limit(limit).skip(skip).populate(['category', 'user']).then(function (contents) {
            let arr =[];
            for(let i=0;i<contents.length;i++){
                let nowT = contents[i].addTime;
                let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
                arr.push(now);
            }
            res.render("node-admin-sys-contentList",{
                contents:contents,
                count:count,
                pages:pages,
                page:page,
                arr:arr
            })
        })
    })
});
//删除文章
router.get("/delete_content",function (req,res) {
    //根据ID 真删除文章
    let id = req.query.id;
    //根据ID删除对应的mongodb文档
    Content.remove({_id:id},function (err) {
        if (!err){
            //没出错的情况下 重定向到contentList列表
            res.redirect("/admin/contentList")
        }
    })
});
module.exports = router;


