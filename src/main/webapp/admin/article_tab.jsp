<!doctype html>
<html lang="zh">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <%@include file="commont/linkHeader.jsp" %>
    <!-- Javascript -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/scripts/klorofil-common.js"></script>

    <script src="assets/upload/jQuery.upload.min.js" type="text/javascript"></script>
    <link href="assets/upload/upload.css" rel="stylesheet">

    <script type="text/javascript" src="assets/wangEditor/wangEditor.js"></script>

    <script type="text/javascript" src="assets/mypage/jqPaginator.min.js"></script>
    <script type="text/javascript" src="assets/mypage/myPage.js"></script>
    <link href="assets/mypage/myPage.css" rel="stylesheet">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">

    <%
        pageContext.setAttribute("activePage", "article");
    %>
    <%@include file="commont/header.jsp" %>

    <%@include file="commont/leftSider.jsp" %>
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <%@include file="content/article.jsp" %>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
</div>
<!-- END WRAPPER -->

</body>

</html>
