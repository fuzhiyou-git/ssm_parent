<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="${prc}/css/common.css">
    <title>用户首页</title>
    <style>

        #select {
            margin-top: 18px;
        }


        div input[name="phoneNumCondition"] {
            float: right;
            border-radius: 5px/10px;
            margin-right: 5px;
            font-weight: bold;
            color: black;
            padding-left: 5px;
            width: 18ch;
        }

        div input[name="usernameCondition"] {
            float: right;
            width: 18ch;
            border-radius: 5px/10px;
            margin-right: 2px;
            font-weight: bold;
            color: black;
            padding-left: 5px;
        }


        /*搜索的按钮*/
        #baidu {
            float: right;
            background-color: #3c3c3c;
            color: white;
            border-radius: 5px/10px;
            margin-right: 7px;
        }


        .userStatus {
            color: red;
            margin-left: 5px;
        }

        a.userStatus:hover {
            color: #001a35;
        }

    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>

    <div class="content-wrapper">
        <!--模态框 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                onclick="closeModal()">&times;</span>
                        </button>
                        <h4 class="modal-title">新建用户</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addform">
                            <div class="form-group">
                                <label>用户名:</label>
                                <input type="text" class="form-control" name="username" placeholder="用户名称">
                            </div>

                            <div class="form-group">
                                <label>密码:</label>
                                <input type="password" class="form-control" placeholder="请输入密码"
                                       name="password">
                            </div>
                            <div class="form-group">
                                <label>联系电话:</label>
                                <input type="text" class="form-control" placeholder="请输入电话号码"
                                       name="phoneNum">
                            </div>
                            <div class="form-group">
                                <label>邮箱:</label>
                                <input type="text" class="form-control" placeholder="请输入邮箱" name="email">
                            </div>

                            <div class="form-group">
                                <label>用户状态:</label>
                                <select class="form-control" name="status">
                                    <option value="1" selected="selected">开启</option>
                                    <option value="0">关闭</option>
                                </select>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal"
                                        onclick="closeModal()">关闭
                                </button>
                                <button type="button" class="btn btn-primary" disabled="disabled"
                                        onclick="addUser()">新建
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <section class="content-header">
            <h1>用户管理
                <small><b>全部用户</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><b>首页</b></a></li>
                <li class="active"><b>全部用户</b></li>
            </ol>
        </section>


        <section class="content">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="table-box">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-github" onclick="refresh()">刷新</button>
                                    <button type="button" class="btn btn-adn" data-toggle="modal"
                                            id="addUser" disabled="disabled" data-target="#exampleModal"
                                            data-whatever="@mdo"> 新建
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div>
                                <button type="button" id="baidu" onclick="showData(1,5)">
                                    <i class="fa fa-search"></i> 搜索
                                </button>
                                <input type="text" name="phoneNumCondition" placeholder="电话号码">
                                <input type="text" name="usernameCondition" placeholder="用户名">
                            </div>
                        </div>

                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px"><input
                                        id="firstCb" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th>用户名</th>
                                <th>邮箱</th>
                                <th>联系电话</th>
                                <th>状态</th>
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
<script src="${prc}/js/user.js"></script>
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