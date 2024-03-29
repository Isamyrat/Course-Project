<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="script" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wTMU"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/watchTopics${topicId}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/watchTopics${topicId}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>
<spring:message code="askTOp" var="askTOp"/>

<div class="container">
    <table>
        <form:form modelAttribute="allTopics">

            <thead>
            <tr>
                <th><spring:message code="tTtT"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="tTT"/></th>
                <th><spring:message code="tR"/></th>
                <c:if test="${person.role == 'ROLE_MANAGER'}">
                    <th><spring:message code="aG"/></th>
                </c:if>

            </tr>
            </thead>
            <tbody>
            <c:if test="${allTopics != null}">
                <tr>
                    <td>${allTopics.text}</td>
                    <td>${allTopics.rules}</td>
                    <c:if test="${person.role == 'ROLE_MANAGER'}">
                        <td>
                            <form>
                                <a href="/editTopics${allTopics.id}"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">
                                    <spring:message code="editT"/></a>
                            </form>
                            <form action="${pageContext.request.contextPath}/deleteTopic" method="post">
                                <input type="hidden" name="topicId" value="${allTopics.id}"/>
                                <input type="hidden" name="action" value="delete"/>
                                <button type="submit" onclick="if(!(confirm('${askTOp}'))) return false"
                                        style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                                    <spring:message code="del"/></button>

                            </form>
                        </td>
                    </c:if>
                </tr>
            </c:if>
            <c:if test="${allTopics == null}">
                <td><spring:message code="eC"/></td>
            </c:if>
            </tbody>
        </form:form>
    </table>
    <c:if test="${person.role == 'ROLE_MANAGER'}">
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
    </c:if>
    <c:if test="${person.role == 'ROLE_USER'}">
        <a href="/watchAllCoursesManager/${0}/${3}" class="big-button"><spring:message code="bK"/></a>
    </c:if>
</div>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>

</html>
