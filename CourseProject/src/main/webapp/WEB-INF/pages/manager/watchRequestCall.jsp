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
        <th>Action</th>
        </thead>
        <c:forEach items="${callBackManager}" var="manager">
            <c:url var="updateLink" value="/editCallBack">
                <c:param name="callBackId" value="${manager.id}"/>
            </c:url>
            <tr>
                <td>${manager.id}</td>
                <td>${manager.status}</td>
                <td>${manager.callBackDate}</td>
                <td>${manager.userCallBack.name}</td>
                <td>${manager.userCallBack.surname}</td>
                <td>${manager.courseCallBack.level}</td>
                <td>${manager.courseCallBack.language}</td>
                <td>
                    <form style="background-color: #576a91; border: 1px #f5f4f4 solid;">
                    <a href="${updateLink}"  type="submit" style="color: white;font-size: 10pt" > Изменить статус пользователю
                     </a>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="svg">
        <a class="button" href="/menuManager">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
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