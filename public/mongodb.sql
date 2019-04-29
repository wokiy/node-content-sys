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
 Date: 25/04/2019 16:32:01
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
    _id: ObjectId("5cc15d9860aab928844660d4"),
    name: "react",
    live: true,
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
    _id: ObjectId("5cc168caba0a361f506ab018"),
    category: ObjectId("5cc15d9860aab928844660d4"),
    user: ObjectId("5cc15ff3f8f09b1424fd4ac8"),
    title: "react",
    images: [ ],
    comments: [ ],
    content: "sadasdsaddddddddddddddddddddddddddddddddddddddddddasdasdsa",
    description: "asdadasd",
    views: NumberInt("2"),
    addTime: ISODate("2019-04-25T07:59:06.213Z"),
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
    _id: ObjectId("5cc15ff3f8f09b1424fd4ac8"),
    username: "aaa",
    password: "123456",
    live: true,
    isBigadmin: true,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5cc1600c6cb32637945f763f"),
    username: "aaasss",
    password: "1234561",
    live: false,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5cc16eb02c048f45d410fdac"),
    username: "jason",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    live: true,
    isBigadmin: true,
    __v: NumberInt("0")
} ]);
