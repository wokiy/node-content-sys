# node-content-sys(还未修改好20190508)
>node内容发布系统,界面布局统一使用响应式boostrap布局，ejs 数据渲染，后台(也是boostrap实现布局)实现node-content-sys的管理，数据库是使用mongodb实现存储。
## node-content-sys 小项目需求整理
1. 具备信息发布系统的特性
2. 具备后台管理的能力
3. 具备小型商品上架和销售的能力
4. 具备在线支付的能力
## 页面展示

#### 首页展示
 ![node博客首页](/public/img/a.png)
#### 文章展示和评论

 ![node文章展示页](/public/img/d.jpg)
#### 登陆页面展示（markdown编辑器发布的效果）

> 原理是node express Web框架 使用markdown-js模块 ， 将markdown语法的 'content' 内容转换为 html 再ejs模板中直接渲染!!!

 ![node文章展示页](/public/img/AS.png)
## 后台展示

#### 后台首页
 ![node后台展示页面](/public/img/c.jpg)
#### 用户列表管理
> 已实现查询所有用户展示修改（20190430具体用户操作代码还没上传！！！！）
![用户列表](/public/img/f.png)

1. 列表用户操作确认弹出框添加(用户删除操作 是伪删除 用户数据是宝贵的 不会随便删除！！！！)

![用户操作](/public/img/aa.png)
#### 文章发布管理 
> 内容界面实现 文章内容添加实现

![用户列表](/public/img/SS.png)

#### 内容管理后台内容展示列表 

> 内容列表无限展示 点击内容title实现跳转到前台页面

![内容列表展示](/public/img/QQ.jpg)

#### 内容列表

> 已实现内容文章删除功能

![列表](/public/img/LL.png)



## 项目运行
1. 具备node环境 npm install
2. 具备 mongodb 并且服务开启(自己配置数据库 新建数据库 本人数据库:blog2 以提供基本mongodb数据库脚本 public 目录下 mongodb.sql)

   



