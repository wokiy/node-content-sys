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
    }
    
});
module.exports = mongoose.model("User",userSchema);

