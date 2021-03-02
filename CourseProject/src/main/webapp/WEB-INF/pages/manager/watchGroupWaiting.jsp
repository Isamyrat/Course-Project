<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="titleGroup"/></title>
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
        <form:form modelAttribute="watchGroupWaiting">
            <thead>
            <tr>
                <th><spring:message code="tiTle"/></th>
            </tr>
            </thead>
            <c:if test="${watchGroupWaiting.size()>0}">
                <thead>
                <tr>
                    <th><spring:message code="nOG"/></th>
                    <th><spring:message code="tOG"/></th>
                    <th><spring:message code="lOG"/></th>
                    <th><spring:message code="laOG"/></th>
                    <th><spring:message code="sG"/></th>
                    <th><spring:message code="aG"/></th>
                    <th><spring:message code="aG"/></th>
                    <th><spring:message code="aG"/></th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${watchGroupWaiting.size()>0}">

                    <c:forEach items="${watchGroupWaiting}" var="groups">

                        <tr>
                            <td>${groups.number_group}</td>
                            <td>${groups.user_teacher.surname}</td>
                            <td>${groups.course_group.level}</td>
                            <td>${groups.course_group.language}</td>
                            <td>${groups.status}</td>
                            <td>
                                <form>
                                    <a href="/watchGroupUsers${groups.id}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                        <spring:message code="titleStud"/></a>
                                </form>
                                <br>
                                <form>
                                    <a href="/editGroupManager${groups.number_group}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                        <spring:message code="eNG"/></a>
                                </form>
                            </td>
                            <td>
                                <form>
                                    <a href="/editGroupTeacher${groups.number_group}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                        <spring:message code="eTG"/></a>
                                </form>
                            </td>
                            <td>
                                <form>
                                    <a href="/editGroupStatus${groups.number_group}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                        <spring:message code="eG"/></a>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${watchGroupWaiting.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
                </tbody>
            </c:if>
        </form:form>
    </table>
    <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
</div>

</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
