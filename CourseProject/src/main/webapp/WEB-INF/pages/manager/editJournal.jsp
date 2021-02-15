<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="editJournal"/></title>
</head>

<html>
<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<div class="login-box" >
    <h2><spring:message code="editJournal"/></h2>
    <form >
<%--
        <label><spring:message code="numberOfJournal"/></label>
--%>
        <div class="user-box">
            <input type="text" name="" required="">
            <label><spring:message code="studentT"/></label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label><spring:message code="lOG"/></label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label><spring:message code="laOG"/></label>
        </div>
        <a href="/saveJournalMan">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="save"/>
        </a>
    <p>
        <a href="/menuManager">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="bK"/>
        </a>
    </p>
    </form>
</div>
</body>
<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/edit.css"%>
</style>
</html>
