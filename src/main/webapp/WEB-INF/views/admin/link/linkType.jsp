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
                    <form name="form" class="form-horizontal">
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
                                    <input type="text" readonly onclick="showMenu(this,0)" onchange="changeUpdateBtnStatus()" name="upTypeName" class="form-control">
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
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4 col-md-8 text-center col-md-offset-4 wrapper-sm padder">
                            <div class="row">
                                <div class="">
                                    <input type="button" class="btn btn-danger m-r-sm" value="删除"
                                           onclick="removeType()">
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
    $updateForm.find("input").on('input', function () {
        if ($(this).val().length > 0) {
            $updateForm.find("input[type='button']").prop('disabled', false);
        } else {
            $updateForm.find("input[type='button']").prop('disabled', true);
        }
    });
    $updateForm.find("input[name='upType.id']").on('change', function () {
        if ($(this).val().length > 0) {
            $updateForm.find("input[type='button']").prop('disabled', false);
        } else {
            $updateForm.find("input[type='button']").prop('disabled', true);
        }
    });
    function changeUpdateBtnStatus(){
        $updateForm.find("input[type='button']").prop('disabled', false);
    }
</script>
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
                            <input type="text" readonly onclick="showMenu(this,0)"  class="form-control">
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
<%--新增链接--%>
<script type="text/javascript">
    var $saveForm = $("form[name='saveForm']");  //新增的表单
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
            },
            seq: {
                required: true,
                digits: true
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
            doPost("<%=request.getContextPath()%>/admin/link/type/save", $saveForm.serialize(), function (data) {
                if (data.status) {
                    $("#info_success").modal("show");
                } else {
                    $("#infoOfFalse").html(data.msg);
                    $("#info_fail").modal("show");
                }
            });
        }
    });

    $('#saveType').on('hidden.bs.modal', function (e) {
        saveValidate.resetForm();
        $saveForm[0].reset();
    });

    //使用ajax提交表单
    function submitSave() {
        $saveForm.submit();
    }
</script>
<%--新增链接结束--%>
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
            client.multipartUpload("link/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
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
<%--删除链接--%>
<script type="text/javascript">
    var removeId;
    var removeUrl;
    var removeIndex; //删除图片的下标
    // 删除操作，删除对应的对象
    function removeType() {
        var removeName = $("#typeName").val();
        removeId = $("#typeId").val();
        removeUrl = "<%=request.getContextPath()%>/admin/link/type/remove";
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
<%--删除链接结束--%>
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
                "<a id='addUpdate' class='add' onclick='clickUpdateUploadInput()'>" +
                "<i class='fa fa-plus'></i>" +
                "</a>" +
                "</label>";
        }
        $updatePreviewDiv.html(html);
    }
    function clickUpdateUploadInput(){
        $("#updateUploadInput").click();
    }

    function updateUploadPreview(file) {
        if (file.files && file.files[0]) {
            $("#addUpdate").html("<i class='fa fa-spin fa-spinner'></i>");
//            这是需要修改图片路径，模块
            client.multipartUpload("link/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
                progress: function*(p) {
                    console.log('Progress: ' + p);
                }
            }).then(function (result) {
                console.log(result);
                updateImages.push(result.url );
                $("#updateValue").val(result.url );
                updateUpdatePreviewDiv();
            }).catch(function (err) {
                console.log(err);
            });
            changeUpdateBtnStatus();
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
            doPost("<%=request.getContextPath()%>/admin/link/type/update", $updateForm.serialize(), function (data) {
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
<%--编辑链接信息结束--%>
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
        return "<%=request.getContextPath()%>/admin/link/type/combo/tree";
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
                name:"链接分类",
                children:responseData.data
            }
            return data;
        } else {
            alert(responseData.msg);
            return [];
        }
    }

    $(document).ready(function () {
        zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);
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
            changeUpdateBtnStatus();
        }
        $("#selectCategory").modal('hide');
    }
</script>
<%--选择分类管理结束--%>
<%--侧边选择分类修改链接分类--%>
<script>
    //ztree设置
    var typeId;
    var zTreeObjType, settingType = {
        showLine:true,
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
    function onAsyncSuccessType(treeNode){
    }
    //显示菜单
    function showMenuType() {
        zTreeObjType.reAsyncChildNodes(null, "refresh");
    }

    //节点点击事件
    function onClickTypeNode(e, treeId, treeNode) {
        var sNodes = zTreeObjType.getSelectedNodes();
        typeId = sNodes[0].id;
        doPost("<%=request.getContextPath()%>/admin/link/type/get", {id: typeId}, function (data) {
            var _data = data.data;
            if (data.status) {
                $updateForm.find("input[name='id']").val(_data.id);
                $("#typeId").val(_data.id);
                $updateForm.find("input[name='name']").val(_data.name);
                $updateForm.find("select[name='showable']").val(_data.showable);
                $updateForm.find("input[name='seq']").val(_data.seq);
                $updateForm.find("input[name='upType.id']").val(_data.upType.id);
                $updateForm.find("input[name='icon']").val(_data.icon);
                $updateForm.find("input[name='urlPrefix']").val(_data.urlPrefix);
                $updateForm.find("input[name='upTypeName']").val(_data.upType.name);
                $updateForm.find("input[value='删除']").prop('disabled', false);
                $updateForm.find("input[value='保存']").prop('disabled', true);
                updateImages = [];
                if (_data.icon != null) {
                    updateImages.push(_data.icon);
                    updateUpdatePreviewDiv();
                }
            } else {
                alert(data.msg);
            }
        });
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
