<%--
  Created by IntelliJ IDEA.
  User: GustinLau
  Date: 2017-04-06
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="app-header navbar">

    <div class="navbar-header bg-black" style="max-height: 50px;height:50px;">
        <button class="pull-right visible-xs dk" data-toggle-class="show" data-toggle-target=".navbar-collapse">
            <i class="glyphicon glyphicon-cog"></i>
        </button>
        <button class="pull-right visible-xs" data-toggle-class="off-screen" data-toggle-target=".app-aside">
            <i class="glyphicon glyphicon-align-justify"></i>
        </button>
        <a href="<%=request.getContextPath()%>/" class="navbar-brand text-lt hidden-xs"
           style="    background-color: #FFF;    height: 50px;">
            <img style="display: block;margin: 0;max-height:50px;width: 100%;" id="websiteLogo"
                 src="${sessionScope.config_logo.value}"/>
        </a>
    </div>
    <div class="collapse pos-rlt navbar-collapse box-shadow bg-white-only">
        <div id="t_nav" class="nav navbar-nav">

            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_top_menu.website})">--%>
            <a href="<%=request.getContextPath()%>/admin/system" class="btn no-shadow navbar-btn">
                系统管理
            </a>
            <%--</sec:authorize>--%>
            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_top_menu.publicNumber})">--%>
            <a href="<%=request.getContextPath()%>/admin/article" class="btn no-shadow navbar-btn">
                图文
            </a>
            <%--</sec:authorize>--%>
            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_top_menu.app})">--%>
            <a href="<%=request.getContextPath()%>/admin/link" class="btn no-shadow navbar-btn">
                链接
            </a>
            <%--</sec:authorize>--%>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle clear">
                    <span class="hidden-sm hidden-md">${sessionScope.session_staff.name}</span>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInRight w">
                    <li>
                        <a href="javascript:logout()">登出</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<script>
    function logout() {
        doPost("<%=request.getContextPath()%>/admin/logout", {}, function (data) {
            if (data.status) {
                window.location.href = "<%=request.getContextPath()%>/admin/login";
            }
        })
    }
    $(function () {

    });
</script>