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

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
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
            <c:if test="${callBackManager.size()>0}">
                <c:forEach items="${callBackManager}" var="manager">
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
            </c:if>
            <c:if test="${callBackManager.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
        </table>
        <a href="/watchRequestCallArhiv" class="big-button"><spring:message code="wCallArhiv"/></a>

        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
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
            <c:if test="${callBack.size()>0}">

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
            </c:if>
            <c:if test="${callBack.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
        </table>
        <a href="/watchAllCoursesManager" class="big-button"><spring:message code="bK"/></a>
    </div>
</sec:authorize>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>