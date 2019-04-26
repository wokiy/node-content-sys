require("../tools/db")

var Content = require("../schemas/Content");
Content.create({
    title:"react",
    description:"asdadasd",
    content:"sadasdsaddddddddddddddddddddddddddddddddddddddddddasdasdsa",
    comments:[],

},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});