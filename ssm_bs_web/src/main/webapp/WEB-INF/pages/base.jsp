<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="prc" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="securict" uri="http://www.springframework.org/security/tags" %>
<security:authentication property="principal.username"/>
<link rel="stylesheet" href="${prc}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="${prc}/css/style.css">
<script src="${prc}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${prc}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>$.widget.bridge('uibutton', $.ui.button);</script>
<script src="${prc}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${prc}/plugins/adminLTE/js/app.min.js"></script>
<script src="${prc}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${prc}/plugins/iCheck/icheck.min.js"></script>
<script src="${prc}/plugins/select2/select2.full.min.js"></script>
<script src="${prc}/js/commoy.js"></script>
<script src="${prc}/js/amcharts.js" type="text/javascript"></script>
<script src="${prc}/js/serial.js" type="text/javascript"></script>
<script src="${prc}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${prc}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" href="${prc}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
<script src="${prc}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${prc}/js/serial.js" type="text/javascript"></script>
<script src="${prc}/js/pie.js" type="text/javascript"></script>
<script src="${prc}/js/core.js"></script>
<script src="${prc}/js/charts.js"></script>
<script src="${prc}/js/animated.js"></script>

