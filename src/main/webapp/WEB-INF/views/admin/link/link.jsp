<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/9
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>澳彩网-系统管理-链接管理</title>
    <%@include file="../common/head.jsp" %>
    <%@include file="../common/validate.jsp" %>
    <%@include file="../common/ztree.jsp" %>
    <%@include file="../common/oss.jsp"%>
</head>
<body>
<div class="app app-header-fixed app-aside-fixed">
    <%@include file="../common/header.jsp" %>
    <%@include file="link_nav.jsp" %>
    <div class="app-content">
        <div class="app-content-body">
            <div class="bg-light lter b-b wrapper-md ">
                <h1 class="m-n font-thin h3 inline">
                    系统链接
                </h1>
            </div>
            <div class="wrapper-md  panel panel-default pull-left " style="width:100%">
                <div class="col-xs-8 col-md-4 col-lg-2 wrapper-md" style="height: 100%">
                    <div class="zTreeDemoBackground">
                        <ul id="typeTree" class="ztree" style="margin-top:0; width:160px;"></ul>
                    </div>
                </div>
                <div class="col-xs-24 col-md-12 col-lg-9  m-b-none wrapper-md">
                    <form class="form-horizontal" id="searchForm">
                        <div class="form-group">
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">编号：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input name="dynamic[id]" type="text" class="form-control"
                                       value="${dynamic.id}">
                                <input type="hidden" name="type.id" id="typeId">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">名称：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <input name="dynamic[name]" type="text" class="form-control"
                                       value="${dynamic.name}">
                            </div>
                            <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                                <label class="control-label">是否上架：</label>
                            </div>
                            <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                                <select name="showable" class="form-control">
                                    <option value="">全部</option>
                                    <option value="0"
                                            <c:if test="${link.showable eq 0}">selected="selected"</c:if>>下架
                                    </option>
                                    <option value="1"
                                            <c:if test="${link.showable eq 1}">selected="selected"</c:if> >
                                        上架
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group m-t-n-md">
                            <div class="col-xs-12">
                                <input type="button" class="btn btn-success btn-default" data-toggle="modal"
                                       data-target="#saveObjectModal" value="新增">
                                <input class="btn btn-default pull-right" value="重置" type="button"
                                       onclick="resetSearch('searchForm')">
                                <input class="btn btn-info pull-right m-r-sm" value="搜索" type="submit">
                            </div>
                        </div>

                    </form>

                    <div class="panel panel-default m-b-none">
                        <table class="table text-center table-bordered table-striped m-b-none">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>图片</th>
                                <th>名称</th>
                                <th>顺序</th>
                                <th>上架</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${links.size() eq 0}">
                                <tr>
                                    <td colspan="6">无数据</td>
                                </tr>
                            </c:if>
                            <c:forEach items="${links}" var="link">
                                <tr>
                                    <td>${link.id}</td>
                                    <td><img src="${link.image}" style="max-width: 50px;max-height: 70px;" alt="">
                                    </td>
                                    <td>${link.name}</td>
                                    <td>${link.seq}</td>
                                    <c:if test="${link.showable eq 0}">
                                        <td>下架</td>
                                    </c:if>
                                    <c:if test="${link.showable eq 1}">
                                        <td>上架</td>
                                    </c:if>
                                    <td>
                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.link_link_get})">--%>
                                        <a href="${link.url}">
                                            <button class="btn btn-success btn-xs">
                                                预览
                                            </button>
                                        </a>
                                            <%--</sec:authorize>--%>
                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.link_link_update})">--%>
                                        <c:if test="${link.showable eq 0}">
                                            <button class="btn btn-warning btn-xs"
                                                    onclick="updateStatus('${link.id}',1)">
                                                上架
                                            </button>
                                        </c:if>
                                        <c:if test="${link.showable eq 1}">
                                            <button class="btn btn-warning btn-xs"
                                                    onclick="updateStatus('${link.id}',0)">
                                                下架
                                            </button>
                                        </c:if>
                                            <%--</sec:authorize>--%> <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.link_link_update})">--%>
                                        <button class="btn btn-info btn-xs" onclick="updateObject('${link.id}')">
                                            编辑
                                        </button>
                                            <%--</sec:authorize>--%>

                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.link_link_remove})">--%>
                                        <button class="btn btn-danger btn-xs"
                                                onclick="removeObject('${link.name}','${link.id}')">
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
<%--新链接--%>
<div class="modal fade" id="saveObjectModal" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增链接</h4>
            </div>
            <div class="modal-body">
                <form name="saveForm" id="saveForm" class="form-horizontal">
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">名称：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="name" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">顺序：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="seq" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">父级：</label>
                        </div>
                        <div class="col-xs-9">
                            <input type="text" readonly onclick="showMenu(this,0)" name="type.name"
                                   class="form-control">
                            <input name="type.id" type="hidden">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">链接：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="url"  type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">上下架：</label>
                        </div>
                        <div class="col-xs-9">
                            <select class="form-control" name="showable">
                                <option value="">请选择</option>
                                <option value="0">下架</option>
                                <option value="1">上架</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label">图标：</label>
                        </div>
                        <div class="col-xs-9">
                            <div id='previewDiv' class='img-preview col-xs-24 col-md-12'></div>
                        </div>
                        <input id="uploadInput" class="hidden" type="file" onchange="uploadPreview(this)"
                               accept="image/png,image/jpg,image/jpeg,image/bmp,image/gif"/>
                        <input name="image" id="url" type="hidden" class="form-control">
                    </div>
                </form>
                <div class="clearfix"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="submitSave()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--新增链接，模态框结束--%>
