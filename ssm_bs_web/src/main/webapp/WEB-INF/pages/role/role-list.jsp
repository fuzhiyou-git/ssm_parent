<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="${prc}/css/common.css">
    <link rel="stylesheet" href="${prc}/css/role.css">
    <title>角色页面</title>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>
    <div class="content-wrapper">
        <!--模态框 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" id="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true"
                                onclick="closeModal()">&times;</span>
                        </button>
                        <h4 class="modal-title" id="exampleModalLabel">新建角色</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addform">
                            <div class="form-group">
                                <label>角色名称:</label>
                                <input type="text" class="form-control" name="roleName" onblur="checkRoleName()"
                                       placeholder="角色名称">
                            </div>

                            <div class="form-group">
                                <label> 角色详情:</label>
                                <input type="text" class="form-control" placeholder="角色详情"
                                       name="roleDesc">
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal"
                                        onclick="closeModal()">关闭
                                </button>
                                <button type="button" class="btn btn-primary" disabled="disabled"
                                        onclick="addRole()">新建
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <section class="content-header">
            <h1> 角色管理
                <small><b>全部角色</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="table-box">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-microsoft" onclick="refresh()">
                                        刷新
                                    </button>

                                    <button type="button" class="btn btn-success" data-toggle="modal"
                                            data-target="#exampleModal" data-whatever="@mdo">新建
                                    </button>
                                </div>
                            </div>
                        </div>


                        <button type="button" class="" id="baidu" onclick="showData(1,5)">
                            <i class="fa fa-search"></i> 搜索
                        </button>
                        <input type="text" name="roleDescCondition" placeholder="角色描述">
                        <input type="text" name="roleNameCondition" placeholder="角色名称">


                        <form id="form">
                            <table class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr class="tr_title">
                                    <th class="" style="padding-right: 0px"><input
                                            id="firstCb" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <th> ID</th>
                                    <th> 角色名称</th>
                                    <th> 角色描述</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
                <jsp:include page="../box-footer.jsp"/>
            </div>
        </section>
    </div>
    <jsp:include page="../footer.jsp"/>
</div>
<script src="${prc}/js/role.js"></script>
<script>
    $(document).ready(function () {
        setSidebarActive();
    });

    $(document).ready(function () {
        showData(1, 5);

    });

</script>
</body>
</html>