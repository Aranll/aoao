<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/7
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>澳彩网-系统管理-系统文章</title>
    <%@include file="../common/head.jsp" %>
    <%@include file="../common/validate.jsp" %>
    <%@include file="../common/ztree.jsp" %>
    <%@include file="../common/datepicker.jsp" %>
    <%--<%@include file="../common/oss.jsp"%>--%>
</head>
<body>
<div class="app app-header-fixed app-aside-fixed">
    <%@include file="../common/header.jsp" %>
    <%@include file="article_nav.jsp" %>
    <div class="app-content">
        <div class="app-content-body">
            <div class="bg-light lter b-b wrapper-md ">
                <h1 class="m-n font-thin h3 inline">
                    系统文章
                </h1>
            </div>
            <div class="wrapper-md col-xs-12 col-md-12 col-lg-12 panel panel-default pull-left">
                <div class="col-xs-12 col-md-2 col-lg-3 wrapper-md" style="height: 100%">
                    <div class="zTreeDemoBackground">
                        <ul id="typeTree" class="ztree" style="margin-top:0; width:160px;"></ul>
                    </div>
                </div>
                <div class="col-xs-12 col-md-10 col-lg-9  m-b-none wrapper-md">
                    <form class="form-horizontal" id="searchForm">
                        <div class="form-group">
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">编号：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input name="dynamic[id]" type="text" class="form-control"
                                       value="${dynamic.id}">
                                <input type="hidden" name="type.id" id="typeId" value="${article.type.id}">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">标题：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input name="dynamic[title]" type="text" class="form-control"
                                       value="${dynamic.title}">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">文章类型：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <select name="contentType" class="form-control">
                                    <option value="">全部</option>
                                    <option value="0"
                                            <c:if test="${article.contentType eq 0}">selected="selected"</c:if>>富文本
                                    </option>
                                    <option value="1"
                                            <c:if test="${article.contentType eq 1}">selected="selected"</c:if> >
                                        链接
                                    </option>
                                </select>
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">创建时间：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input type="text" class="form-control datepicker"
                                       value="${dynamic.startCreateTime}" id="startCreateTime"
                                       onchange="searchTime(this.id)">
                                <input value="${dynamic.startCreateTime}" name="dynamic[startCreateTime]" type="hidden">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">至：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input type="text" id="endCreateTime" class="form-control datepicker"
                                       value="${dynamic.endCreateTime}" onchange="searchTime(this.id)">
                                <input value="${dynamic.endCreateTime}" type="hidden" name="dynamic[endCreateTime]">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">关键词：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input name="dynamic[key]" type="text" class="form-control"
                                       value="${dynamic.key}">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">编辑时间：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input type="text" class="form-control datepicker"
                                       value="${dynamic.startUpdateTime}" onchange="searchTime(this.id)">
                                <input name="dynamic[startUpdateTime]" type="hidden" onchange="searchTime(this.id)">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">至：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input type="text" class="form-control datepicker" onchange="searchTime(this.id)"
                                       value="${dynamic.endUpdateTime}">
                                <input type="hidden" name="dynamic[endUpdateTime]">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">是否上架：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <select name="showable" class="form-control">
                                    <option value="">全部</option>
                                    <option value="0"
                                            <c:if test="${article.showable eq 0}">selected="selected"</c:if>>禁用
                                    </option>
                                    <option value="1"
                                            <c:if test="${article.showable eq 1}">selected="selected"</c:if> >
                                        正常
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group m-t-n-md">
                            <div class="col-xs-12">
                                <a href="<%=request.getContextPath()%>/admin/article/article/save?redirectUrl=${redirectUrl}">
                                    <input type="button" class="btn btn-success btn-default" value="新增">
                                </a>
                                <input class="btn btn-default pull-right" value="重置" type="button"
                                       onclick="resetSearch('searchForm')">
                                <input class="btn btn-info pull-right m-r-sm" value="搜索" type="button" onclick="submitSearch()">
                            </div>
                        </div>
                    </form>
                    <div class="panel panel-default m-b-none">
                        <table class="table text-center table-bordered table-striped m-b-none">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>图片</th>
                                <th>标题</th>
                                <th>类型</th>
                                <th>上架</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${articles.size() eq 0}">
                                <tr>
                                    <td colspan="6">无数据</td>
                                </tr>
                            </c:if>
                            <c:forEach items="${articles}" var="article">
                                <tr>
                                    <td>${article.id}</td>
                                    <td><img src="${article.image}" style="max-width: 50px;max-height: 70px;" alt="">
                                    </td>
                                    <td>${article.title}</td>
                                    <c:if test="${article.contentType eq 0}">
                                        <td>富文本</td>
                                    </c:if>
                                    <c:if test="${article.contentType eq 1}">
                                        <td>链接</td>
                                    </c:if>
                                    <c:if test="${article.showable eq 0}">
                                        <td>下架</td>
                                    </c:if>
                                    <c:if test="${article.showable eq 1}">
                                        <td>上架</td>
                                    </c:if>
                                    <td>
                                        <a href="${article.url}">
                                            <button class="btn btn-success btn-xs">
                                                预览
                                            </button>
                                        </a>
                                        <c:if test="${article.showable eq 0}">
                                            <button class="btn btn-warning btn-xs"
                                                    onclick="updateStatus('${article.id}',1)">
                                                上架
                                            </button>
                                        </c:if>
                                        <c:if test="${article.showable eq 1}">
                                            <button class="btn btn-warning btn-xs"onclick="updateStatus('${article.id}',0)">
                                                下架
                                            </button>
                                        </c:if>
                                        <a href="<%=request.getContextPath()%>/admin/article/article/update?redirectUrl=${redirectUrl}&id=${article.id}">
                                            <button class="btn btn-info btn-xs">
                                                编辑
                                            </button>
                                        </a>

                                        <button class="btn btn-danger btn-xs"
                                                onclick="remove('${article.title}','${article.id}','<%=request.getContextPath()%>/admin/article/article/remove')">
                                            删除
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <c:if test="${isPagination}">
                            <div class="col-xs-12">
                                <ul class="pagination pull-right">
                                        ${pagination}
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/common.jsp"></jsp:include>
<script>
    ztreeName = "文章管理";
    updateHtml = "下架";
    ossPathName = "article/";
</script>
<jsp:include page="../common/operationTip.jsp"></jsp:include>
<jsp:include page="../common/select.jsp"></jsp:include>
</body>
</html>
