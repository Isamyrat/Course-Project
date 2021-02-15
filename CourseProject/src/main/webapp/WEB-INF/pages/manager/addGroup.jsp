<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="addGroup"/></title>
</head>

<html>

<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>

<spring:message code="save" var="save"/>
<spring:message code="bK" var="back"/>
<div class="main">
    <div class="container">
        <div class="signup-content">
            <div class="signup-form">
                <form:form method="Post" class="register-form" id="register-form" action="/saveGroupManager"
                           modelAttribute="group">
                    <h2><spring:message code="enterDatas"/></h2>
                    <form:hidden path="id"/>
                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="nOG"/></label>
                            <form:input type="text" path="number_group"/>
                        </div>
                    </div>
                    <form:hidden path="userGroup"/>
                    <form:hidden path="status"/>

                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="select"/></label>
                            <div class="form-select">
                                <form:select path="user_teacher">
                                    <c:forEach items="${users}" var="user">
                                        <option value=""></option>
                                        <option value="${user.id}">${user.surname}</option>
                                    </c:forEach>
                                </form:select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>


                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="select"/></label>
                            <div class="form-select">
                                <form:select path="course_group">
                                    <c:forEach items="${courses}" var="course">
                                        <option value=""></option>
                                        <option value="${course.id}">${course.level} - ${course.language}</option>
                                    </c:forEach>
                                </form:select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-submit">
                        <input type="submit" value="${save}" class="submit" name="submit" id="submit"/>
                    </div>

                </form:form>
                <div class="form-submit">
                    <form action="/menuManager">
                        <input type="submit" value="${back}" class="submit" style="background-color: #ff6801"/>
                    </form>
                </div>
            </div>
        </div>

    </div>

</div>


</body>

<style>
    <%@include file ="../css/owl.carousel.css"%>
    <%@include file ="../css/material-design-iconic-font.min.css"%>
    <%@include file ="../css/js/jquery-3.3.1.min.js"%>
    <%@include file ="../css/js/custom.js"%>

</style>
</html>

