<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="errors"/></title>
</head>


<body>
<div class="container">
    <div class="localize" style="width: 500px; height: 300px; font-size: 35px; color: black;" >
        ${groupError}
        ${topicLL} ${errorTeacher}${errorStudent}${addToError}${addToErrors}${addressError}
        <p>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="/menuAdmin" class="big-button"><spring:message code="bK"/></a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_MANAGER')">
                <a href="/menuManager" class="big-button"><spring:message code="bK"/></a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
                <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
            </sec:authorize>
        </p>
    </div>

</div>
</body>


<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file="../css/button.css"%>
</style>
</html>
