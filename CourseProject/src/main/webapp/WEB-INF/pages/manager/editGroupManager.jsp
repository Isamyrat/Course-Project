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

<html>

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

        <label><spring:message code="nOG"/></label>
        <form:hidden path="id"/>
        <div class="user-box">
            <form:input type="text" path="number_group"/>
        </div>

        <label><spring:message code="sG"/></label>
        <div class="user-box">
            <form:input type="text" path="status"/>
        </div>

        <form:hidden path="userGroup"/>
        <form:hidden path="course_group"/>
        <form:hidden path="user_teacher"/>

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
