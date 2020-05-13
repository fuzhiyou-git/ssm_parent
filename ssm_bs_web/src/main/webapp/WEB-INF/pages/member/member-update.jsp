<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>会员修改页面</title>
    <style>
        #pages, #total {
            font-weight: bold;
            font-size: 2ch;
            color: #9f191f;
        }

        #role_imfor {
            color: #1b6d85;
            font-size: 1.8ch;
            font-weight: bold;
        }


        #product {
            float: right;
            margin-right: 8px;
            margin-top: -4.72ch;
        }


        #memberUpdate, #memberCenter {
            border-radius: 5px/8px;
        }

        #add, #return {
            border-radius: 5px/8px;
        }

        /*标题的样式*/
        .tr_title {
            font-size: 2ch;
            font-weight: bold;

        }

        /*内容的样式*/
        .tbody_class {
            font-size: 1.8ch;
            font-weight: bold;
            color: #985f0d;
        }

        /*标题的背景颜色*/
        section form div[class="col-md-2 title"] {
            color: #9f191f;
            font-weight: bold;
        }

        /*输入内容方框的样式*/
        form div input[class="form-control"] {
            font-size: 1.68ch;
            font-weight: bold;
            border-radius: 15px/20px;
        }
    </style>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <b> 编辑会员</b>
                <small><b>表会员单</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${prc}/main.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>
            </ol>
        </section>


        <input type="hidden" name="id" value="${member.id}">
        <section class="content">
            <div class="panel panel-default" id="memberUpdate">
                <div class="panel-heading" id="role_imfor"><i>会员信息</i></div>
                <div id="product">
                    <button type="button" class="btn bg-purple-active" onclick="toMember_Product(${member.id})">添加产品
                    </button>
                </div>

                <form id="form">
                    <input type="hidden" value="${member.id}" name="id">
                    <div class="row data-type">
                        <div class="col-md-2 title">会员名称</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="name" value="${member.name}">
                        </div>
                        <div class="col-md-2 title">会员昵称</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="nickname" value="${member.nickname}">
                        </div>
                        <div class="col-md-2 title">电话号码</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="phoneNum" value="${member.phoneNum}">
                        </div>

                        <div class="col-md-2 title">邮箱</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="email" value="${member.email}">
                        </div>
                    </div>
                </form>
            </div>

            <div class="box-tools text-center">
                <button type="button" class="btn bg-maroon" onclick="updateMember()">保存
                </button>
                <button type="button" class="btn bg-olive-active" onclick="history.back(-1);">返回
                </button>
            </div>
            <hr class="line"/>
            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                <thead>
                <tr class="tr_title">
                    <th>产品编号</th>
                    <th>产品名称</th>
                    <th>出发城市</th>
                    <th>出发时间</th>
                    <th> 产品价格</th>
                    <th>产品描述</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
            </table>
            <div class="box-footer">
                <div class="pull-left">
                    <div class="form-group form-inline" id="select">
                        <b>总共 <span id="pages"></span> 页，共 <span
                                id="total"></span> 条数据</b>
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <ul class="pagination"></ul>
                </div>
            </div>
        </section>
    </div>

    <jsp:include page="../footer.jsp"/>
</div>

<script src="${prc}/js/member.js"></script>
<script>
    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(function () {
        showAllProducts(1, 3, ${member.id});
    });
</script>
</body>
</html>