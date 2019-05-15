var  mongoose = require("mongoose");

var catagorySchema = mongoose.Schema({
    //栏目名称
    name:String,
    live:{
        type:Boolean,
        default:true
    },
    //栏目添加时间
    addTime:{
        type:Date,
        default:new Date()
    },
    //栏目简介
    description:{
        type:String,
        default:''
    },

});

module.exports = mongoose.model("Category",catagorySchema);