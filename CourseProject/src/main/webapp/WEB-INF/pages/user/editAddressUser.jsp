<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="editAddress"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/editAddressUser${addressId}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/editAddressUser${addressId}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>
<div class="login-box">
    <h2><spring:message code="enterData"/></h2>
    <form:form method="POST" action="/saveAddressEdit" modelAttribute="addressEdit">

        <form:hidden path="id"/>

        <label class="label-color"><spring:message code="addCount"/></label>
        <div class="user-box">
            <form:input path="country"/>
        </div>

        <label class="label-color"><spring:message code="addCity"/></label>
        <div class=" user-box">
            <form:input path="city"/>
        </div>

        <label class="label-color"><spring:message code="addD"/></label>
        <div class="user-box">
            <form:input path="district"/>
        </div>

        <label class="label-color"><spring:message code="addS"/></label>
        <div class="user-box">
            <form:input path="street"/>
        </div>

        <label class="label-color"><spring:message code="addH"/></label>
        <div class="user-box">
            <form:input path="house"/>
        </div>

        <label class="label-color"><spring:message code="addA"/></label>
        <div class="user-box">
            <form:input path="apartment"/>
        </div>

        <form:hidden path="userAddress"/>

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
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/edit.css"%>
</style>
</html>
