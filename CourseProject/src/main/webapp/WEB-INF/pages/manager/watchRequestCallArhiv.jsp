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
            <th><spring:message code="lOG"/></th
            <th><spring:message code="aG"/></th>
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
                <td>
                    <form action="${pageContext.request.contextPath}/deleteCallBack" method="post">
                        <input type="hidden" name="callBackId" value="${arhiv.id}"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button type="submit"  onclick="if(!(confirm('Are you sure want to delete this topic?'))) return false"
                                style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                            <spring:message code="del"/></button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
</div>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>