<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Aranl_lin
  Date: 2017/9/5
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>医览网-系统-员工管理</title>
    <%@include file="../common/head.jsp" %>
    <%@include file="../common/validate.jsp" %>
</head>
<body>
<div class="app app-header-fixed app-aside-fixed">
    <%@include file="../common/header.jsp" %>
    <%@include file="./system_nav.jsp" %>

    <div class="app-content ">
        <div class="app-content-body">
            <div class="bg-light lter b-b wrapper-md ">
                <h1 class="m-n font-thin h3">员工管理</h1>
            </div>
            <div class="wrapper-md">
                <form class="form-horizontal" id="searchForm">
                    <div class="form-group">
                        <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                            <label class="control-label">编号：</label>
                        </div>
                        <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                            <input class="form-control" type="number" name="id" value="${id}"/>
                        </div>
                        <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                            <label class="control-label">名称：</label>
                        </div>
                        <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                            <input class="form-control" type="text" name="dynamic[name]" value="${dynamic.name}"/>
                        </div>
                        <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                            <label class="control-label">用户名：</label>
                        </div>
                        <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                            <input class="form-control" type="text" name="dynamic[username]" value="${dynamic.username}"/>
                        </div>
                        <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                            <label class="control-label">手机：</label>
                        </div>
                        <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                            <input class="form-control" type="text" name="dynamic[mobile]" value="${dynamic.mobile}"/>
                        </div>
                        <div class="col-xs-4 col-md-2 col-lg-1 no-padder m-b-md text-right">
                            <label class="control-label">状态：</label>
                        </div>
                        <div class="col-xs-8 col-md-4 col-lg-3 m-b-md">
                            <select id="searchStatus" name="status" class="form-control">
                                <option value="">全部</option>
                                <option value="0">禁用</option>
                                <option value="1">正常</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group m-t-n-md">
                        <div class="col-xs-12">
                            <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_create})">--%>
                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#create">
                                新增
                            </button>
                            <%--</sec:authorize>--%>
                            <input class="btn btn-default pull-right" value="重置" type="button" onclick="resetSearch()">
                            <input class="btn btn-info pull-right m-r-sm" value="搜索" type="submit">
                        </div>
                    </div>
                </form>

                <div class="panel panel-default m-b-none">
                    <table class="table text-center table-bordered table-striped m-b-none">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>用户名</th>
                            <th>手机</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${staffs.size() eq 0}">
                            <tr>
                                <td colspan="6">无数据</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${staffs}" var="staff">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.name}</td>
                                <td>${staff.username}</td>
                                <td>${staff.mobile}</td>
                                <c:if test="${staff.status eq 0}">
                                    <td>禁用</td>
                                </c:if>
                                <c:if test="${staff.status eq 1}">
                                    <td>正常</td>
                                </c:if>
                                <td>
                                        <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_join})">--%>
                                    <c:if test="${staff.status eq 0}">
                                        <button class="btn btn-warning btn-xs" onclick="updateStatus('${staff.id}',1)">正常</button>
                                    </c:if>
                                    <c:if test="${staff.status eq 1}">
                                        <button class="btn btn-warning btn-xs" onclick="updateStatus('${staff.id}',0)">禁用</button>
                                    </c:if>
                                        <%--</sec:authorize>--%>
                                        <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_update})">--%>
                                    <button class="btn btn-info btn-xs" onclick="edit('${staff.id}')">编辑</button>
                                        <%--</sec:authorize>--%>
                                        <%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_delete})">--%>
                                    <button class="btn btn-danger btn-xs" onclick="remove('${staff.id}','${staff.name}')">删除</button>
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
<script>
    var $searchForm = $("#searchForm");
    var $searchStatus = $("#searchStatus");

    $searchStatus.val("${status}");

    function resetSearch() {
        $searchForm.find("input[type='text']").each(function () {
            $(this).val("");
        });
        $searchForm.find("input[type='number']").each(function () {
            $(this).val("");
        });
        $searchStatus.val("");
    }

</script>
<%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_create})">--%>
<%--新增员工--%>
<div class="modal fade" id="create" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增员工</h4>
            </div>
            <div class="modal-body">
                <form name="createForm" class="form-horizontal">
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">用户名</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="text" name="username"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">密码</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="password" name="password" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">姓名</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="text" name="name"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label">手机</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="text" name="mobile"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">状态</label>
                        </div>
                        <div class="col-xs-9">
                            <select name="status" class="form-control">
                                <option value="">请选择</option>
                                <option value="0">禁用</option>
                                <option value="1">正常</option>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="clearfix"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" onclick="submitCreateForm()">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    var $createForm = $("form[name='createForm']");

    var createValidate = $createForm.validate({
        errorClass: 'text-danger',
        rules: {
            username: {
                required: true,
                notEmpty: true
            },
            password: {
                required: true,
                notEmpty: true,
                minlength: 6,
                maxlength: 20
            },
            mobile: {
                mobile: true
            },
            name: {
                required: true,
                notEmpty: true
            },
            status: {
                required: true
            }
        },
        messages: {
            username: {
                required: "用户名不能为空",
                notEmpty: "用户名不能为空"
            },
            password: {
                required: "密码不能为空",
                notEmpty: "密码不能为空",
                minlength: "密码至少为6位",
                maxlength: "密码至多位20位"
            },
            mobile: {
                mobile: "手机格式不对"
            },
            name: {
                required: "名称不能为空",
                notEmpty: "名称不能为空"
            },
            status: {
                required: "请选择状态"
            }
        },
        submitHandler: function (form) {
            doPost("<%=request.getContextPath()%>/admin/system/staff/save", $(form).serialize(), function (data) {
                if (data.status) {
                    $("#info_success").modal("show");
                } else {
                    $("#infoOfFalse").html(data.msg);
                    $("#info_fail").modal("show");
                }
            });
        }
    });

    $('#create').on('hidden.bs.modal', function (e) {
        createValidate.resetForm();
        $createForm[0].reset();
    });

    function submitCreateForm() {
        $createForm.submit();
    }
