var express = require("express");
var router = express.Router();
const  fs = require("fs");
let User = require("../schemas/User");
let Category = require("../schemas/Category");
let Content = require("../schemas/Content");
const pathLib=require('path');
let  moment = require("moment");
var newName2='';
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
        res.render("login",{msg:{err:"请登录后再访问该页面！！！"}});
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
    }
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
            let arr =[]
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
module.exports = router;

