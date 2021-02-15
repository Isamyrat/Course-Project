<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="eCM"/></title>
</head>

<html>

<header>
    <div style="float: right">
        <h4><a href="/editCourseManager${course}?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="/editCourseManager${course}?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>
<div class="login-box">
    <h2><spring:message code="enterData"/></h2>
    <form:form modelAttribute="editCourse" method="POST" action="/saveCourseEditManager">

        <form:hidden path="id"/>

        <label><spring:message code="p"/></label>
        <div class="user-box">
            <form:input  path="price"/>
        </div>

        <label><spring:message code="oTGW"/></label>
        <div class="user-box">
            <form:input type="text" path="time"/>
        </div>

        <label><spring:message code="oTDW"/></label>
        <div class="user-box">
            <form:input type="text"  path="days"/>
        </div>

        <label><spring:message code="dOC"/></label>
        <div class="user-box">
            <form:input type="text" path="start_date"/>
        </div>

        <label><spring:message code="dOTC"/></label>
        <div class="user-box">
            <form:input type="text" path="duration"/>
        </div>

        <form:hidden path="level"/>
        <form:hidden path="language"/>

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
            <spring:message code="mAM"/>
        </a>
        </p>

    </form:form>
</div>
</body>
<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>
