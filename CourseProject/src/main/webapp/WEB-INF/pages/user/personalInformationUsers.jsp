<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> <spring:message code="peronalInfo"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <a href="/personalInformationUsers${personId}?lang=en" class="big-button"><spring:message code="app.en"/></a>
        <a href="/personalInformationUsers${personId}?lang=ru" class="big-button"><spring:message code="app.ru"/></a>
    </div>
</header>
<body>
<div class="container">

    <table>
        <form:form modelAttribute="person">
            <thead>
            <tr>
                <th><h1> <spring:message code="peronalInfo"/></h1></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th> <spring:message code="ageU"/></th>
                <th> <spring:message code="gPerson"/></th>
                <th> <spring:message code="numberPhone"/></th>
                <th> <spring:message code="aG"/></th>
            </tr>
            </thead>
            <c:if test="${person != null}">

            <tbody>

            <tr>
                <td>${person.age}</td>
                <td>${person.gender}</td>
                <td>${person.number}</td>
                <td>
                    <form>
                        <a href="/editPersonalInformationUser${person.id}" type="submit"
                           style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid;">
                            <spring:message code="editPersonalInfo"/>
                        </a>
                    </form>
                </td>

            </tr>
            </tbody>
            </c:if>
            <c:if test="${person == null}">
                <td><spring:message code="eC"/> </td>
            </c:if>
        </form:form>
    </table>
    <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
</div>
</body>


<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>
