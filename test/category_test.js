require("../tools/db")

var Category = require("../schemas/Category");
Category.create({
    name:"react",
    description:'前端框架'
},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});