/*
 Navicat Premium Data Transfer

 Source Server         : blog2
 Source Server Type    : MongoDB
 Source Server Version : 40009
 Source Host           : localhost:27017
 Source Schema         : blog2

 Target Server Type    : MongoDB
 Target Server Version : 40009
 File Encoding         : 65001

 Date: 17/06/2019 16:41:07
*/


// ----------------------------
// Collection structure for categories
// ----------------------------
db.getCollection("categories").drop();
db.createCollection("categories");

// ----------------------------
// Documents of categories
// ----------------------------
db.getCollection("categories").insert([ {
    _id: ObjectId("5cdb8a5dcbfeb4581c2aebdf"),
    name: "路人甲",
    description: "路人甲测试栏目",
    addTime: ISODate("2019-05-15T03:38:57.229Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cdd0e11ccad323fd40103fa"),
    name: "栏目空",
    description: "测试栏目",
    addTime: ISODate("2019-05-16T07:14:49.489Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cdd1001c3945b3b1ce8a46e"),
    name: "微服务",
    description: "light-4j：A fast, lightweight and more productive microservices framework",
    addTime: ISODate("2019-05-16T07:23:10.333Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cdd1088ac72c152688fb4ae"),
    name: "啊啊啊",
    description: "啊啊啊啊",
    addTime: ISODate("2019-05-16T07:25:52.024Z"),
    live: false,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cdd10ccac72c152688fb4af"),
    name: "node服务架构",
    description: "前端跟node也是可以独立开发，降低耦合，也可单独部署",
    addTime: ISODate("2019-05-16T07:25:52.024Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce515145af77e88acc3d7d2"),
    name: "vue",
    description: "渐进式 JavaScript 框架",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce515415af77e88acc3d7d3"),
    name: "react",
    description: "用于构建用户界面的 JavaScript 库",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce515655af77e88acc3d7d4"),
    name: "IT笔记",
    description: "记录互联网开发例子和实战",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce515845af77e88acc3d7d5"),
    name: "Mysql",
    description: "MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce515a65af77e88acc3d7d6"),
    name: "javascript",
    description: "JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce515c05af77e88acc3d7d7"),
    name: "java",
    description: "Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce515e75af77e88acc3d7d8"),
    name: "产品🐶",
    description: "产品经理（Product Manager）是企业中专门负责产品管理的职位，产品经理负责市场调查并根据产品、市场及用户等的需求，确定开发何种产品，选择何种业务模式、商业模式等。并推动相应产品的开发组织，他还要根据产品的生命周期，协调研发",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce5160d5af77e88acc3d7d9"),
    name: "产品设计",
    description: "产品设计 好的设计,不会过分打扰用户 让用户感觉到被打扰,一般分为这3种情况:信息重复出现;用户不需要时出现;信息展示强度大于信息价值",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce516345af77e88acc3d7da"),
    name: "微信开发",
    description: "在微信公众平台开发微信程序",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5ce5165a5af77e88acc3d7db"),
    name: "大数据",
    description: "大数据以Java技术为基础，在熟练掌握了Java技术以后，再学习大数据的相关技术会容易很多",
    addTime: ISODate("2019-05-22T08:39:33.18Z"),
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cecd5e6d07106489c723b03"),
    name: "测试栏目a",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    addTime: ISODate("2019-05-28T06:31:27.613Z"),
    live: true,
    __v: NumberInt("0")
} ]);

// ----------------------------
// Collection structure for comments
// ----------------------------
db.getCollection("comments").drop();
db.createCollection("comments");