</script>
<%--</sec:authorize>--%>
<%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_update})">--%>
<%--编辑员工--%>
<div class="modal fade" id="edit" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑员工</h4>
            </div>
            <div class="modal-body">
                <form name="editForm" class="form-horizontal">
                    <input type="hidden" name="id">
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">用户名</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="text" name="username"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label">密码</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="password" name="password" placeholder="留空则不修改" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">姓名</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="text" name="name"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label ">手机</label>
                        </div>
                        <div class="col-xs-9">
                            <input class="form-control" type="text" name="mobile"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-3 text-right">
                            <label class="control-label required">状态</label>
                        </div>
                        <div class="col-xs-9">
                            <select name="status" class="form-control">
                                <option value="">请选择</option>
                                <option value="0">禁用</option>
                                <option value="1">正常</option>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="clearfix"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-info" onclick="submitEditForm()">确定</button>
            </div>
        </div>
    </div>
</div>
<script>

    var $editForm = $("form[name='editForm']");
    var editValidate = $editForm.validate({
        errorClass: 'text-danger',
        rules: {
            username: {
                required: true,
                notEmpty: true
            },
            password: {
                minlength: 6,
                maxlength: 20
            },
            mobile: {
                mobile: true
            },
            name: {
                required: true,
                notEmpty: true
            },
            status: {
                required: true
            }
        },
        messages: {
            username: {
                required: "用户名不能为空",
                notEmpty: "用户名不能为空"
            },
            password: {
                minlength: "密码至少为6位",
                maxlength: "密码至多位20位"
            },
            mobile: {
                mobile: "手机格式不对"
            },
            name: {
                required: "名称不能为空",
                notEmpty: "名称不能为空"
            },
            status: {
                required: "请选择状态"
            }
        },
        submitHandler: function (form) {
            doPost("<%=request.getContextPath()%>/admin/system/staff/update", $(form).serialize(), function (data) {
                if (data.status) {
                    $("#info_success").modal("show");
                } else {
                    $("#infoOfFalse").html(data.msg);
                    $("#info_fail").modal("show");
                }
            });
        }
    });

    $('#edit').on('hidden.bs.modal', function (e) {
        editValidate.resetForm();
        $("#edit").find(".text-danger").removeClass("text-danger");
    });

    function edit(id) {
        doPost("<%=request.getContextPath()%>/admin/system/staff/get", {id: id}, function (data) {
            if (data.status) {
                var _data = data.data;
                $editForm.find("input[name='id']").val(_data.id);
                $editForm.find("input[name='name']").val(_data.name);
                $editForm.find("input[name='username']").val(_data.username);
                $editForm.find("input[name='mobile']").val(_data.mobile);
                $editForm.find("select[name='status']").val(_data.status);
                $editForm.find("input[name='password']").val("");
                $("#edit").modal('show');
            } else {
                $("#infoOfFalse").html(data.msg);
                $("#info_fail").modal("show");
            }
        });
    }

    function submitEditForm() {
        $editForm.submit();
    }
</script>
<%--</sec:authorize>--%>
<%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_delete})">--%>
<%--删除员工--%>
<div class="modal fade" id="del" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">删除员工</h4>
            </div>
            <div class="modal-body text-center">
                <h4 class="text-danger" id="removeStaff"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" onclick="submitRemove()">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    var deleteId;
    var deleteName;
    function remove(id,name) {
        deleteId = id;
        deleteName = name;
        var html ;
        html = "确认删除员工"+"<br>"+"["+deleteId+"-"+deleteName+"]";
        $("#removeStaff").html(html);
        $("#del").modal('show');
    }
    function submitRemove() {
        doPost("<%=request.getContextPath()%>/admin/system/staff/remove", {id: deleteId}, function (data) {
            if (data.status) {
                $("#info_success").modal("show");
            } else {
                $("#infoOfFalse").html(data.msg);
                $("#info_fail").modal("show");
            }
        });
    }
</script>
<%--</sec:authorize>--%>
<%--<sec:authorize access="hasAnyRole(${sessionScope.sec_op.system_staff_auth})">--%>
<%--</sec:authorize>--%>


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
<%--信息提示操作成功--%>
<div class="modal fade" id="info_update" data-backdrop="static" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息确认</h4>
            </div>
            <div class="modal-body">
                <h4 class="text-danger" align="" id="updateInfo">操作成功</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="updateSuccess()">确定</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function updateSuccess() {
        $("#info_update").modal('hide');
        window.location.reload(true);
    }
</script>
<%--信息提示操作成功--%>
<script>
    var userId;
    var userStatus;
    function updateStatus(id, status) {
        userId = id;
        userStatus = status;
        if (status == 0) {
            $("#statusInfo").html("确定禁用？");
        } else {
            $("#statusInfo").html("确定取消禁用?");
        }
        $("#changeId").modal('show');
    }
    function submitChange() {
        doPost("<%=request.getContextPath()%>/admin/system/staff/update", {
            id: userId,
            status: userStatus
        }, function (data) {
            if (data.status) {
                $("#updateInfo").html("操作成功");
                $("#changeId").modal('hide');
                $("#info_update").modal('show');
            } else {
                $("#updateInfo").html("操作失败");
                $("#changeId").modal('hide');
                $("#info_update").modal('show');
            }
        });
    }
</script>
<jsp:include page="../common/operationTip.jsp"/>
</body>
</html>
