<%--
  Created by IntelliJ IDEA.
  User: ltz80
  Date: 2020/2/4
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="webapp/js/jquery.min.js"></script>
    <script type="text/javascript" src="webapp/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="webapp/css/bootstrap.css"/>
    <script type="text/javascript" src="webapp/js/vue.min.js"></script>
    <script type="text/javascript" src="webapp/js/user.js"></script>
    <link rel="stylesheet" type="text/css" href="webapp/css/style.css"/>
</head>
<body>
<div id="main">
    {{ hello }}
    <div>
        <input type="text" class="text" placeholder="请输入编号"><button type="button" class="btn btn-info btn-sm">查询</button>
        <button type="button" class="btn btn-info btn-sm add">新增用户</button>
    </div>
    <div>
        <table  class="table table-bordered table-hover">
            <tr><th>编号</th><th>姓名</th><th>密码</th><th>性别</th><th>手机</th><th>电子邮件</th><th>状态</th><th>操作</th></tr>
            <tr v-for="user in heihei">
                <td>{{user.id}}</td>
                <td>{{user.username}}</td>
                <td>{{user.password}}</td>
                <td>{{user.sex}}</td>
                <td>{{user.phone}}</td>
                <td>{{user.email}}</td>
                <td>{{user.status}}</td>
                <td><button class="btn btn-danger btn-sm">更改</button>&nbsp;&nbsp;<button class="btn btn-danger btn-sm">删除</button></td>
            </tr>
        </table>
    </div>
    <div class="page">
        <button onclick="pageCount('previous')" class="btn btn-success btn-sm">上一页</button>
        <button onclick="pageCount('next')" class="btn btn-success btn-sm">下一页</button>
    </div>
</div>

</body>
</html>
