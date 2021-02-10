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
    <form:form method="POST" action="/saveAddress" modelAttribute="addressAdd">

        <form:hidden path="id"/>

        <label style="color: #8e8e92">Страна:</label>
        <div class="user-box">
            <form:input path="country"/>
        </div>

        <label style="color: #8e8e92">Город:</label>
        <div class=" user-box">
            <form:input path="city"/>
        </div>

        <label style="color: #8e8e92">Район:</label>
        <div class="user-box">
            <form:input path="district"/>
        </div>
        <label style="color: #8e8e92">Улица:</label>
        <div class="user-box">
            <form:input path="street"/>
        </div>
        <label style="color: #8e8e92">Дом:</label>
        <div class="user-box">
            <form:input path="house"/>
        </div>
        <label style="color: #8e8e92">Квартира:</label>
        <div class="user-box">
            <form:input path="apartment"/>
        </div>

        <form:hidden path="user_address"/>

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
