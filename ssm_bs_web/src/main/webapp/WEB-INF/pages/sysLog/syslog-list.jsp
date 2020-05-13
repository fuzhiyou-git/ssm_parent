<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>日志首页</title>
    <style>

        /*搜索的按钮*/
        #baidu {
            float: right;
            background-color: #3c3c3c;
            color: white;
            border-radius: 5px/10px;
            margin-right: 6ch;

        }

        div input[name="username"] {
            float: right;
            margin-right: 1ch;
            border-radius: 5px/10px;
            font-weight: bold;
            color: black;
            padding-left: 3px;
            width: 18ch;
        }


        #list {
            color: #1b6d85;
            font-size: 2ch;
        }

        #syslogManment {
            font-size: 3ch;
            font-weight: bold;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../aside.jsp"></jsp:include>


    <div class="content-wrapper">
        <section class="content-header">
            <h1 id="syslogManment">
                日志管理
                <small><b>全部日志</b></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${prc}/index.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title" id="list"><i><b>列表</b></i></h3>
                </div>
                <div class="box-body">
                    <div class="table-box">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-microsoft"
                                            onclick="window.location.reload();">刷新
                                    </button>
                                    <button type="button" class="btn btn-github" onclick="deleteSys()">
                                        删除选中
                                    </button>
                                </div>
                            </div>
                        </div>


                        <div>
                            <div id="manyConditions">
                                <button type="submit" id="baidu" onclick="showData(1,5)">
                                    <i class="fa fa-search"></i> 搜索
                                </button>
                                <div>
                                    <input type="text" name="username" placeholder="请输入要查询的用户">
                                </div>
                            </div>
                        </div>

                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th style="padding-right: 0px"><input id="firstCb" type="checkbox"
                                                                      class="icheckbox_square-blue"></th>
                                <th>访问用户</th>
                                <th>访问时间</th>
                                <th>访问IP</th>
                                <th>资源URL</th>
                                <th>执行时间</th>
                            </tr>
                            </thead>
                            <tbody id="tbody">
                            </tbody>
                        </table>
                    </div>

                </div>
                <jsp:include page="../box-footer.jsp"/>
            </div>
        </section>

    </div>
    <jsp:include page="../footer.jsp"/>

</div>
<script src="${prc}/js/syslog.js"></script>
<script>

    $(document).ready(function () {
        showData(1, 5);
    });


</script>
</body>

</html>