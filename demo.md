limit(number)// 限制多少条

skip(2)//忽略前两条数据


每页显示 8条
 1 1-8 skip 0  (当前页面-1) *limit
 2 9-16 skip 8

 let page = n //前台用户page = 多少来访问   req.query.page || 1;
 let limit = 8
 let skip = (n-1) * m

User.count()//总条数


  Content.find({}).sort({_id:-1}).populate(['category','user']).then(function (contents) {
          //空数组 存储过滤处理好的时间数据
          let arr =[];
          //遍历内容中的 博文时间过滤处理
          for(let i=0;i<contents.length;i++){
              let nowT = contents[i].addTime;
              let now = moment(nowT).format("YYYY-MM-DD HH:mm:ss");
              arr.push(now);
          }
          //markdown语法展示
          let text = content.content;
          let html = markdown.makeHtml(text);
          //评论数目
          let comments = contents.length;
          console.log(contents);
  
          //阅读数目
          let views= contents.views;
          //内容渲染到指定页面
          res.render('node-admin-sys-blog',{
              contents:contents,
              arr:arr,
              contentHtml: html,
              comments:comments,
              views:views
          });
      });





            <%
                if(!contents && contents.length ===0){
            %>
                <div class="post-head">
                    当前没有博文!!!!!
                </div>
            <%
              }else{
                for(let i=0;i<contents.length;i++){
            %>
            <div class="ibox">
                <div class="ibox-content">
                    <a href="/views" class="btn-link">
                        <h2>
                         <!--title-->
                            <%=contents[i].title%>
                        </h2>
                    </a>
                    <div class="small m-b-xs">
                        <strong><%=contnets[i].user.username%></strong>
                        <span class="text-muted">
                            <i class="fa fa-clock-o"><%=arr[i].toString()%></i>
                        </span>
                    </div>
                    <p>
                        <%-contentHtml%>
                    </p>
                    <div class="row">
                        <div class="col-md-6">
                            <h5>标签：</h5>
                            <button class="btn btn-primary btn-xs" type="button"><%=contents[i].category.name%></button>
                        </div>
                        <div class="col-md-6">
                            <div class="small text-right">
                                <h5>状态：</h5>
                                <div> <i class="fa fa-comments-o"> </i> <%=comments%> 评论 </div>
                                <i class="fa fa-eye"> </i> <%=views%> 浏览
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            }
            %>




   <%
            for(let i = 0;i<contents.length;i++){
            %>
            <div class="ibox">
                <div class="ibox-content">
                    <a href="article.html" class="btn-link">
                        <h2>
                            <a href="/views?id=<%=contents[i]._id%>" target="_blank"><%=contents[i].title%></a>
                        </h2>
                    </a>
                    <div class="small m-b-xs">
                        <strong><%=contents[i].user.username%></strong> <span class="text-muted"><i class="fa fa-clock-o"></i> <%=arr[i]%></span>
                    </div>
                    <p>
                        <%=contents[i].description%>
                    </p>
                    <div class="row">
                        <div class="col-md-6">
                            <h5>标签：</h5>
                            <button class="btn btn-primary btn-xs" type="button"><%=contents[i].category.name%></button>
                        </div>
                        <div class="col-md-6">
                            <div class="small text-right">
                                <h5>状态：</h5>
                                <div> <i class="fa fa-comments-o"> </i> <%=comments%>评论 </div>
                                <i class="fa fa-eye"> </i> <%=views%> 浏览
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
            
            
            
            
             <div class="about-author clearfix">
                                <!--<a href="/author/wangsai/"><img src="http://static.ghostchina.com/image/5/ea/da657733ee8c9add9cf3fd70183a6.png" alt="王赛" class="avatar pull-left"></a>-->
            
                                <!--未登录显示-->
                                <%
                                if(!session.loginUser){
                                %>
                                    <a href="/login" class="btn btn-default btn-block">你 还 没 登 陆 请 ! 先 登 陆 再 评 论</a>
                                    <br>
            
                                    <ul class="list-group">
                                        <%
                                        if(!content && content.toString() == ""){
                                        %>
                                            <li class="list-group-item"><strong>没有评论！！！！</strong></li>
                                        <%
                                        } else{
                                        for(let i = 0;i < content.comments.length;i++){
            
            
                                        if (content.comments[i].live === true) {
                                            //评论激活的情况下
                                        %>
                                        <li class="list-group-item">
                                            <div class="left">
                                                 <span style=" display:inline-block;width: 50px;margin: 0 auto;">
                                                     <!--头像-->
                                                         <img class="img-responsive" src="<%= content.comments[i].images %>"
                                                              alt="用户头像">
                                                 </span>
                                                <span class="strong1">
                                                <!--<i class="glyphicon glyphicon-user"></i>-->
                                                <strong>
                                                    <%= content.comments[i].user %>: &nbsp;&nbsp;
                                                </strong>
                                             </span>
                                            </div>
            
                                            <div class="right">
                                                <span class=""><%= content.comments[i].comments %></span>
                                                <span class=" pull-right">
                                                 <%= arr[i] %>
                                            </span>
                                            </div>
            
                                        </li>
                                        <%
                                        }
            
                                        }
                                        }
                                        %>
                                    </ul>
                                    <!--<a href="#" class="btn btn-success pull-right" style="margin-left:5px; ">下一页</a>-->
                                    <!--<span class="page-number">当前第  页&nbsp; 总共2页</span>-->
                                    <!--<a href="#" class="btn btn-success pull-right">上一页</a>-->
                                    <%
                                    }else {
                                    %>
                                        <!--已登陆显示 评论表单!!!!-->
                                        <form action="/addComments" method="post" id="reportPicform">
                                            <div class="form-group ">
                                                <label for="comments">发表评论</label>
                                                <input type="hidden" name="id" value="<%= content._id %>">
                                                <input id="comments" style="border: 1px #7fa785 solid" type="text"
                                                       class="form-control"
                                                       name="comments">
                                                <!--<input type="submit" class="btn-primary pull-right addC" value="提交评论">-->
                                                <button id="inputButton" type="button" class="btn btn-default pull-right addC"
                                                        onclick="submitComm()">提交评论
                                                </button>
                                            </div>
                                        </form>
                                        <br>
                                        <br>
            
                                        <ul class="list-group">
                                            <%
                                            if(!content && content.toString() == ""){
                                            %>
                                                <li class="list-group-item"><strong>没有评论！！！！</strong></li>
                                            <%
                                            } else{
                                            for(let i = 0;i < content.comments.length;i++){
                                            if (content.comments[i].live === true) {
                                            %>
                                                <li class="list-group-item">
                                                    <div class="left">
                                                 <span style=" display:inline-block;width: 50px;margin: 0 auto;">
                                                    <img class="img-responsive" src="<%= content.comments[i].images %>" alt="用户头像">
                                                </span>
                                                        <span class="strong1">
                                                <!--<i class="glyphicon glyphicon-user"></i>-->
                                                <strong>
                                                    <%= content.comments[i].user %>: &nbsp;&nbsp;
                                                </strong>
                                             </span>
                                                    </div>
            
                                                    <div class="right">
                                                        <span class=""><%= content.comments[i].comments %></span>
                                                        <span class=" pull-right">
                                                 <%= arr[i] %>
                                            </span>
                                                    </div>
            
                                                </li>
                                            <%
                                            }
                                            }
                                            %>
                                        </ul>
                                        <!--<button type="button" class="btn btn-success pull-right" style="margin-left:5px; ">下一页</button>-->
                                        <!--<button type="button" class="btn btn-success pull-right">上一页</button>-->
                                    <%
                                    }
                                    }
                                    %>
            
                            </div>


