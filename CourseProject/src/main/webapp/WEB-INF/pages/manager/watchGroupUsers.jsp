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

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/watchGroupUsers${idGroup}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/watchGroupUsers${idGroup}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>
<spring:message code="askGS" var="askGS"/>

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
                <th><spring:message code="aG"/></th>
                <th><spring:message code="aCJ"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${watchUsers.userGroup}" var="users">

                <tr>
                    <td>${users.name}</td>
                    <td>${users.surname}</td>
                    <td>${users.personalInformation.age}</td>
                    <td>${users.personalInformation.number}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/deleteStud" method="post">
                            <input type="hidden" name="userId" value="${users.id}"/>
                            <input type="hidden" name="groupNumber" value="${watchUsers.number_group}"/>
                            <input type="hidden" name="action" value="delete"/>
                        </form>
                        <form action="${pageContext.request.contextPath}/deleteStud" method="post">
                            <input type="hidden" name="userId" value="${users.id}"/>
                            <input type="hidden" name="groupNumber" value="${watchUsers.number_group}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit"  onclick="if(!(confirm('${askGS}'))) return false"
                                    style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                                <spring:message code="dU"/></button>
                        </form>
                    </td>
                    <td>
                        <form>
                            <a href="/watchJournalGroup/${users.id}/${watchUsers.number_group}/${0}/${7}" type="submit"
                               style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;font-size: 20px"><spring:message
                                    code="aCJW"/></a>
                        </form>
                    </td>
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
                    <th><spring:message code="aCJ"/></th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${watchUsers.userGroup}" var="users">

                    <tr>
                        <td>${users.name}</td>
                        <td>${users.surname}</td>
                        <td>${users.personalInformation.age}</td>
                        <td>${users.personalInformation.number}</td>

                        <td>
                            <form>
                                <a href="/watchJournalGroup/${users.id}/${watchUsers.number_group}/${0}/${7}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;font-size: 20px"><spring:message
                                        code="aCJW"/></a>
                            </form>
                            <form>
                                <a href="/addJournalGroup/${users.id}/${watchUsers.number_group}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;font-size: 20px"><spring:message
                                        code="aJG"/></a>
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
