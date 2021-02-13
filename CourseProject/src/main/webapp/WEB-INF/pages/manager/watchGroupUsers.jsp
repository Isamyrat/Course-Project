<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть группу</title>
</head>

<html>
<body>

<div class="container">
    <table>
        <form:form modelAttribute="watchUsers">
            <thead>
            <tr>
                <th>Watch all students of groups</th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th>Name of student</th>
                <th>Surname of student</th>
                <th>Age of student</th>
                <th>Number of phone of student</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${watchUsers.userGroup}" var="users">

                <tr>
                    <td>${users.name}</td>
                    <td>${users.surname}</td>
                    <td>${users.personalInformation.age}</td>
                    <td>${users.personalInformation.number}</td>
                </tr>

            </c:forEach>
            </tbody>
        </form:form>
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

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
