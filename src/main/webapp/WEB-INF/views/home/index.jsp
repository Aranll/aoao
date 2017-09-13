<%--
  Created by IntelliJ IDEA.
  User: gustinlau
  Date: 06/09/2017
  Time: 5:04 PM
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

    <!--上分提示-->
    <div class="grade">
        <ul>
            <li class="text-right"><a style="text-decoration: none" target="_blank"><span id="time_1"
                                                                                          class="time"></span> 用户<span
                    class="randomPhone" id="phone_1"></span>上分 <span
                    class="integral" id="point_1"></span>分</a></li>

            <li class="text-right"><a style="text-decoration: none" target="_blank"><span id="time_2"
                                                                                          class="time"></span> 用户<span
                    class="randomPhone" id="phone_2"></span>上分 <span
                    class="integral" id="point_2"></span>分</a></li>
        </ul>
    </div>

    <!--玩法-->
    <div class="row method">
        <c:forEach items="${links}" var="link">
            <div class="col-sm-3 col-xs-6 text-center">
                <a href="${link.url}">
                    <div class="method-box">
                        <img src="${link.image}" alt="">
                    </div>
                    <p>${link.name}</p>
                </a>
            </div>
        </c:forEach>
    </div>
    <div class="clearfix"></div>
    <%@include file="./common/footer.jsp" %>
</div>

<%@include file="./common/contact.jsp"%>

<script src="<%=request.getContextPath()%>/assets/home/js/index.js"></script>
</body>
</html>
