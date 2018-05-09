<%@ page import="com.entity.User" %>
<%@ page import="com.util.EmptyUtil" %>
<!doctype html>
<html lang="zh" class="fullscreen-bg">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    User user = (User) request.getSession().getAttribute("user_session");
    if (EmptyUtil.isNotEmpty(user)){
        response.sendRedirect("admin/index.jsp");
    }
%>
<%--<base href="<%=basePath %>"/>--%>

<head>
    <title>Login | Klorofil - Free Bootstrap Dashboard Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="admin/assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="admin/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="admin/assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <%--<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">--%>
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="admin/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="admin/assets/img/favicon.png">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left left-content">
                    <div class="content">
                        <div class="header">
                            <div class="logo text-center"><img src="admin/assets/img/logo-dark.png" alt="Klorofil Logo">
                            </div>
                            <p class="lead">后台登录</p>
                        </div>
                        <form class="form-auth-small" action="loginac" method="post">
                            <div class="form-group">
                                <label for="signin-email" class="control-label sr-only">用户名</label>
                                <input type="text" class="form-control" id="signin-email"
                                       value="" name="username" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <label for="signin-password" class="control-label sr-only">密码</label>
                                <input type="password" class="form-control" id="signin-password"
                                       value="" name="userpassword" placeholder="密码">
                            </div>
                            <div class="form-group">
                                <label for="signin-google" class="control-label sr-only">谷歌验证码</label>
                                <input type="text" class="form-control" id="signin-google"
                                       value="" name="googlecode" placeholder="谷歌验证码">
                            </div>
                            <%--<div class="form-group clearfix">--%>
                                <%--<label class="fancy-checkbox element-left">--%>
                                    <%--<input type="checkbox">--%>
                                    <%--<span>Remember me</span>--%>
                                <%--</label>--%>
                            <%--</div>--%>
                            <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                        <%--<h1 class="heading">后台登录</h1>--%>
                        <%--<p>后台登录</p>--%>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

</html>
