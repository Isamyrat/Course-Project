<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Добавить преподавателя</title>
</head>

<html>
<body>

<div class="login-box">
    <h2>Добавить менеджера: </h2>
    <form:form  method="POST" action="/saveTeacher" modelAttribute="userTeacher">

        <form:hidden path="id"/>
        <label style="color: #8e8e92">Имя менеджера</label>
        <div class="user-box">
            <form:input path="name"/>
        </div>

        <label style="color: #8e8e92">Фамилия менеджера</label>

        <div class=" user-box">
            <form:input path="surname"/>
        </div>
        <label style="color: #8e8e92">Логин менеджеру</label>
        <div class="user-box">
            <form:input path="username"/>
        </div>
        <label style="color: #8e8e92">Пароль менеджеру</label>
        <div class="user-box">
            <form:input path="password"/>
        </div>
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
