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
    <title>澳彩网-系统管理-活动图管理</title>
    <%@include file="../common/head.jsp" %>
    <%@include file="../common/validate.jsp" %>
    <%@include file="../common/ztree.jsp" %>
    <%@include file="../common/oss.jsp"%>
</head>
<body>
<div class="app app-header-fixed app-aside-fixed">
    <%@include file="../common/header.jsp" %>
    <%@include file="../article/article_nav.jsp" %>
    <div class="app-content">
        <div class="app-content-body">
            <div class="bg-light lter b-b wrapper-md ">
                <h1 class="m-n font-thin h3 inline">
                    系统活动图
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
                                            <c:if test="${banner.showable eq 0}">selected="selected"</c:if>>下架
                                    </option>
                                    <option value="1"
                                            <c:if test="${banner.showable eq 1}">selected="selected"</c:if> >
                                        上架
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group m-t-n-md">
                            <div class="col-xs-12">
                                <input type="button" class="btn btn-success btn-default" data-toggle="modal"
                                       data-target="#saveBanner" value="新增">
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
                            <c:if test="${banners.size() eq 0}">
                                <tr>
                                    <td colspan="6">无数据</td>
                                </tr>
                            </c:if>
                            <c:forEach items="${banners}" var="banner">
                                <tr>
                                    <td>${banner.id}</td>
                                    <td><img src="${banner.image}" style="max-width: 50px;max-height: 70px;" alt="">
                                    </td>
                                    <td>${banner.name}</td>
                                    <td>${banner.seq}</td>
                                    <c:if test="${banner.showable eq 0}">
                                        <td>下架</td>
                                    </c:if>
                                    <c:if test="${banner.showable eq 1}">
                                        <td>上架</td>
                                    </c:if>
                                    <td>
                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.banner_banner_get})">--%>
                                        <a href="${banner.url}">
                                            <button class="btn btn-success btn-xs">
                                                预览
                                            </button>
                                        </a>
                                            <%--</sec:authorize>--%>
                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.banner_banner_update})">--%>
                                        <c:if test="${banner.showable eq 0}">
                                            <button class="btn btn-warning btn-xs"
                                                    onclick="updateStatus('${banner.id}',1)">
                                                上架
                                            </button>
                                        </c:if>
                                        <c:if test="${banner.showable eq 1}">
                                            <button class="btn btn-warning btn-xs"
                                                    onclick="updateStatus('${banner.id}',0)">
                                                下架
                                            </button>
                                        </c:if>
                                            <%--</sec:authorize>--%> <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.banner_banner_update})">--%>
                                        <button class="btn btn-info btn-xs" onclick="updateBanner('${banner.id}')">
                                            编辑
                                        </button>
                                            <%--</sec:authorize>--%>

                                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.banner_banner_remove})">--%>
                                        <button class="btn btn-danger btn-xs"
                                                onclick="remove('${banner.name}','${banner.id}','<%=request.getContextPath()%>/admin/banner/banner/remove')">
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

<%--新活动图--%>
<div class="modal fade" id="saveBanner" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增活动图</h4>
            </div>
            <div class="modal-body">
                <form name="saveForm" class="form-horizontal">
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
                            <label class="control-label">链接：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="name" placeholder="留空则点击不跳转" type="text" class="form-control">
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
<%--新增活动图，模态框结束--%>
<%--新增活动图--%>
<script type="text/javascript">
    var $saveForm = $("form[name='saveForm']");  //新增的表单
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
            }
        },
        submitHandler: function () {
            doPost("<%=request.getContextPath()%>/admin/banner/banner/save", $saveForm.serialize(), function (data) {
                if (data.status) {
                    $("#info_success").modal("show");
                } else {
                    $("#infoOfFalse").html(data.msg);
                    $("#info_fail").modal("show");
                }
            });
        }
    });

    $('#saveBanner').on('hidden.bs.modal', function (e) {
        saveValidate.resetForm();
        $saveForm[0].reset();
    });

    //使用ajax提交表单
    function submitSave() {
        $saveForm.submit();
    }
