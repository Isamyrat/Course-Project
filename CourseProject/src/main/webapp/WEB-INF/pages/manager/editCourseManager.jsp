<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Изменить курсы</title>
</head>

<html>
<body>
<div class="login-box">
    <h2>Изменить данные курса: </h2>
    <form:form modelAttribute="editCourse" method="POST" action="/saveCourseEditManager">

        <form:hidden path="id"/>

        <label>Цена курса</label>
        <div class="user-box">
            <form:input  path="price"/>
        </div>

        <label>Время провождение курсов:</label>
        <div class="user-box">
            <form:input type="text" path="time"/>
        </div>

        <label>Дни курса:</label>
        <div class="user-box">
            <form:input type="text"  path="days"/>
        </div>

        <label>Дата начало курса:</label>
        <div class="user-box">
            <form:input type="text" path="start_date"/>
        </div>

        <label>Продолжительность курса</label>
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
