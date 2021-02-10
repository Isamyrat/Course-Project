<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Добавить персональный аккаунт</title>
</head>

<html>
<body>

<body>

<div class="login-box" >
    <h2>Personal information: </h2>
    <form>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Имя</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Фамилия</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Возраст</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Пол </label>
        </div>
        <a href="/personalInformationManager">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Сохранить данные
        </a>
        <a href="/menuManager">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Back
        </a>
    </form>
</div>
</body>
<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>

