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
<sec:authorize access="hasRole('ROLE_USER')">
<div class="container">
    <table>
        <form:form modelAttribute="userGroup">
        <thead>
        <tr>
            <th>В данном курсе вы проходите обучение</th>
        </tr>
        <thead>
        <tr>
            <th>Number of group</th>
            <th>Surname of Teacher</th>
            <th>Language of group</th>
            <th>Level of group</th>
            <th>Date of start</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>${userGroup.number_group}</td>
            <td>${userGroup.user_teacher.surname}</td>
            <td>${userGroup.course_group.language}</td>
            <td>${userGroup.course_group.level}</td>
            <td>${userGroup.course_group.start_date}</td>
        </tr>

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
</sec:authorize>

<sec:authorize access="hasRole('ROLE_TEACHER')">
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
                    <th>Action </th>
                </tr>
                </thead>

                <tbody>
                <c:url var="watchUsers" value="/watchGroupUsers">
                    <c:param name="idGroup" value="${userGroup.id}"/>
                </c:url>
                <tr>
                    <td>${userGroup.number_group}</td>
                    <td>${userGroup.course_group.language}</td>
                    <td>${userGroup.course_group.level}</td>
                    <td>${userGroup.course_group.start_date}</td>
                    <td><form>
                        <a href="${watchUsers}"  type="submit" style="color: white;font-size: 10pt" >
                            Students of this group</a>
                    </form></td>
                </tr>

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
</sec:authorize>

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
