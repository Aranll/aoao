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
                <%--</div>--%>
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
                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.article_article_get})">--%>
                                        <a href="${article.url}">
                                            <button class="btn btn-success btn-xs">
                                                预览
                                            </button>
                                        </a>
                                            <%--</sec:authorize>--%>
                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.article_article_update})">--%>
                                        <c:if test="${article.showable eq 0}">
                                            <button class="btn btn-warning btn-xs"
                                                    onclick="updateShowableStatus('${article.id}',1,'确定上架[${article.id}-${article.title}]')">
                                                上架
                                            </button>
                                        </c:if>
                                        <c:if test="${article.showable eq 1}">
                                            <button class="btn btn-warning btn-xs"onclick="updateShowableStatus('${article.id}',0,'确定下架[${article.id}-${article.title}]？')">
                                                下架
                                            </button>
                                        </c:if>
                                            <%--</sec:authorize>--%> <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.article_article_update})">--%>
                                        <a href="<%=request.getContextPath()%>/admin/article/article/update?redirectUrl=${redirectUrl}&id=${article.id}">
                                            <button class="btn btn-info btn-xs">
                                                编辑
                                            </button>
                                        </a>
                                            <%--</sec:authorize>--%>

                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.article_article_remove})">--%>
                                        <button class="btn btn-danger btn-xs"
                                                onclick="remove('${article.title}','${article.id}','<%=request.getContextPath()%>/admin/article/article/remove')">
                                            删除
                                        </button>
                                            <%--</sec:authorize>--%>
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
<%--改变上下架状态--%>
<div class="modal fade" id="updateShowableModal" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body text-center">
                <h4 class="text-danger" id="statusInfo"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="submitUpdateShowableStatus()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--上下架开始--%>
<script>
    //改变对象的状态
    var showableId; //对象的id
    var showableStatus;  //对象改变成的状态
    var updateUrl = "<%=request.getContextPath()%>/admin/article/article/update";
    function updateShowableStatus(id, status, html){
        showableId = id;
        showableStatus = status;
        if (status == 0){
            $("#statusInfo").html(html); //显示在模态框中的提示信息
        }else{
            $("#statusInfo").html(html);
        }
        $("#updateShowableModal").modal('show');
    }
    function submitUpdateShowableStatus(){
        doPost(updateUrl,{id:showableId,showable:showableStatus},function (data) {
            if (data.status) {
                $("#info_success").modal().show();
            } else {
                $("#infoOfFalse").html(data.msg);
                $("#info_fail").modal().show();
            }
        });
    }
</script>
<%--上下架结束--%>
<%--url--%>
<script>
    ztreeUrl="<%=request.getContextPath()%>/admin/article/type/combo/tree";
</script>
<jsp:include page="../common/operationTip.jsp"></jsp:include>
<jsp:include page="../common/select.jsp"></jsp:include>
</body>
</html>
