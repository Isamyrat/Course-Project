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
        <h4><a href="/watchJournalGroup${userId}${groupNumber}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/watchJournalGroup${userId}${groupNumber}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<sec:authorize access="hasRole('ROLE_MANAGER')">
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
                <c:forEach items="${watchGroups}" var="users">

                    <tr>
                        <td>${users.date}</td>
                        <td>${users.point}</td>
                        <td>${users.absent}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </form:form>
        </table>
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_TEACHER')">
    <div class="container">
        <table>
            <form:form modelAttribute="watchGroups">
                <thead>
                <tr>
                    <th><spring:message code="titleT"/></th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th><spring:message code="date"/></th>
                    <th><spring:message code="point"/></th>
                    <th><spring:message code="upsent"/></th>
                    <th><spring:message code="aG"/></th>
                    <th><spring:message code="aG"/></th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${watchGroups}" var="users">

                    <tr>
                        <td>${users.date}</td>
                        <td>${users.point}</td>
                        <td>${users.absent}</td>
                        <td>
                            <form>
                                <a href="/editJournalGroup${users.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;font-size: 20px"><spring:message
                                        code="eJG"/></a>
                                <input type="hidden" name="journalGroupId" value="${users.id}"/>
                            </form>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/deleteJournalGroup" method="post">
                                <input type="hidden" name="journalGroupId" value="${users.id}"/>
                                <input type="hidden" name="action" value="delete"/>
                                <button type="submit"
                                        style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 20px">
                                    <spring:message code="dJG"/></button>
                            </form>
                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </form:form>
        </table>
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
