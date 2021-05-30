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
                    <c:if test="${person.role == 'ROLE_USER'}">
                        <th><spring:message code="addToCourses"/></th>
                    </c:if>
                    <c:if test="${person.role == 'ROLE_MANAGER'}">
                        <th><spring:message code="topCours"/></th>
                        <th><spring:message code="delCourse"/></th>
                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${allCourses}" var="courses">
                    <tr>
                        <td>${courses.time}</td>
                        <c:if test="${courses.language == 'English'}">
                            <td>${english}</td>
                        </c:if>
                        <c:if test="${courses.language == 'French'}">
                            <td>${french}</td>
                        </c:if>
                        <c:if test="${courses.language == 'Russian'}">
                            <td>${russian}</td>
                        </c:if>
                        <c:if test="${courses.language == 'Turkish'}">
                            <td>${turkish}</td>
                        </c:if>
                        <c:if test="${courses.level == 'Start'}">
                            <td>${start}</td>
                        </c:if>
                        <c:if test="${courses.level == 'Elementary'}">
                            <td>${elementary}</td>
                        </c:if>
                        <c:if test="${courses.level == 'Pre-Intermediate'}">
                            <td>${pre_Intermediate}</td>
                        </c:if>
                        <c:if test="${courses.level == 'Intermediate'}">
                            <td>${intermediate}</td>
                        </c:if>
                        <c:if test="${courses.level == 'Upper_Intermediate'}">
                            <td>${upper_Intermediate}</td>
                        </c:if>
                        <c:if test="${courses.level == 'Advanced'}">
                            <td>${advanced}</td>
                        </c:if>
                        <td>${courses.startDate}</td>
                        <td>${courses.duration}</td>
                        <td>${courses.days}</td>
                        <td>${courses.price}</td>
                        <c:if test="${person.role == 'ROLE_USER'}">
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
                        </c:if>
                        <c:if test="${person.role == 'ROLE_MANAGER'}">
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
                        </c:if>

                    </tr>
                </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${allCourses.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
        </form:form>
    </table>
    <c:if test="${allCourses.size() > 0}">
        <div>
            <ul class="hr">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li>
                        <a href="/watchAllCoursesManager?page=${page}&size=${3}">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <c:if test="${person.role == 'ROLE_MANAGER'}">
        <a href="/watchAllCoursesManagerArchive?page=${0}&size=${3}" class="big-button"><spring:message code="wACM"/></a>
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
    </c:if>
    <c:if test="${person.role == 'ROLE_USER'}">
        <a href="/watchRequestCallUser?page=${0}&size=${7}" class="big-button"><spring:message code="wWGR"/></a>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
    </c:if>

</div>
</body>
<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file="../css/button.css"%>
</style>
</html>
