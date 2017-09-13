<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/4
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>澳彩网-系统管理-系统链接</title>
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
                <button class="btn btn-success pull-right" style="margin-top: -3px;margin-right: 5px"
                        data-toggle="modal" data-target="#saveType">
                    新增
                </button>
            </div>
            <div class="wrapper-md col-xs-12 col-md-12 col-lg-12 panel panel-default pull-left">
                <div class="col-xs-4 col-md-4 col-lg-3 wrapper-md" style="height: 100%">
                        <div   class="zTreeDemoBackground">
                            <ul id="typeTree" class="ztree" style="margin-top:0; width:160px;"></ul>
                        </div>
                </div>
                <div class="col-xs-8 col-md-8 col-lg-6  m-b-none wrapper-md">
                    <form name="updateForm" id="updateForm" class="form-horizontal">
                        <div class="wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">编号：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <input id="typeId" disabled type="text" class="form-control">
                                    <input name="id" type="hidden" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">名称：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <input name="name" id="typeName" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">顺序：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <input name="seq" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">父级：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <input type="text" onclick="showMenu(this,0)" onchange="changeUpdateBtnStatus()" name="upType.name" class="form-control">
                                    <input name="upType.id" type="hidden">
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">状态：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <select name="showable" onchange="changeUpdateBtnStatus()" class="form-control">
                                        <option value="" selected="selected">请选择</option>
                                        <option value="0">禁用</option>
                                        <option value="1">正常</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label">图标：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <div id="updatePreviewDiv" class="img-preview col-xs-8 col-md-9">
                                    </div>
                                    <input id="updateUploadInput" class="hidden" type="file"
                                           onchange="updateUploadPreview(this)"
                                           accept="image/png,image/jpg,image/jpeg,image/bmp,image/gif"/>
                                    <input name="icon" id="updateUrl" type="hidden" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4 col-md-8 text-center col-md-offset-4 wrapper-sm padder">
                            <div class="row">
                                <div class="">
                                    <input type="button" class="btn btn-danger m-r-sm" value="删除"
                                           onclick="removeType()">
                                    <input type="button" class="btn  btn-info " data-toggle="modal"
                                           data-target="#updateOperationModal" value="保存">
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--新链接--%>
<div class="modal fade" id="saveType" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增链接类型</h4>
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
                            <input type="text" readonly onclick="showMenu(this,0)" name="upType.name" class="form-control">
                            <input name="upType.id" type="hidden">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">状态：</label>
                        </div>
                        <div class="col-xs-9">
                            <select name="showable" class="form-control">
                                <option value="" selected="selected">请选择</option>
                                <option value="0">禁用</option>
                                <option value="1">正常</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label">图标：</label>
                        </div>
                        <div class="col-xs-9">
                            <div id='previewDiv' class='img-preview '></div>
                        </div>
                        <input id="uploadInput" class="hidden" type="file" onchange="uploadPreview(this)"
                               accept="image/png,image/jpg,image/jpeg,image/bmp,image/gif"/>
                        <input name="icon" id="url" type="hidden" class="form-control">
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
<jsp:include page="../common/common.jsp"></jsp:include>
<script>
    function removeType() {
        var name = $("#typeName").val();
        var id = $("#typeId").val();
        removeObject(name,id);
    }
    ztreeName = "链接分类";
    ossPathName = "link/";
</script>
<%--新增链接--%>
<script type="text/javascript">
    var saveValidate = $saveForm.validate({
        errorClass: 'text-danger',
        rules: {
            name: {
                required: true,
                notEmpty:true
            },
            seq: {
                required: true,
                notEmpty:true
            },
            'upType.id': {
                required: true,
                notEmpty:true

            },
            showable: {
                required: true
            }
        },
        messages: {
            name: {
                required: "名称不能为空"
            },
            key: {
                required: "key不能为空"
            },
            'upType.id': {
                required: "父级不能为空"
            },
            showable: {
                required: "状态不能为空"
            },
            seq: {
                required: "顺序不能为空",
                digits: "请输入数字"
            }
        },
        submitHandler: function () {
            doObject(saveUrl,$saveForm.serialize());
        }
    });

    $('#saveType').on('hidden.bs.modal', function (e) {
        saveValidate.resetForm();
        $saveForm[0].reset();
    });

</script>
<%--编辑文件图片上传结束--%>
<%--编辑链接信息--%>
<script>
    $updateForm.validate({
        errorClass: 'text-danger',
        rules: {
            name: {
                required: true
            },
            key: {
                required: true
            },
            typeType: {},
            value: {}
        },
        messages: {
            name: {
                required: "名称不能为空"
            },
            key: {
                required: "key不能为空"
            },
            typeType: {},
            value: {}
        },
        submitHandler: function () {
            doObject(updateUrl,$updateForm.serialize());
        }
    });
</script>
<%--编辑链接信息结束--%>
<jsp:include page="../common/selectCategory.jsp"></jsp:include>
<jsp:include page="../common/operationTip.jsp"></jsp:include>
</body>
</html>
