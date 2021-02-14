<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="tT"/></title>
</head>

<html>

<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>
<div class="container">
    <table>
        <thead>
        <tr>
            <th><spring:message code="tUT"/></th>
        </tr>
        </thead>
        <thead>
        <th><spring:message code="idT"/></th>
        <th><spring:message code="lN"/></th>
        <th><spring:message code="pW"/></th>
        <th><spring:message code="nMU"/></th>
        <th><spring:message code="sNUS"/></th>
        <th><spring:message code="aG"/></th>
        </thead>
        <c:forEach items="${allTeachers}" var="user">
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
                                <button type="submit"  style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; "><spring:message code="dT"/></button>
                            </form>
                            <form action="${pageContext.request.contextPath}/editTeacher" method="get">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <button type="submit"  style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; "><spring:message code="cT"/></button>
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
            <span style="font-size: 8pt"><spring:message code="mAM"/></span>
        </a>
    </div>

</div>
<span></span>
</body>

<style>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>