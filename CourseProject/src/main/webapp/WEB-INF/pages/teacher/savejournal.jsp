<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Сохранить журнал</title>
</head>

<html>
<body>

<div class="login-box" >
    <h2>Заполнить журнал: </h2>
    <form >
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Дата:</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Студент:</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Оценка:</label>
        </div>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>Был/Не был на занятии</label>
        </div>
        <a href="/saveJournal">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Сохранить данные
        </a>
        <a href="/watchJournal">
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
