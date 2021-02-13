<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть курсы</title>
</head>

<html>
<body>
<sec:authorize access="hasRole('ROLE_USER')">

    <div class="container">
        <table>
            <form:form modelAttribute="allCoursesUser">
                <thead>
                <tr>
                    <th>Watch all course</th>
                </tr>
                </thead>
                <c:if test="${allCoursesUser.size()>0}">
                    <thead>
                    <tr>
                        <th>Language</th>
                        <th>Level</th>
                        <th>Date of start</th>
                        <th>Duration od this course</th>
                        <th>On this days were courses</th>
                        <th>On this times were courses</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allCoursesUser}" var="courses">
                        <c:url var="watchTopic" value="/watchTopics">
                            <c:param name="topicId" value="${courses.id}"/>
                        </c:url>


                        <tr>
                            <td>${courses.time}</td>
                            <td>${courses.language}</td>
                            <td>${courses.level}</td>
                            <td>${courses.start_date}</td>
                            <td>${courses.duration}</td>
                            <td>${courses.days}</td>
                            <td>${courses.price}</td>
                            <td>
                                <form >
                                    <a href="${watchTopic}"  type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">
                                        топик
                                        данного курса</a>
                                </form>
                                    <p>
                                <form action="${pageContext.request.contextPath}/addToCourse" method="post">
                                    <input type="hidden" name="course" value="${courses.id}"/>
                                    <button  type="submit" style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">Add to this course</button>
                                </form>
                                </p>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${allCoursesUser.size()<1}">
                    <td>Empty</td>
                </c:if>
            </form:form>
        </table>
        <div class="svg">
            <a class="button" href="/personalInformationUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Меню</span>
            </a>
            <a class="button" href="/watchRequestCallUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Посмотреть на какие курсы я отправил заявку</span>
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
                    <th>Watch all course</th>
                </tr>
                </thead>
                <c:if test="${allCoursesUser.size()>0}">
                    <thead>
                    <tr>
                        <th>Language</th>
                        <th>Level</th>
                        <th>Date of start</th>
                        <th>Duration od this course</th>
                        <th>On this days were courses</th>
                        <th>On this times were courses</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allCoursesUser}" var="courses">

                        <c:url var="updateLink" value="/editCourseManager">
                            <c:param name="course" value="${courses.id}"/>
                        </c:url>

                        <c:url var="watchTopic" value="/watchTopics">
                            <c:param name="topicId" value="${courses.id}"/>
                        </c:url>
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
                                    <a href="${watchTopic}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">топик
                                        данного курса</a>
                                </form>
                                <p>
                                <form >

                                <a href="${updateLink}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">
                                Edit this course</a>
                                </form>
                                </p>

                                <form action="${pageContext.request.contextPath}/deleteCourseManager" method="post">
                                    <input type="hidden" name="idCourse" value="${courses.id}"/>
                                    <input type="hidden" name="action" value="delete"/>
                                    <button type="submit" style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
                <c:if test="${allCoursesUser.size()<1}">
                    <td>Empty</td>
                </c:if>
            </form:form>
        </table>
        <div class="svg">
            <a class="button" href="/menuManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Меню</span>
            </a>
        </div>

    </div>
</sec:authorize>
</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