// ----------------------------
// Documents of comments
// ----------------------------
db.getCollection("comments").insert([ {
    _id: ObjectId("5cf88b5e789be902ecbbb512"),
    userID: ObjectId("5ccff734e0343d19cc12e283"),
    contentID: ObjectId("5cf88b28547b2b4548e71a17"),
    live: true,
    giveTheThumbsUp: NumberInt("66"),
    contents: "测试新表萨达",
    addTime: ISODate("2019-06-06T03:41:18.742Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("comments").insert([ {
    _id: ObjectId("5cfe0a0306a1273038cef968"),
    userID: ObjectId("5ccff8c8e0343d19cc12e287"),
    contentID: ObjectId("5cf88cde45e4b4046c2b56bd"),
    live: true,
    giveTheThumbsUp: NumberInt("0"),
    contents: "测试评论帖子",
    addTime: ISODate("2019-06-10T07:42:21.544Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("comments").insert([ {
    _id: ObjectId("5cfe0a91db930c2190fca033"),
    userID: ObjectId("5ccff8c8e0343d19cc12e287"),
    contentID: ObjectId("5cf88cde45e4b4046c2b56bd"),
    live: true,
    giveTheThumbsUp: NumberInt("0"),
    contents: "我再测试帖子评论！",
    addTime: ISODate("2019-06-10T07:44:58.531Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("comments").insert([ {
    _id: ObjectId("5cfe0aafdb930c2190fca034"),
    userID: ObjectId("5ccff8c8e0343d19cc12e287"),
    contentID: ObjectId("5cf88b28547b2b4548e71a17"),
    live: true,
    giveTheThumbsUp: NumberInt("0"),
    contents: "我测试看看",
    addTime: ISODate("2019-06-10T07:44:58.531Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("comments").insert([ {
    _id: ObjectId("5d02189bac036209d4c4b253"),
    userID: ObjectId("5cd0dec5cd5b904130a9738e"),
    contentID: ObjectId("5cf88cde45e4b4046c2b56bd"),
    live: false,
    giveTheThumbsUp: NumberInt("0"),
    contents: "测试删除功能jasonlwy",
    addTime: ISODate("2019-06-13T09:33:27.155Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("comments").insert([ {
    _id: ObjectId("5d074478d5d3b244cc2cafd5"),
    userID: ObjectId("5cd0dec5cd5b904130a9738e"),
    contentID: ObjectId("5d0743ead5d3b244cc2cafd4"),
    live: true,
    giveTheThumbsUp: NumberInt("0"),
    contents: "点评",
    addTime: ISODate("2019-06-17T07:28:28.484Z"),
    __v: NumberInt("0")
} ]);

// ----------------------------
// Collection structure for contents
// ----------------------------
db.getCollection("contents").drop();
db.createCollection("contents");

// ----------------------------
// Documents of contents
// ----------------------------
db.getCollection("contents").insert([ {
    _id: ObjectId("5cf88b28547b2b4548e71a17"),
    user: ObjectId("5ccff734e0343d19cc12e283"),
    category: ObjectId("5ce515415af77e88acc3d7d3"),
    title: "react",
    images: [ ],
    contents: "智慧城市研究院!!!!!",
    description: "jasonl",
    views: NumberInt("32"),
    addTime: ISODate("2019-06-06T03:40:24.19Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cf88cde45e4b4046c2b56bd"),
    category: ObjectId("5cdd0e11ccad323fd40103fa"),
    title: "智慧城市研究院",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [
        "\\upload\\3994933cb093c59e03638deb732d5908.jpg"
    ],
    contents: "**粗体**                                    ",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("55"),
    addTime: ISODate("2019-06-06T03:47:04.126Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5d073c16afa8425478b7c960"),
    category: ObjectId("5ce515655af77e88acc3d7d4"),
    title: "百度富文本编辑器",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    contents: "<p>adadadadasda<br/></p>",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("10"),
    addTime: ISODate("2019-06-17T07:06:32.361Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5d0743ead5d3b244cc2cafd4"),
    category: ObjectId("5ce515655af77e88acc3d7d4"),
    title: "百度编辑器图片功能展示",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    contents: "<p><img src=\"/images/ueditor/1140524540707868672.png\" title=\"\" alt=\"tupian.png\"/></p><p>图片测试</p>",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("3"),
    addTime: ISODate("2019-06-17T07:28:28.482Z"),
    __v: NumberInt("0")
} ]);

// ----------------------------
// Collection structure for sessions
// ----------------------------
db.getCollection("sessions").drop();
db.createCollection("sessions");
db.getCollection("sessions").createIndex({
    expires: NumberInt("1")
}, {
    name: "expires_1"
});

// ----------------------------
// Documents of sessions
// ----------------------------
db.getCollection("sessions").insert([ {
    _id: "E-Mf1S-T8o9-Qucd7jqbBaL4DgG_sUzy",
    expires: ISODate("2019-06-17T08:44:59.133Z"),
    session: "{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-06-17T07:48:34.398Z\",\"httpOnly\":true,\"path\":\"/\"},\"loginUser\":{\"_id\":\"5cd0dec5cd5b904130a9738e\",\"username\":\"韩立\",\"password\":\"7c4a8d09ca3762af61e59520943dc26494f8941b\",\"__v\":0,\"images\":\"\\\\upload\\\\db85bfac60c41957c4ebafcd5c295627.jpg\",\"addTime\":\"2019-05-07T01:26:08.673Z\",\"live\":true,\"isBigadmin\":true}}"
} ]);

// ----------------------------
// Collection structure for users
// ----------------------------
db.getCollection("users").drop();
db.createCollection("users");
db.getCollection("users").createIndex({
    username: NumberInt("1")
}, {
    name: "username_1",
    background: true,
    unique: true
});

// ----------------------------
// Documents of users
// ----------------------------
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff44ee0343d19cc12e282"),
    username: "陆雨晴",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: false,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff734e0343d19cc12e283"),
    username: "jasonlwy",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: true,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff768e0343d19cc12e284"),
    username: "厉飞雨",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff87ee0343d19cc12e285"),
    username: "南宫婉",
    password: "dd5fef9c1c1da1394d6d34b248c51be2ad740840",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff89be0343d19cc12e286"),
    username: "紫灵",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff8c8e0343d19cc12e287"),
    username: "金童",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\cb9e018f1f249551ac40777751d5d6fd.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff8f3e0343d19cc12e288"),
    username: "路人甲",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: false,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5cd0dec5cd5b904130a9738e"),
    username: "韩立",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-07T01:26:08.673Z"),
    live: true,
    isBigadmin: true,
    __v: NumberInt("0"),
    images: "\\upload\\db85bfac60c41957c4ebafcd5c295627.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ce34e3c416594566cc151ad"),
    username: "呼言道人",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-21T01:01:18.909Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ce34eaa416594566cc151ae"),
    username: "魔主",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-21T01:01:18.909Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ce513805af77e88acc3d7d1"),
    username: "六花夫人",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-22T08:39:33.174Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0"),
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg"
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5cedf80fbcad053c4c427925"),
    username: "晨阳",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
    addTime: ISODate("2019-05-29T03:09:19.493Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
