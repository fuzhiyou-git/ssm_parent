<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/pages/base.jsp" %>
<html>

<style>
    #addPermission {
        font-size: 0.8cm;
        font-weight: bold;
        color: black;
    }

    .reboot {
        font-size: 0.5cm;

    }

    .promission {
        color: red;
        margin-left: 5px;
    }

    a.promission:hover {
        color: #001a35;
    }
</style>

<head>
    <title>系统输入有误界面</title>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <header class="main-header">

        <a href="all-admin-index.html" class="logo">
            <span class="logo-mini"><b>数据</b></span>
            <span class="logo-lg"><b>数据</b>后台管理</span>
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
							未登录
					</span>

                    </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header"><img
                                    src="${prc}/img/user6-128x128.jpg"
                                    class="img-circle" alt="User Image"></li>

                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#"
                                       class="btn btn-default btn-flat">注销</a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
    </header>
    <aside class="main-sidebar">

        <section class="sidebar">

            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/img/user6-128x128.jpg"
                         class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>
                        未登录
                    </p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>

            <ul class="sidebar-menu">
                <li class="header">菜单</li>
                <li id="admin-index"><a
                        href="${pageContext.request.contextPath}/pages/main.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>

                <li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
                    <span>系统管理</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                    <ul class="treeview-menu">

                        <li id="system-setting"><a
                                href="${pageContext.request.contextPath}/user/findAll.do"> <i
                                class="fa fa-circle-o"></i> 用户管理
                        </a></li>
                        <li id="system-setting"><a href="${pageContext.request.contextPath}/role/findAll.do">
                            <i class="fa fa-circle-o"></i> 角色管理
                        </a></li>
                        <li id="system-setting"><a href="${pageContext.request.contextPath}/permission/findAll.do">
                            <i class="fa fa-circle-o"></i> 资源权限管理
                        </a></li>
                        <li id="system-setting"><a
                                href="${pageContext.request.contextPath}/sysLog/findAll.do"> <i
                                class="fa fa-circle-o"></i> 访问日志
                        </a></li>

                    </ul>
                </li>
                <li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
                    <span>基础数据</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                    <ul class="treeview-menu">

                        <li id="system-setting"><a
                                href="${pageContext.request.contextPath}/product/findAll.do">
                            <i class="fa fa-circle-o"></i> 产品管理
                        </a></li>
                        <li id="system-setting"><a
                                href="${pageContext.request.contextPath}/order/findAll.do?page=1&pageSize=3">
                            <i class="fa fa-circle-o"></i> 订单管理
                        </a></li>

                    </ul>
                </li>

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <div class="content-wrapper">
        <section class="content-header">
            <div id="addPermission">访问权限不足 页面
                <h1> 引起异常的原因:${errorWhy}</h1>
                <h1> 异常跟踪栈:${errorFinally}</h1>
            </div>

            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> <b>首页</b></a></li>
                <li class="active"><b>访问权限不足</b></li>
            </ol>

        </section>
        <br/>

        <section class="content">
            <div class="error-page">


                <div class="error-content">

                    <p class="reboot"><b>
                        访问失败 , 你可以 <a class="promission" href="${prc}/login.jsp">返回到登录页面</a>
                        重新登录</b>
                    </p>


                </div>

            </div>

        </section>

    </div>


    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version 1.0.8</b>
        </div>
        <strong>Copyright &copy; 2014-2017 <a
                href="http://www.itcast.cn">研究院研发部</a>.
        </strong> <b>All rights reserved.</b>
    </footer>
    <!-- 底部导航 /-->

</div>


<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function () {
        setSidebarActive("admin-500");
    });
</script>
</body>

</html>