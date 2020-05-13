<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>

<head>
    <link rel="stylesheet" href="${prc}/css/product.css">
    <title>产品修改页面</title>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <b>产品管理</b>
                <small><b>产品表单</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp">首页</a></li>
            </ol>
        </section>


        <form id="form">
            <input type="hidden" name="id" value="${product.id}">
            <section class="content">
                <div class="panel panel-default">
                    <div class="row data-type">

                        <div class="col-md-2 title">产品编号</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="productNum" value="${product.productNum}">
                        </div>
                        <div class="col-md-2 title">产品名称</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="productName" value="${product.productName}">
                        </div>

                        <div class="col-md-2 title">出发城市</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="cityName" value="${product.cityName}">
                        </div>

                        <div class="col-md-2 title">出发时间</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control"
                                   id="datepicker-a3" name="departureTimeStr" value="${product.departureTimeStr}">
                        </div>

                        <div class="col-md-2 title">产品价格</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="productPrice" value="${product.productPrice}">
                        </div>

                        <div class="col-md-2 title">产品状态</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" value="${product.productStatusStr}"
                                   readonly="readonly">

                        </div>

                        <div class="col-md-2 title rowHeight2x">其他信息
                        </div>
                        <div class="col-md-10 data rowHeight2x">
                            <input type="text" name="productDesc" style="height: 2.0cm" class="form-control"
                                   value="${product.productDesc}">
                        </div>

                    </div>
                </div>
                <div class="box-tools text-center">
                    <button type="button" class="btn bg-maroon" onclick="updateProduct()">保存
                    </button>
                    <button type="button" class="btn bg-olive-active" onclick="history.back(-1);">返回
                    </button>
                </div>
            </section>

        </form>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>

</div>

<script src="${prc}/js/product.js"></script>
<script>
    $(document).ready(function () {
        // 激活导航位置
        setSidebarActive("order-manage");
        $("#datepicker-a3").datetimepicker({
            format: "yyyy-mm-dd hh:ii",
            autoclose: true,
            todayBtn: true,
            language: "zh-CN"
        });
    });


</script>
</body>
</html>