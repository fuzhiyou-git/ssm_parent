<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>系统日抗压量图</title>
    <style>
        #chartdiv {
            width: 100%;
            height: 500px;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <i class="fa fa-bar-chart-o"></i>
                            <h3 class="box-title"><b>系统日抗压量图</b></h3>
                        </div>
                        <div id="chartdiv"></div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../footer.jsp"/>

</div>
</body>


<script>
    am4core.ready(function () {
        getOnlineData();
    });
</script>
</html>
