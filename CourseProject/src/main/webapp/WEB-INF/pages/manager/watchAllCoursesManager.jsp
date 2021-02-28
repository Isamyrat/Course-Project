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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="paginator/jquery.simplePagination.js"></script>
</head>

<body>
<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
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
                <c:if test="${allCoursesUser.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>

        </table>
        <a href="/watchRequestCallUser" class="big-button"><spring:message code="wWGR"/></a>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
    </div>
</sec:authorize>


<sec:authorize access="hasRole('ROLE_MANAGER')">

    <div class="container">
        <h2>Select Number Of Rows</h2>
        <div class="form-group"> 	<!--		Show Numbers Of Rows 		-->
            <select class  ="form-control" name="state" id="maxRows">
                <option value="5000">Show ALL Rows</option>
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="70">70</option>
                <option value="100">100</option>
            </select>

        </div>
        <table id = "table-id">
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
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>

        <!--		Start Pagination -->
        <div class='pagination-container' >
            <nav>
                <ul class="pagination">

                    <li data-page="prev" >
                        <span> < <span class="sr-only">(current)</span></span>
                    </li>
                    <!--	Here the JS Function Will Add the Rows -->
                    <li data-page="next" id="prev">
                        <span> > <span class="sr-only">(current)</span></span>
                    </li>
                </ul>
            </nav>
        </div>

    </div> <!-- 		End of Container -->

</sec:authorize>
</body>


<style>
    <%@include file ="../css/js/pagination.js"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file="../css/button.css"%>
</style>
</html>
