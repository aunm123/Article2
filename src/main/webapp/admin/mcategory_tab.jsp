<!doctype html>
<html lang="zh">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <%@include file="commont/linkHeader.jsp"%>

    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/vendor/chartist/js/chartist.min.js"></script>
    <script src="assets/scripts/klorofil-common.js"></script>
    <script src="assets/treegrid/js/jquery.treegrid.js"></script>

    <link rel="stylesheet" href="assets/treegrid/css/jquery.treegrid.css" />
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">

    <%
        pageContext.setAttribute("activePage","mcategory");
    %>
    <%@include file="commont/header.jsp"%>

    <%@include file="commont/leftSider.jsp"%>
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <%@include file="content/mcategory.jsp"%>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->

</body>

</html>
