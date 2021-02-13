<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<div class="container">


    <span><spring:message code="app.title"/>:</span>

    <a href="/userAddressWatch${addressId}?lang=en"><spring:message code="app.en"/></a>
    <a href="/userAddressWatch${addressId}?lang=ru"><spring:message code="app.en"/></a>

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
                <th>Город</th>
                <th>Район</th>
                <th>Улицы</th>
                <th>Дом</th>
                <th>Квартира</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${address}" var="add">

                <c:url var="watchAddress" value="/userAddressWatch">
                    <c:param name="addressId" value="${addresId}"/>
                </c:url>

                <c:url var="editAddress" value="/editAddressUser">
                    <c:param name="addressId" value="${add.id}"/>
                </c:url>

                <tr>
                    <td>${add.country}</td>
                    <td>${add.city}</td>
                    <td>${add.district}</td>
                    <td>${add.street}</td>
                    <td>${add.house}</td>
                    <td>${add.apartment}</td>

                    <td>
                        <form>
                            <a href="${editAddress}" type="submit"
                               style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid; ">Edit
                                address date</a>
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
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>