<%--编辑链接--%>
<div class="modal fade" id="updateObjectModal" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑链接</h4>
            </div>
            <div class="modal-body">
                <form id="updateForm" name="updateForm" class="form-horizontal">
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">名称：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="name" type="text" class="form-control">
                            <input type="hidden" name="id" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">顺序：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="seq" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">父级：</label>
                        </div>
                        <div class="col-xs-9">
                            <input type="text" readonly onclick="showMenu(this,0)" name="type.name"
                                   class="form-control">
                            <input name="type.id" type="hidden">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">链接：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="url" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">上下架：</label>
                        </div>
                        <div class="col-xs-9">
                            <select class="form-control" name="showable">
                                <option value="">请选择</option>
                                <option value="0">下架</option>
                                <option value="1">上架</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label">图标：</label>
                        </div>
                        <div class="col-xs-9">
                            <div id='updatePreviewDiv' class='img-preview col-xs-24 col-md-12'></div>
                        </div>
                        <input id="updateUploadInput" class="hidden" type="file" onchange="updateUploadPreview(this)"
                               accept="image/png,image/jpg,image/jpeg,image/bmp,image/gif"/>
                        <input name="image" id="updateUrl" type="hidden" class="form-control">
                    </div>
                </form>
                <div class="clearfix"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="submitUpdate()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--编辑链接，模态框结束--%>
<jsp:include page="../common/common.jsp"></jsp:include>
<script>
    ztreeName = "图片管理";
    updateHtml = "下架";
    ossPathName = "link/";
</script>
<%--新增链接--%>
<script type="text/javascript">
    var saveValidate = $saveForm.validate({
        errorClass: 'text-danger',
        rules: {
            name: {
                required: true,
                notEmpty: true
            },
            'type.id': {
                required: true,
                notEmpty: true
            },
            seq: {
                required: true,
                notEmpty: true,
                digits: true
            },
            showable: {
                required: true,
                notEmpty: true
            },
            url: {
                required: true,
                notEmpty: true,
                url:true
            }
        },
        messages: {
            name: {
                required: "名称不能为空",
                notEmpty: "名称不能为空"
            },
            'type.id': {
                required: "父级不能为空",
                notEmpty: "父级不能为空"
            },
            seq: {
                required: "顺序不能为空",
                notEmpty: "顺序不能为空",
                digits: "请输入数字"
            },
            showable: {
                required: "上下架状态不能为空",
                notEmpty: "上下架状态不能为空"
            },
            url: {
                required: "链接不能为空",
                notEmpty: "链接不能为空",
                url: "请输入正确格式的url"
            }
        },
        submitHandler: function () {
            doObject(saveUrl,$saveForm.serialize());
        }
    });

    $('#saveObjectModal').on('hidden.bs.modal', function (e) {
        saveValidate.resetForm();
        $saveForm[0].reset();
    });
</script>
<%--新增链接结束--%>
<%--编辑链接信息--%>
<script>
    $updateForm.validate({
        errorClass: 'text-danger',
        rules: {
            name: {
                required: true,
                notEmpty: true
            },
            'type.id': {
                required: true,
                notEmpty: true
            },
            seq: {
                required: true,
                notEmpty: true,
                digits: true
            },
            showable: {
                required: true,
                notEmpty: true
            },
            url: {
                required: true,
                notEmpty: true,
                url: true
            }
        },
        messages: {
            name: {
                required: "名称不能为空",
                notEmpty: "名称不能为空"
            },
            'type.id': {
                required: "父级不能为空",
                notEmpty: "父级不能为空"
            },
            seq: {
                required: "顺序不能为空",
                notEmpty: "顺序不能为空",
                digits: "请输入数字"
            },
            showable: {
                required: "上下架状态不能为空",
                notEmpty: "上下架状态不能为空"
            },
            url: {
                required: "链接不能为空",
                notEmpty: "链接不能为空",
                url: "请输入正确格式的网址"
            }
        },
        submitHandler: function () {
            doObject(updateUrl,$updateForm.serialize());
        }
    });
</script>
<%--编辑链接信息结束--%>
<jsp:include page="../common/select.jsp"></jsp:include>
<jsp:include page="../common/operationTip.jsp"></jsp:include>
</body>
</html>