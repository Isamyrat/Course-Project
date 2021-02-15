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

<html>

<header>
    <div style="float: right">
        <h4><a href="/editCallBack${callBackId}?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="/editCallBack${callBackId}?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>


<body>
<div class="login-box">
    <h2><spring:message code="select"/></h2>
    <form:form method="POST" action="/saveApprove" modelAttribute="editCallBack">

        <form:hidden path="id"/>

        <form:hidden path="callBackDate"/>


        <form:select path="status">
            <option value=""></option>
            <option value="Approve"><spring:message code="aCa"/></option>
            <option value="NotApprove"><spring:message code="aNot"/></option>
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
    <%@include file ="../css/edit.css"%>
</style>
</html>
