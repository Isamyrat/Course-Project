<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> <spring:message code="addData"/></title>
</head>

<html>
<header>
    <div style="float: right">
        <a href="/userAddressWatch${addressId}?lang=en"><spring:message code="app.en"/></a>
        <a href="/userAddressWatch${addressId}?lang=ru"><spring:message code="app.en"/></a>
    </div>
</header>

<body>
<div class="container">

    <table>
        <form:form modelAttribute="address">
            <thead>
            <tr>
                <th><h1><spring:message code="addresUser"/></h1></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="countryAddress"/></th>
                <th> <spring:message code="cityAddress"/></th>
                <th> <spring:message code="districtAddre"/></th>
                <th> <spring:message code="streetAddtess"/></th>
                <th> <spring:message code="houAddress"/></th>
                <th> <spring:message code="apartmentAddress"/></th>
                <th> <spring:message code="aG"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${address}" var="add">

              <%--  <c:url var="editAddress" value="/editAddressUser">
                    <c:param name="addressId" value="${add.id}"/>
                </c:url>--%>

                <tr>
                    <td>${add.country}</td>
                    <td>${add.city}</td>
                    <td>${add.district}</td>
                    <td>${add.street}</td>
                    <td>${add.house}</td>
                    <td>${add.apartment}</td>

                    <td>
                        <form>
                            <a href="/editAddressUser${add.id}" type="submit"
                               style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid; "> <spring:message code="editAddress"/></a>
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
            <span style="font-size: 10pt"> <spring:message code="bK"/></span>
        </a>
    </div>
</div>

</body>


<style>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>
