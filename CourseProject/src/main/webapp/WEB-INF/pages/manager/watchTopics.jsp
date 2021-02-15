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
    <title> <spring:message code="wTMU"/></title>
</head>

<html>


<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/watchTopics${topicId}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/watchTopics${topicId}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<sec:authorize access="hasRole('ROLE_MANAGER')">
    <div class="container">
        <table>
            <form:form modelAttribute="allTopics">

                <thead>
                <tr>
                    <th> <spring:message code="tTtT"/></th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th> <spring:message code="tTT"/></th>
                    <th> <spring:message code="tR"/></th>
                    <th><spring:message code="aG"/> </th>
                </tr>
                </thead>
                <tbody>
              <%--  <c:url var="editTopic" value="/editTopics">
                    <c:param name="topicId" value="${allTopics.id}"/>
                </c:url>--%>
                <c:if test="${allTopics != null}">
                <tr>
                    <td>${allTopics.text}</td>
                    <td>${allTopics.rules}</td>
                    <td>
                        <form>
                            <a href="/editTopics${allTopics.id}"  type="submit"
                               style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; "> <spring:message code="editT"/></a>
                        </form>
                        <form action="${pageContext.request.contextPath}/deleteTopic" method="post">
                            <input type="hidden" name="idTopic" value="${allTopics.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit" style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; "> <spring:message code="deleteT"/></button>
                        </form>
                    </td>
                </tr>
                </c:if>
                <c:if test="${allTopics == null}">
                    <td><spring:message code="eC"/> </td>
                </c:if>
                </tbody>
            </form:form>
        </table>
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>

    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')">
    <div class="container">
        <table>
            <form:form modelAttribute="allTopics">
                <thead>
                <tr>
                    <th> <spring:message code="tTtT"/></th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th> <spring:message code="tTT"/></th>
                    <th> <spring:message code="tR"/></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>${allTopics.text}</th>
                    <th>${allTopics.rules}</th>
                </tr>
                </tbody>
            </form:form>
        </table>
        <a href="/watchAllCoursesManager" class="big-button"><spring:message code="bK"/></a>
    </div>
</sec:authorize>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>

</html>
