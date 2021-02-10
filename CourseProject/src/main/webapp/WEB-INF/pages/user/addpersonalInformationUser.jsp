<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Персональный аккаунт</title>
</head>

<html>
<body>

<div class="login-box">
    <h2>Добавить личные данные: </h2>
    <form:form method="POST" action="/savePersonalInfos" modelAttribute="personAdd">

        <form:hidden path="id"/>

        <label style="color: #8e8e92">Ваш возраст</label>
        <div class="user-box">
            <form:input path="age" />
        </div>

        <label style="color: #8e8e92">Ваш пол</label>
        <div class=" user-box">
            <form:input path="gender"/>
        </div>

        <label style="color: #8e8e92">Ваш номер телефона</label>
        <div class="user-box">
            <form:input path="number"/>
        </div>
        <form:hidden path="status"/>
        <form:hidden path="user_information"/>
        <button style="background-color: #141e30">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Сохранить данные
        </button>
        <a href="/personalInformationUser">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Back
        </a>
    </form:form>
</div>

</body>

<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>
