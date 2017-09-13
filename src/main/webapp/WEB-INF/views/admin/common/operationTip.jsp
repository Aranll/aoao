<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/8/10
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            client.multipartUpload("article/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
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
            client.multipartUpload("article/" + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
                progress: function*(p) {
                    console.log('Progress: ' + p);
                }
            }).then(function (result) {
                console.log(result);
                updateImages.push(result.url);
                $("#updateUrl").val(result.url);
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
<%--删除操作--%>
<div class="modal fade" id="deleteOperation" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body text-center">
                <h4 class="text-danger" id="delete_info">确定删除？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="submitRemove()">确定</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var removeId;
    var removeName;
    var removeUrl;
    // 删除操作，删除对应的对象
    function remove(name, id ,url) {
        removeName = name;
        removeId = id;
        removeUrl = url;
        var html = "确认删除？" + "<br>" + "[" + removeId + "-" + removeName + "]"
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
<%--删除操作结束--%>
<%--更新操作--%>
<div class="modal fade" id="updateOperation" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body text-center">
                <h4 class="text-danger" id="update_info">确认修改？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="submitUpdate()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--删除操作结束--%>
<%--信息提示操作成功--%>
<div class="modal fade" id="info_success" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body">
                <h4 class="text-danger" id="infoOfSuccess">操作成功</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="infoUpdate()">确定</button>
            </div>
        </div>
    </div>
</div>
<%--信息提示操作成功--%>
<%--信息提示失败--%>
<div class="modal fade" id="info_fail" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body">
                <h4 class="text-danger"  id="infoOfFalse">操作失败</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="infoClose('info_fail')">确定</button>
            </div>
        </div>
    </div>
</div>
<%--信息提示失败--%>
<script>
    var $updateForm = $("#updateForm");
    var $saveForm = $("#saveForm");
    function submitSearch(){
        $("#searchForm").submit();
    }
    function submitUpdate(){
        $updateForm.submit();
    }
    //使用ajax提交表单
    function submitSave() {
        $saveForm.submit();
    }
</script>

