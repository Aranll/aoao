<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/12
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    var ztreeUrl;
    function asyncUrl() {
        return ztreeUrl;
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
            };
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
<%--侧边选择分类修改文章分类--%>
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
        typeId = sNodes[0].id;
        $("#typeId").val(typeId);
        submitSearch();
    }
    $(document).ready(function () {
        zTreeObjType = $.fn.zTree.init($("#typeTree"), settingType, zTreeNodes);
        showMenuType();
    });
</script>
<%--结束--%>
