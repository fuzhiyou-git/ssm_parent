<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>用户浏览量百分比</title>
    <style type="text/css">
        #pie {
            width: 1000px;
            height: 800px;
            font-size: 15ch;
            font-weight: bold;
            padding-top: -20ch;
            font-family: 黑体;
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
                            <h3 class="box-title"><b>用户浏览量百分比</b></h3>
                        </div>
                        <div id="pie"></div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../footer.jsp"/>
    </div>

</div>
<script>
    $(document).ready(function () {
        viUserAndCount();
    });
</script>
</body>
</html>