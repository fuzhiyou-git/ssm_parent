<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>会员添加产品界面</title>
    <style>
        span[class="pages_total"] {
            font-weight: bold;
            font-size: 2ch;
            color: #9f191f;
        }

        div input[name="productNum"] {
            float: right;
            width: 16ch;
            border-radius: 5px/10px;
            margin-top: 2ch;
            font-weight: bold;
            margin-right: 48px;
        }

        div input[name="productName"] {
            float: right;
            width: 16ch;
            border-radius: 5px/10px;
            margin-top: 2ch;
            font-weight: bold;
            margin-right: 35px;
        }

        /*搜索的按钮*/
        #baidu {
            float: right;
            background-color: #3c3c3c;
            color: white;
            border-radius: 5px/10px;
            margin-right: 7ch;
            margin-top: 2ch;
            margin-left: -5ch;
        }


        #memberName {
            color: sienna;
            font-size: 3.8ch;
            font-weight: bold;
            padding-left: 18px;
        }


        /*标题的样式*/
        table thead tr th {
            font-size: 2ch;
            font-weight: bold;
            text-align: center;
        }

        /*内容的样式*/
        table tbody tr td {
            font-size: 1.8ch;
            color: #5d59a6;
            font-weight: bold;
            text-align: center;

        }
    </style>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content-header">
            <ol class="breadcrumb">
                <li><a href="/main.jsp">首页></a></li>
                <li><a href="/member/toMember">会员列表</a></li>
            </ol>
        </section>
        <div>
            <div><span id="memberName">会员名:${member.name}</span></div>

            <div>
                <div>
                    <button type="button" id="baidu" onclick="findAllNoProductByMemberId(1,5,${member.id})">
                        <i class="fa fa-search"></i> 搜索
                    </button>
                    <input type="text" name="productNum" placeholder="产品编号">
                    <input type="text" name="productName" placeholder="产品名称">

                </div>
            </div>
        </div>

        <br>
            <section class="content">
                <input type="hidden" name="memberId" value="${member.id}">
                <br>
                <table id="dataList"
                       class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr>
                        <th style="padding-right: 0px">
                            <input id="firstCb" type="checkbox" class="icheckbox_square-blue"></th>
                        <th>产品编号</th>
                        <th>产品名称</th>
                        <th> 出发城市</th>
                        <th>出发时间</th>
                        <th>产品价格</th>
                        <th>产品描述</th>
                        <th>产品状态</th>
                    </tr>
                    </thead>
                    <tbody id="tbody"></tbody>
                </table>

                <div style="text-align: center">
                    <button type="button" class="btn bg-maroon" onclick="addProductToMember(${member.id})">添加
                    </button>
                    <button type="button" class="btn bg-olive-active"
                            onclick="history.back(-1);">返回
                    </button>
                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <b>总共 <span class="pages_total" id="pages"></span> 页，共 <span class="pages_total"
                                                                                             id="total"></span> 条数据</b>
                            </div>
                        </div>

                        <div class="box-tools pull-right">
                            <ul class="pagination"></ul>
                        </div>
                    </div>
                </div>
            </section>
    </div>

    <jsp:include page="../footer.jsp"/>
</div>
<script src="${prc}/js/member.js"></script>
<script>

    $(document).ready(function () {
        setSidebarActive();
    });

    $(document).ready(function () {
        findAllNoProductByMemberId(1, 5, ${member.id});
    });

</script>
</body>
</html>
