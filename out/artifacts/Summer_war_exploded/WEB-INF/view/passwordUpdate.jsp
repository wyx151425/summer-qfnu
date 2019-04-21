<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2016/12/30
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>密码修改</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png"
          type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.png"/>
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

            $("#updateBtn").click(function () {
                var hiddenPassword = $("#hiddenPassword").val();
                var oldPassword = $("#oldPassword").val();
                var newPassword = $("#newPassword").val();
                var repeatPassword = $("#repeatPassword").val();
                var promptView = $("#prompt");

                if (hiddenPassword !== oldPassword) {
                    promptView.text("原密码错误");
                    return;
                }
                if (newPassword !== repeatPassword) {
                    promptView.text("新密码不一致");
                    return;
                }
                if (newPassword < 6) {
                    promptView.text("新密码过短");
                    return;
                }

                $.ajax("${pageContext.request.contextPath}/api/users",
                    {
                        dataType: "json",
                        type: "put",
                        contentType: "application/json",
                        data: JSON.stringify(
                            {
                                id: $("#id").val(),
                                password: newPassword
                            }
                        ),
                        async: true,
                        success: function (data) {
                            if (200 === data.statusCode) {
                                successDiv.css("display", "block");
                                msgSuccess.text("更新成功");
                                $("#hiddenPassword").val(newPassword);
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
                <p class="biaoti pd1"><b>密码修改</b></p>
            </div>
            <ul class="subnav">
                <li><a href="${pageContext.request.contextPath}/mvc/accountInfo">账号信息</a></li>
                <c:if test="${sessionScope.user.type == 0}">
                    <li><a href="${pageContext.request.contextPath}/mvc/ticketManage">订单管理</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/mvc/ticketList">订单列表</a></li>
                <li class="on"><a href="#">密码修改</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="main-right container">
    <div class="lists order-table user-pswd">
        <form id="user-form" action=""
              method="post" class="form-horizontal" role="form" name="OnlinePasswordModifyForm" onsubmit="return false">
            <div class="form-group">
                <label class="col-sm-2 control-label nopd  col-lg-1 mt8">原密码：</label>
                <div class="col-sm-10 col-lg-5">
                    <input type="hidden" value="${sessionScope.user.id}" id="id"/>
                    <input type="hidden" value="${sessionScope.user.password}" id="hiddenPassword"/>
                    <input type="password" class="form-control" placeholder="必填" id="oldPassword"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label nopd  col-lg-1 mt8">新密码：</label>
                <div class="col-sm-10 col-lg-5">
                    <input type="password" class="form-control" placeholder="必填" id="newPassword"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label nopd mt13 col-lg-1">确认密码：</label>
                <div class="col-sm-10 col-lg-5">
                    <input type="password" class="form-control" placeholder="必填" id="repeatPassword"/>
                    <p id="prompt" class="tips"></p>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-1 col-sm-10 col-lg-5">
                    <button class="btn bg-blue save-btn" id="updateBtn" type="button">确定</button>
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
