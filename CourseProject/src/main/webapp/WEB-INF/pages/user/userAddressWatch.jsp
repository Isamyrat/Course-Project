<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="addData"/></title>
</head>

<html>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <a href="/userAddressWatch${addressId}?lang=en" class="big-button"><spring:message code="app.en"/></a>
        <a href="/userAddressWatch${addressId}?lang=ru" class="big-button"><spring:message code="app.en"/></a>
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
                <th><spring:message code="cityAddress"/></th>
                <th><spring:message code="districtAddre"/></th>
                <th><spring:message code="streetAddtess"/></th>
                <th><spring:message code="houAddress"/></th>
                <th><spring:message code="apartmentAddress"/></th>
                <th><spring:message code="aG"/></th>
            </tr>
            </thead>
            <c:if test="${address.size()>0}">

                <tbody>
                <c:forEach items="${address}" var="add">

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
                                   style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid; ">
                                    <spring:message code="editAddress"/></a>
                            </form>
                        </td>

                    </tr>

                </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${address.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
        </form:form>
    </table>
    <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>

</div>

</body>


<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>
