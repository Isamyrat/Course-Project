<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="mAM"/></title>
    <script type="text/javascript">
        <%@include file ="../css/js/jquery-3.3.1.min.js"%>
    </script>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<div class="heading-wrapper">
    <div><span class="heading"><spring:message code="mAM"/></span></div>
</div>

<div class="button-wrapper" style="padding: 20px;">
    <a href="/addTeacher" class="btn btn-1"><spring:message code="adTeach"/></a>
    <a href="/addCourse" class="btn btn-1"><spring:message code="addCours"/></a>
    <a href="/addGroup" class="btn btn-2"><spring:message code="addGroup"/></a>
    <a href="/addTopics" class="btn btn-2"><spring:message code="addTopic"/></a>
    <a href="/watchTeacher?page=${0}&size=${5}" class="btn btn-4"><spring:message code="wTeach"/></a>
    <a href="/watchJournalManager/${0}/${7}" class="btn btn-4"><spring:message code="wJournals"/></a>
    <a href="/watchRequestCall/${0}/${7}" class="btn btn-5"><spring:message code="wCall"/></a>
    <a href="/watchGroup?page=${0}&size=${3}" class="btn btn-5"><spring:message code="wGroups"/></a>
    <a href="/watchAllCoursesManager/${0}/${3}" class="btn btn-6"><spring:message code="wCourse"/></a>
    <a href="/personalInformationUser" class="btn btn-6"><spring:message code="bK"/></a>
</div>
<div class="footer-wrapper">
    <div><span class="footer"><spring:message code="gW"/></span></div>

</div>

</body>
<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="/WEB-INF/pages/css/button_manager.css"%>
</style>
</html>
