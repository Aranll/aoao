<%--
  Created by IntelliJ IDEA.
  User: gustinlau
  Date: 07/09/2017
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--网页底部信息栏-->
<footer class="footer">
    <div class="footer-box">
        <div class="footer-nav text-center">
            <ul class="list-unstyled">
                <c:forEach items="${config_menu}" var="menu">
                    <c:choose>
                        <c:when test="${menu.url eq '/index'}">
                            <li><a href="<%=request.getContextPath()%>/index">${menu.name}</a></li>
                        </c:when>
                        <c:when test="${menu.url eq '/news'}">
                            <li><a href="<%=request.getContextPath()%>/news">${menu.name}</a></li>
                        </c:when>
                        <c:when test="${menu.url eq '/about'}">
                            <li><a href="<%=request.getContextPath()%>/about">${menu.name}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${menu.url}">${menu.name}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
            <p>${config_recordInfo.value}</p>
            <div class="footer-img">
                <img src="${config_bottomCode.value}" alt="">
            </div>
        </div>
    </div>
</footer>
<script>
    $(".flexslider").flexslider({
        animation: "slide",
        slideshowSpeed: 5000,
        directionNav: false,
        start: function () {
            setFooter();
        },
        before: function (slider) {
            slider.pause();
            slider.play();
        }
    });

</script>