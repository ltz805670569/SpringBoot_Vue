<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
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
    <div id="form_data">
        <label>
            <input v-model="userId" type="text" class="text" placeholder="请输入编号">
        </label>
        <button type="button" class="btn btn-info btn-sm" @click="selUser">查询</button>
        <a class="btn btn-info btn-sm add" href="toAdd">新增用户</a>
    </div>
    <div id="data">
        <table  class="table table-bordered table-hover">
            <tr><th>编号</th><th>姓名</th><th>密码</th><th>性别</th><th>手机</th><th>电子邮件</th><th>状态</th><th>操作</th></tr>
            <tr v-for="(user,index) in arr">
                <td>{{user.id}}</td>
                <td>{{user.username}}</td>
                <td>{{user.password}}</td>
                <td>{{user.sex}}</td>
                <td>{{user.phone}}</td>
                <td>{{user.email}}</td>
                <td>{{user.status}}</td>
                <td><button class="btn btn-danger btn-sm" @click="updateTransfer(index)">更改</button>&nbsp;&nbsp;<button class="btn btn-danger btn-sm" @click="deleteUser(index)">删除</button></td>
            </tr>
        </table>
    </div>
    <div id ="pageStyle" class="page">
        <button  onclick="pageCount('previous')" class="btn btn-success btn-sm">上一页</button>
        <button  onclick="pageCount('next')" class="btn btn-success btn-sm">下一页</button>
    </div>
    <script type="text/javascript">

        var table = new Vue({
            el: "#data",
            data: {
                arr:"",
            },
            methods: {
                updateTransfer:function (index) {
                    var user = table.arr[index];
                    $.ajax({
                        url:"updateTransfer",
                        type:"post",
                        data:{
                            "id":user.id,
                            "username":user.username,
                            "password":user.password,
                            "sex":user.sex,
                            "phone":user.phone,
                            "email":user.email,
                            "status":user.status
                        },
                        success:function (data) {
                            var msg = data.msg;
                            if(msg === "success"){
                                // window.location.href = 'http://www.baidu.com'  //当前页面打开
                                window.open('toUpdate')  //新窗口打开
                            }
                        }
                    });
                },
                deleteUser:function(index){
                    // alert(index);
                    var id = table.arr[index].id;
                    // alert(id);
                    $.ajax({
                        url:"deleteUser",
                        type:"post",
                        data:{"id":id},
                        success:function (data) {
                            var msg = data.msg;
                            if(msg === "success"){
                                alert("删除成功");
                                location.reload();
                            }else if(msg === "fail"){
                                alert("删除失败");
                                location.reload();
                            }else {
                                alert("服务器异常");
                                location.reload();
                            }
                        }
                    });
                }
            }
        });

        var form_data = new Vue({
            el:"#form_data",
            data:{
                userId:"",
            },
            methods:{
                selUser:function(){
                    $.ajax({
                        url:"selOne",
                        type:"get",
                        data:{"userId":form_data.userId},
                        success:function(data){
                            table.arr = data;
                            $("#pageStyle").css("display","none");
                        }
                    });
                }
            }
        });

        $(function () {
            $.ajax({
                url: "selAll",
                type: "get",
                success: function (data) {
                    pages = data.pages;
                    pageSize = data.pageSize;
                    pageNum = data.pageNum;
                    table.arr = data.userList;
                    // console.log(table.user);
                }
            });
        });
    </script>
</div>

</body>
</html>