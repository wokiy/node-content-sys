# node-content-sys (最后打算在完善下 发布到线上)
>node内容发布系统,界面布局统一使用响应式布局，ejs 数据渲染，后台响应式布局实现node-content-sys的管理后台关系系统，数据库是使用mongodb实现存储。
## node-content-sys 小项目需求整理（小项目基本功能已经实现不再修改）
> 小项目缺陷： 没有对表单添加判断操作，按照最正确的方式擦做表单即可。
1. 具备信息发布系统的功能
2. 具备后台管理系统和前台系统
3. 具备session登陆管理和评论管理
4. 具备markdown语法发布内容
5. 具备图片上传功能
## 页面展示
#### 首页展示
  > 内容列表具体看个人爱好
  
![ss](/public/img/ii.png)  

#### 文章展示和评论

 ![node文章展示页](/public/img/view.png)
 
#### 登陆页面展示（markdown编辑器发布的效果）

> 原理是node express Web框架 使用markdown-js模块 ， 将markdown语法的 'content' 内容转换为 html 再ejs模板中直接渲染!!!

 
 #### 资源查询
 
 > 统一返回界面
 
 ![界面显示](/public/img/none.png)
 
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


#### 内容添加成功显示

![内容成功发布](/public/img/add.png)

##### 内容首页封面图片添加或内容图片添加功能
> 简单markdown 语法加单独图片上传功能

![图片](/public/img/p1.png)

![图片](/public/img/p2.png)

#### 内容列表
> 已实现内容文章删除功能

![列表](/public/img/LL.png)

#### 栏目管理
> 实现栏目列表展示、栏目添加、栏目添加tip提示、栏目修改编辑

![栏目编辑](/public/img/CC.png)

#### 用户评论列表

>全部展示用户评论的列表

![全部评论](/public/img/comments.png) 

##### 增加评论id管理
![id](/public/img/id.png)

##### 评论删除功能实现
> 根据live状态伪删除用户评论(具体看源码操作)
![评论删除](/public/img/admin_delete.png)



## 项目整体架构分析
> 技术选型 node express+ejs boostrap
 
1. web应用程序{Express 是一种保持最低程度规模的灵活 Node.js Web 应用程序框架，为 Web 和移动应用程序提供一组强大的功能}
2. API {各种HTTP使用程序方法和中间件，快速方便地创建强大的API}
3. 性能 {EXpress 提供精简 web应用程序功能}



## mongodb数据库设计
> node操作mongodb数据库实现 （还木有添加）

## 项目运行
1. 具备node环境 npm install
2. 具备 mongodb 并且服务开启(自己配置数据库 新建数据库 本人数据库:blog2 以提供基本mongodb数据库脚本 public 目录下 mongodb.sql)

   



