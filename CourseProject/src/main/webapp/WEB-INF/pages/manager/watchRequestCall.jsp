<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wCall"/></title>
</head>
<html>
<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>
<sec:authorize access="hasRole('ROLE_MANAGER')">

    <div class="container">
        <table>
            <thead>
            <tr>
                <th><spring:message code="tCall"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="idT"/></th>
                <th><spring:message code="dR"/></th>
                <th><spring:message code="dCall"/></th>
                <th><spring:message code="nMU"/></th>
                <th><spring:message code="sNUS"/></th>
                <th><spring:message code="laOG"/></th>
                <th><spring:message code="lOG"/></th>
                <th><spring:message code="aG"/></th>
            </tr>
            </thead>
            <c:forEach items="${callBackManager}" var="manager">

               <%-- <c:url var="updateLink" value="/editCallBack">
                    <c:param name="callBackId" value="${manager.id}"/>
                </c:url>--%>
                <tr>
                    <td>${manager.id}</td>
                    <td>${manager.status}</td>
                    <td>${manager.callBackDate}</td>
                    <td>${manager.userCallBack.name}</td>
                    <td>${manager.userCallBack.surname}</td>
                    <td>${manager.courseCallBack.level}</td>
                    <td>${manager.courseCallBack.language}</td>
                    <td>
                        <form>
                            <a href="/editCallBack${manager.id}" type="submit"
                               style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                <spring:message code="editStatus"/>
                            </a>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div>
            <form action="${pageContext.request.contextPath}/menuManager" method="get">
                <button type="submit"
                        style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 25px ">
                    <spring:message code="mAM"/></button>
            </form>
            <form action="${pageContext.request.contextPath}/menuManager" method="get">
                <button type="submit"
                        style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 25px ">
                    <spring:message code="mAM"/></button>
            </form>
            <form action="${pageContext.request.contextPath}/menuManager" method="get">
                <button type="submit"
                        style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 25px ">
                    <spring:message code="mAM"/></button>
            </form>

        </div>
       <%-- <div class="svg">
            <a class="button" href="/menuManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"> <spring:message code="bK"/></span>
            </a>
        </div>--%>
    </div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
    <div class="container">
        <table>
            <thead>
            <tr>
                <th><spring:message code="tCall"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="dR"/></th>
                <th><spring:message code="dCall"/></th>
                <th><spring:message code="laOG"/></th>
                <th><spring:message code="lOG"/></th>
            </tr>
            </thead>
            <c:forEach items="${callBack}" var="user">
                <tbody>
                <tr>
                    <td>${user.status}</td>
                    <td>${user.callBackDate}</td>
                    <td>${user.courseCallBack.language}</td>
                    <td>${user.courseCallBack.level}</td>

                </tr>
                </tbody>
            </c:forEach>
        </table>
        <div class="svg">
            <a class="button" href="/watchAllCoursesManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"> <spring:message code="bK"/></span>
            </a>
        </div>
    </div>
</sec:authorize>
</body>

<style>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>