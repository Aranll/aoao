<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/8
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>澳彩网-系统管理-文章管理-编辑文章</title>
    <%@include file="../common/head.jsp" %>
    <%@include file="../common/validate.jsp" %>
    <%@include file="../common/ueditor.jsp" %>
    <%@include file="../common/ztree.jsp" %>
    <%@include file="../common/oss.jsp"%>

</head>
<body>
<div class="app app-header-fixed app-aside-fixed">
    <%@include file="../common/header.jsp" %>
    <%@include file="./article_nav.jsp" %>
    <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_article_create})">--%>
    <div class="app-content ">
        <div class="app-content-body">
            <div class="bg-light lter b-b wrapper-md ">
                <h1 class="m-n font-thin h3 inline">
                    文章管理 > 编辑文章
                </h1>
                <a class="btn btn-default pull-right" style="margin-top: -3px" href="${redirectUrl}">
                    返回
                </a>
                <button class="btn btn-success pull-right" style="margin-top: -3px;margin-right: 5px"
                        onclick="submitForm()">
                    确定
                </button>
            </div>
            <div class="wrapper-md">
                <div class="panel panel-default m-b-none">
                    <form class="form-horizontal" name="form">
                        <div class="col-xs-12 col-md-6 b  line-dashed wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-8 col-md-3 no-padder text-right">
                                    <label class="control-label required">标题：</label>
                                </div>
                                <div class="col-xs-16 col-md-9">
                                    <input name="title" value="${article.title}" type="text" class="form-control">
                                    <input type="hidden" name="id" value="${article.id}">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 b  line-dashed wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">顺序：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <input name="seq" value="${article.seq}" type="text" class="form-control" maxlength="20">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 b  line-dashed wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">是否上架：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <select id="typeSelect" name="showable" class="form-control">
                                        <option value="">请选择</option>
                                        <option value="0" <c:if test="${article.showable eq 0}">selected="selected"</c:if>>下架</option>
                                        <option value="1" <c:if test="${article.showable eq 1}">selected="selected"</c:if>>上架</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 b  line-dashed wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">分类：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <input type="text" readonly onclick="showMenu(this,0)" value="${article.type.name}" name="type.name" class="form-control">
                                    <input name="type.id" value="${article.type.id}" type="hidden">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 b  line-dashed wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label required">文章类型：</label>
                                </div>
                                <div class="col-xs-8 col-md-9">
                                    <select id="saveType" name="contentType" class="form-control">
                                        <option value="">请选择</option>
                                        <option value="0" <c:if test="${article.contentType eq 0}">selected="selected"</c:if>>富文本</option>
                                        <option value="1" <c:if test="${article.contentType eq 1}">selected="selected"</c:if>>链接</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 b  line-dashed wrapper-sm padder">
                            <div class="row">
                                <div class="col-xs-4 col-md-3 no-padder text-right">
                                    <label class="control-label ">图标：</label>
                                </div>
                                <div id="previewDiv" class="img-preview col-xs-8 col-md-9">
                                </div>
                                <input id="uploadInput" class="hidden" type="file" onchange="uploadPreview(this)"
                                       accept="image/png,image/jpg,image/jpeg,image/bmp,image/gif"/>
                                <input id="images" type="hidden" name="image" value="${article.image}"/>
                            </div>
                        </div>
                        <div id="text" class="col-xs-12 b line-dashed wrapper-sm padder">
                            <div class="row m-b-sm">
                                <div class="col-xs-12">
                                    <label class="control-label required">内容：</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div id="container" name="content"   style="height: 500px"></div>
                                </div>
                            </div>
                        </div>
                        <div id="link" class="col-xs-12 b line-dashed wrapper-sm padder" style="display: none">
                            <div class="row m-b-sm">
                                <div class="col-xs-12">
                                    <label class="control-label required">链接：</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <input type="text" name="url" value="${article.url}"  class="form-control">
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var ue = UE.getEditor('container', {initialFrameWidth: null});
        ue.ready(function(){
            ue.setContent($("${article.content}").html());
        })
        var $form = $("form[name='form']");
        $form.validate({
            errorClass: 'text-danger',
            rules: {
                title: {
                    required: true,
                    notEmpty: true
                },
                'type.id': {
                    required: true,
                    notEmpty: true
                },
                contentType: {
                    required: true,
                    notEmpty: true
                },
                seq: {
                    required: true,
                    digits:true,
                    notEmpty: true
                },
                image: {
                    required: true,
                    notEmpty: true
                },
                showable: {
                    required: true,
                    digits: true,
                    notEmpty: true
                }
            },
            messages: {
                title: {
                    required: "文章标题不能为空",
                    notEmpty: "文章标题不能为空"
                },
                'type.id': {
                    required: "类型不能为空",
                    notEmpty: "类型不能为空"
                },
                contentType: {
                    required: "内容类型不能为空",
                    notEmpty: "内容类型不能为空"
                },
                seq: {
                    required: "顺序不能为空",
                    notEmpty: "顺序不能为空",
                    digits:"顺序是数字"
                },
                image: {
                    required: "图片不能为空",
                    notEmpty: "图片不能为空"
                },
                showable: {
                    required: "状态不能为空",
                    notEmpty: "状态不能为空",
                }
            },
            submitHandler: function (form) {
                if($saveType.val()==0){
                    $("#container").val(ue.getContent());
                }
                doPost("<%=request.getContextPath()%>/admin/article/article/update", $(form).serialize(), function (data) {
                    if (data.status) {
                        $("#info_success").modal("show");

                    } else {
                        $("#info").html(data.msg);
                        $("#info_fail").modal("show");
                    }
                });
            }
        });

        function submitForm() {
            $form.submit();
        }
    </script>
    <%--控制链接和富文本选择--%>
    <script>
        var $saveType = $("#saveType");
        $saveType.on('change', function () {
            if ($saveType.val() == 0) {
                $("#text").show();
                $("#link").hide();
            } else {
                $("#text").hide();
                $("#link").show();
            }
        });
    </script>

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
            if($("#images").val()!=null&&$("#images").val().length!=0){
                images = [];
                images.push($("#images").val());
            }
            updatePreviewDiv();
            if ($saveType.val() == 0) {
                $("#text").show();
                $("#link").hide();
            } else {
                $("#text").hide();
                $("#link").show();
            }
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
                client.multipartUpload("article/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
                    progress: function*(p) {
                        console.log('Progress: ' + p);
                    }
                }).then(function (result) {
                    images.push(result.url );
                    $("#images").val(result.url );
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
            return "<%=request.getContextPath()%>/admin/article/type/combo/tree";
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
                var data={
                    id:0,
                    name:"文章管理",
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

            }
            $("#selectCategory").modal('hide');
        }
    </script>
    <%--选择分类管理结束--%>
    <%--操作提示及删除--%>
    <jsp:include page="../common/operationTip.jsp" flush="false"></jsp:include>
    <%--操作提示结束--%>
    <%--</sec:authorize>--%>
</body>
</html>

