<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2016/12/29
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png"
          type="image/x-icon"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <title>订单列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-slider.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/responsive-nav.css?"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datalist.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pay.css"/>
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
                <p class="biaoti pd1"><b>订单列表</b></p>
            </div>
            <ul class="subnav">
                <li><a href="${pageContext.request.contextPath}/mvc/accountInfo">账号信息</a></li>
                <c:if test="${sessionScope.user.type == 0}">
                    <li><a href="${pageContext.request.contextPath}/mvc/ticketManage">订单管理</a></li>
                </c:if>
                <li class="on"><a href="#">订单列表</a></li>
                <li><a href="${pageContext.request.contextPath}/mvc/passwordUpdate">密码修改</a></li>
            </ul>
        </div>

    </div>
</div>
<div class="main-right container">
    <div class="main-right container">
        <div class="lists box-sh order-table">
            <div class="main-right-bottom">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered">
                        <tr class="active">
                            <td>列车号</td>
                            <td>车厢号</td>
                            <td>座位号</td>
                            <td>出发地</td>
                            <td>目的地</td>
                            <td>发车时间</td>
                            <td>票价</td>
                            <td>订票时间</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${requestScope.ticketList}" var="ticket">
                            <tr>
                                <td>${ticket.trainNo}</td>
                                <td>${ticket.carriageNo}</td>
                                <td>${ticket.seatNo}</td>
                                <td>${ticket.fromCity}</td>
                                <td>${ticket.toCity}</td>
                                <td>${ticket.departureTime}</td>
                                <td>${ticket.price}</td>
                                <td>${ticket.createAt}</td>
                                <td><button class="btn btn-sm btn-primary" type="button" onclick="deleteTicket(${ticket.id});">取消</button></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="main-right-top">
                    <form class="main-right-cotent">
                        <a href="${pageContext.request.contextPath}/mvc/trainList"
                           class="save-btn pull-right  btn mt10 bg-blue">
                            继续订票
                        </a>
                    </form>
                </div>
            </div>
        </div>
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
<script>
    function deleteTicket(id) {
        var successDiv = $("#successDiv");
        var posBtn = $("#posBtn");
        var msgSuccess = $("#msgSuccess");

        var errorDiv = $("#errorDiv");
        var navBtn = $("#navBtn");
        var msgError = $("#msgError");
        $.ajax("${pageContext.request.contextPath}/api/ticketDel/" + id,
            {
                dataType: "json",
                type: "post",
                contentType: "application/json",
                data: null,
                async: true,
                success: function (data) {
                    if (200 === data.statusCode) {
                        successDiv.css("display", "block");
                        msgSuccess.text("取消成功");
                    } else if (9002 === data.statusCode) {
                        errorDiv.css("display", "block");
                        msgError.text("车票已过期，不可取消");
                    } else {
                        errorDiv.css("display", "block");
                        msgError.text("系统错误");
                    }
                }
            }
        );
    }
</script>
</body>
</html>
