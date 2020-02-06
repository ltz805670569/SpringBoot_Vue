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
        <label for="username" class="col-sm-2 control-label">名字</label>
        <div class="col-sm-4">
            <input v-model="username" type="text" class="form-control" id="username" placeholder="请输入名字">
        </div>
    </div>

    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-4">
            <input v-model="password" type="text" class="form-control" id="password" placeholder="请输入密码">
        </div>
    </div>
    <div class="form-group">
        <label for="sex" class="col-sm-2 control-label">性别</label>
        <div class="col-sm-4">
            <input v-model="sex" type="text" class="form-control" id="sex" placeholder="请输入性别">
        </div>
    </div>
    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">手机号码</label>
        <div class="col-sm-4">
            <input v-model="phone" type="text" class="form-control" id="phone" placeholder="请输入手机号码">
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="col-sm-2 control-label">电子邮件</label>
        <div class="col-sm-4">
            <input v-model="email" type="text" class="form-control" id="email" placeholder="请输入电子邮件">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-info" @click="addUser">新增</button>
        </div>
    </div>

</form>
</div>

<script type="text/javascript">

      var form_data = new Vue({
          el:"#form_data",
          data:{
              username:"",
              password:"",
              sex:"",
              phone:"",
              email:""
          },
          methods:{
              addUser:function(){
                  $.ajax({
                      url:"addUser",
                      type:"post",
                      data:{
                          "username": form_data.username,
                          "password": form_data.password,
                          "sex": form_data.sex,
                          "phone": form_data.phone,
                          "email": form_data.email
                      },
                      success:function(data){
                          var msg = data.msg;
                          if(msg === "success"){
                              alert("添加成功");
                          }else if(msg === "fail"){
                              alert("添加失败");
                          }else {
                              alert("服务器异常");
                          }
                      }
                  });
              }
          }
      })
</script>

</body>
</html>
