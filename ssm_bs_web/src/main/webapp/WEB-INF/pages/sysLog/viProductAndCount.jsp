<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>产品销量</title>
    <style type="text/css">
        #cylindrical {
            text-align: center;
            width: 980px;
            height: 480px;
            font-size: 1ch;
            font-weight: bold;
            padding-left: 8ch;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../aside.jsp"/>
    <div class="content-wrapper">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <i class="fa fa-bar-chart-o"></i>
                            <h3 class="box-title"><b>产品销量柱状图</b></h3>
                        </div>
                        <div id="cylindrical"></div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../footer.jsp"/>


</div>
<script type="text/javascript">

    $(document).ready(function () {
        viProductAndCount();
    });

</script>
</body>
</html>