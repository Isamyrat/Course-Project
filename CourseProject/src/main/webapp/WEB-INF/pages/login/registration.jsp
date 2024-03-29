<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Регистрация</title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<spring:message code="eL" var="eLl"/>
<spring:message code="eP" var="ePp"/>
<spring:message code="nM" var="nMM"/>
<spring:message code="sN" var="sNm"/>
<div class="container">
    <header>
        <h1>

            <img src='${pageContext.request.contextPath}/resources/images/English-resources.png'
                 alt="Authentic Collection">

        </h1>
    </header>
    <h2 class="text-center"><spring:message code="registrationT"/></h2>

    <form:form method="POST" modelAttribute="userForm">
        <label class="col-one-half">
            <form:input type="text" path="username" placeholder="${eLl}" cssStyle="font-size: 15px"
                        autofocus="true"/>
            <form:errors path="username"/>
                ${usernameError}
        </label>
        <label class="col-one-half">
            <form:input type="password" path="password" placeholder="${ePp}" cssStyle="font-size: 15px"/>

        </label>
        <label>
            <form:input type="text" path="name" placeholder="${nMM}" cssStyle="font-size: 15px"/>

        </label>
        <label class="password">
            <form:input type="text" path="surname" placeholder="${sNm}" cssStyle="font-size: 15px"/>

        </label>

        <div class="text-center">
            <button class="submit" name="register" onclick=""><spring:message code="sNU"/></button>
        </div>
    </form:form>
    <div class="text-center">
        <form action="/">
            <button class="submit" onclick=""><spring:message code="bK"/></button>
        </form>
    </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/registration.css"%>
    <%@include file ="../css/js/index.js"%>
</style>


</body>
</html>