<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WangZhenqi
  Date: 2018/3/18
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
</head>
<body>
<table>
    <thead>
    <th>列车号</th>
    <th>车厢号</th>
    <th>座位号</th>
    <th>出发地</th>
    <th>目的地</th>
    <th>发车时间</th>
    <th>票价</th>
    <th>订购时间</th>
    </thead>
    <tbody>
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
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
