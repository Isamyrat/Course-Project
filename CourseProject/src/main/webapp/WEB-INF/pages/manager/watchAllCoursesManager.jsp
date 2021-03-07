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
<spring:message code="askMC" var="askMC"/>

<sec:authorize access="hasRole('ROLE_USER')">

    <div class="container">
        <table>
            <form:form modelAttribute="allCourses">
                <thead>
                <tr>
                    <th><spring:message code="aC"/></th>
                </tr>
                </thead>
                <c:if test="${allCourses.size()>0}">
                    <thead>
                    <tr>
                        <th><spring:message code="oTGW"/></th>
                        <th><spring:message code="laOG"/></th>
                        <th><spring:message code="lOG"/></th>
                        <th><spring:message code="dOC"/></th>
                        <th><spring:message code="dOTC"/></th>
                        <th><spring:message code="oTDW"/></th>
                        <th><spring:message code="p"/></th>
                        <th><spring:message code="aG"/></th>
                        <th><spring:message code="addToCourses"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allCourses}" var="courses">
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
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                                            <spring:message code="tTG"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/addToCourse" method="post">
                                        <input type="hidden" name="courseId" value="${courses.id}"/>
                                        <button type="submit"
                                                style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="aTG"/></button>

                                    </form>
                                </td>

                            </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${allCourses.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>
        </table>
        <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
            <c:if test="${pageNumber>0}">
                <a href="/watchAllCoursesManager/${pageNumber-1}/${4}" class="arrow left"
                   style="float: left; padding-left: 100px;  font-size: 60px"><</a>
            </c:if>
            <c:if test="${allCourses.size()>pageNumber}">
                <a href="/watchAllCoursesManager/${pageNumber+1}/${4}" class="arrow right"
                   style="float: left; padding-left: 160px; font-size: 60px"> > </a>
            </c:if>
        </form>
        <a href="/watchRequestCallUser/${0}/${10}" class="big-button"><spring:message code="wWGR"/></a>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
    </div>
</sec:authorize>


<sec:authorize access="hasRole('ROLE_MANAGER')">

    <div class="container">
        <table id="table-id">
            <form:form modelAttribute="allCourses">
                <thead>
                <tr>
                    <th><spring:message code="aC"/></th>
                </tr>
                </thead>
                <c:if test="${allCourses.size()>0}">
                    <thead>
                    <tr>
                        <th><spring:message code="oTGW"/></th>
                        <th><spring:message code="laOG"/></th>
                        <th><spring:message code="lOG"/></th>
                        <th><spring:message code="dOC"/></th>
                        <th><spring:message code="dOTC"/></th>
                        <th><spring:message code="oTDW"/></th>
                        <th><spring:message code="p"/></th>
                        <th><spring:message code="aG"/></th>
                        <th><spring:message code="topCours"/></th>
                        <th><spring:message code="delCourse"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allCourses}" var="courses">
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
                                        <a href="/editCourseManager${courses.id}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="eCM"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form>
                                        <a href="/watchTopics${courses.id}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="tTG"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/saveCourseEditStatus"
                                          method="post">
                                        <input type="hidden" name="idCourse" value="${courses.id}"/>
                                        <button type="submit" onclick="if(!(confirm('${askMC}'))) return false"
                                                style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                                            <spring:message code="sTA"/></button>
                                    </form>
                                </td>
                            </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${allCourses.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>
        </table>
        <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
            <c:if test="${pageNumber>0}">
                <a href="/watchAllCoursesManager/${pageNumber-1}/${4}" class="arrow left"
                   style="float: left; padding-left: 100px;  font-size: 60px"><</a>
            </c:if>
            <c:if test="${allCourses.size()>pageNumber}">
                <a href="/watchAllCoursesManager/${pageNumber+1}/${4}" class="arrow right"
                   style="float: left; padding-left: 160px; font-size: 60px"> > </a>
            </c:if>
        </form>
        <a href="/watchAllCoursesManagerArchive/${0}/${3}" class="big-button"><spring:message code="wACM"/></a>
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>

    </div>

</sec:authorize>
</body>


<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file="../css/button.css"%>
</style>
</html>
