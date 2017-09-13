<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gustinlau
  Date: 07/09/2017
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--导航栏-->
<nav class="clearfix cg-nav">
    <div class="logo pull-left">
        <a href="<%=request.getContextPath()%>/index">
            <img src="${config_logo.value}" alt="">
        </a>
    </div>
    <div class="nav-style pull-right">
        <ul class="list-unstyled ac-nav">
            <c:forEach items="${config_menu}" var="menu">
                <c:choose>
                    <c:when test="${menu.url eq '/index'}">
                        <li class="${current==0?"active":""}"><a
                                href="<%=request.getContextPath()%>/index">${menu.name}</a></li>
                    </c:when>
                    <c:when test="${menu.url eq '/news'}">
                        <li class="${current==1?"active":""}"><a
                                href="<%=request.getContextPath()%>/news">${menu.name}</a></li>
                    </c:when>
                    <c:when test="${menu.url eq '/about'}">
                        <li class="${current==2?"active":""}"><a
                                href="<%=request.getContextPath()%>/about">${menu.name}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${menu.url}">${menu.name}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </div>
</nav>
<div class="clearfix"></div>

<!--轮播图-->
<div class="flexslider">
    <ul class="slides">
        <c:forEach items="${banners}" var="banner">
            <c:if test="${banner.url.length() gt 0}">
                <li><a href="${banner.url}"><img src=${banner.image}></a></li>
            </c:if>
            <c:if test="${banner.url eq null || banner.url.length() eq 0}">
                <li><a><img src=${banner.image}></a></li>
            </c:if>
        </c:forEach>
    </ul>
</div>