<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wCallArhiv"/></title>
</head>
<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<html>
<body>
<div class="container">
    <table>
        <thead>
        <tr>
            <th><spring:message code="tCall"/></th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th><spring:message code="idT"/></th>
            <th><spring:message code="dR"/></th>
            <th><spring:message code="dCall"/></th>
            <th><spring:message code="nMU"/></th>
            <th><spring:message code="sNUS"/></th>
            <th><spring:message code="laOG"/></th>
            <th><spring:message code="lOG"/></th>
        </tr>
        </thead>
        <c:forEach items="${callBackManagerArhiv}" var="arhiv">
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
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 8pt"> <spring:message code="bK"/></span>
        </a>
    </div>

</div>
</body>

<style>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>