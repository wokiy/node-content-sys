var mongoose = require("mongoose");
mongoose.connect("mongodb://127.0.0.1/blog2",{useMongoClient:true});
mongoose.connection.on("open",function () {
    console.log("数据库链接成功！！！！");
});