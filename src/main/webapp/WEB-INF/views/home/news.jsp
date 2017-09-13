<%--
  Created by IntelliJ IDEA.
  User: gustinlau
  Date: 07/09/2017
  Time: 1:54 PM
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


    <!--内容区-->
    <div class="content clearfix">
        <aside class="text-center col-xs-3">
            <dl>
                <dt>${articleTypes.name}</dt>
                <c:forEach items="${articleTypes.children}" var="type">
                    <dd class="${currentTypeId eq type.id?"active":""}"><a
                            href="<%=request.getContextPath()%>/news?type.id=${type.id}">${type.name}</a></dd>
                </c:forEach>
            </dl>
        </aside>
        <section class="col-xs-9">
            <c:if test="${articles.size() gt 0}">
                <ul class="news clearfix">
                    <c:forEach items="${articles}" var="article">
                        <li>
                            <c:if test="${article.contentType eq 0}">
                                <a href="<%=request.getContextPath()%>/news/details?id=${article.id}" class="pull-left">${article.title}</a>
                            </c:if>
                            <c:if test="${article.contentType eq 1}">
                                <a href="${article.url}" class="pull-left">${article.title}</a>
                            </c:if>
                            <span class="pull-right">${article.createTime}</span>
                        </li>
                    </c:forEach>
                </ul>
                <c:if test="${isPagination}">
                    <div class="pagination clearfix">
                        <div class="pagination-left pull-left">
                            <span>共${listTotal}条 每页10条 页数 ${currentPage}/${maxPage}</span>
                        </div>
                    </div>
                    <ul class="pagination pagination-right pull-right">
                            ${pagination}
                    </ul>
                </c:if>
            </c:if>
            <c:if test="${articles.size() eq 0}">
                <p style="text-align: center">暂无新闻</p>
            </c:if>
        </section>
    </div>
    <%@include file="./common/footer.jsp" %>
</div>
<%@include file="./common/contact.jsp"%>
</body>
</html>
