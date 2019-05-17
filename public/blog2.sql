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

 Date: 17/05/2019 15:46:43
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
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc259c1a6a6d34d8ca769b7"),
    name: "vue",
    live: true,
    __v: NumberInt("0")
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a0880a12e57fa4005e02"),
    name: "IT笔记",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a09d0a12e57fa4005e03"),
    name: "Mysql",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a0ac0a12e57fa4005e04"),
    name: "javascript",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a0bb0a12e57fa4005e05"),
    name: "PHP",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a0cb0a12e57fa4005e06"),
    name: "产品苟",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a0dd0a12e57fa4005e07"),
    name: "随心生活",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a0e90a12e57fa4005e08"),
    name: "旅游摄影",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a0f80a12e57fa4005e09"),
    name: "小说杂技",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a1040a12e57fa4005e0a"),
    name: "微信开发",
    live: true,
    __v: 0
} ]);
db.getCollection("categories").insert([ {
    _id: ObjectId("5cc6a1140a12e57fa4005e0b"),
    name: "产品设计",
    live: true,
    __v: 0
} ]);
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
    live: true,
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

// ----------------------------
// Collection structure for contents
// ----------------------------
db.getCollection("contents").drop();
db.createCollection("contents");

// ----------------------------
// Documents of contents
// ----------------------------
db.getCollection("contents").insert([ {
    _id: ObjectId("5cc259a3a6a6d34d8ca769b6"),
    category: ObjectId("5cc15d9860aab928844660d4"),
    title: "智慧城市研究院",
    user: ObjectId("5ccff44ee0343d19cc12e282"),
    images: [
        "\\upload\\57b3fb40a158e59caa810e298dfc4da9.jpg"
    ],
    comments: [
        {
            user: "jasonl",
            postTime: ISODate("2019-04-29T07:01:09.106Z"),
            comments: "好公司"
        }
    ],
    content: "智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范",
    description: "智慧城市研究院 arcGIs 开发规范 超图开发规范 地理信息系统开发规范",
    views: NumberInt("7"),
    addTime: ISODate("2019-04-26T01:04:15.499Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cc26733239eb63574bc6947"),
    category: ObjectId("5cc259c1a6a6d34d8ca769b7"),
    title: "智慧研究院",
    user: ObjectId("5ccff44ee0343d19cc12e282"),
    images: [
        "\\upload\\3dd0fb5be562e15cd9462ffa7d9ccbe6.jpg"
    ],
    comments: [
        {
            user: "jasonl",
            postTime: ISODate("2019-04-26T02:58:40.652Z"),
            comments: "好公司"
        },
        {
            user: "jasonl",
            postTime: ISODate("2019-04-29T06:37:18.344Z"),
            comments: "node-content-sys 修改"
        },
        {
            user: "jason",
            postTime: ISODate("2019-04-30T03:34:26.364Z"),
            comments: "好单位"
        },
        {
            user: "紫灵",
            postTime: ISODate("2019-05-06T09:14:36.674Z"),
            comments: "韩立你给我出来！"
        },
        {
            user: "jasonlwy",
            postTime: ISODate("2019-05-07T01:23:36.118Z"),
            comments: "时间道纹"
        },
        {
            user: "韩立",
            postTime: ISODate("2019-05-07T01:27:06.419Z"),
            comments: "本道祖来了"
        }
    ],
    content: "智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院",
    description: "智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院智慧研究院",
    views: NumberInt("35"),
    addTime: ISODate("2019-04-26T02:03:00.954Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cd232bda96bd256bcd01128"),
    category: ObjectId("5cc6a0cb0a12e57fa4005e06"),
    title: "智慧城市研究院",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    comments: [ ],
    content: "### 智慧城市研究院                                   ",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("3"),
    addTime: ISODate("2019-05-08T01:36:16.732Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cd23a7f611ca15b48ed2005"),
    category: ObjectId("5cc6a0cb0a12e57fa4005e06"),
    title: "智慧城市研究院",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    comments: [ ],
    content: "![输入图片说明](http://www.cetccity.com/media/upload/motoya_055-720x480_%E5%89%AF%E6%9C%AC.jpg \"在这里输入图片标题\")      ",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("4"),
    addTime: ISODate("2019-05-08T02:08:11.726Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cd27c1f706b2d5560789fe3"),
    category: ObjectId("5cc6a0ac0a12e57fa4005e04"),
    title: "JavaScript案例",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    comments: [
        {
            user: "韩立",
            postTime: ISODate("2019-05-08T06:52:24.717Z"),
            comments: "这代码........"
        }
    ],
    content: "# 代码千万行 注释第一行 代码不规范 同事两行泪\r\n\r\n> 遍历  [ {\"a\": '1212',......} , {.......}] //{}是json格式 的方法\r\n\r\n`\r\n      var json = [\r\n    \t {\r\n    \t  \"a\": \"2018-09-07T20:00:00\",\r\n    \t  \"b\": 1265.3,\r\n    \t  \"v\": 123432432.9,\r\n    \t  \"w\": \"a\",\r\n    \t  \"radius7_quad\": {\r\n    \t    \"nbedddd\": 2540,\r\n    \t    \"sqeff\": 3150,\r\n    \t    \"swww\": 3150,\r\n    \t    \"ndwd\": 1350\r\n    \t  }, \r\n    ]`\r\n\r\n```\r\n   <script type=\"text/javascript\">\r\n    function jsonlwy( data ) {\r\n    \t//遍历数组的每个对\t\r\n    \tfor(var i = 0; i < data.length; i++){\r\n    \t\t//遍历json对象\r\n    \t\tvar json1 = data[i];\r\n    \t\t//遍历json对象\r\n    \t\tfor(var p in json1){\r\n    \t\tvar json2 = json1[p];\r\n    \t\t//打印显示\r\n    \t\tdocument.write(p + \": \"+ json1[p] +'</br>')\r\n      \t\tconsole.log(p + \" \" + json1[p]);\r\n                //判断是否是对象 再遍历\r\n    \t  \t\tif (typeof json1[p] === \"object\") {\r\n    \t  \t\t\t//遍历json对象\r\n    \t  \t\t\tfor(var q in json2){\r\n    \t  \t\t\t\t//打印显示\r\n    \t  \t\t\t\tdocument.write(q + \" : \"+ json2[q]+'</br>')\r\n    \t  \t\t\t\tconsole.log(q + \" \"+ json2[q] )\t\r\n    \t  \t\t\t}\r\n    \t  \t\t}\r\n    \t\t}\r\n     \t}\r\n    }\r\n    jasonlwy(json);\r\n    </script>\r\n```           ",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("10"),
    addTime: ISODate("2019-05-08T06:47:06.304Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cd2a8b3e4d37f333044124d"),
    category: ObjectId("5cc6a0880a12e57fa4005e02"),
    title: "杂学",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    comments: [ ],
    content: "## 前端性能优化\r\n\r\n> 一个项目的性能是非常重要的，除了要在技术层面上注意，更要在项目的设计之初就开始考虑，这样才可以使性能的各种隐形需求完美的整合到项目中，随着项目一起推进\r\n  性能最好具有可量化、可监测以及可改动的特性。网络越来越复杂，对网络的监控也变得越来越难因为监测的过程会受到包括设备、浏览器、协议、网络类型以及其他技术\r\n  CDN，ISP，缓存，代理服务器，防火墙，负载均衡器和服务器对性能的影响都很大）的很大影响。\r\n  \r\n#### 选择适合你的CDN\r\n  \r\n* 根据你的动态数据量，可以将一部分内容外包给静态网站生成工具，将它置于CDN上，从中生成一个静态版本，从而避免那些数据库的请求。也可以选择基于CDN的静态主机平台，通过交互组件丰富你的页面（JAMStack）\r\n\r\n* 注意CDN是否可以很好的处理（或分流）动态内容。没必要单纯的将你的CDN限制为静态。反复检查CDN是否执行了内容的压缩和转化，检查智能HTTP/2传输和缓存服务器（ESI），注意哪些静态或动态的部分处在CDN的边缘（最接近用户的服务器）\r\n\r\n#### 开始优化\r\n\r\n##### 直接确定优化顺序\r\n\r\n首先应该弄清楚你想解决的问题是什么。检查一遍你所有的文件（JavaScript，图片，字体，第三方script文件以及页面中重要的模块，例如轮播，复杂信息图标和多媒体内容），并将他们分类。\r\n列一个表格。明确浏览器上应该有的基础核心内容，哪些部分属于为高性能浏览器设计的升级体验，哪些是附加内容（那些不必要或者可以被延时加载的部分，例如字体，不必要的样式，轮播组件，播放器，社交网站入口，很大的图片）。更详细的细节请参考文章”Improving Smashing Magazine’s Performance‘’。\r\n\r\n##### 使用符合标准的技术\r\n\r\n使用符合标准的技术向过时的浏览器提供核心体验，向老式浏览器提供增强体验, 同时对所加载的内容要有严格的把控。即首要加载核心体验部分，将增强部分放在DomContentLoaded，把额外内容发在load事件中。\r\n\r\n以前我们可以通过浏览器的版本推断出设备的性能，但现在我们已经无法推测了。因为现在市场上很多廉价的安卓手机都不考虑内存限制和CPU性能，直接使用高版本的Chrome浏览器。一定要注意，在我们没有其他选择的时候，我们选择的技术同时可能成为我们的限制。\r\n\r\n##### 考虑微优化和渐进启动\r\n\r\n1. 在一些应用中，可以在渲染页面前先初始化应用。最好先显示框架，而不是一个进度条或指示器。使用可以加速初始渲染时间的模块或技术（例如tree-shaking和code-splitting），因为大部分性能问题来自于应用引导程序的初始分析时间。还可以在服务器上提前编译，从而减轻部分客户端的渲染过程，从而快速输出结果。最后，考虑使用Optimize.js来加快初始加载速度，它的原理是包装优先级高的调用函数（虽然现在已经没什么必要了）。\r\n2. 到底采用客户端渲染还是服务器端渲染？不论哪种做法，我们的目标都是建立渐进启动：使用服务器端渲染可以得到很短的首次有效渲染时间，这个渲染过程也包括小部分的JavaScript文件，目的是使交互时间尽可能的接近首次有效渲染时间。接下来，尽可能的增加一些应用的非必要功能。不幸的是，正如Paul Lewis所说，框架基本上对开发者是没有优先级的概念的，因此渐进启动在很多库和框架上是很难实施的。如果你有时间的话，还是考虑使用策略去优化你的性能吧\r\n\r\n##### 合理使用http的缓存头\r\n\r\n仔细检查一下例如expires，cache-control，max-age以及其他HTTP缓存头是否被正确的使用。一般来说，资源不论在短时间（如果它会被频繁改动）还是不确定的时间内（如果它是静态的）都是可缓存的——你大可在需要的时候在URL中成改版本。\r\n\r\n如果可能，使用为指纹静态资源设计的Cache-control:immutable，从而避免二次验证（2016年12月，只有FireFox在https://处理中支持）。你可以使用，Heroku的primer on HTTP caching headers，Jake Archibald的 ”Caching Best Practices”，还有IIya Grigorik的HTTP caching primer作为指导。\r\n\r\n##### 减少使用第三方库 加载JavaScript一步操作\r\n\r\n- 当用户请求页面时，浏览器会抓取HTML同时生成DOM，然后抓取CSS并建立CSS对象模型，最后通过匹配DOM和CSS对象生成渲染树。在需要处理的JavaScript文件被解决之前，浏览器不会开始对页面进行渲染。作为开发者，我们要明确的告诉浏览器不要等待，直接开始渲染。具体方法是使用HTML中的defer和async两个属性。\r\n- 事实上，defer更好一些（因为对于IE9及以下用户对于IE9及以下用户，很有可能会中断脚本）。同时，减少第三方库和脚本的使用，尤其是社交网站的分享按键和<iframe>嵌入（比如地图）。你可以使用静态的社交网站分享按键（例如SSBG的）和指向交互地图的静态链接去代替他们。\r\n\r\n##### 图片是否被正确优化\r\n\r\n1. 尽可能的使用带有srcset，sizes还有<picture>元素的响应式图片。你也可以利用<picture>元素的WebP格式，用JPEG格式作为替补（参见Andreas Bovens的code snippet）或是使用内容协商（使用接受头）。Sketch原本就支持WebP，WebP图片可以直接被Photoshop的WebP plugin导出。当然也有很多其他方法。\r\n2. 你也可以使用客户端提示，现在浏览器也可以做到。在用来生成响应图片的源文件过少时，使用响应图片断点生成器或类似Cloudinary的服务自动的优化图片。在很多案例中，单独使用sreset和sizes都带来了很大的收益。在本网站上，我们给文件添加-opt后缀——例如brotli-compression-opt.png；这样团队的每一个人就知道这些带着后最的图片是被优化过的。\r\n\r\n##### 再次优化图片\r\n\r\n当你在编写登陆界面的时候，发现页面上的图片加载的特别快，这时你需要确认一下JPEG格式文件是否已经通过mozJPEG（它可以操作扫描等级从而提高渲染时间）优化和压缩，PNG格式对应Pingo，GIF需要用到Lossy GIF，SVG要使用SVGOMG。对图片不重要的部分进行模糊处理（使用高斯模糊过滤器处理他们），从而减少文件大小，最后你可能还要去彩色化使图片变成黑白，从而减少更多的容量。对于背景图片，使用Photoshop保持0到10%的质量输出是绝对可以接受的。\r\n\r\n如果你还觉得不够，那你可以通过多重背景图片技术来提高图片的感知性能。                                    ",
    description: "前段知识杂技",
    views: NumberInt("7"),
    addTime: ISODate("2019-05-08T09:51:39.889Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cd3ee4ea0a08b4e8cddab79"),
    category: ObjectId("5cc6a0ac0a12e57fa4005e04"),
    title: "JavaScript代码块",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    comments: [ ],
    content: "### JavaScript代码\r\n> 实现node-admin-sys后台系统列表操作 弹出框删除操作\r\n\r\n```\r\n$('.dataID').each(function (index,element) {\r\n        //获取ID\r\n       $(this).click(function () {\r\n          let dataID = $(element).attr('value');\r\n          $('.test').text(dataID);\r\n          let string = '/admin/delete_content?id='+dataID\r\n          $('.delete').attr('href',string)\r\n      })\r\n })\r\n```                                    ",
    description: "实现node-admin-sys后台系统列表操作 弹出框删除操作",
    views: NumberInt("13"),
    addTime: ISODate("2019-05-09T09:01:55.883Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cd3ef1610eabe08705a01cc"),
    category: ObjectId("5cc6a0880a12e57fa4005e02"),
    title: "前端代码块",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    comments: [ ],
    content: "## 前端代码块\r\n\r\n> 测试\r\n\r\n```\r\n  <div class=\"modal-footer\">\r\n     <button type=\"button\" class=\"btn btn-white\" data-dismiss=\"modal\">关闭</button>\r\n          <a class=\"delete btn btn-primary\">确认</a>\r\n   </div>\r\n```                                    ",
    description: "打造新型智慧城市战略研究、创新转化、运营服务高地，推进新型智慧城市产业模式形成和产业板块聚集",
    views: NumberInt("24"),
    addTime: ISODate("2019-05-09T09:11:08.506Z"),
    __v: NumberInt("0")
} ]);
db.getCollection("contents").insert([ {
    _id: ObjectId("5cdd1120ac72c152688fb4b0"),
    category: ObjectId("5cc6a0ac0a12e57fa4005e04"),
    title: "toastr提示编写",
    user: ObjectId("5cd0dec5cd5b904130a9738e"),
    images: [ ],
    comments: [ ],
    content: "```\r\n<script>\r\n   var textSuc =  $('#tip').text().trim();\r\n   var textErr =  $('#err-tip').text().trim();\r\n    //提示配置信息\r\n    toastr.options = {\r\n        \"closeButton\": true,\r\n        \"debug\": false,\r\n        \"positionClass\": \"toast-top-right\",\r\n        \"onclick\": null,\r\n        \"showDuration\": \"300\",\r\n        \"hideDuration\": \"1000\",\r\n        \"timeOut\": \"5000\",\r\n        \"extendedTimeOut\": \"1000\",\r\n        \"showEasing\": \"swing\",\r\n        \"hideEasing\": \"linear\",\r\n        \"showMethod\": \"fadeIn\",\r\n        \"hideMethod\": \"fadeOut\"\r\n    }\r\n    //根据后台返回的数据结果显示提示的内容\r\n    //成功情况\r\n    if (textSuc === 'ok'){\r\n        toastr.success('栏目添加成功！！！')\r\n    } else if (textErr === \"err\"){\r\n        toastr.error('栏目添加不规范或为空或已存在!!!!!')\r\n    }\r\n</script>\r\n```                                 ",
    description: "插件描述：toastr是非阻塞通知的JavaScript库。jQuery是必需的。我们的目标是创建一个简单的核心库，可以自定义和扩展。",
    views: NumberInt("11"),
    addTime: ISODate("2019-05-16T07:25:52.025Z"),
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
    _id: ObjectId("5ccff44ee0343d19cc12e282"),
    username: "陆雨晴",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: false,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff734e0343d19cc12e283"),
    username: "jasonlwy",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: true,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff768e0343d19cc12e284"),
    username: "厉飞雨",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff87ee0343d19cc12e285"),
    username: "南宫婉",
    password: "dd5fef9c1c1da1394d6d34b248c51be2ad740840",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff89be0343d19cc12e286"),
    username: "紫灵",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff8c8e0343d19cc12e287"),
    username: "金童",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: true,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5ccff8f3e0343d19cc12e288"),
    username: "路人甲",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-06T08:45:31.371Z"),
    live: false,
    isBigadmin: false,
    __v: NumberInt("0")
} ]);
db.getCollection("users").insert([ {
    _id: ObjectId("5cd0dec5cd5b904130a9738e"),
    username: "韩立",
    password: "7c4a8d09ca3762af61e59520943dc26494f8941b",
    addTime: ISODate("2019-05-07T01:26:08.673Z"),
    live: true,
    isBigadmin: true,
    __v: NumberInt("0")
} ]);
