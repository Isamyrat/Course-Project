<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="eCB"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/editCallBack${callBackId}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/editCallBack${callBackId}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>
<div class="login-box">
    <h2><spring:message code="select"/></h2>
    <form:form method="POST" action="/saveApprove" modelAttribute="editCallBack">

        <form:hidden path="id"/>

        <form:hidden path="callBackDate"/>

        <label class="label-color"><spring:message code="select"/></label>
        <form:select path="status">
            <option value=""></option>
            <option value="Approved"><spring:message code="aCa"/></option>
            <option value="Denied"><spring:message code="aNot"/></option>
        </form:select>

        <form:hidden path="userCallBack"/>
        <form:hidden path="courseCallBack"/>
        <p>
        <button style="background-color: #141e30">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="save"/>
        </button></p>
        <p>
        <a href="/menuManager">
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
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/edit.css"%>
</style>
</html>
