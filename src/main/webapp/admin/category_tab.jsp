<!doctype html>
<html lang="zh">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<%@include file="commont/linkHeader.jsp"%>

	<script src="/admin/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/admin/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/admin/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/admin/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/admin/assets/scripts/klorofil-common.js"></script>
	<script src="/admin/assets/treegrid/js/jquery.treegrid.js"></script>

	<link rel="stylesheet" href="/admin/assets/treegrid/css/jquery.treegrid.css" />
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">

        <%
            pageContext.setAttribute("activePage","category");
        %>
		<%@include file="commont/header.jsp"%>

		<%@include file="commont/leftSider.jsp"%>
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<%@include file="content/category.jsp"%>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->

</body>

</html>
