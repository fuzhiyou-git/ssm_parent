<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="prc" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="securict" uri="http://www.springframework.org/security/tags" %>
    <link rel="stylesheet" href="${prc}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${prc}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${prc}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${prc}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${prc}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${prc}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${prc}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${prc}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${prc}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${prc}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${prc}/css/style.css">
    <link rel="stylesheet" href="${prc}/plugins/bootstrap-slider/slider.css">

<style type="text/css">

    .user-footer, .pull-left, .pull-right {
        border-radius: 8px/10px;
    }

</style>
<header class="main-header">
    <a href="#" class="logo">
        <span class="logo-mini"><b>数据</b></span>
        <span class="logo-lg"><b>数据后台管理</b></span>
    </a>

    <nav class="navbar navbar-static-top">

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas"
           role="button"> <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <li class="dropdown user user-menu"><a href="#"
                                                       class="dropdown-toggle" data-toggle="dropdown"> <img
                        src="${prc}/img/user6-128x128.jpg"
                        class="user-image" alt="User Image"> <span class="hidden-xs">
                    <securict:authentication property="principal.username"></securict:authentication>
                </span>

                </a>
                    <ul class="dropdown-menu">
                        <li class="user-header"><img
                                src="${prc}/img/user6-128x128.jpg"
                                class="img-circle" alt="User Image"></li>

                        <li class="user-footer">
                            <div class="pull-left" id="pull-left">
                                <a href="${prc}/user/passwordChange" class="btn btn-default btn-success"
                                   style="color: whitesmoke">修改密码</a>
                            </div>
                            <div class="pull-right" id="pull-right">
                                <a href="${prc}/logout"
                                   class="btn btn-default btn-danger" style="color: whitesmoke">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
</header>
