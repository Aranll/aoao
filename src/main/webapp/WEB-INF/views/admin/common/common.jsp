<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/13
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--改变用户状态--%>

<script type="text/javascript">
    var getUrl = "${url}/get";
    var removeUrl = "${url}/remove";
    var updateUrl = "${url}/update";
    var saveUrl = "${url}/save";
    var ztreeUrl = "${url}/combo/tree";

    var $updateForm = $("#updateForm");
    var $saveForm = $("#saveForm");
    var $searchForm = $("#searchForm");

    //id
    var getId = null;
    var removeId = null;
    var updateShowableStatusId = null;

    //name
    var removeName = null;
    var ztreeName = null;
    var ossPathName = null;

    //删除图片的下标
    var removeIndex = null;

    //树根节点名称
    var treeParentNodeName = null;

    function submitUpdate() {
        $updateForm.submit();
    }
    function submitSave() {
        $saveForm.submit();
    }
    function submitSearch() {
        $searchForm.submit();
    }

    //树的节点点击事
    function clickZNode() {

    }

    //改变状态
    var updateShowableStatus = null;
    var updateHtml = null;

    function updateStatus(id, status) {
        updateShowableStatus = status;
        updateShowableStatusId = id;

        if (updateShowableStatus == 0) {
            $("#statusInfo").html("确定" + updateHtml);
        } else {
            $("#statusInfo").html("确定取消" + updateHtml);
        }
        $("#updateStatusModal").modal('show');
    }
    function submitUpdateShowableStatus() {
        var formData = {
            id: updateShowableStatusId,
            showable: updateShowableStatus
        };
        doObject(updateUrl, formData);
    }

    //改变分类模块保存按钮的状态
    function changeUpdateBtnStatus(){
        $updateForm.find("input[type='button']").prop('disabled', false);
    }

    //function
    //根据传入的url和对象数据对对象进行操作
    function doObject(url, formData) {
        doPost(url, formData, function (data) {
            if (data.status) {
                $("#info_success").modal().show();
            } else {
                $("#infoOfFalse").html(data.msg);
                $("#info_fail").modal().show();
            }
        });
    }
    //删除操作，删除对应的对象
    function removeObject(name, id) {
        removeId = id;
        removeName = name;
        var html = "确认删除？" + "<br>" + "[" + removeId + "-" + removeName + "]"
        $("#removeInfo").html(html);
        $("#removeOperationModal").modal('show');
    }
    function submitRemove() {
        var formData = {
            id: removeId
        };
        doObject(removeUrl, formData);
    }


    //更新操作，修改对应的对象
    function updateObject(id) {
        getId = id;
        doPost(getUrl, {id: getId}, function (data) {
            var _data = data.data;
            if (data.status) {
                $updateForm.find("input[name='id']").val(_data.id);
                $updateForm.find("input[name='name']").val(_data.name);
                $updateForm.find("input[name='seq']").val(_data.seq);
                $updateForm.find("input[name='type.name']").val(_data.type.name);
                $updateForm.find("input[name='type.id']").val(_data.type.id);
                $updateForm.find("input[name='upType.name']").val(_data.upType.name);
                $updateForm.find("input[name='upType.id']").val(_data.upType.id);
                $updateForm.find("input[name='url']").val(_data.url);
                $updateForm.find("select[name='showable']").val(_data.showable);
                $updateForm.find("input[name='image']").val(_data.image);
                updateImages = [];
                updateImages.push(_data.image);
                updateUpdatePreviewDiv();
                $("#updateObjectModal").modal("show");
            } else {
                $("#infoOfFalse").html(data.msg);
                $("#info_fail").modal().show();
            }
        });
    }

</script>
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
            client.multipartUpload(ossPathName + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
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
            client.multipartUpload(ossPathName + Date.parse(new Date()) + "_" + file.files[0].name, file.files[0], {
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