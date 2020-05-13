<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<script src="${prc}/js/role.js"></script>
<head>
    <link rel="stylesheet" href="${prc}/css/role.css">
    <title>角色权限界面</title>
    <style>

        #rName {
            margin-top: 1ch;
            font-weight: bold;
            font-size: 3ch;
            margin-left: 0.78ch;
            color: sienna;

            float: left;
        }

        .roleName {
            color: #00a65a;
        }

        a.roleName:hover {

            color: sienna;
        }

        section div b span {
            font-weight: bold;
            font-size: 2ch;
            color: #9f191f;
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
                <b>角色管理</b>
                <small><b>添加权限表单</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><b>首页</b></a></li>

            </ol>
        </section>

        <div>
            <div class="line"></div>
            <div id="rName">角色名称:
                <a class="roleName"><i>${role.roleName}</i></a></div>
        </div>
        <hr>
        <section class="content">
            <input type="hidden" name="roleId" value="${role.id}">
            <table id="dataList"
                   class="table table-bordered table-striped table-hover dataTable">
                <thead>
                <tr>
                    <th class="" style="padding-right: 0px">
                        <input id="firstCb"
                               type="checkbox" class="icheckbox_square-blue"></th>
                    <th>ID</th>
                    <th>权限名称</th>
                    <th>权限描述</th>
                </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
            </table>

            <div class="box-tools text-center">
                <button type="button" class="btn bg-maroon" onclick="addPermissionToRole(${role.id})">
                    添加
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
<script>

    $(document).ready(function () {
        findNoPermissionByRoleId(1, 3, ${role.id});
    });
</script>
</body>
</html>