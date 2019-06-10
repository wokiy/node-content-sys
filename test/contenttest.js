require("../tools/db")

var Content = require("../schemas/Content");
Content.create({
    user:'5ccff734e0343d19cc12e283',
    category:'5ce515415af77e88acc3d7d3',
    title:"react",
    description:"jasonl",
    contents:"智慧城市研究院!!!!!",

},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});