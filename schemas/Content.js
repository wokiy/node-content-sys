const  mongoose = require("mongoose");

let blogSchema = mongoose.Schema({
    category:{
        //类型
        type:mongoose.Schema.Types.ObjectId,
        //引用
        ref: 'Category'
    },
    //内容标题
    title:String,
    // 关联用户id
    user:{
        //类型
        type:mongoose.Schema.Types.ObjectId,
        //引用
        ref:"User"
    },
    //添加时间
    addTime:{
        type:Date,
        default:new Date()
    },
    //阅读量
    views:{
        type:Number,
        default:0
    },
    description:{
        type:String,
        default:''
    },
    content:{
        type:String,
        default:''
    },
    //评论
    comments:{
        type:Array,
        default:[]
    },
    images:{
        type:Array,
        default:[]
    }
}) ;
module.exports = mongoose.model("Content",blogSchema);