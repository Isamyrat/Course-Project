<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Меню</title>
</head>

<html>
<body>

<div class="heading-wrapper">
    <div><span class="heading">Меню:</span></div>
</div>

<div class="button-wrapper" style="padding: 20px;">
    <a href="/addTeacher" class="btn btn-1">Добавить преподавателей</a>
    <a href="/addCourse" class="btn btn-1">Добавить курсы</a>
    <a href="/addGroup" class="btn btn-2">Добавить группу</a>
    <a href="/addTopics" class="btn btn-2">Добавить топик</a>
    <a href="/addJournal" class="btn btn-2">Добавить журнал</a>

    <a href="/watchTeacher" class="btn btn-4">Посмотреть преподавателей</a>
<%--
    <a href="/watchTopics" class="btn btn-4">Посмотреть все материаллы топиков</a>
--%>
    <a href="/watchJournalManager" class="btn btn-4">Посмотреть журналлы</a>
    <a href="/watchRequestCall" class="btn btn-5">Посмотреть заявки на поступления</a>
    <a href="/watchRequestCallArhiv" class="btn btn-5">Посмотреть архив заявки на поступления</a>
    <a href="/watchGroup" class="btn btn-5">Посмотреть группы</a>
    <a href="/watchAllCoursesManager" class="btn btn-6">посмотреть все курсы</a>
    <a href="/personalInformationUser" class="btn btn-6">персональные данные</a>
</div>
<div class="footer-wrapper">
    <div><span class="footer">Хорошей работы</span></div>

</div>

</div>
</body>
<style>
    <%@include file ="/WEB-INF/pages/css/button_manager.css"%>
</style>
</html>
