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

<html>

<header>
    <div style="float: right">
        <a href="/personalInformationUsers${personId}?lang=en"><spring:message code="app.en"/></a>
        <a href="/personalInformationUsers${personId}?lang=ru"><spring:message code="app.en"/></a>
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
            <tbody>

          <%--  <c:url var="editPerson" value="/editPersonalInformationUser">
                <c:param name="personId" value="${person.id}"/>
            </c:url>--%>

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
        </form:form>
    </table>

    <div class="svg">

        <a class="button" href="/personalInformationUser">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 10pt"> <spring:message code="bK"/></span>
        </a>
    </div>
</div>
</body>


<style>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>
