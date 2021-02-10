<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>menu Admin</title>
</head>

<html>
<body>
<br>

<a href="/admin" class="fancy-btn">Посмотреть пользователей</a>
<br>
<a href="/personalInformationUser" class="fancy-btn">персональные данные</a>
<br>
<a href="/addManager" class="fancy-btn">Добавить менеджера</a>
<br>
<a href="/watchManagersAdmin" class="fancy-btn">Посмотреть менеджеров</a>


</body>

<style>
    <%@include file ="/WEB-INF/pages/css/button_admin.css"%>
</style>
</html>
