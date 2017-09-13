<%--
  Created by IntelliJ IDEA.
  User: gustinlau
  Date: 07/09/2017
  Time: 4:32 PM
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
                <dt>澳彩城</dt>
                <c:forEach items="${articles}" var="article">
                    <dd class="${article.id eq currentId?"active":""}"><a href="<%=request.getContextPath()%>/about?id=${article.id}">${article.title}</a></dd>
                </c:forEach>
            </dl>
        </aside>
        <section class="col-xs-9">
            <h3 class="text-center">${atr.title}</h3>
            ${art.content}
        </section>
    </div>
    <%@include file="./common/footer.jsp" %>
</div>
<%@include file="./common/contact.jsp"%>
</body>
</html>
