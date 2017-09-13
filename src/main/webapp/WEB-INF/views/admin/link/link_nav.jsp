<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/4
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="app-aside hidden-xs bg-black">
    <div class="aside-wrap ">
        <div class="navi-wrap">
            <nav class="navi">
                <ul id="a_nav" class="nav">
                    <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_left_menu.})">--%>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/link/type">
                            <i class=" icon-book-open"></i>
                            <span>链接分类</span>
                        </a>
                        </a>
                    </li>
                    <%--</sec:authorize>--%>
                    <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_left_menu.})">--%>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/link/link">
                            <i class=" icon-equalizer"></i>
                            <span>链接管理</span>
                        </a>
                    </li>
                    <%--</sec:authorize>--%>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
