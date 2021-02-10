<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Записаься на курсы</title>
</head>

<html>
<body>
<div class="container">
    <table>
        <thead>
        <th>Status</th>
        <th>Date</th>
        <th>Language of Course</th>
        <th>Level of course</th>
        </thead>
        <c:forEach  items="${callBack}" var="user">
            <tr>
                <td>${user.status}</td>
                <td>${user.callBackDate}</td>
                <td>${user.courseCallBack.language}</td>
                <td>${user.courseCallBack.level}</td>

            </tr>
        </c:forEach>
    </table>
    <div class="svg">
        <a class="button" href="/watchAllCoursesManager">
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