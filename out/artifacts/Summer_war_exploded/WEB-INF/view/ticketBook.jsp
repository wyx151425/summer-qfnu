<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2016/12/30
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon"/>
    <title>订购车票</title>
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

            $("#bookBtn").click(function () {
                $.ajax("${pageContext.request.contextPath}/api/tickets",
                    {
                        dataType: "json",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify(
                            {
                                id: ${requestScope.train.id}
                            }
                        ),
                        async: true,
                        success: function (data) {
                            if (200 === data.statusCode) {
                                successDiv.css("display", "block");
                                msgSuccess.text("订票成功");
                            } else if (9001 === data.statusCode) {
                                errorDiv.css("display", "block");
                                msgError.text("您已订购过本次车票");
                            } else {
                                errorDiv.css("display", "block");
                                msgError.text("系统错误");
                            }
                        }
                    }
                );
            });

            posBtn.click(function () {
                successDiv.css("display", "none");
            });
            navBtn.click(function () {
                errorDiv.css("display", "none");
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
                <p class="biaoti pd1"><b>订购车票</b></p>
            </div>
            <ul class="subnav">
                <li class="on"><a href="#">订购车票</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="main-right container">
    <div class="lists box-sh return-finace">
        <a class="glyphicon glyphicon-arrow-left" href="${pageContext.request.contextPath}/mvc/trainList"></a>
        <span>返回</span>
    </div>
    <div class="mt order-table user-content">

        <form class="form-horizontal" role="form" action="">
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">列车号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" value="${requestScope.train.number}" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">出发地</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" value="${requestScope.train.fromCity}" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">目的地</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" value="${requestScope.train.toCity}" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">发车时间</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" value="${requestScope.train.departureTime}" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">余票数</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" value="${requestScope.train.remainderTicket}" disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">票价</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" value="${requestScope.train.ticketPrice}" disabled/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-1 col-sm-10 col-lg-5">
                    <button id="bookBtn" type="button" class="btn bg-blue save-btn">订票</button>
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

