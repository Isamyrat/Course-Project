<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Изменить топик</title>
</head>

<html>
<body>

<div class="login-box" >
    <h2>Изменить данные топика: </h2>
    <form:form method="POST" action="/saveEditTopic" modelAttribute="editTopic">

        <form:hidden path="id"/>

        <label>Правила</label>
        <div class="user-box">
            <form:input type="text" path="rules"/>
        </div>

        <label>Тескты</label>
        <div class="user-box">
            <form:input type="text" path="text"/>
        </div>

        <form:hidden path="course_topic"/>
        <button  style="background-color: #141e30">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Сохранить данные
        </button>
        <a href="/menuManager">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Меню
        </a>

    </form:form>
</div>
</body>
<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>
