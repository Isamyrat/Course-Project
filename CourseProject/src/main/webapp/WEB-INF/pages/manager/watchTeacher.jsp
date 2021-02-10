<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть преподавателей</title>
</head>

<html>


<body>
<div class="container">
    <table>
        <thead>
        <tr>
            <th>Все преподаватели</th>
        </tr>
        </thead>
        <thead>
        <th>ID</th>
        <th>Login</th>
        <th>Password</th>
        <th>Name</th>
        <th>Surname</th>
        <th></th>
        </thead>
        <c:forEach items="${allTeachers}" var="user">
            <%--<c:url var="updateLink" value="/editTeacher">
                <c:param name="idUser" value="${user.id}"/>
            </c:url>
            <c:url var="deleteLink" value="/deleteTeacher">
                <c:param name="idUser" value="${user.id}"/>
            </c:url>--%>
            <c:forEach items="${user.roles}" var="role">
                <c:if test="${role.name=='ROLE_TEACHER'}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.name}</td>
                        <td>${user.surname}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/deleteTeacher" method="post">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <input type="hidden" name="action" value="delete"/>
                                <button type="submit">Delete</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/editTeacher" method="get">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <button type="submit">Change</button>
                            </form>

                        </td>

                    </tr>
                </c:if>
            </c:forEach>
        </c:forEach>
    </table>
    <div class="svg">
        <a class="button" href="/menuManager">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 8pt">Меню</span>
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