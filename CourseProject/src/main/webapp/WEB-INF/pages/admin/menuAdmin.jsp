<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="mA"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<a href="/admin/${0}/${10}" class="fancy-btn"><spring:message code="wUser"/></a>

<br>
<a href="/addManager" class="fancy-btn"><spring:message code="aManager"/></a>
<br>
<a href="/watchManagersAdmin/${0}/${10}" class="fancy-btn"><spring:message code="wMan"/></a>
<br>
<a href="/watchTeacher/${0}/${10}" class="fancy-btn"><spring:message code="wTeach"/></a>
<br>
<a href="/personalInformationUser" class="fancy-btn"><spring:message code="bK"/></a>

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="/WEB-INF/pages/css/button_admin.css"%>
</style>
</html>
