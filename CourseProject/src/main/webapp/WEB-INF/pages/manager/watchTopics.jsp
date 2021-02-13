<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть топик</title>
</head>

<html>
<body>
<sec:authorize access="hasRole('ROLE_MANAGER')">
    <div class="container">
        <table>
            <form:form modelAttribute="allTopics">

                <thead>
                <tr>
                    <th>Topics</th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th>Rules</th>
                    <th>Text</th>
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
                            <%--<form action="${pageContext.request.contextPath}/editTopics" method="get">
                                <input type="hidden" name="topicId" value="${allTopics.id}"/>
                                <button type="submit">Change</button>
                            </form>--%>
                        <form>
                            <a href="${editTopic}"  type="submit" style="background-color: #576a91; color: white; border: 1px #f5f4f4 solid; font-size: 10pt">Edit
                                topic</a>
                        </form>
                        <form action="${pageContext.request.contextPath}/deleteTopic" method="post">
                            <input type="hidden" name="idTopic" value="${allTopics.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit" style="background-color: #576a91; color: white; border: 1px #f5f4f4 solid; font-size: 10pt">Delete</button>
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
                <span style="font-size: 8pt">Меню</span>
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
                    <th>Topics</th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th>Rules</th>
                    <th>Text</th>
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
                <span style="font-size: 8pt">Back</span>
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
