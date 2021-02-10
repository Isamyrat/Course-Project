<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<table class="container">
    <thead>
    <tr>
        <th><h1>Персональный аккаунт</h1></th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Имя</td>
        <td>Антон</td>
    </tr>
    <tr>
        <td>Фамилия</td>
        <td>Попов</td>
    </tr>
    <tr>
        <td>Год рождения</td>
        <td>2000</td>
    </tr>
    <tr>
        <td>Пол</td>
        <td>мужской</td>
    </tr>
    </tbody>
</table>


<div class="svg">
    <a class="button" href="/menuManager">
        <svg>
            <rect height="40" width="130" fill="transparent" />
        </svg>
        <span style="font-size: 10pt">Главное меню</span>
    </a>
    <a class="button" href="/addPersonalInformationManager">
        <svg>
            <rect height="40" width="130" fill="transparent" />
        </svg>
        <span style="font-size: 7pt">Добавить личные данные</span>
    </a>
    <a class="button" href="/">
        <svg>
            <rect height="40" width="130" fill="transparent" />
        </svg>
        <span style="font-size: 10pt">Back</span>
    </a>
</div>

</body>

<style>
    <%@include file ="../css/personalInformation.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>
