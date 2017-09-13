<%--
  Created by IntelliJ IDEA.
  User: gustinlau
  Date: 07/09/2017
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="./common/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <%@include file="./common/header.jsp" %>

    <!--新闻详情-->
    <div class="news-content">
        <div class="news-nav">
            当前位置:
            <a href="<%=request.getContextPath()%>/news">新闻动态</a>
            <a>新闻详情</a>
        </div>
        <div class="news-text clearfix">
            <h3 class="text-center">${article.title}</h3>
            <span class="clearfix text-right">${article.createTime}</span>
            <div>
                ${article.content}
            </div>
        </div>
    </div>

    <%@include file="./common/footer.jsp" %>
</div>
<%@include file="./common/contact.jsp"%>
</body>
</html>
