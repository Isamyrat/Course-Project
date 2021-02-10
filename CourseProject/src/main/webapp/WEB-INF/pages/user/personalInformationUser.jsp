<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Личные данные</title>
</head>

<html>
<body>

<table class="container">
    <form:form modelAttribute="person">
        <thead>
        <tr>
            <th><h1>Личные данные</h1></th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th>Age</th>
            <th>Gender</th>
            <th>Number of your phone</th>
        </tr>
        </thead>
        <tbody>

        <c:url var="editPerson" value="/editPersonalInformationUser">
            <c:param name="personId" value="${person.id}"/>
        </c:url>

        <tr>
            <td>${person.age}</td>
            <td>${person.gender}</td>
            <td>${person.number}</td>
            <td>
                <form>
                    <a href="${editPerson}"  type="submit" style="background-color: #576a91; color: white; border: 1px #f5f4f4 solid; font-size: 10pt">Edit data</a>
                </form>
            </td>

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

</body>


<style>
    <%@include file ="../css/personalInformation.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>
