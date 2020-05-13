<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="base.jsp" %>
<div class="box-footer">
    <div class="pull-left">
        <div class="form-group form-inline" id="select">
            <b>总共 <span class="pages_total" id="pages"></span> 页，共 <span class="pages_total"
                                                                         id="total"></span>条数据。
                每页
                <select class="form-control" id="changePageSize"
                        onchange="changePageSize()">
                    <c:forEach begin="5" end="20" step="5" var="num">
                        <option>${num}</option>
                    </c:forEach>
                </select> 条</b>
        </div>
    </div>

    <div class="box-tools pull-right">
        <ul class="pagination"></ul>
    </div>
</div>