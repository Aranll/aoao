<%--
  Created by IntelliJ IDEA.
  User: GustinLau
  Date: 2017-04-07
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <%@include file="./common/head.jsp" %>
    <%@include file="./common/validate.jsp" %>
</head>
<body>
<div class="app app-header-fixed ">
    <div class="container w-xxl w-auto-xs">
        <div class="text-center m-t-lg">
            <img style="width: 300px" src="${sessionScope.config_logo.value}"/>
        </div>
        <div class="m-b-lg">
            <div class="text-center">
            </div>
            <form name="form" class="form-validation" method="post">
                <div id="errorText" class="text-danger wrapper text-center" style="height: 50px">

                </div>
                <div class="list-group list-group-sm">
                    <div class="list-group-item">
                        <input type="text" name="username" placeholder="用户名" class="form-control no-border"
                               required>
                    </div>
                    <div class="list-group-item">
                        <input type="password" placeholder="密　码" name="password" class="form-control no-border"
                               required>
                    </div>
                </div>
                <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
                <div class="line line-dashed"></div>
            </form>
        </div>
    </div>
</div>
<script>
    $("form[name='form']").validate({
        rules: {
            username: {required: true},
            password: {required: true}
        },
        messages: {
            username: {required: "请输入用户名"},
            password: {required: "请输入密码"}
        },
        submitHandler: function (form) {
            $("button[type='submit']").attr("disabled", true);
            doPost("<%=request.getContextPath()%>/admin/login", $(form).serialize(),
                function (data) {
                    if (data.status) {
                        window.location.href = "<%=request.getContextPath()%>/admin/index"
                    } else {
                        $("#errorText").html(data.msg);
                    }
                    $("button[type='submit']").attr("disabled", false);
                }, function (XMLHttpRequest, textStatus) {
                    alert("请求失败：" + textStatus + "\n错误码：" + XMLHttpRequest.status);
                    $("button[type='submit']").attr("disabled", false);
                });
        }
    });
</script>
</body>
</html>
