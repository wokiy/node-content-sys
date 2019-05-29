var mongoose = require("mongoose");
var userSchema = mongoose.Schema({
    username:{
        type:String,
        unique:true
    },
   password:String,
    isBigadmin:{
        type:Boolean,
        default:false
    },
    live:{
        type:Boolean,
        default:true
    },
    //添加时间
    addTime:{
        type:Date,
        default:new Date()
    },
    //设置头像
    images:{
        type:String,
        default:'1e7f6e9614774dcd686bc0b9a32fdd10.jpg'
        //设置默认头像
    }
    
});
module.exports = mongoose.model("User",userSchema);

