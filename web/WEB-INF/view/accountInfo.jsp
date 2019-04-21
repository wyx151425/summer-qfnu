<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2016/12/29
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png"
          type="image/x-icon"/>
    <title>账号信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-slider.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/responsive-nav.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datalist.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pay.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

    <script>
        $(document).ready(function () {
            var successDiv = $("#successDiv");
            var posBtn = $("#posBtn");
            var msgSuccess = $("#msgSuccess");

            var errorDiv = $("#errorDiv");
            var navBtn = $("#navBtn");
            var msgError = $("#msgError");

            posBtn.click(function () {
                successDiv.css("display", "none");
            });
            navBtn.click(function () {
                errorDiv.css("display", "none");
            });

            $("#saveBtn").click(function () {
                $.ajax("${pageContext.request.contextPath}/api/users",
                    {
                        dataType: "json",
                        type: "put",
                        contentType: "application/json",
                        data: JSON.stringify(
                            {
                                id: ${sessionScope.user.id},
                                name: $("#name").val(),
                                idNumber: $("#idNumber").val(),
                                email: $("#email").val()
                            }
                        ),
                        async: true,
                        success: function (data) {
                            if (200 === data.statusCode) {
                                successDiv.css("display", "block");
                                msgSuccess.text("更新成功");
                            } else if (7005 === data.statusCode) {
                                errorDiv.css("display", "block");
                                msgError.text("身份证号已被使用");
                            } else {
                                errorDiv.css("display", "block");
                                msgError.text("系统错误");
                            }
                        }
                    }
                );
            });
        });
    </script>
</head>
<body>

<div id="nav" class="sidenav">
    <ul>
        <li><a href="#">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/mvc/trainList">列车</a></li>
        <li class="on"><a href="${pageContext.request.contextPath}/mvc/accountInfo">账号</a></li>
    </ul>
</div>

<div class="main-left">
    <div>
        <div>
            <div>
                <p class="biaoti pd1"><b>账号信息</b></p>
            </div>
            <ul class="subnav">
                <li class="on"><a href="#">账号信息</a></li>
                <c:if test="${sessionScope.user.type  == 0}">
                    <li><a href="${pageContext.request.contextPath}/mvc/ticketManage">订单管理</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/mvc/ticketList">订单列表</a></li>
                <li><a href="${pageContext.request.contextPath}/mvc/passwordUpdate">密码修改</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="main-right container">
    <div class="lists box-sh order-table">
        <h5><b>请务必完善账号信息</b></h5>
    </div>

    <div class="mt order-table user-content">

        <form class="form-horizontal" id="user-form" role="form">
            <div class="form-group">
                <label class="col-sm-2 control-label nopd  col-lg-1 mt8">姓名</label>
                <div class="col-sm-10 col-lg-5">
                    <input type="text" class="form-control" id="name" value="${sessionScope.user.name}"
                           placeholder="必填">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label nopd  col-lg-1">手机号</label>
                <div class="col-sm-10 col-lg-5">
                    <span id="mobilePhoneNumber">${sessionScope.user.mobilePhoneNumber}</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label nopd  col-lg-1 mt8">身份证号</label>
                <div class="col-sm-10 col-lg-5">
                    <input type="text" class="form-control" id="idNumber" value="${sessionScope.user.idNumber}"
                           placeholder="必填">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label nopd  col-lg-1 mt8">电子邮箱</label>
                <div class="col-sm-10 col-lg-5">
                    <input type="text" class="form-control" id="email" value="${sessionScope.user.email}"
                           placeholder="必填">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label nopd  col-lg-1 mt8">注册时间</label>
                <div class="col-sm-10 col-lg-5">
                    <input type="text" class="form-control" value="${sessionScope.user.createAt}" disabled>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-1 col-sm-10 col-lg-5">
                    <button id="saveBtn" type="button" class="btn bg-blue save-btn">保存</button>
                </div>
            </div>
        </form>
    </div>

    <div class="footer">
        <div class="footer-right pull-right">
            <a href="#">2015级软件工程四班张静</a>
        </div>
    </div>
</div>

<div id="successDiv" class="alert alert-success alert-dismissable" style="display: none;">
    <button id="posBtn" type="button" class="close" aria-hidden="true">&times;</button>
    <div id="msgSuccess"></div>
</div>

<div id="errorDiv" class="alert alert-danger alert-dismissable" style="display: none;">
    <button id="navBtn" type="button" class="close" aria-hidden="true">&times;</button>
    <div id="msgError"></div>
</div>
</body>
</html>
