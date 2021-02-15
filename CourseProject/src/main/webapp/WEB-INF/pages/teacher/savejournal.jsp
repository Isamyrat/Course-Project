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
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>



<body>

<div class="login-box" >
    <h2><spring:message code="addNewPoint"/></h2>
    <form >
        <div class="user-box">
            <input type="text" name="" required="">
            <label><spring:message code="date"/></label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label><spring:message code="studentT"/></label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label><spring:message code="point"/></label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label><spring:message code="upsent"/></label>
        </div>
        <a href="/saveJournal">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <spring:message code="save"/>
        </a>
        <p>
        <a href="/watchJournalManager">
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
    <%@include file ="../css/edit.css"%>
</style>
</html>
