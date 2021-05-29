<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="personalAccaunt"/></title>
</head>
<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>
<div class="container">
    <table>
        <form:form modelAttribute="userId">
            <thead>
            <tr>
                <th><spring:message code="caption"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="nMU"/></th>
                <th><spring:message code="sNUS"/></th>
                <c:if test="${userId.role == 'ROLE_USER'}">
                    <th><spring:message code="wpI"/></th>
                    <th><spring:message code="wAddr"/></th>
                </c:if>
            </tr>
            </thead>
            <c:if test="${userId != null}">

                <tbody>
                <tr>
                    <td>${userId.name}</td>
                    <td>${userId.surname}</td>
                    <c:if test="${userId.role == 'ROLE_USER'}">
                        <td>
                            <form>
                                <a href="/addPersonalInformationUser" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="adPI"/></a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="/personalInformationUsers${userId.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="pI"/></a>
                            </form>

                        </td>
                        <td>
                            <form>
                                <a href="/addAddressUser" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);   color: #000000; border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="adAddress"/></a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="/userAddressWatch${userId.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);   color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="wAI"/></a>
                            </form>

                        </td>
                    </c:if>
                </tr>
                </tbody>
            </c:if>
            <c:if test="${userId == null}">
                <td><spring:message code="eC"/></td>
            </c:if>
        </form:form>
    </table>
    <c:if test="${userId.role == 'ROLE_TEACHER'}">
        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/watchGroupTeacher/${0}/${7}" class="big-button"><spring:message code="wG"/></a>
    </c:if>
    <c:if test="${userId.role == 'ROLE_USER'}">
        <a href="/watchAllCoursesManager/${0}/${3}" class="big-button"><spring:message code="wAC"/></a>
        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/watchGroupUser/${0}/${7}" class="big-button"><spring:message code="wWG"/></a>
    </c:if>
    <c:if test="${userId.role == 'ROLE_MANAGER'}">
        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/menuManager" class="big-button"><spring:message code="mM"/></a>
    </c:if>
    <c:if test="${userId.role == 'ROLE_ADMIN'}">
        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/menuAdmin" class="big-button"><spring:message code="mM"/></a>
    </c:if>
    <a href="/" class="big-button"><spring:message code="bK"/></a>
</div>
</body>
<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>


