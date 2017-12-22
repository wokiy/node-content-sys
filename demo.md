limit(number)// 限制多少条

skip(2)//忽略前两条数据


每页显示 8条
 1 1-8 skip 0  (当前页面-1) *limit
 2 9-16 skip 8

 let page = n //前台用户page = 多少来访问   req.query.page || 1;
 let limit = 8
 let skip = (n-1) * m

User.count()//总条数