</script>
<%--新增活动图结束--%>
<%--文件上传&&新增图片--%>
<script>
    var images = [];
    var $previewDiv = $("#previewDiv");

    $(function () {
        updatePreviewDiv();
    });
    function updatePreviewDiv() {
        var html = "";
        $.each(images, function (index, image) {
            html += "<label>" +
                "<img src='" + image + "'/>" +
                "<a class='delete' href='javascript:confirmDeleteUpload(" + index + ")'>删除</a>" +
                "</label>";
        });
        if (images.length === 0) {
            html += "<label>" +
                "<a id='add' class='add' onclick='clickUploadInput()'>" +
                "<i class='fa fa-plus'></i>" +
                "</a>" +
                "</label>";
        }
        $previewDiv.html(html);
    }
    function clickUploadInput() {
        $('#uploadInput').click();
    }
    //上传文件
    function uploadPreview(file) {
        if (file.files && file.files[0]) {
            $("#add").html("<i class='fa fa-spin fa-spinner'></i>");
//            这是需要修改图片路径，模块
            client.multipartUpload("banner/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
                progress: function*(p) {
                    console.log('Progress: ' + p);
                }
            }).then(function (result) {
                images.push(result.url );
                $("#url").val(result.url );
                updatePreviewDiv();
            }).catch(function (err) {
                console.log(err);
            });
        }
        $('#uploadInput').val("");
    }
    //弹出模态框确认删除操作
    function confirmDeleteUpload(index) {
        removeIndex = index;
        $("#removeSaveIMG").modal("show");
    }
    function removeSaveIMG() {
        images.splice(removeIndex, 1);
        updatePreviewDiv();
        $("#removeSaveIMG").modal("hide");
    }
</script>
<%--文件上传结束--%>

<%--改变用户状态--%>
<div class="modal fade" id="changeId" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body">
                <h4 class="text-danger" id="statusInfo"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="submitChange()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--上下架开始--%>
