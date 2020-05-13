<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="prc" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>

<!-- Small modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal
</button>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">

            <label for="username" class="control-label"> 用户名:</label>
            <input id="username" type="text">
        </div>
    </div>
</div>

<script src="${prc}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${prc}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${prc}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${prc}/plugins/raphael/raphael-min.js"></script>
<script src="${prc}/plugins/morris/morris.min.js"></script>
<script src="${prc}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${prc}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${prc}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${prc}/plugins/knob/jquery.knob.js"></script>
<script src="${prc}/plugins/daterangepicker/moment.min.js"></script>
<script src="${prc}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${prc}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${prc}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="${prc}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="${prc}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${prc}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src=${prc}></script>
<script src="${prc}/plugins/iCheck/icheck.min.js"></script>
<script src="${prc}/plugins/adminLTE/js/app.min.js"></script>
<script src="${prc}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${prc}/plugins/select2/select2.full.min.js"></script>
<script src="${prc}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${prc}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${prc}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${prc}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${prc}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${prc}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${prc}/plugins/ckeditor/ckeditor.js"></script>
<script src="${prc}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${prc}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${prc}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${prc}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${prc}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${prc}/plugins/chartjs/Chart.min.js"></script>
<script src="${prc}/plugins/flot/jquery.flot.min.js"></script>
<script src="${prc}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${prc}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${prc}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${prc}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${prc}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<input type="text">

<form role="form" action="${prc}/excel/printExcel" method="post">
    <div class="input-group input-group-sm">
        <div class="input-group-addon">
            <i class="fa fa-calendar"></i>
        </div>
        <input type="text" name="inputDate" class="form-control pull-right" id="datepicker">
        <span class="input-group-btn">
                    <button type="submit" class="btn btn-info btn-flat">submit</button>
                </span>
    </div>
</form>

<%--<span><a href="javascript:refreshCode()">
                <img src="${prc}/checkCode" title="看不清点击刷新" id="vcode"/>
            </a></span>--%>
<script>

    $('#datepicker').datepicker({
        language: "zh-CN",
        autoclose: true,
        format: 'yyyy-mm',
        startView: 'months', //开始视图层，为月视图层
        maxViewMode: 'years', //最大视图层，为年视图层
        minViewMode: 'months', //最小视图层，为月视图层
    });
    /* //设置验证码的点击切换;
     function refreshCode() {
         var vcode = document.getElementById("vcode");
         vcode.src = "${prc}/checkCode?time" + new Date().getTime();
    }*/
</script>
</body>
</html>
