<!doctype html>
<html lang="zh">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <%@include file="commont/linkHeader.jsp"%>
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">

    <%@include file="commont/header.jsp"%>

    <%@include file="commont/leftSider.jsp"%>

    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <%@include file="content/homepage.jsp"%>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
</div>
<!-- END WRAPPER -->
<%@include file="commont/footer.jsp"%>
<script>
    $(function() {
        var data, options;

        // headline charts
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [23, 29, 24, 40, 25, 24, 35],
                [14, 25, 18, 34, 29, 38, 44],
            ]
        };

        options = {
            height: 300,
            showArea: true,
            showLine: false,
            showPoint: false,
            fullWidth: true,
            axisX: {
                showGrid: false
            },
            lineSmooth: false,
        };

        new Chartist.Line('#headline-chart', data, options);

    });
</script>
</body>

</html>