<script>
    var bannerId;
    var bannerShowable;
    function updateStatus(id, status) {
        bannerId = id;
        bannerShowable = status;
        if (status == 0) {
            $("#statusInfo").html("确定下架？");
        } else {
            $("#statusInfo").html("确定上架?");
        }
        $("#changeId").modal('show');
    }
    function submitChange() {
        doPost("<%=request.getContextPath()%>/admin/banner/banner/update", {
            id: bannerId,
            showable: bannerShowable
        }, function (data) {
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

<%--删除新增图片--%>
<div class="modal fade" id="removeSaveIMG" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body text-center">
                <h4 class="text-danger">确定删除该图片？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="removeSaveIMG()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--删除图片结束--%>
<%--删除活动图--%>
<script type="text/javascript">
    var removeId;
    var removeUrl;
    var removeName;
    var removeIndex; //删除图片的下标
    // 删除操作，删除对应的对象
    function remove(name, id, url) {
        removeName = name;
        removeId = id;
        removeUrl = url;
        var html = "确认删除分类？" + "<br>" + "[" + removeId + "-" + removeName + "]"
        $("#delete_info").html(html);
        $("#deleteOperation").modal('show');
    }
    function submitRemove() {
        doPost(removeUrl, {id: removeId}, function (data) {
            //防止误删
            removeId = null;
            removeUrl = null;
            if (data.status) {
                $("#info_success").modal('show');
            } else {
                $("#infoOfFalse").html(data.msg);
                $("#info_fail").modal('show');
            }
        });
        //防止误删
        if (removeId != null) {
            removeId = null;
            removeUrl = null;
        }
    }

</script>
<%--删除活动图结束--%>
<%--删除编辑图片--%>
<div class="modal fade" id="removeUpdateIMG" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body text-center">
                <h4 class="text-danger">确定删除？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="removeUpdateIMG()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--删除编辑文件结束--%>


<%--编辑活动图--%>
<div class="modal fade" id="updateBanner" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑活动图</h4>
            </div>
            <div class="modal-body">
                <form name="updateForm" class="form-horizontal">
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
                            <label class="control-label">链接：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="url" placeholder="留空则点击不跳转" type="text" class="form-control">
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
                        <input id="updateUploadInput" class="hidden" type="file" onchange="uploadPreview(this)"
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
<%--编辑活动图，模态框结束--%>
<%--获取编辑活动图--%>
<script>
    var $updateForm = $("form[name='updateForm']");
    function updateBanner(id) {
        var id = id;
        doPost("<%=request.getContextPath()%>/admin/banner/banner/get", {id: id}, function (data) {
            var _data = data.data;
            var image = '';
            if (data.status) {
                $updateForm.find("input[name='id']").val(_data.id);
                $updateForm.find("input[name='name']").val(_data.name);
                $updateForm.find("input[name='seq']").val(_data.seq);
                $updateForm.find("input[name='type.name']").val(_data.type.name);
                $updateForm.find("input[name='type.id']").val(_data.type.id);
                $updateForm.find("input[name='url']").val(_data.url);
                $updateForm.find("select[name='showable']").val(_data.showable);
                $updateForm.find("input[name='image']").val(_data.image);
                updateImages = [];
                updateImages.push(_data.image);
                updateUpdatePreviewDiv();
            } else {
                $("#infoOfFalse").html(data.msg);
                $("#info_fail").modal().show();
            }
        });
        $("#updateBanner").modal("show");
    }
</script>
<%--获取结束--%>
<%--编辑文件图片上传--%>
<script type="text/javascript">
    var updateImages = [];
    var $updatePreviewDiv = $("#updatePreviewDiv");
    $(function () {
        updateUpdatePreviewDiv();
    });

    function updateUpdatePreviewDiv() {
        var html = "";
        $.each(updateImages, function (index, image) {
            html += "<label>" +
                "<img src='" + image + "'/>" +
                "<a class='delete' href='javascript:updateConfirmDeleteUpload(" + index + ")'>删除" +
                "</a>" +
                "</label>";
        });
        if (updateImages.length === 0) {
            html += "<label>" +
                "<a id='addUpdate' class='add' onclick='clickUpdateUploadInput()'>" +
                "<i class='fa fa-plus'></i>" +
                "</a>" +
                "</label>";
        }
        $updatePreviewDiv.html(html);
    }
    function clickUpdateUploadInput() {
        $("#updateUploadInput").click();
    }

    function updateUploadPreview(file) {
        if (file.files && file.files[0]) {
            $("#addUpdate").html("<i class='fa fa-spin fa-spinner'></i>");
//            这是需要修改图片路径，模块
            client.multipartUpload("banner/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
                progress: function*(p) {
                    console.log('Progress: ' + p);
                }
            }).then(function (result) {
                console.log(result);
                updateImages.push(result.url );
                $("#updateUrl").val(result.url );
                updateUpdatePreviewDiv();
            }).catch(function (err) {
                console.log(err);
            });
        }
        $('#updateUploadInput').val("");
    }


    function updateConfirmDeleteUpload(index) {
        removeIndex = index;
        $("#removeUpdateIMG").modal("show");

    }
    function removeUpdateIMG() {
        updateImages.splice(removeIndex, 1);
        updateUpdatePreviewDiv();
        $("#removeUpdateIMG").modal("hide");
    }


</script>
<%--编辑文件图片上传结束--%>
<%--编辑活动图信息--%>
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
            }
        },
        submitHandler: function () {
            doPost("<%=request.getContextPath()%>/admin/banner/banner/update", $updateForm.serialize(), function (data) {
                if (data.status) {
                    $("#info_success").modal("show");
                } else {
                    $("#infoOfFalse").html(data.msg);
                    $("#info_fail").modal("show");
                }
            });
        }
    });

    function submitUpdate() {
        $updateForm.submit();
    }
</script>
<%--编辑活动图信息结束--%>
<%--编辑及删除图片结束--%>

