<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2016/12/29
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>新增列车</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-slider.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/responsive-nav.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datalist.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pay.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zTreeStyle.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-switch.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    
    <script>
        $(document).ready(function () {
            var successDiv = $("#successDiv");
            var posBtn = $("#posBtn");
            var msgSuccess = $("#msgSuccess");

            var errorDiv = $("#errorDiv");
            var navBtn = $("#navBtn");
            var msgError = $("#msgError");

            $("#addBtn").click(function () {
                $.ajax("${pageContext.request.contextPath}/api/trains",
                    {
                        dataType: "json",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify(
                            {
                                number: $("#number").val(),
                                carriageTotal: $("#carriageTotal").val(),
                                fromCity: $("#fromCity").val(),
                                toCity: $("#toCity").val(),
                                remainderTicket: $("#remainderTicket").val(),
                                departureTime: $("#departureTime").val(),
                                ticketPrice: $("#ticketPrice").val()
                            }
                        ),
                        async: true,
                        success: function (data) {
                            if (200 === data.statusCode) {
                                successDiv.css("display", "block");
                                msgSuccess.text("添加成功");
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
        <li><a href="">首页</a></li>
        <li class="on"><a href="${pageContext.request.contextPath}/mvc/trainList">列车</a></li>
        <li><a href="${pageContext.request.contextPath}/mvc/accountInfo">账号</a></li>
    </ul>
</div>

<div class="main-left">
    <div>
        <div>
            <div>
                <p class="biaoti pd1"><b>添加列车</b></p>
            </div>
            <ul class="subnav">
                <li class="on"><a href="#">添加列车</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="main-right container">
    <div class="lists box-sh return-finace">
        <a class="glyphicon glyphicon-arrow-left" href="${pageContext.request.contextPath}/mvc/trainList"></a>
        <span>返回</span>
    </div>

    <div class="mt order-table">
        <form class="form-horizontal info-edit" role="form" action="">
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">列车号</label>
                <div class="col-sm-6">
                    <input type="text" id="number" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">车厢数</label>
                <div class="col-sm-6">
                    <input type="text" id="carriageTotal" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">出发地</label>
                <div class="col-sm-6">
                    <input type="text" id="fromCity" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">目的地</label>
                <div class="col-sm-6">
                    <input type="text" id="toCity" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">余票数</label>
                <div class="col-sm-6">
                    <input type="text" id="remainderTicket" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">出发时间</label>
                <div class="col-sm-6">
                    <input type="datetime-local" id="departureTime" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 nopd control-label mt8 col-lg-1">票价</label>
                <div class="col-sm-6">
                    <input type="text" id="ticketPrice" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-lg-offset-1 col-sm-10 ">
                    <button id="addBtn" type="button" class="btn bg-blue save-btn">添加</button>
                </div>
            </div>
        </form>
    </div>

    <div id="treeNodes" class=""></div>

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

