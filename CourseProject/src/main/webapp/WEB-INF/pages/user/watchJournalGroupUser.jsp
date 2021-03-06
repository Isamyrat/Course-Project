<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="aCJ"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/watchJournalGroupUser${groupNumber}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/watchJournalGroupUser${groupNumber}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<div class="container">
    <table>
        <form:form modelAttribute="watchGroups">
            <thead>
            <tr>
                <th><spring:message code="aCJ"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="date"/></th>
                <th><spring:message code="point"/></th>
                <th><spring:message code="upsent"/></th>

            </tr>
            </thead>
            <tbody>
            <c:if test="${watchGroups.size()>0}">

            <c:forEach items="${watchGroups}" var="users">

                <tr>
                    <td>${users.date}</td>
                    <td>${users.point}</td>
                    <td>${users.absent}</td>
                </tr>
            </c:forEach>
            </c:if>
            <c:if test="${watchGroups.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
            </tbody>
        </form:form>
    </table>
    <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
        <c:if test="${pageNumber>0}">
            <a href="/watchJournalGroupUser${groupNumber}/${pageNumber-1}/${7}" class="arrow left"
               style="float: left; padding-left: 100px;  font-size: 60px"><</a>
        </c:if>
        <c:if test="${watchGroups.size()>pageNumber}">
            <a href="/watchJournalGroupUser${groupNumber}/${pageNumber+1}/${7}" class="arrow right"
               style="float: left; padding-left: 160px; font-size: 60px"> > </a>
        </c:if>
    </form>
    <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
</div>


</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
