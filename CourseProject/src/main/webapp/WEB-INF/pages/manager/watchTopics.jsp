<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> <spring:message code="wTMU"/></title>
</head>

<html>
<header>
    <div style="float: right">
        <h4><a href="/watchTopics${topicId}?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="/watchTopics${topicId}?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
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
                </tr>
                </thead>
                <tbody>
                <c:url var="editTopic" value="/editTopics">
                    <c:param name="topicId" value="${allTopics.id}"/>
                </c:url>

                <tr>
                    <th>${allTopics.text}</th>
                    <th>${allTopics.rules}</th>
                    <th>
                        <form>
                            <a href="${editTopic}"  type="submit"
                               style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; "> <spring:message code="editT"/></a>
                        </form>
                        <form action="${pageContext.request.contextPath}/deleteTopic" method="post">
                            <input type="hidden" name="idTopic" value="${allTopics.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit" style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; "> <spring:message code="deleteT"/></button>
                        </form>
                    </th>
                </tr>
                </tbody>
            </form:form>
        </table>

        <div class="svg">
            <a class="button" href="/menuManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"> <spring:message code="mAM"/></span>
            </a>
        </div>
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

        <div class="svg">
            <a class="button" href="/watchAllCoursesManager">
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
