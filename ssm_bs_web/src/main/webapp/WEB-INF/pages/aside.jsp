<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="prc" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="securict" uri="http://www.springframework.org/security/tags" %>
<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${prc}/img/user6-128x128.jpg"
                     class="img-circle">
            </div>
            <div class="pull-left info">
                <p><securict:authentication property="principal.username"></securict:authentication></p>
                <i class="fa fa-circle text-success"></i> 在线
            </div>
        </div>
        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <li><a href="${prc}/main.jsp"><i
                    class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 系统管理 -->
            <li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
                <span>系统管理</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span></a>
                <ul class="treeview-menu">

                    <li>
                        <!-- 只有拥有ADMIN这个角色的用户可以访问用户管理-->
                        <securict:authorize access="hasAnyRole('ROLE_ADMIN')">
                            <a href="${prc}/user/toUserList"> <i
                                    class="fa fa-circle-o"></i> 用户管理
                            </a>
                        </securict:authorize>
                    </li>

                    <!-- 含有ROLE这个角色的用户才可以访问-->
                    <securict:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_ROLE')">
                        <li><a href="/role/toRoleList"> <i
                                class="fa fa-circle-o"></i> 角色管理
                        </a></li>
                    </securict:authorize>

                    <!-- 含有PERMISSION这个角色的用户才可以访问-->
                    <securict:authorize access="hasAnyRole('ROLE_PERMISSION','ROLE_ADMIN')">
                        <li><a href="/permission/toPermissionList">
                            <i class="fa fa-circle-o"></i> 资源权限管理
                        </a></li>
                    </securict:authorize>

                </ul>
            </li>


            <!-- 基础数据 -->
            <li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
                <span>基础数据</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>

                <ul class="treeview-menu">
                    <securict:authorize access="hasAnyRole('ROLE_PRODUCT','ROLE_ADMIN')">
                        <li><a href="/product/list">
                            <i class="fa fa-circle-o"></i> 产品管理
                        </a></li>
                    </securict:authorize>

                    <!--会员管理:超管可见，会员管理员可见 -->
                    <securict:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
                        <li><a href="/member/toMember?pwd=list"> <i
                                class="fa fa-circle-o"></i> 会员管理
                        </a></li>
                    </securict:authorize>

                    <li><a href="/excel/toProductExcel"> <i
                            class="fa fa-circle-o"></i> 导出产品表
                    </a></li>
                </ul>


                <!-- 日志管理-->
            <li class="treeview"><a href="#"> <i class="fa fa-calendar-minus-o"></i>
                <span>日志管理</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>

                <ul class="treeview-menu">

                    <li><a href="/sysLog/toList?pwd=list"> <i
                            class="fa fa-circle-o"></i> 访问日志
                    </a></li>


                    <li><a href="/sysLog/testEmailException"> <i
                            class="fa fa-circle-o"></i> 测试
                    </a></li>

                </ul>
            </li>

            <li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
                <span>统计数据</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span></a>

                <ul class="treeview-menu">

                    <li><a href="/sysLog/toTJ?chartsType=usernameAndCount"> <i
                            class="fa fa-circle-o"></i> 系统用户浏览量
                    </a></li>

                    <li><a href="/sysLog/toTJ?chartsType=getOnlineData"> <i
                            class="fa fa-circle-o"></i> 系统日访问量
                    </a></li>

                    <li><a href="/sysLog/toTJ?chartsType=viProductAndCount"> <i
                            class="fa fa-circle-o"></i> 产品销量统计
                    </a></li>

                </ul>
        </ul>
    </section>
</aside>