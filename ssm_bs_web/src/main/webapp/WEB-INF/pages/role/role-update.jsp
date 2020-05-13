<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="${prc}/css/role.css">
    <title>修改角色页面</title>
</head>

<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">

    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">

        <section class="content-header">
            <h1>
                <b>角色管理</b>
                <small><b>角色表单</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>

            </ol>
        </section>

        <form id="form">
            <input type="hidden" name="id" value="${role.id}">
            <section class="content">
                <div class="panel panel-success">
                    <div class="panel-heading"><i><b>角色信息</b></i>
                    </div>
                    <hr class="line"/>

                    <div class="row data-type">
                        <div class="col-md-2 title" id="roleName">角色名称
                        </div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="roleName" value="${role.roleName}">
                        </div>

                        <div class="col-md-2 title" id="roleDesc">角色描述
                        </div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="roleDesc" value="${role.roleDesc}">
                        </div>
                    </div>
                </div>
                <div class="box-tools text-center">
                    <button type="button" class="btn bg-maroon" id="add" onclick="updateRole()">
                        保存
                    </button>
                    <button type="button" class="btn bg-olive-active"
                            id="return" onclick="history.back(-1);">返回
                    </button>
                </div>
                <hr class="line"/>

                <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr class="permission">
                        <th> ID</th>
                        <th> 资源权限名称</th>
                        <th> 描述</th>
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
        </form>
    </div>
    <jsp:include page="../footer.jsp"/>
</div>
<script src="${prc}/js/role.js"></script>
<script>

    $(document).ready(function () {
        setSidebarActive();
    });

    //查询角色已有的的资源权限
    $(document).ready(function () {
        showPermissionByRoleId(1, 3, ${role.id});
    });
</script>
</body>
</html>