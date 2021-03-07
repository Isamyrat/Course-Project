<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="eG"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/editGroupManager${groupId}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/editGroupManager${groupId}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<div class="login-box">
    <h2><spring:message code="enterData"/></h2>
    <form:form modelAttribute="group" method="POST" action="/saveGroupMan">

        <form:hidden path="id"/>

        <label class="label-color"><spring:message code="select"/></label>
        <form:select path="userTeacher">
            <option value=""></option>
            <c:forEach items="${teacher}" var="teacher">
                <c:forEach items="${teacher.roles}" var="role">
                    <c:if test="${role.name=='ROLE_TEACHER'}">
                        <option value="${teacher.id}">${teacher.surname}</option>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </form:select>

        <form:hidden path="numberGroup"/>
        <form:hidden path="status"/>
        <form:hidden path="userGroup"/>
        <form:hidden path="courseGroup"/>

        <button style="background-color: #141e30">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="save"/>
        </button>
        <p>
            <a href="/menuManager">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="bK"/>
            </a></p>
    </form:form>
</div>
</body>
<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/edit.css"%>
</style>
</html>
