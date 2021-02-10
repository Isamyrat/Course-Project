<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Персональный аккаунт</title>
</head>

<html>
<body>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="login-box">
        <h2>Изменить персональные данные: </h2>
        <form:form  method="POST" action="/saveAdmins" modelAttribute="userEdit">

            <form:hidden path="id"/>
            <label style="color: #8e8e92">Имя пользователей</label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label style="color: #8e8e92">Фамилия пользователей</label>

            <div class=" user-box">
                <form:input path="surname"/>
            </div>
            <label style="color: #8e8e92">Логин пользователей</label>
            <div class="user-box">
                <form:input path="username"/>
            </div>
            <label style="color: #8e8e92">Пароль пользователей</label>
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
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Меню
            </a>
        </form:form>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')">
    <div class="login-box">
        <h2>Изменить персональные данные: </h2>
        <form:form  method="POST" action="/saveUsers" modelAttribute="userEdit">

            <form:hidden path="id"/>
            <label style="color: #8e8e92">Имя пользователей</label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label style="color: #8e8e92">Фамилия пользователей</label>

            <div class=" user-box">
                <form:input path="surname"/>
            </div>
            <label style="color: #8e8e92">Логин пользователей</label>
            <div class="user-box">
                <form:input path="username"/>
            </div>
            <label style="color: #8e8e92">Пароль пользователей</label>
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
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Меню
            </a>
        </form:form>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_MANAGER')">
    <div class="login-box">
        <h2>Изменить персональные данные: </h2>
        <form:form  method="POST" action="/saveManagers" modelAttribute="userEdit">

            <form:hidden path="id"/>
            <label style="color: #8e8e92">Имя пользователей</label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label style="color: #8e8e92">Фамилия пользователей</label>

            <div class=" user-box">
                <form:input path="surname"/>
            </div>
            <label style="color: #8e8e92">Логин пользователей</label>
            <div class="user-box">
                <form:input path="username"/>
            </div>
            <label style="color: #8e8e92">Пароль пользователей</label>
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
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Меню
            </a>
        </form:form>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_TEACHER')">
    <div class="login-box">
        <h2>Изменить персональные данные: </h2>
        <form:form  method="POST" action="/saveTeacherses" modelAttribute="userEdit">

            <form:hidden path="id"/>
            <label style="color: #8e8e92">Имя пользователей</label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label style="color: #8e8e92">Фамилия пользователей</label>

            <div class=" user-box">
                <form:input path="surname"/>
            </div>
            <label style="color: #8e8e92">Логин пользователей</label>
            <div class="user-box">
                <form:input path="username"/>
            </div>
            <label style="color: #8e8e92">Пароль пользователей</label>
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
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Меню
            </a>
        </form:form>
    </div>
</sec:authorize>


</body>
<style>
    <%@include file ="../css/edit.css"%>
</style>
</html>

<%--
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
        <a href="/personalInformationUser">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Сохранить данные
        </a>
        <a href="/personalInformationUser">
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
--%>
