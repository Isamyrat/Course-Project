<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="tT"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
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
        <%--
                <th><spring:message code="lN"/></th>
                <th><spring:message code="pW"/></th>--%>
        <th><spring:message code="nMU"/></th>
        <th><spring:message code="sNUS"/></th>
        <th><spring:message code="aG"/></th>
        </thead>
        <c:forEach items="${allTeachers}" var="user">
            <c:forEach items="${user.roles}" var="role">
                <c:if test="${role.name=='ROLE_TEACHER'}">
                    <tr>
                        <td>${user.id}</td>
                            <%--
                                                    <td>${user.username}</td>
                                                    <td>${user.password}</td>--%>
                        <td>${user.name}</td>
                        <td>${user.surname}</td>
                        <td>

                                <%--<form action="/editTeacher${user.id}" method="get">
                                    <input type="hidden" name="userId" value="${user.id}"/>
                                    <button type="submit"  style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; "><spring:message code="cT"/></button>
                                </form>--%>
                            <form>
                                <a href="/editTeacher${user.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;font-size: 20px"><spring:message
                                        code="cT"/></a>
                            </form>
                            <form action="${pageContext.request.contextPath}/deleteTeacher" method="post">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <input type="hidden" name="action" value="delete"/>
                                <button type="submit"
                                        style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 25px ">
                                    <spring:message code="dT"/></button>
                            </form>

                        </td>

                    </tr>
                </c:if>
            </c:forEach>
        </c:forEach>
    </table>
    <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
</div>
<span></span>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>