<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="prc" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title> 登录界面</title>
      <link rel="stylesheet" href="${prc}/plugins/iCheck/square/blue.css">
      <script type="text/javascript" src="${prc}/plugins/jQuery/jquery-2.2.3.min.js"></script>
      <script src="${prc}/plugins/bootstrap/js/bootstrap.min.js"></script>
      <script src="${prc}/plugins/iCheck/icheck.min.js"></script>
    <style>

        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: #34495e;
        }


        #box {
            width: 300px;
            padding: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #191919;
            text-align: center;
        }

        #box h1 {
            color: white;
            text-transform: uppercase;
            font-weight: 500;
            cursor: pointer;
        }


        #box input[type ="text" ],
        #box input[type ="password"] {
            background: none;
            display: block;
            margin: 20px auto;
            padding: 12px 8px;
            width: 180px;
            outline: none;
            color: white;
            border: 2px solid #3498db;
            border-radius: 20px;
            transition: 0.25s;
            text-align: center;

        }

        #box input[type ="text" ]:focus,
        #box input[type ="password"]:focus {
            width: 250px;
            border-color: chocolate;
        }

        #box input[type="submit"] {
            background: none;
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 12px 8px;
            outline: none;
            color: white;
            border: 2px solid #3498db;
            border-radius: 20px;
            transition: 0.25s;

        }

        #box input[type="submit"]:hover {
            background: chocolate;
        }
    </style>
</head>

<body>


<!-- 登录界面-->
<form id="box" action="${prc}/login" method="post">
    <security:csrfInput/>
    <h1>数据权限控制系统</h1>
    <div>
        <input type="text" name="username" placeholder="Username" id="username">
        <input type="password" name="password" placeholder="Password" id="password">

        <div>
            <input type="text" name="verifycode" id="verifycode" placeholder="请输入验证码"
                   style="width: 100px;float: left;padding-right: 10px;margin-left: 4.8ch"/>
            <a href="javascript:refreshCode()">
                <img src="${prc}/checkCode" title="看不清点击刷新" id="vcode"
                     style="float: left;padding-top: 2.8ch;padding-left: 8px"/>
            </a>
        </div>
        <br><br><br><br>
        <input type="submit" value="Login" id="submit">

        <label style="color: white"><input type="checkbox" name="remember-me" value="true"> 记住 下次自动登录</label>
        <div>
            <c:if test="${not empty param.error}">
                <span style="color: #d33724">用户名或者密码错误</span>
            </c:if>
            <span style="color: #d33724">${msg}</span>
        </div>
    </div>
</form>
<script>
    //设置验证码的点击切换;
    function refreshCode() {
        var vcode = document.getElementById("vcode");
        vcode.src = "${prc}/checkCode?time" + new Date().getTime();
    }
</script>
</body>

</html>