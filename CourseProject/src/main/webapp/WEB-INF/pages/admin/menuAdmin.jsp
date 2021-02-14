<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="mA"/></title>
</head>

<html>

<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>
<br>

<a href="/admin" class="fancy-btn"><spring:message code="wUser"/></a>
<br>
<a href="/addManager" class="fancy-btn"><spring:message code="aManager"/></a>
<br>
<a href="/watchManagersAdmin" class="fancy-btn"><spring:message code="wMan"/></a>
<br>
<a href="/personalInformationUser" class="fancy-btn"><spring:message code="bK"/></a>

</body>

<style>
    <%@include file ="/WEB-INF/pages/css/button_admin.css"%>
</style>
</html>
