var  mongoose = require("mongoose");

var catagorySchema = mongoose.Schema({
    /*分类名称！！！！*/
    name:String,
    live:{
        type:Boolean,
        default:true
    }
});

module.exports = mongoose.model("Category",catagorySchema);