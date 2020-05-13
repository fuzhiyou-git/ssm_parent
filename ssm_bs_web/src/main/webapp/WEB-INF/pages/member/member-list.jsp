<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>会员页面</title>
    <style>
        span[class="pages_total"] {
            font-weight: bold;
            font-size: 2ch;
            color: #9f191f;
        }

        #changePageSize {
            border-radius: 80px/100px;
            color: #9f191f;
            font-weight: bold;
        }

        #select {
            margin-top: 18px;
        }

        /* 标题的css样式 */
        table thead tr th {
            font-size: 1.9ch;
            font-weight: bold;
            text-align: center;
        }

        /*内容的css样式*/
        form table tbody tr td {
            font-size: 1.68ch;
            font-weight: bold;
            color: #8677A7;
            text-align: center;

        }

        #editor, #delete, #modal-content {
            border-radius: 5px/10px;
        }


        input[name='nameCondation'] {
            float: right;
            border-radius: 5px/10px;
            margin-right: 6px;
            font-weight: bold;
            color: black;
            padding-left: 5px;
            width: 15ch;

        }


        input[name='phoneNumCondition'] {
            float: right;
            border-radius: 5px/10px;
            margin-right: 5px;
            font-weight: bold;
            color: black;
            padding-left: 5px;
            width: 15ch;
        }

        input[name='emailCondition'] {
            float: right;
            width: 15ch;
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

        #form-group {
            margin-top: 10px;
        }

        #table-box {
            margin-top: -3px;
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
                <div class="modal-content" id="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true"
                                onclick="closeModal()">&times;</span>
                        </button>
                        <h4 class="modal-title" id="exampleModalLabel">添加会员页面</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addform">
                            <div class="form-group">
                                <label>会员名:</label>
                                <input type="text" class="form-control" placeholder="请输入会员名"
                                       onblur="checkMember()" name="name">
                            </div>

                            <div class="form-group">
                                <label>会员昵称 :</label>
                                <input type="text" class="form-control" placeholder="请输入会员昵称"
                                       name="nickname">
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

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal"
                                        onclick="closeModal()">关闭
                                </button>
                                <button type="button" class="btn btn-primary" disabled="disabled" onclick="addMember()">
                                    新建
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <section class="content-header">
            <h1>会员管理
                <small><b>全部会员</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="table-box" id="table-box">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group" id="form-group">
                                    <button type="button" class="btn btn-github" onclick="refresh()">刷新
                                    </button>
                                    <button type="button" class="btn btn-success" data-toggle="modal"
                                            data-target="#exampleModal" data-whatever="@mdo">新建
                                    </button>

                                </div>
                            </div>
                        </div>
                        <div>
                            <div>
                                <button type="button" id="baidu" onclick="showData(1,5)">
                                    <i class="fa fa-search"></i> 搜索
                                </button>
                                <input type="text" name="emailCondition" placeholder="邮箱">
                                <input type="text" name="phoneNumCondition" placeholder="电话号码">
                                <input type="text" name="nameCondation" placeholder="会员名称"></div>
                        </div>
                        <form id="form">
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th style="padding-right: 0px"><input
                                            id="firstCb" type="checkbox" class="icheckbox_square-blue" value="id">
                                    </th>
                                    <th>会员名称</th>
                                    <th>会员昵称</th>
                                    <th>电话号码</th>
                                    <th>邮箱</th>
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
<script src="${prc}/js/member.js"></script>
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