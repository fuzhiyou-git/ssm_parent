<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>产品首页</title>
    <style>
        #list {
            color: #1b6d85;
            font-size: 2ch;
        }

        #changePageSize {
            border-radius: 80px/100px;
            color: #9f191f;
            font-weight: bold;
        }

        #select {
            margin-top: 18px;
        }

        /*内容的css样式*/
        table tbody tr td {
            font-size: 1.68ch;
            font-weight: bold;
            color: #8677A7;
            text-align: center;

        }

        /* 标题的css样式 */
        table thead tr th {
            font-size: 1.9ch;
            font-weight: bold;
            text-align: center;
        }


        div input[name="productName"] {
            float: right;
            border-radius: 5px/10px;
            margin-right: 6px;
            font-weight: bold;
            color: black;
            padding-left: 5px;
            width: 15ch;

        }


        div input[name="cityName"] {
            float: right;
            border-radius: 5px/10px;
            margin-right: 5px;
            font-weight: bold;
            color: black;
            padding-left: 5px;
            width: 15ch;
        }

        /*搜索的按钮*/
        #baidu {
            float: right;
            background-color: #3c3c3c;
            color: white;
            border-radius: 5px/10px;
            margin-right: 7px;
        }

        div input[name="productPrice"] {
            float: right;
            width: 15ch;
            border-radius: 5px/10px;
            margin-right: 2px;
            font-weight: bold;
            color: black;
            padding-left: 5px;
        }

        #form-group {
            margin-top: 10px;
        }

        #table-box {
            margin-top: -3px;
        }


    </style>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content-header">
            <h1 id="productManment">
                产品管理
                <small><b>产品列表</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp">首页</a>
                </li>
            </ol>
        </section>


        <section class="content">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="table-box" id="table-box">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group" id="form-group">
                                    <button type="button" class="btn btn-github" onclick="refresh_product()">刷新</button>
                                    <button type="button" class="btn btn-success" onclick="toProduct()">新建</button>

                                    <button type="button" class="btn btn-github" onclick="delSelectedProduct()"> 删除选中
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <div>
                                    <div>
                                        <button type="button" onclick="showData(1,5)" id="baidu">
                                            <i class="fa fa-search"></i> 搜索
                                        </button>
                                        <input type="text" name="productPrice" placeholder="产品价格">
                                        <input type="text" name="cityName" placeholder="出发城市">
                                        <input type="text" name="productName" placeholder="产品名称">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div id="table">
                                <table class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th style="padding-right: 0px;"><input
                                                id="firstCb" type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                        <th>产品编号</th>
                                        <th>产品名称</th>
                                        <th>出发城市</th>
                                        <th>出发时间</th>
                                        <th>产品价格</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody"></tbody>
                                </table>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

                <jsp:include page="../box-footer.jsp"/>
            </div>
        </section>
    </div>

    <jsp:include page="../footer.jsp"/>

</div>
<script src="${prc}/js/product.js"></script>
<script>


    $(document).ready(function () {
        setSidebarActive();
    });


    //查询所有的产品
    $(document).ready(function () {
        showData(1, 5);
    });

</script>
</body>

</html>