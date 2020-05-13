<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>用户添加角色页面</title>
    <style>

        span[class="pages_total"] {
            font-weight: bold;
            font-size: 2ch;
            color: #9f191f;
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

        #line {
            border: 2px solid;
            color: #c9cccf;
            margin-top: 1.3ch;
        }

        #Nname {
            margin-top: 0.8ch;
            font-weight: bold;
            font-size: 3ch;
            margin-left: 0.78ch;
            color: sienna;
            float: left;
        }

        .roleName {
            color: #00a65a;
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
                <b>角色添加</b>
                <small><b>添加角色表单</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${prc}/main.jsp"><b>首页</b></a></li>
                <li class="active"><b>添加角色表单</b></li>
            </ol>
        </section>

        <div>
            <div id="line"></div>
            <div id="Nname">
                用户名:
                <a href="#" class="roleName">${user.username}</a></div>

        </div>

        <form>
            <section class="content">
                <input type="hidden" name="userId" value="${user.id}">
                <hr/>
                <table id="dataList"
                       class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr>
                        <th class="" style="padding-right: 0px">
                            <input id="firstCb"
                                   type="checkbox" class="icheckbox_square-blue"></th>
                        <th>ID</th>
                        <th>角色名称</th>
                        <th>角色描述</th>
                    </tr>
                    </thead>
                    <tbody id="tbody"></tbody>
                </table>
                <div class="box-tools text-center">
                    <button type="button" class="btn bg-maroon" onclick="addRoleToUser(${user.id})">添加
                    </button>
                    <button type="button" class="btn bg-olive-active"
                            onclick="history.back(-1);">返回
                    </button>
                </div>
            </section>
        </form>
        <div class="box-footer">
            <div class="pull-left">
                <div class="form-group form-inline">
                    <b>总共 <span class="pages_total" id="pages"></span> 页，共 <span class="pages_total" id="total"></span>
                        条数据</b>
                </div>
            </div>

            <div class="box-tools pull-right">
                <ul class="pagination"></ul>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"/>
</div>

<script src="${prc}/js/user.js"></script>
<script>
    $(document).ready(function () {
        setSidebarActive();
    });
    $(document).ready(function () {
        findNoRoleByUserId(1, 5, '${user.id}');
    });

</script>
</body>
</html>