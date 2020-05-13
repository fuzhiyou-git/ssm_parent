<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/pages/base.jsp" %>
<html>
<head>
    <title>首页</title>
</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
    <jsp:include page="WEB-INF/pages/header.jsp"/>
    <jsp:include page="WEB-INF/pages/aside.jsp"/>
    <div class="content-wrapper">
        <img src="${prc}/img/center.jpg"
             width="100%" height="100%"/>
    </div>
    <jsp:include page="WEB-INF/pages/footer.jsp"/>
</div>

</body>

</html>