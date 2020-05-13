<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<link rel="stylesheet" href="${prc}/css/product.css">
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <b>新建产品</b>
                <small><b>产品表单</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><b>首页</b></a></li>
            </ol>
        </section>

        <form id="addform">
            <section class="content">
                <div class="panel panel-default" id="productUpdate">
                    <div class="panel-heading" id="product_imfor"><i><b>产品信息
                    </b></i></div>
                    <div class="row data-type" id="productCenter">

                        <div class="col-md-2 title">产品编号</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="productNum" onblur="checkProductNum()"
                                   placeholder="产品编号">
                        </div>
                        <div class="col-md-2 title">产品名称</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="productName"
                                   placeholder="产品名称">
                        </div>
                        <div class="col-md-2 title">出发城市</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="cityName" placeholder="出发城市">
                        </div>

                        <div class="col-md-2 title">出发时间</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control pull-right"
                                   id="datepicker-a3" name="departureTime" placeholder="出发时间">

                        </div>

                        <div class="col-md-2 title">产品价格
                        </div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" placeholder="产品价格" name="productPrice">
                        </div>

                        <div class="col-md-2 title">产品状态</div>
                        <div class="col-md-4 data">
                            <select class="form-control" name="productStatus">
                                <option value="1">开启</option>
                                <option value="0">关闭</option>
                            </select>
                        </div>

                        <div class="col-md-2 title rowHeight2x">其他信息</div>
                        <div class="col-md-10 data rowHeight2x">
                            <input type="text" name="productDesc" style="height: 2.0cm" class="form-control">
                        </div>

                    </div>
                </div>
                <div class="box-tools text-center">
                    <button type="button" class="btn bg-red-active" onclick="addProduct()" disabled="disabled">
                        添加
                    </button>
                    <button type="button" class="btn bg-olive-active" onclick="history.back(-1);">返回
                    </button>
                </div>
            </section>
        </form>
    </div>
    <jsp:include page="../footer.jsp"/>

</div>
<script src="${prc}/js/product.js"></script>
<script>
</script>
</body>
</html>