<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../base.jsp" %>
<html>
<head>
    <title>修改密码界面</title>
    <style>

        #username, #password, #phoneNum {
            font-size: 1.8ch;
            font-weight: bold;
            background-color: #d5d59d;
            color: #5d59a6;
        }

        /*输入内容方框的样式*/
        #uUsername, #uPassword, #ppassword {
            font-size: 1.68ch;
            font-weight: bold;
            border-radius: 15px/20px;
        }


        #stUsername, #stPassword, #stPhoneNum {
            font-size: 1.8ch;
            font-weight: bold;
            background-color: gainsboro;
            border-radius: 1px/3px;

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
                <div><b>修改密码</b></div>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>
            </ol>
        </section>


        <form id="form">
            <input type="hidden" name="username" value="${username}">
            <section class="content">
                <div class="panel panel-default">
                    <div class="panel-heading"><i><b>用户信息</b></i>
                    </div>
                    <div class="row data-type">

                        <div class="col-md-4 title" id="username"> 用户名称</div>
                        <div class="col-md-8 data" id="stUsername">
                            <input type="text" class="form-control" id="uUsername"
                                   value="${username}"
                                   disabled="disabled">
                        </div>

                        <div class="col-md-4 title" id="password">新密码</div>
                        <div class="col-md-8 data" id="stPassword">
                            <input type="password" class="form-control" name="password" placeholder="请您输入新密码">
                        </div>

                        <div class="col-md-4 title" id="phoneNum">确认新密码</div>
                        <div class="col-md-8 data" id="stPhoneNum">
                            <input type="password" class="form-control" name="newPassword" placeholder="请您再次确认新密码">
                        </div>


                    </div>
                </div>
                <div class="box-tools text-center">
                    <button type="button" class="btn bg-red-active" onclick="updatePassword()">
                        </i> 保存
                    </button>
                    <button type="button" class="btn bg-olive-active"
                            id="return" onclick="history.back(-1);">返回
                    </button>
                </div>
            </section>
        </form>
    </div>
    <jsp:include page="../footer.jsp"/>


</div>
<script src="${prc}/js/user.js"></script>
</body>
</html>