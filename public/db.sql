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

 Date: 26/07/2019 15:27:17
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
    _id: ObjectId("5d1ea82436eaa506b4ea3ff6"),
    name: "react",
    description: "前端框架",
    addTime: ISODate("2019-07-05T01:30:12.256Z"),
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
    _id: ObjectId("5d3aa8e578133e53e4af0536"),
    userID: ObjectId("5d25a0eb86b5be0538968a5e"),
    contentID: ObjectId("5d3aa6d878133e53e4af0535"),
    live: true,
    giveTheThumbsUp: NumberInt("0"),
    contents: "新型智慧城市",
    addTime: ISODate("2019-07-26T07:06:37.856Z"),
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
    _id: ObjectId("5d36bc34722e2434140de3bc"),
    category: ObjectId("5d1ea82436eaa506b4ea3ff6"),
    title: "前端",
    user: ObjectId("5d25a0eb86b5be0538968a5e"),
    giveCollect: NumberInt("0"),
    giveHuUp: NumberInt("18"),
    images: [ ],
    contents: "<p>啊实打实大苏打</p>",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("44"),
    addTime: ISODate("2019-07-23T07:49:03.98Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5d36bcbf722e2434140de3bd"),
    category: ObjectId("5d1ea82436eaa506b4ea3ff6"),
    title: "撒大苏打",
    user: ObjectId("5d25a0eb86b5be0538968a5e"),
    giveCollect: NumberInt("0"),
    giveHuUp: NumberInt("28"),
    images: [ ],
    contents: "<p>啊是大大大大大大大</p>",
    description: "阿萨大大",
    views: NumberInt("81"),
    addTime: ISODate("2019-07-23T07:49:03.98Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5d38086efea2dd3b842e9db7"),
    category: ObjectId("5d1ea82436eaa506b4ea3ff6"),
    title: "智慧城市研究院",
    user: ObjectId("5d25a0eb86b5be0538968a5e"),
    giveCollect: NumberInt("0"),
    giveHuUp: NumberInt("3"),
    images: [ ],
    contents: "<p>sadsadadasdasdadadadsa</p>",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("67"),
    addTime: ISODate("2019-07-24T07:27:07.161Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5d3aa6d878133e53e4af0535"),
    category: ObjectId("5d1ea82436eaa506b4ea3ff6"),
    title: "智慧城市研究院",
    user: ObjectId("5d25a0eb86b5be0538968a5e"),
    giveCollect: NumberInt("0"),
    giveHuUp: NumberInt("0"),
    images: [
        "\\upload\\a78a9e279c27edf3f232d0d28af6c0a4.jpg"
    ],
    contents: "<p>撒大撒大撒大大撒旦按时大苏打大大撒旦按时大苏打大苏打啊实打实大大</p>",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("7"),
    addTime: ISODate("2019-07-26T07:06:37.855Z"),
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
    _id: "NFRg12cOqI-93QpPwChWxkUN--dsW0l6",
    expires: ISODate("2019-07-26T08:26:09.679Z"),
    session: "{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-07-26T08:18:21.526Z\",\"httpOnly\":true,\"path\":\"/\"},\"loginError\":\"请登录！！！\"}"
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
    _id: ObjectId("5d25a0eb86b5be0538968a5e"),
    username: "石空解",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    collect: [
        {
            addTime: ISODate("2019-07-23T07:49:03.98Z"),
            views: NumberInt("80"),
            description: "阿萨大大",
            contents: "<p>啊是大大大大大大大</p>",
            images: [ ],
            giveHuUp: NumberInt("28"),
            giveCollect: NumberInt("0"),
            __v: NumberInt("0"),
            user: {
                isBigadmin: true,
                live: true,
                addTime: ISODate("2019-07-10T08:24:44.91Z"),
                images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
                address: "深汕特别合作区智慧城市研究院",
                emaddress: "jasonwy@163.com",
                briefIntroduction: "youIntroduction",
                nice: [
                    "5d36bcbf722e2434140de3bd",
                    "5d38086efea2dd3b842e9db7"
                ],
                collect: [ ],
                __v: NumberInt("0"),
                password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
                username: "石空解",
                _id: ObjectId("5d25a0eb86b5be0538968a5e")
            },
            title: "撒大苏打",
            category: {
                live: true,
                addTime: ISODate("2019-07-05T01:30:12.256Z"),
                description: "前端框架",
                __v: NumberInt("0"),
                name: "react",
                _id: ObjectId("5d1ea82436eaa506b4ea3ff6")
            },
            _id: ObjectId("5d36bcbf722e2434140de3bd")
        },
        {
            addTime: ISODate("2019-07-26T07:06:37.855Z"),
            views: NumberInt("4"),
            description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
            contents: "<p>撒大撒大撒大大撒旦按时大苏打大大撒旦按时大苏打大苏打啊实打实大大</p>",
            images: [
                "\\upload\\a78a9e279c27edf3f232d0d28af6c0a4.jpg"
            ],
            giveHuUp: NumberInt("0"),
            giveCollect: NumberInt("0"),
            __v: NumberInt("0"),
            user: {
                isBigadmin: true,
                live: true,
                addTime: ISODate("2019-07-10T08:24:44.91Z"),
                images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
                address: "深汕特别合作区智慧城市研究院",
                emaddress: "jasonwy@163.com",
                briefIntroduction: "youIntroduction",
                nice: [
                    "5d36bcbf722e2434140de3bd",
                    "5d38086efea2dd3b842e9db7"
                ],
                collect: [
                    {
                        addTime: ISODate("2019-07-23T07:49:03.98Z"),
                        views: NumberInt("80"),
                        description: "阿萨大大",
                        contents: "<p>啊是大大大大大大大</p>",
                        images: [ ],
                        giveHuUp: NumberInt("28"),
                        giveCollect: NumberInt("0"),
                        __v: NumberInt("0"),
                        user: {
                            isBigadmin: true,
                            live: true,
                            addTime: ISODate("2019-07-10T08:24:44.91Z"),
                            images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
                            address: "深汕特别合作区智慧城市研究院",
                            emaddress: "jasonwy@163.com",
                            briefIntroduction: "youIntroduction",
                            nice: [
                                "5d36bcbf722e2434140de3bd",
                                "5d38086efea2dd3b842e9db7"
                            ],
                            collect: [ ],
                            __v: NumberInt("0"),
                            password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
                            username: "石空解",
                            _id: ObjectId("5d25a0eb86b5be0538968a5e")
                        },
                        title: "撒大苏打",
                        category: {
                            live: true,
                            addTime: ISODate("2019-07-05T01:30:12.256Z"),
                            description: "前端框架",
                            __v: NumberInt("0"),
                            name: "react",
                            _id: ObjectId("5d1ea82436eaa506b4ea3ff6")
                        },
                        _id: ObjectId("5d36bcbf722e2434140de3bd")
                    }
                ],
                __v: NumberInt("0"),
                password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
                username: "石空解",
                _id: ObjectId("5d25a0eb86b5be0538968a5e")
            },
            title: "智慧城市研究院",
            category: {
                live: true,
                addTime: ISODate("2019-07-05T01:30:12.256Z"),
                description: "前端框架",
                __v: NumberInt("0"),
                name: "react",
                _id: ObjectId("5d1ea82436eaa506b4ea3ff6")
            },
            _id: ObjectId("5d3aa6d878133e53e4af0535")
        }
    ],
    nice: [
        "5d36bcbf722e2434140de3bd",
        "5d38086efea2dd3b842e9db7"
    ],
    briefIntroduction: "youIntroduction",
    emaddress: "jasonwy@163.com",
    address: "深汕特别合作区智慧城市研究院",
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
    addTime: ISODate("2019-07-10T08:24:44.91Z"),
    live: true,
    isBigadmin: true,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5d36b618cdb48353682239c2"),
    username: "紫灵",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    collect: [
        {
            addTime: ISODate("2019-07-24T07:27:07.161Z"),
            views: NumberInt("56"),
            description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
            contents: "<p>sadsadadasdasdadadadsa</p>",
            images: [ ],
            giveHuUp: NumberInt("3"),
            giveCollect: NumberInt("0"),
            __v: NumberInt("0"),
            user: {
                isBigadmin: true,
                live: true,
                addTime: ISODate("2019-07-10T08:24:44.91Z"),
                images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
                address: "深汕特别合作区智慧城市研究院",
                emaddress: "jasonwy@163.com",
                briefIntroduction: "youIntroduction",
                nice: [
                    "5d36bcbf722e2434140de3bd",
                    "5d38086efea2dd3b842e9db7"
                ],
                collect: [ ],
                __v: NumberInt("0"),
                password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
                username: "石空解",
                _id: ObjectId("5d25a0eb86b5be0538968a5e")
            },
            title: "智慧城市研究院",
            category: {
                live: true,
                addTime: ISODate("2019-07-05T01:30:12.256Z"),
                description: "前端框架",
                __v: NumberInt("0"),
                name: "react",
                _id: ObjectId("5d1ea82436eaa506b4ea3ff6")
            },
            _id: ObjectId("5d38086efea2dd3b842e9db7")
        },
        {
            addTime: ISODate("2019-07-23T07:49:03.98Z"),
            views: NumberInt("41"),
            description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
            contents: "<p>啊实打实大苏打</p>",
            images: [ ],
            giveHuUp: NumberInt("18"),
            giveCollect: NumberInt("0"),
            __v: NumberInt("0"),
            user: {
                isBigadmin: true,
                live: true,
                addTime: ISODate("2019-07-10T08:24:44.91Z"),
                images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
                address: "深汕特别合作区智慧城市研究院",
                emaddress: "jasonwy@163.com",
                briefIntroduction: "youIntroduction",
                nice: [
                    "5d36bcbf722e2434140de3bd",
                    "5d38086efea2dd3b842e9db7"
                ],
                collect: [ ],
                __v: NumberInt("0"),
                password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
                username: "石空解",
                _id: ObjectId("5d25a0eb86b5be0538968a5e")
            },
            title: "前端",
            category: {
                live: true,
                addTime: ISODate("2019-07-05T01:30:12.256Z"),
                description: "前端框架",
                __v: NumberInt("0"),
                name: "react",
                _id: ObjectId("5d1ea82436eaa506b4ea3ff6")
            },
            _id: ObjectId("5d36bc34722e2434140de3bc")
        },
        {
            addTime: ISODate("2019-07-24T07:27:07.161Z"),
            views: NumberInt("63"),
            description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
            contents: "<p>sadsadadasdasdadadadsa</p>",
            images: [ ],
            giveHuUp: NumberInt("3"),
            giveCollect: NumberInt("0"),
            __v: NumberInt("0"),
            user: {
                isBigadmin: true,
                live: true,
                addTime: ISODate("2019-07-10T08:24:44.91Z"),
                images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
                address: "深汕特别合作区智慧城市研究院",
                emaddress: "jasonwy@163.com",
                briefIntroduction: "youIntroduction",
                nice: [
                    "5d36bcbf722e2434140de3bd",
                    "5d38086efea2dd3b842e9db7"
                ],
                collect: [ ],
                __v: NumberInt("0"),
                password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
                username: "石空解",
                _id: ObjectId("5d25a0eb86b5be0538968a5e")
            },
            title: "智慧城市研究院",
            category: {
                live: true,
                addTime: ISODate("2019-07-05T01:30:12.256Z"),
                description: "前端框架",
                __v: NumberInt("0"),
                name: "react",
                _id: ObjectId("5d1ea82436eaa506b4ea3ff6")
            },
            _id: ObjectId("5d38086efea2dd3b842e9db7")
        }
    ],
    nice: [
        "5d36bc34722e2434140de3bc",
        "5d36bcbf722e2434140de3bd",
        "5d36bc34722e2434140de3bc",
        "5d38086efea2dd3b842e9db7"
    ],
    briefIntroduction: "youIntroduction",
    emaddress: "jasonwy@126.com",
    address: "深汕特别合作区智慧城市研究院",
    images: "\\upload\\ba1a1d90b2bd4bff552146c073a0b6df.jpg",
    addTime: ISODate("2019-07-23T07:23:01.648Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5d381145719584436ce8b281"),
    username: "韩立",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    collect: [ ],
    nice: [
        "5d38086efea2dd3b842e9db7",
        "5d36bcbf722e2434140de3bd"
    ],
    briefIntroduction: "youIntroduction",
    emaddress: "jasonwy@163.com",
    address: "深汕特别合作区智慧城市研究院",
    images: "\\upload\\1e7f6e9614774dcd686bc0b9a32fdd10.jpg",
    addTime: ISODate("2019-07-24T08:03:19.036Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
