require("../tools/db")

var User = require("../schemas/User");
User.create({
    username:"deleteTest",
    password:"40bd001563085fc35165329ea1ff5c5ecbdbbeef",
    live:false
},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});
