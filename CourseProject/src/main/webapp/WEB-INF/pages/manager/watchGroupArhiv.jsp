<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wAG"/></title>
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
        <form:form modelAttribute="watchUsersArhiv">
        <thead>
        <tr>
            <th><spring:message code="tiTle"/></th>
        </tr>
        </thead>
            <c:if test="${watchUsersArhiv.size()>0}">
        <thead>
        <tr>
            <th><spring:message code="nOG"/></th>
            <th><spring:message code="tOG"/></th>
            <th><spring:message code="lOG"/></th>
            <th><spring:message code="laOG"/></th>
            <th><spring:message code="dOG"/></th>
            <th><spring:message code="sG"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${watchUsersArhiv}" var="groups">

        <tr>
            <td>${groups.number_group}</td>
            <td>${groups.user_teacher.surname}</td>
            <td>${groups.course_group.level}</td>
            <td>${groups.course_group.language}</td>
            <td>${groups.course_group.start_date}</td>
            <td>${groups.status}</td>
        </tr>
        </c:forEach>
        </tbody>
            </c:if>
        </form:form>
    </table>
    <a href="/menuManager" class="big-button"><spring:message code="bK"/></a>
</div>

</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
