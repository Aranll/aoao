<%--
  Created by IntelliJ IDEA.
  User: gustinlau
  Date: 09/09/2017
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="side-nav" style="background-image: url('<%=request.getContextPath()%>/assets/home/img/box.png');background-size: contain;background-color: #FFF">
    <!--关闭按钮-->
    <div class="close-box">
        <img id="closeContact" src="<%=request.getContextPath()%>/assets/home/img/close.png" alt="">
    </div>
    <!--客服栏框-->
    <div class="service text-left">
        <c:if test="${config_kefu.size() gt 3}">
        <c:forEach items="${config_kefu}" var="kefu" begin="0" end="2">
            <div class="service-box">
                <img src="<%=request.getContextPath()%>/assets/home/img/qq.png" alt="">
                <span>${kefu.name}</span>
                <a href="${kefu.url}">在线咨询</a>
            </div>
        </c:forEach>
        </c:if>
        <c:if test="${config_kefu.size() le 3}">
            <c:forEach items="${config_kefu}" var="kefu">
                <div class="service-box">
                    <img src="<%=request.getContextPath()%>/assets/home/img/qq.png" alt="">
                    <span>${kefu.name}</span>
                    <a href="${kefu.url}">在线咨询</a>
                </div>
            </c:forEach>
        </c:if>
        <div class="code-big">
            <img src="${config_customerCode.value}" alt="">
        </div>
    </div>
</div>
<div class="small-side-nav">
    <p>客</p>
    <p>服</p>
    <p>咨</p>
    <p>询</p>
</div>