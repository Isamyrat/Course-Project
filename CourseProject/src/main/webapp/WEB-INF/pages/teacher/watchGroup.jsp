<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть </title>
</head>

<html>
<body>

<div class="container">
    <table>
        <form:form modelAttribute="userGroup">
            <thead>
            <tr>
                <th>В данном курсе вы обучаете</th>
            </tr>
            <thead>
            <tr>
                <th>Number of group</th>
                <th>Language of group</th>
                <th>Level of group</th>
                <th>Date of start</th>
                <th>Action</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${userGroup}" var="teacher">
                <c:url var="watchUsers" value="/watchGroupUsers">
                    <c:param name="idGroup" value="${teacher.id}"/>
                </c:url>
            <tr>
                <td>${teacher.number_group}</td>
                <td>${teacher.course_group.language}</td>
                <td>${teacher.course_group.level}</td>
                <td>${teacher.course_group.start_date}</td>
                <td>
                    <form>
                        <a href="${watchUsers}" type="submit"
                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">
                            Students of this group</a>
                    </form>
                </td>
            </tr>
            </c:forEach>
            </tbody>
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
    <%@include file ="../css/dop.css"%>
</style>
</html>