<%--选择分类--%>
<div id="selectCategory" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
                <div id="menuContent2" myStatus="hidden" class="zTreeDemoBackground ">
                    <ul id="tree" class="ztree" style="margin-top:0; width:160px;"></ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<%--选择分类结束--%>
<%--选择分类管理--%>
<script>
    var $searchForm = $("#searchForm");
    //type 0为展示所有节点，1为展示一级节点，2为展示一二级节点
    var type;
    var targetElement;
    //ztree设置
    var zTreeObj, setting = {
        check: {
            enable: false
        },
        async: {
            enable: true,
            type: "post",
            url: asyncUrl,
            dataFilter: asyncFilter
        },
        callback: {
            onClick: onClickNode,
            beforeAsync: beforeAsync,
            onAsyncSuccess: onAsyncSuccess
        }
    };
    var zTreeNodes = [];
    function asyncUrl() {
        return "<%=request.getContextPath()%>/admin/banner/type/combo/tree";
    }
    function onAsyncSuccess() {
        if (type == 1) {
            var allNodes = zTreeObj.getNodes();

            for (var i = 0; i < allNodes.length; i++) {
                zTreeObj.removeChildNodes(allNodes[i]);
            }
        } else if (type == 2) {
            var allNodes = zTreeObj.getNodes();
            for (var i = 0; i < allNodes.length; i++) {
                var childNodes = allNodes[i].children;
                for (var j = 0; j < childNodes[j].length; j++) {
                    zTreeObj.removeChildNodes(allNodes[i]);
                }
            }
        }
    }

    function beforeAsync(treeId, treeNode) {
        if (treeNode === undefined)
            return false;
    }

    function asyncFilter(treeId, parentNode, responseData) {
        if (responseData.status) {
            var data = {
                id:0,
                name:"图片管理",
                children: responseData.data
            }
            return data;
        } else {
            alert(responseData.msg);
            return [];
        }
    }

    $(document).ready(function () {
        zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);
        zTreeObj.expandAll(true);
    });
    function ZtreeNode(id, pId, name) {//定义ztree的节点类
        this.id = id;
        this.pId = pId;
        this.name = name;
    }
    //显示菜单
    function showMenu(e, t) {
        targetElement = e;
        type = t;
        zTreeObj.reAsyncChildNodes(null, "refresh");

        $("#selectCategory").modal();
        $("#menuContent2").css({left: "15px", top: "34px"}).slideDown("fast");
    }

    //节点点击事件
    function onClickNode(e, treeId, treeNode) {
        var sNodes = zTreeObj.getSelectedNodes();
        if (sNodes.length > 0) {
            $(targetElement).next().attr("value", (sNodes[0].id));
            $(targetElement).val(sNodes[0].name);

        }
        $("#selectCategory").modal('hide');
    }
</script>
<%--选择分类管理结束--%>
<%--侧边选择分类修改活动图分类--%>
<script>
    //ztree设置
    var typeId;
    var zTreeObjType, settingType = {
        showLine: true,
        check: {
            enable: false
        },
        async: {
            enable: true,
            type: "post",
            url: asyncUrl,
            dataFilter: asyncFilter
        },
        callback: {
            onClick: onClickTypeNode,
            beforeAsync: beforeAsyncType,
            onAsyncSuccess: onAsyncSuccessType()
        }
    };

    function beforeAsyncType(treeId, treeNode) {
        if (treeNode === undefined)
            return false;
    }
    function onAsyncSuccessType(treeNode) {
    }
    //显示菜单
    function showMenuType() {
        zTreeObjType.reAsyncChildNodes(null, "refresh");
    }

    //节点点击事件
    function onClickTypeNode(e, treeId, treeNode) {
        var sNodes = zTreeObjType.getSelectedNodes();
        $("#typeId").val(sNodes[0].id);
        $searchForm.submit();
    }


    $(document).ready(function () {
        zTreeObjType = $.fn.zTree.init($("#typeTree"), settingType, zTreeNodes);
        showMenuType();
    });
</script>
<%--结束--%>
<jsp:include page="../common/operationTip.jsp"></jsp:include>
</body>
</html>