<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="${prc}/css/permission.css">
    <title>资源权限首页</title>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>

    <div class="content-wrapper">
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" id="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="exampleModalLabel">修改权限</h4>
                    </div>
                    <div class="modal-body">
                        <form id="updateform">
                            <input type="hidden" name="id">
                            <div class="form-group">
                                <label>权限名称:</label>
                                <input type="text" class="form-control" name="permissionName">
                            </div>

                            <div class="form-group">
                                <label>权限路径:</label>
                                <input type="text" class="form-control" name="url">
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn-primary" onclick="update_Permission()">保存
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <section class="content-header">
            <h1 id="PermissionManment">
                资源权限管理
                <small><b>全部资源权限</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${prc}/main.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>


            </ol>
        </section>
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <div id="list"><i><b>列表</b></i></div>
                </div>

                <div class="box-body">
                    <div class="table-box">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-microsoft" onclick="refresh()">刷新
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div>
                                <button type="button" id="baidu" onclick="showData(1,5)">
                                    <i class="fa fa-search"></i> 搜索
                                </button>
                                <input type="text" name="urlCondition" placeholder="描述">
                                <input type="text" name="permissionNameCondition" placeholder="权限资源名称">
                            </div>
                        </div>


                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th style="padding-right: 0px"><input
                                        id="firstCb" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th> ID</th>
                                <th> 资源权限名称</th>
                                <th> 资源权限路径</th>
                                <th> 操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody"></tbody>
                        </table>
                    </div>
                </div>
                <jsp:include page="../box-footer.jsp"/>
            </div>
        </section>
    </div>
    <jsp:include page="../footer.jsp"/>

</div>
<script src="${prc}/js/permissione.js"></script>
<script>
    $(document).ready(function () {
        setSidebarActive();
    });


    //查询所有的资源权限
    $(document).ready(function () {
        showData(1, 5);
    });

</script>
</body>
</html>