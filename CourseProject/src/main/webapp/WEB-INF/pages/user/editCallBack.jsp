<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Изменить персональный аккаунт</title>
</head>

<html>
<body>
<div class="login-box">
    <h2>Изменить пользовательские данные: </h2>
    <form:form method="POST" action="/saveApprove" modelAttribute="editCallBack">

        <form:hidden path="id"/>

        <form:hidden path="callBackDate"/>


        <form:select path="status">
            <option value=""></option>
            <option value="Approve">Одобрить</option>
            <option value="NotApprove">Отказать</option>
        </form:select>

        <form:hidden path="userCallBack"/>
        <form:hidden path="courseCallBack"/>

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
            Back
        </a>
    </form:form>
</div>

</body>

<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>
