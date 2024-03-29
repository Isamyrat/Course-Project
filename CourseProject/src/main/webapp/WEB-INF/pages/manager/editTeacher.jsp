<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="editTeacher"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/editTeacher${userId}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/editTeacher${userId}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<div class="login-box">
    <h2><spring:message code="enterData"/></h2>
    <form:form method="POST" action="/saveTeachers" modelAttribute="userTeacher">

        <form:hidden path="id"/>
        <label class="label-color"><spring:message code="nM"/></label>
        <div class="user-box">
            <form:input path="name"/>
        </div>

        <label class="label-color"><spring:message code="sN"/></label>
        <div class=" user-box">
            <form:input path="surname"/>
        </div>

        <form:hidden path="username"/>
        <form:hidden path="password"/>
        <form:hidden path="role"/>

        <button style="background-color: #141e30">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="save"/>
        </button>
        <p>
            <c:if test="${person.role == 'ROLE_MANAGER'}">
                <a href="/menuManager">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <spring:message code="bK"/>
                </a>
            </c:if>
            <c:if test="${person.role == 'ROLE_ADMIN'}">
                <a href="/menuAdmin">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <spring:message code="bK"/>
                </a>
            </c:if>

        </p>
    </form:form>
</div>

</body>
<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/edit.css"%>
</style>
</html>
