<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="aM"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>
<spring:message code="askMan" var="askMan"/>

<div class="container">
    <table>
        <thead>
        <tr>
            <th><spring:message code="aUT"/></th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th><spring:message code="nMU"/></th>
            <th><spring:message code="sNUS"/></th>
            <th><spring:message code="aG"/></th>
        </tr>
        </thead>
        <c:if test="${allUsers.size()>0}">
            <c:forEach items="${allUsers}" var="user">

                        <tr>
                            <td>${user.name}</td>
                            <td>${user.surname}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/deleteUsers" method="post">
                                    <input type="hidden" name="userId" value="${user.id}"/>
                                    <input type="hidden" name="action" value="delete"/>
                                    <button type="submit" onclick="if(!(confirm('${askMan}'))) return false"
                                            style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                                        <spring:message code="dU"/></button>
                                </form>
                            </td>
                        </tr>
            </c:forEach>
        </c:if>
        <c:if test="${allUsers.size()<1}">
            <td><spring:message code="eC"/></td>
        </c:if>
    </table>

    <c:if test="${allUsers.size() > 0}">
        <div>
            <ul class="hr">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li>
                        <a href="/watchUsers?page=${page}&size=${5}">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <a href="/menuAdmin" class="big-button"><spring:message code="mA"/></a>
</div>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>