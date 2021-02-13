<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Изменить группу</title>
</head>

<html>
<body>

<div class="login-box">
    <h2>Изменить данные группы: </h2>
    <form:form modelAttribute="groupEdit" method="POST" action="/saveGroupMan">
        <label>Номер группы</label>
        <form:hidden path="id"/>
        <div class="user-box">
            <form:input type="text" path="number_group"/>
        </div>

        <label>Status </label>
        <div class="user-box">
            <form:input type="text" path="status"/>
        </div>
        <form:hidden path="userGroup"/>
        <form:hidden path="course_group"/>
        <form:hidden path="user_teacher"/>

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
