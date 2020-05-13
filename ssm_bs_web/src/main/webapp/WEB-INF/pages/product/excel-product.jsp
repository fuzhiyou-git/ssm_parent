<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>导出产品详情表</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../aside.jsp"/>
    <div class="content-wrapper">
        <section class="content" style="text-align: center">
            <span style="font-size: 15px;font-weight: bold;color: #d33724">导出产品详情表</span><br><br>
            <form role="form" action="/excel/printExcel" method="post">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" name="inputDate" class="form-control pull-right" id="datepicker">
                    <span class="input-group-btn">
                    <button type="submit" class="btn btn-info btn-flat">submit</button>
                </span>
                </div>
            </form>

        </section>
        <div></div>


    </div>
    <jsp:include page="../footer.jsp"/>
</div>


<script>
    $('#datepicker').datepicker({
        language: "zh-CN",
        autoclose: true,
        format: 'yyyy-mm',
        startView: 'months', //开始视图层，为月视图层
        maxViewMode: 'years', //最大视图层，为年视图层
        minViewMode: 'months', //最小视图层，为月视图层
    });

</script>
</body>

</html>
