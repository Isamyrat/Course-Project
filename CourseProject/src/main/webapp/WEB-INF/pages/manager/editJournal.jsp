<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Изменить журнал</title>
</head>

<html>
<body>

<div class="login-box" >
    <h2>Изменить данные журнала: </h2>
    <form >
        <label>Номер журнала</label>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Номер студента</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Уровень</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Язык </label>
        </div>
        <a href="/saveJournalMan">
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
            Меню
        </a>

    </form>
</div>
</body>
<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>
