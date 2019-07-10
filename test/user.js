require("../tools/db");

var User = require("../schemas/User");
User.create({
    username:"aaasss",
    password:"1234561",
    live:false
},function (err) {
    if(!err){
        console.log("数据插入成功！！！");
    }
});
