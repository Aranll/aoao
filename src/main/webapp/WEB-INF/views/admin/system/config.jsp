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
    <title>澳彩网-系统管理-系统配置</title>
    <%@include file="../common/head.jsp" %>
    <%@include file="../common/validate.jsp" %>
    <%@include file="../common/oss.jsp"%>
</head>
<body>
<div class="app app-header-fixed app-aside-fixed">
    <%@include file="../common/header.jsp" %>
    <%@include file="system_nav.jsp" %>
    <div class="app-content">
        <div class="app-content-body">
            <div class="bg-light lter b-b wrapper-md ">
                <h1 class="m-n font-thin h3 inline">
                    系统配置
                </h1>
                <button class="btn btn-success pull-right" style="margin-top: -3px;margin-right: 5px"
                        data-toggle="modal" data-target="#saveConfig">
                    新增
                </button>
            </div>
            <div class="wrapper-md col-lg-12 panel panel-default pull-left">
                <div class="col-xs-3 col-md-4 col-lg-3 wrapper-md" style="height: 100%">
                    <div class="list-group">
                        <a class="list-group-item active">系统配置</a>
                        <c:forEach items="${configs}" var="config">
                            <a onclick="getConfigById('${config.id}')"
                               class="list-group-item" style="white-space:nowrap;overflow:hidden;text-overflow : ellipsis">${config.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-xs-9 col-md-8 col-lg-9  m-b-none wrapper-md">
                    <form name="form" class="form-horizontal">
                        <div class=" wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-2 no-padder text-right">
                                    <label class="control-label required">编号：</label>
                                </div>
                                <div class="col-xs-8 col-md-6">
                                    <input id="configId" disabled type="text" class="form-control">
                                    <input name="id" type="hidden" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class=" wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-2 no-padder text-right">
                                    <label class="control-label required">名称：</label>
                                </div>
                                <div class="col-xs-8 col-md-6">
                                    <input name="name" id="configName" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class=" wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-2 no-padder text-right">
                                    <label class="control-label required">配置KEY：</label>
                                </div>
                                <div class="col-xs-8 col-md-6">
                                    <input name="key" disabled type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class=" wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-2 no-padder text-right">
                                    <label class="control-label">配置值：</label>
                                </div>
                                <div class="col-xs-8 col-md-6" id="updateConfigTypeText">
                                    <input name="value" type="text" id="updateValue" class="form-control">
                                </div>
                                <div class="col-xs-8 col-md-6" id="updateConfigTypeImg" style="display: none">
                                    <div id="updatePreviewDiv" class="img-preview col-xs-8 col-md-6">
                                    </div>
                                    <input id="updateUploadInput" class="hidden" type="file"
                                           onchange="updateUploadPreview(this)"
                                           accept="image/png,image/jpg,image/jpeg,image/bmp,image/gif"/>
                                </div>
                            </div>
                        </div>
                        <div class=" wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-8 col-md-6 text-center col-xs-offset-3 col-md-offset-2">
                                    <input type="button" class="btn btn-danger m-r-sm" value="删除"
                                           onclick="removeConfig()">
                                    <input type="button" class="btn  btn-info " data-toggle="modal"
                                           data-target="#updateOperation" value="保存">
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
<script type="text/javascript">
    var $updateForm = $("form[name='form']");
    $updateForm.find("input[type='button']").prop('disabled', true);
    $updateForm.find("input[name='value']").on('input', function () {
        if ($(this).val().length > 0) {
            $updateForm.find("input[type='button']").prop('disabled', false);
        } else {
            $updateForm.find("input[type='button']").prop('disabled', true);
        }
    });
    $updateForm.find("input[name='name']").on('input', function () {
        if ($(this).val().length > 0) {
            $updateForm.find("input[type='button']").prop('disabled', false);
        } else {
            $updateForm.find("input[type='button']").prop('disabled', true);
        }
    });
</script>
<%--获取配置信息--%>
<script type="text/javascript">
    var configId;
    function getConfigById(id) {
        configId = id;
        doPost("<%=request.getContextPath()%>/admin/system/config/get", {id: configId}, function (data) {
            var _data = data.data;
            if (data.status) {
                $updateForm.find("input[name='id']").val(_data.id);
                $("#configId").val(_data.id);
                $updateForm.find("input[name='name']").val(_data.name);
                $updateForm.find("input[name='key']").val(_data.key);
                $updateForm.find("input[name='value']").val(_data.value);
                $updateForm.find("input[value='删除']").prop('disabled', false);
                if (_data.configType === 0) {
                    $("#updateConfigTypeText").show();
                    $("#updateConfigTypeImg").hide();
                } else {
                    updateImages = [];
                    updateImages.push(_data.value);
                    updateUpdatePreviewDiv();
                    $("#updateConfigTypeText").hide();
                    $("#updateConfigTypeImg").show();
                }
            } else {
                alert(data.msg);
            }
        });
    }
</script>
<%--获取配置信息结束--%>

<%--新配置--%>
<div class="modal fade" id="saveConfig" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增配置</h4>
            </div>
            <div class="modal-body">
                <form name="saveForm" class="form-horizontal">
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">名称：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="name" type="text" class="form-control" value="${name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">配置Key：</label>
                        </div>
                        <div class="col-xs-9">
                            <input name="key" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label ">配置类型：</label>
                        </div>
                        <div class="col-xs-3">
                            <select name="configType" id="saveConfigType" class="form-control">
                                <option value="0" selected="selected">文本</option>
                                <option value="1">图片</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label ">配置值：</label>
                        </div>
                        <div class="col-xs-9" id="configValueText">
                            <input name="value" id="url" type="text" class="form-control">
                        </div>
                        <div class="col-xs-9" style="display: none" id="configValueImg">
                            <div id='previewDiv' class='img-preview col-xs-12 col-md-12'></div>
                        </div>
                        <input id="uploadInput" class="hidden" type="file" onchange="uploadPreview(this)"
                               accept="image/png,image/jpg,image/jpeg,image/bmp,image/gif"/>
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
<%--新增配置，模态框结束--%>
<%--新增配置--%>
<script type="text/javascript">
    var $saveForm = $("form[name='saveForm']");  //新增的表单
    var $saveConfigType = $("#saveConfigType");  //要保存的文件类型
    var saveValidate = $saveForm.validate({
        errorClass: 'text-danger',
        rules: {
            name: {
                required: true
            },
            key: {
                required: true
            }
        },
        messages: {
            name: {
                required: "名称不能为空"
            },
            key: {
                required: "key不能为空"
            }
        },
        submitHandler: function () {
            doPost("<%=request.getContextPath()%>/admin/system/config/save", $saveForm.serialize(), function (data) {
                if (data.status) {
                    $("#info_success").modal("show");
                } else {
                    $("#infoOfFalse").html(data.msg);
                    $("#info_fail").modal("show");
                }
            });
        }
    });

    $('#saveConfig').on('hidden.bs.modal', function (e) {
        saveValidate.resetForm();
        $saveForm[0].reset();
        if ($saveConfigType.val() == 0) {
            $("#configValueText").show();
            $("#configValueImg").hide();
        } else {
            $("#configValueText").hide();
            $("#configValueImg").show();
        }
    });
    //当文件类型改变时，修改输入样式。富文本或图片
    $saveConfigType.on('change', function () {
        if ($saveConfigType.val() == 0) {
            $("#configValueText").show();
            $("#configValueImg").hide();
        } else {
            $("#configValueText").hide();
            $("#configValueImg").show();
        }
    });


    //使用ajax提交表单
    function submitSave() {
        $saveForm.submit();
    }
</script>
<%--新增配置结束--%>
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
                "<a id='add' class='add' onclick=\"$('#uploadInput').click();\">" +
                "<i class='fa fa-plus'></i>" +
                "</a>" +
                "</label>";
        }
        $previewDiv.html(html);
    }
    //上传文件
    function uploadPreview(file) {
        if (file.files && file.files[0]) {
            $("#add").html("<i class='fa fa-spin fa-spinner'></i>");
//            这是需要修改图片路径，模块
            client.multipartUpload("config/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
                progress: function*(p) {
                    console.log('Progress: ' + p);
                }
            }).then(function (result) {
                images.push(result.url);
                $("#url").val(result.url);
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

<%--删除配置--%>
<script type="text/javascript">
    var removeId;
    var removeUrl;
    var removeIndex; //删除图片的下标
    // 删除操作，删除对应的对象
    function removeConfig() {
        var removeName = $("#configName").val();
        removeId = $("#configId").val();
        removeUrl = "<%=request.getContextPath()%>/admin/system/config/remove";
        var html = "删除系统配置可能你导致系统不可用！确定删除？" + "<br>" + "[" + removeId + "-" + removeName + "]"
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
<%--删除配置结束--%>
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
                "<a id='addUpdate' class='add' onclick=\" $('#updateUploadInput').click()\">" +
                "<i class='fa fa-plus'></i>" +
                "</a>" +
                "</label>";
        }
        $updatePreviewDiv.html(html);
    }

    function updateUploadPreview(file) {
        if (file.files && file.files[0]) {
            $("#addUpdate").html("<i class='fa fa-spin fa-spinner'></i>");
//            这是需要修改图片路径，模块
            client.multipartUpload("picture/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
                progress: function*(p) {
                    console.log('Progress: ' + p);
                }
            }).then(function (result) {
                console.log(result);
                updateImages.push(result.url);
                $("#updateValue").val(result.url);
                changeUpdateBtnStatus();
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
<%--编辑配置信息--%>
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
            configType: {},
            value: {}
        },
        messages: {
            name: {
                required: "名称不能为空"
            },
            key: {
                required: "key不能为空"
            },
            configType: {},
            value: {}
        },
        submitHandler: function () {
            doPost("<%=request.getContextPath()%>/admin/system/config/update", $updateForm.serialize(), function (data) {
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
    function changeUpdateBtnStatus(){
        $updateForm.find("input[type='button']").prop('disabled', false);
    }
</script>
<%--编辑配置信息结束--%>

<%--编辑及删除图片结束--%>
<jsp:include page="../common/operationTip.jsp"></jsp:include>
</body>
</html>
