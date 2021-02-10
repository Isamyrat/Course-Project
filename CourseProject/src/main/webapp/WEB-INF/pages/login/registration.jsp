<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Регистрация</title>
</head>

<body>

<div class="container">
    <header>
        <h1>
            <a href="#">

                <img src="https://eoistver.ru/pluginfile.php/39557/course/overviewfiles/English-resources.png"
                     alt="Authentic Collection">
            </a>
        </h1>
    </header>
    <h1 class="text-center">Register</h1>
    <form:form method="POST" modelAttribute="userForm">
        <label class="col-one-half">
            <form:input type="text" path="username" placeholder="Username"
                        autofocus="true"></form:input>
            <form:errors path="username"></form:errors>
                ${usernameError}
                <%--  <span class="label-text">First Name</span>
                  <input type="text" name="firstName">--%>
        </label>
        <label class="col-one-half">
            <form:input type="password" path="password" placeholder="Password"/>

                <%--<span class="label-text">Last Name</span>
                    <input type="text" name="lastName">--%>
        </label>
        <label>
            <form:input type="text" path="name" placeholder="name"></form:input>

                <%--<span class="label-text">Email</span>
                    <input type="text" name="email">--%>
        </label>
        <label class="password">
            <form:input type="text" path="surname" placeholder="surname"></form:input>

        </label>

        <div class="text-center">
                <%-- <a href="/loginAdmin">Зарегистрироваться</a>--%>
            <button class="submit" name="register" onclick="">Sign Me Up</button>
        </div>
    </form:form>
    <div class="text-center">
        <form action="/">
            <button class="submit" onclick="">Back</button>
        </form>
    </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


<style>
    <%@include file ="../css/registration.css"%>
    <%@include file ="../css/js/index.js"%>
</style>


</body>
</html>