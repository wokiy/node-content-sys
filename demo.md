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




