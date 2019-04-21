<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2016/12/29
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png"
          type="image/x-icon"/>
    <title>列车列表</title>
    <link rel="stylesheet" type="text/css" href="http://assets2016.bmob.cn/css/bootstrap.min.css?26"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-slider.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/responsive-nav.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#logout").click(function () {
                $.ajax("${pageContext.request.contextPath}/api/users/logout",
                    {
                        dataType: "json",
                        type: "post",
                        contentType: "application/json",
                        data: null,
                        async: true,
                        success: function (data) {
                            if (200 === data.statusCode) {
                                window.location.href = "${pageContext.request.contextPath}/mvc/login";
                            }
                        }
                    }
                );
            });

            $(".table-responsive").click(function () {
                var divObj = $(this);
                window.location.href = "${pageContext.request.contextPath}/mvc/ticketBook/" + divObj.attr('id');
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
<div class="main">
    <div class="main-top" style="position:relative;z-index:1;">
        <form action="${pageContext.request.contextPath}/mvc/cityTrain" method="get" style="display: inline; margin-right: 10px">
            <input type="text" name="fromCity" class="city-item" placeholder="出发地">
            <input type="text" name="toCity" class="city-item" placeholder="目的地">
            <button type="submit" class="btn btn-lg btn-addapp" data-toggle="modal">
                搜索列车
            </button>
        </form>
        <a href="${pageContext.request.contextPath}/mvc/ticketList">
            <button type="button" class="btn btn-lg btn-addapp" data-toggle="modal">
                我的订单
            </button>
        </a>
        <c:if test="${sessionScope.user.type == 0}">
            <a style="margin-left: 10px" href="${pageContext.request.contextPath}/mvc/trainAdd">
                <button type="button" class="btn btn-lg btn-addapp" data-toggle="modal">
                    添加列车 +
                </button>
            </a>
        </c:if>
        <div class="user-msg">
            <i class="hidden-xs">${sessionScope.user.name}</i>
            <span id="logout" class="glyphicon glyphicon-off hidden-xs"></span>
        </div>
    </div>

    <c:forEach items="${requestScope.trainList}" var="train">
        <div id="${train.id}" class="table-responsive">
            <table class="table app">
                <tr>
                    <td class="hidden">
                        <h5>
                            <strong>${train.id}</strong>
                            <span></span>
                        </h5>
                        <span></span>
                    </td>
                    <td class="hidden-xs">
                        <h5>
                            <strong>${train.number}</strong>
                            <span></span>
                        </h5>
                        <span></span>
                    </td>
                    <td class="hidden-xs">
                        <h5>
                            <strong>${train.fromCity}</strong>
                            <span>市</span>
                        </h5>
                        <span>出发地</span>
                    </td>

                    <td class="hidden-xs">
                        <h5>
                            <strong>${train.toCity}</strong>
                            <span>市</span>
                        </h5>
                        <span>目的地</span>
                    </td>

                    <td class="hidden-xs">
                        <h5>
                            <strong style="font-size: 135%">${train.departureTime}</strong>
                            <span></span>
                        </h5>
                        <span>发车时间</span>
                    </td>

                    <td class="hidden-xs hidden-sm">
                        <h5>
                            <strong>${train.remainderTicket}</strong>
                            <span>张</span>
                        </h5>
                        <span>余票</span>
                    </td>
                    <td class="hidden-xs hidden-sm hidden-md">
                        <h5>
                            <strong>${train.ticketPrice}</strong>
                            <span>元</span>
                        </h5>
                        <span>票价</span>
                    </td>

                </tr>
            </table>
        </div>
    </c:forEach>
    <div class="footer">
        <div class="footer-right pull-right">
            <a href="#">2015级软件工程四班张静</a>
        </div>
    </div>
</div>
</body>
</html>