<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="${prc}/css/user.css">
    <title>修改用户页面</title>

</head>

<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <b>用户编辑</b>
                <small><b>用户表单</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><b>首页</b></a></li>
            </ol>
        </section>


        <form id="form">
            <input type="hidden" value="${usersInfo.id}" name="id">
            <section class="content">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>用户信息</b>
                    </div>

                    <div class="row data-type">
                        <div class="col-md-2 title">用户名称</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="username"
                                   value="${usersInfo.username}">
                        </div>
                        <div class="col-md-2 title">邮箱
                        </div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="email"
                                   value="${usersInfo.email}">
                        </div>
                        <div class="col-md-2 title">联系电话</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="phoneNum"
                                   value="${usersInfo.phoneNum}">
                        </div>

                        <div class="col-md-2 title">用户状态</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="statusStr"
                                   readonly="readonly"
                                   value="${usersInfo.statusStr}">
                        </div>
                    </div>
                </div>

                <div class="box-tools text-center">
                    <button type="button" class="btn bg-maroon" onclick="updateUer()">
                        保存
                    </button>
                    <button type="button" class="btn bg-olive-active" onclick="history.back(-1);">
                        返回
                    </button>
                </div>
                <h1/>
                <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr class="permission">
                        <th>ID</th>
                        <th>角色名称</th>
                        <th>角色描述</th>
                        <th> 操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody_role">
                    </tbody>
                </table>
            </section>
        </form>
    </div>
    <jsp:include page="../footer.jsp"/>
</div>
<script src="${prc}/js/user.js"></script>
<script>
    $(document).ready(function () {
        setSidebarActive();
    });

    //查询用户已有的的角色
    $(document).ready(function () {
        findRoleByUserId(1, 3, ${usersInfo.id});
    });

</script>
</body>
</html>