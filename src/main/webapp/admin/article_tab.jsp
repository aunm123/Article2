<!doctype html>
<html lang="zh">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <%@include file="commont/linkHeader.jsp" %>
    <!-- Javascript -->
    <script src="/admin/assets/vendor/jquery/jquery.min.js"></script>
    <script src="/admin/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/admin/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/admin/assets/scripts/klorofil-common.js"></script>

    <script src="/admin/assets/upload/jQuery.upload.min.js" type="text/javascript"></script>
    <link href="/admin/assets/upload/upload.css" rel="stylesheet">

    <script type="text/javascript" src="/admin/assets/wangEditor/wangEditor.js"></script>

    <script type="text/javascript" src="/admin/assets/jqPaginator/jqPaginator.min.js"></script>
    <script type="text/javascript" src="/admin/assets/jqPaginator/myPage.js"></script>
    <link href="/admin/assets/jqPaginator/myPage.css" rel="stylesheet">
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
