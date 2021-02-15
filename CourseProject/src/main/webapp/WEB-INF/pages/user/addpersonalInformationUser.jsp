<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="adPI"/></title>
</head>

<html>

<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>

<div class="login-box">
    <h2><spring:message code="enterData"/></h2>
    <form:form method="POST" action="/savePersonalInfos" modelAttribute="personAdd">

        <form:hidden path="id"/>

        <label style="color: #8e8e92"><spring:message code="etAg"/></label>
        <div class="user-box">
            <form:input path="age" />
        </div>

        <label style="color: #8e8e92"><spring:message code="etGe"/></label>
        <div class=" user-box">
            <form:input path="gender"/>
        </div>

        <label style="color: #8e8e92"><spring:message code="etNum"/></label>
        <div class="user-box">
            <form:input path="number"/>
        </div>
        <form:hidden path="status"/>
        <form:hidden path="user_information"/>
        <button style="background-color: #141e30">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="save"/>
        </button>
        <p>
        <a href="/personalInformationUser">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="bK"/>
        </a>
        </p>
    </form:form>
</div>

</body>

<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>
