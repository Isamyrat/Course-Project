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

<html>
<body>
<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<sec:authorize access="hasRole('ROLE_USER')">

    <div class="container">
        <table>
            <form:form modelAttribute="allCoursesUser">
                <thead>
                <tr>
                    <th><spring:message code="aC"/></th>
                </tr>
                </thead>
                <c:if test="${allCoursesUser.size()>0}">
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
                    <c:forEach items="${allCoursesUser}" var="courses">


                        <tr>
                            <td>${courses.time}</td>
                            <td>${courses.language}</td>
                            <td>${courses.level}</td>
                            <td>${courses.start_date}</td>
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
                                    <input type="hidden" name="course" value="${courses.id}"/>
                                    <button type="submit"
                                            style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                        <spring:message code="aTG"/></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${allCoursesUser.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>
        </table>
        <div class="svg">
            <a class="button" href="/personalInformationUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="bK"/></span>
            </a>
            <a class="button" href="/watchRequestCallUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="wWGR"/></span>
            </a>
        </div>


    </div>


</sec:authorize>


<sec:authorize access="hasRole('ROLE_MANAGER')">

    <div class="container">
        <table>
            <form:form modelAttribute="allCoursesUser">
                <thead>
                <tr>
                    <th><spring:message code="aC"/></th>
                </tr>
                </thead>
                <c:if test="${allCoursesUser.size()>0}">
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
                    <c:forEach items="${allCoursesUser}" var="courses">

                        <tr>
                            <td>${courses.time}</td>
                            <td>${courses.language}</td>
                            <td>${courses.level}</td>
                            <td>${courses.start_date}</td>
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
                                <form action="${pageContext.request.contextPath}/deleteCourseManager" method="post">
                                    <input type="hidden" name="idCourse" value="${courses.id}"/>
                                    <input type="hidden" name="action" value="delete"/>
                                    <button type="submit"
                                            style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 25px ">
                                        <spring:message code="dC"/></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${allCoursesUser.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>
        </table>
        <div class="svg">
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
          <%--  <a class="button" href="/menuManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"> <spring:message code="mAM"/></span>
            </a>--%>
        </div>

    </div>
</sec:authorize>
</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
