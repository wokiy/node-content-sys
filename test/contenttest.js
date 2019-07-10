require("../tools/db")

var Content = require("../schemas/Content");
Content.create({
    user:'5d1ea71f637e5c45cc94a078',
    category:'5d1ea82436eaa506b4ea3ff6',
    title:"react",
    description:"jasonl",
    contents:"智慧城市研究院!!!!!",

},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});