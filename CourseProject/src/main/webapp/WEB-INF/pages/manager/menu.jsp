<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="mMM"/></title>
</head>

<html>

<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<div class="heading-wrapper">
    <div><span class="heading"><spring:message code="mMM"/></span></div>
</div>

<div class="button-wrapper" style="padding: 20px;">
    <a href="/addTeacher" class="btn btn-1"><spring:message code="adTeach"/></a>
    <a href="/addCourse" class="btn btn-1"><spring:message code="addCours"/></a>
    <a href="/addGroup" class="btn btn-2"><spring:message code="addGroup"/></a>
    <a href="/addTopics" class="btn btn-2"><spring:message code="addTopic"/></a>
    <a href="/addJournal" class="btn btn-2"><spring:message code="addJournal"/></a>
    <a href="/watchTeacher" class="btn btn-4"><spring:message code="wTeach"/></a>
    <a href="/watchJournalManager" class="btn btn-4"><spring:message code="wJournals"/></a>
    <a href="/watchRequestCall" class="btn btn-5"><spring:message code="wCall"/></a>
    <a href="/watchRequestCallArhiv" class="btn btn-5"><spring:message code="wCallArhiv"/></a>
    <a href="/watchGroup" class="btn btn-5"><spring:message code="wGroups"/></a>
    <a href="/watchAllCoursesManager" class="btn btn-6"><spring:message code="wCourse"/></a>
    <a href="/personalInformationUser" class="btn btn-6"><spring:message code="bK"/></a>
</div>
<div class="footer-wrapper">
    <div><span class="footer"><spring:message code="gW"/></span></div>

</div>

</div>
</body>
<style>
    <%@include file ="/WEB-INF/pages/css/button_manager.css"%>
</style>
</html>
