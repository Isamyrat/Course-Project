<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть заявки</title>
</head>

<html>
<body>
<div class="container">
    <table>
        <thead>
        <th>Id</th>
        <th>Status</th>
        <th>Date</th>
        <th>User name</th>
        <th>User surname</th>
        <th>Language of Course</th>
        <th>Level of course</th>
        </thead>
        <c:forEach  items="${callBackManagerArhiv}" var="arhiv">
            <tr>
                <td>${arhiv.id}</td>
                <td>${arhiv.status}</td>
                <td>${arhiv.callBackDate}</td>
                <td>${arhiv.userCallBack.name}</td>
                <td>${arhiv.userCallBack.surname}</td>
                <td>${arhiv.courseCallBack.level}</td>
                <td>${arhiv.courseCallBack.language}</td>

            </tr>
        </c:forEach>
    </table>
    <div class="svg">
        <a class="button" href="/menuManager">
            <svg>
                <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 8pt">Back</span>
        </a>
    </div>

</div>
<span></span>
</body>

<style>
    <%@include file ="../css/data.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>