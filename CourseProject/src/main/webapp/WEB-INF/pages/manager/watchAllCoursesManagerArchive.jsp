<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wCourse"/></title>
</head>

<body>
<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<spring:message code="askMCB" var="askMCB"/>
<div class="container">

    <table id="table-id">
        <form:form modelAttribute="allCoursesArchive">
            <thead>
            <tr>
                <th><spring:message code="aC"/></th>
            </tr>
            </thead>
            <c:if test="${allCoursesArchive.size()>0}">
                <thead>
                <tr>
                    <th><spring:message code="oTGW"/></th>
                    <th><spring:message code="laOG"/></th>
                    <th><spring:message code="lOG"/></th>
                    <th><spring:message code="dOC"/></th>
                    <th><spring:message code="dOTC"/></th>
                    <th><spring:message code="oTDW"/></th>
                    <th><spring:message code="p"/></th>
                    <th><spring:message code="topCours"/></th>
                    <th><spring:message code="delCourse"/></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${allCoursesArchive}" var="courses">
                    <tr>
                        <td>${courses.time}</td>
                        <td>${courses.language}</td>
                        <td>${courses.level}</td>
                        <td>${courses.startDate}</td>
                        <td>${courses.duration}</td>
                        <td>${courses.days}</td>
                        <td>${courses.price}</td>
                        <td>
                            <form>
                                <a href="/watchTopics${courses.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                    <spring:message code="tTG"/></a>
                            </form>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/saveCourseStatusEdit" method="post">
                                <input type="hidden" name="idCourse" value="${courses.id}"/>
                                <button type="submit"  onclick="if(!(confirm('${askMCB}'))) return false"
                                        style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                                    <spring:message code="sTAB"/></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${allCoursesArchive.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
        </form:form>
    </table>
    <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
        <c:if test="${pageNumber>0}">
            <a href="/watchAllCoursesManagerArchive/${pageNumber-1}/${4}" class="arrow left"
               style="float: left; padding-left: 100px;  font-size: 60px"><</a>
        </c:if>
        <c:if test="${allCoursesArchive.size()>pageNumber}">
            <a href="/watchAllCoursesManagerArchive/${pageNumber+1}/${4}" class="arrow right"
               style="float: left; padding-left: 160px; font-size: 60px"> > </a>
        </c:if>
    </form>
    <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
</div>
</body>


<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file="../css/button.css"%>
</style>
</html>
