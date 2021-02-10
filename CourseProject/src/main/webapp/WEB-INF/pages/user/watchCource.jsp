<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть все курсы</title>
</head>

<html>
<body>

<div class="container">
    <table>
        <form:form modelAttribute="allCourses">
            <thead>
            <tr>
                <th>Watch all course</th>
            </tr>
            </thead>
            <c:if test="${allCourses.size()>0}">
                <thead>
                <tr>
                    <th>Language</th>
                    <th>Level</th>
                    <th>Date of start</th>
                    <th>Duration od this course</th>
                    <th>On this days were courses</th>
                    <th>On this times were courses</th>
                    <th>Price</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${allCourses} " var="cours">
                    <tr>
                        <td>${cours.time}</td>
                        <td>${cours.language}</td>
                        <td>${cours.level}</td>
                        <td>${cours.start_date}</td>
                        <td>${cours.duration}</td>
                        <td>${cours.days}</td>
                        <td>${cours.price}</td>
                        <td>
                            <div class="svg">
                                <a class="button" href="/topic">
                                    <svg>
                                        <rect height="40" width="130" fill="transparent"/>
                                    </svg>
                                    <span style="font-size: 10pt">топик данного курса</span>
                                </a>
                            </div>
                            <div class="svg">
                                <a class="button" href="/addToCourse">
                                    <svg>
                                        <rect height="40" width="130" fill="transparent"/>
                                    </svg>
                                    <span style="font-size: 10pt">Записаться в эти курсы</span>
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${allCourses.size()<1}">
                <td>Empty</td>
            </c:if>
        </form:form>
    </table>
    <div class="svg">
        <a class="button" href="/personalInformationUser">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 10pt">Back</span>
        </a>
    </div>

</div>

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/data.css"%>
</style>
</html>
