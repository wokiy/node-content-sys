require("../tools/db")

var Content = require("../schemas/Content");
Content.create({
    name:"react",
    description:"asdadasd",
    content:"sadasdsaddddddddddddddddddddddddddddddddddddddddddasdasdsa",
    comments:[]
},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});