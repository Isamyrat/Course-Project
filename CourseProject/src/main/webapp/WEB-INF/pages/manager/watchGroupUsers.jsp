<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="titleStud"/></title>
</head>

<html>

<header>
    <div style="float: right">
        <h4><a href="/watchGroupUsers${idGroup}?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="/watchGroupUsers${idGroup}?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<sec:authorize access="hasRole('ROLE_MANAGER')">
<div class="container">
    <table>
        <form:form modelAttribute="watchUsers">
            <thead>
            <tr>
                <th><spring:message code="titleT"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="nOS"/></th>
                <th><spring:message code="sOS"/></th>
                <th><spring:message code="aOs"/></th>
                <th><spring:message code="nOs"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${watchUsers.userGroup}" var="users">

                <tr>
                    <td>${users.name}</td>
                    <td>${users.surname}</td>
                    <td>${users.personalInformation.age}</td>
                    <td>${users.personalInformation.number}</td>
                </tr>

            </c:forEach>
            </tbody>
        </form:form>
    </table>

    <div class="svg">
        <a class="button" href="/menuManager">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 8pt"><spring:message code="mAM"/></span>
        </a>
    </div>
</div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_TEACHER')">
    <div class="container">
        <table>
            <form:form modelAttribute="watchUsers">
                <thead>
                <tr>
                    <th><spring:message code="titleT"/></th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th><spring:message code="nOS"/></th>
                    <th><spring:message code="sOS"/></th>
                    <th><spring:message code="aOs"/></th>
                    <th><spring:message code="nOs"/></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${watchUsers.userGroup}" var="users">

                    <tr>
                        <td>${users.name}</td>
                        <td>${users.surname}</td>
                        <td>${users.personalInformation.age}</td>
                        <td>${users.personalInformation.number}</td>
                    </tr>

                </c:forEach>
                </tbody>
            </form:form>
        </table>

        <div class="svg">
            <a class="button" href="/personalInformationUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"><spring:message code="bK"/></span>
            </a>
        </div>
    </div>
</sec:authorize>


</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
