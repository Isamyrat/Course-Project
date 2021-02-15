<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wJM"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<html>
<body>
<sec:authorize access="hasRole('ROLE_MANAGER')">

    <div class="container">
        <table>
            <thead>
            <tr>
                <th><spring:message code="jJJ"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="sOS"/></th>
                <th><spring:message code="aG"/></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Egor</td>
                <td>10</td>
            </tr>
            <tr>

                <td>Aleksey</td>
                <td>9</td>
            </tr>
            </tbody>
        </table>
        <a href="/editJournalManager" class="big-button"><spring:message code="eJM"/></a>
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>

    </div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_TEACHER')">
    <div class="container">
        <table>
            <thead>
            <tr>
                <th><spring:message code="jJJ"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="sOS"/></th>
                <th><spring:message code="aG"/></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Egor</td>
                <td>10</td>
            </tr>
            <tr>

                <td>Aleksey</td>
                <td>9</td>
            </tr>
            </tbody>
        </table>
        <a href="/editJournal" class="big-button"><spring:message code="eJM"/></a>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>

    </div>

</sec:authorize>

</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
