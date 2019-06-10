require("../tools/db")

var Comment = require("../schemas/Comment");
Comment.create({
    userID:'5ccff734e0343d19cc12e283',
    contentID:'5cf88b28547b2b4548e71a17',
    contents:"测试新表",
    live:true,
    giveTheThumbsUp:66,
},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});