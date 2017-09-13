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
    <title>澳彩网-系统管理-系统活动图</title>
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
                    活动图分类
                </h1>
                <button class="btn btn-success pull-right" style="margin-top: -3px;margin-right: 5px"
                        data-toggle="modal" data-target="#saveType">
                    新增
                </button>
            </div>
            <div class="wrapper-md col-xs-12 col-md-12 col-lg-12 panel panel-default pull-left">
                <div class="col-xs-4 col-md-4 col-lg-3 wrapper-md" style="height: 100%">
                    <div class="zTreeDemoBackground">
                        <ul id="typeTree" class="ztree" style="margin-top:0; width:160px;"></ul>
                    </div>
                </div>
                <div class="col-xs-16 col-md-8 col-lg-6  m-b-none wrapper-md">
                    <form name="form" id="updateForm" class="form-horizontal">
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
                                    <input type="text" readonly onclick="showMenu(this,0)" onchange="changeUpdateBtnStatus()" name="upType.name"
                                           class="form-control">
                                    <input name="type.id" type="hidden" >
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">上下架：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <select class="form-control" name="showable" onchange="changeUpdateBtnStatus()">
                                        <option value="">请选择</option>
                                        <option value="0">下架
                                        </option>
                                        <option value="1">上架
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4 col-md-9 col-md-offset-3 text-center wrapper-sm padder">
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
<%--新活动图--%>
<div class="modal fade" id="saveType" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增活动图类型</h4>
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
                            <input type="text" readonly onclick="showMenu(this,0)" class="form-control">
                            <input name="upType.id" type="hidden">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">上下架：</label>
                        </div>
                        <div class="col-xs-9">
                            <select class="form-control" name="showable">
                                <option value="">请选择</option>
                                <option value="0" >下架</option>
                                <option value="1" >上架</option>
                            </select>
                        </div>
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
<jsp:include page="../common/common.jsp"></jsp:include>
<script>
    function removeType() {
        var name = $("#typeName").val();
        var id = $("#typeId").val();
        removeObject(name,id);
    }
    ztreeName = "活动图分类";
    ossPathName = "banner/";
</script>
<%--新增活动图--%>
<script type="text/javascript">
    var saveValidate = $saveForm.validate({
        errorClass: 'text-danger',
        rules: {
            name: {
                required: true,
                notEmpty: true
            },
            'upType.id': {
                required: true,
                notEmpty: true
            },
            seq: {
                required: true,
                notEmpty: true,
                digits: true
            }
        },
        messages: {
            name: {
                required: "名称不能为空",
                notEmpty: "名称不能为空"
            },
            'upType.id': {
                required: "父级不能为空",
                notEmpty: "父级不能为空"
            },
            seq: {
                required: "顺序不能为空",
                notEmpty: "顺序不能为空",
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
<%--新增活动图结束--%>
<%--编辑活动图信息--%>
<script>
    $updateForm.validate({
        errorClass: 'text-danger',
        rules: {
            name: {
                required: true,
                notEmpty: true,
            },
            seq: {
                required: true,
                notEmpty: true,
            },
            'upType.id': {}
        },
        messages: {
            name: {
                required: "名称不能为空",
                notEmpty: "名称不能为空"
            },
            seq: {
                required: "key不能为空",
                notEmpty: "key不能为空"
            }
        },
        submitHandler: function () {
            doPost("<%=request.getContextPath()%>/admin/banner/type/update", $updateForm.serialize(), function (data) {
                if (data.status) {
                    $("#info_success").modal("show");
                } else {
                    $("#infoOfFalse").html(data.msg);
                    $("#info_fail").modal("show");
                }
            });
        }
    });

</script>
<%--编辑活动图信息结束--%>
<%--结束--%>
<jsp:include page="../common/operationTip.jsp"></jsp:include>
<jsp:include page="../common/selectCategory.jsp"></jsp:include>
</body>
</html>
