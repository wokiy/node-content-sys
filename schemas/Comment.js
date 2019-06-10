const  mongoose = require("mongoose");

let CommentSchema = mongoose.Schema({
// 关联用户id
    userID:{
        //类型
        type:mongoose.Schema.Types.ObjectId,
        //引用
        ref:"User"
    },
    contentID:{
        type:mongoose.Schema.Types.ObjectId,
        //引用
        ref:"Content"
    },
    //添加时间
    addTime:{
        type:Date,
        default:new Date()
    },
    //评论内容
    contents:{
        type:String,
        default:''
    },
    //点赞数
    giveTheThumbsUp:{
        type:Number,
        default:0
    },
    //是否删除
    live:{
      type: Boolean,
      default: true
    }
});
module.exports = mongoose.model("Comment",CommentSchema);