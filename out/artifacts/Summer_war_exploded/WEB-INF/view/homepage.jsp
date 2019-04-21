<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2018/3/17
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Summer</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
</head>
<body>
<header>
    <div id="header">
        <div class="header-container">
            <div class="brand"><img src="${pageContext.request.contextPath}/images/brand.png"></div>
            <a href="${pageContext.request.contextPath}/mvc/myOrder">
                <button type="button" class="my-order">我的订单</button>
            </a>
        </div>
    </div>
</header>
<c:forEach items="${requestScope.trainList}" var="train">
    <div class="table-responsive">
        <table class="table">
            <tbody>
            <tr>
                <td>
                    <p>${train.number}</p>
                </td>
                <td>
                    <p>${train.fromCity}</p>
                    <span>出发地</span>
                </td>
                <td>
                    <p>${train.toCity}</p>
                    <span>目的地</span>
                </td>
                <td>
                    <p class="departure">${train.departureTime}</p>
                    <span>发车时间</span>
                </td>
                <td>
                    <p>${train.remainderTicket}张</p>
                    <span>余票</span>
                </td>
                <td>
                    <p>${train.ticketPrice}元</p>
                    <span>票价</span>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</c:forEach>
</body>
</html>
