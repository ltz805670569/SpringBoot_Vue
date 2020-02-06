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
</head>
<body>
<div>
    <form id="form_data" class="form-horizontal" role="form">
        <div class="form-group">
            <label for="id" class="col-sm-2 control-label">编号</label>
            <div class="col-sm-4">
                <input v-model="id" type="text" class="form-control" id="id" disabled='disabled'>
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">名字</label>
            <div class="col-sm-4">
                <input v-model="username" type="text" class="form-control" id="username">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-4">
                <input v-model="password" type="text" class="form-control" id="password">
            </div>
        </div>
        <div class="form-group">
            <label for="sex" class="col-sm-2 control-label">性别</label>
            <div class="col-sm-4">
                <input v-model="sex" type="text" class="form-control" id="sex">
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label">手机号码</label>
            <div class="col-sm-4">
                <input v-model="phone" type="text" class="form-control" id="phone">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">电子邮件</label>
            <div class="col-sm-4">
                <input v-model="email" type="text" class="form-control" id="email">
            </div>
        </div>
        <div class="form-group">
            <label for="status" class="col-sm-2 control-label">状态</label>
            <div class="col-sm-4">
                <input v-model="status" type="text" class="form-control" id="status" disabled='disabled'>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-info" @click="updateUser">修改</button>
            </div>
        </div>

    </form>
</div>
<script type="text/javascript">
     var form_data = new Vue({
         el:"#form_data",
         data:{
             id:"",
             username:"",
             password:"",
             sex:"",
             phone:"",
             email:"",
             status:""
         },
         methods:{
             updateUser:function () {
                 $.ajax({
                     url:"updateUser",
                     type:"post",
                     data:{
                         "id":form_data.id,
                         "username":form_data.username,
                         "password":form_data.password,
                         "sex":form_data.sex,
                         "phone":form_data.phone,
                         "email":form_data.email
                     },
                     success:function (data) {
                         var msg = data.msg;
                         if(msg === "success"){
                             alert("修改成功");
                         }else if(msg === "fail"){
                             alert("修改失败");
                         }else {
                             alert("服务器异常");
                         }
                     }
                 });
             }
         }
     });
     $(function () {
         $.ajax({
             url:"toUpdateFront",
             type:"get",
             success:function (data) {
                 form_data.id = data.id;
                 form_data.username = data.username;
                 form_data.password = data.password;
                 form_data.sex = data.sex;
                 form_data.phone = data.phone;
                 form_data.email = data.email;
                 form_data.status = data.status;
             }
         });
     });
</script>
</body>
</html>
