require("../tools/db")

var Category = require("../schemas/Category");
Category.create({
    name:"react"
},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});