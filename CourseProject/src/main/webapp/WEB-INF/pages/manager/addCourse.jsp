<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="addCours"/></title>
</head>

<html>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<spring:message code="save" var="save"/>
<spring:message code="bK" var="back"/>
<div class="main">
    <div class="container">
        <div class="signup-content">
            <div>
                <img src="../css/images/signup-img.jpg" alt="">
            </div>
            <div class="signup-form">
                <form:form method="POST" class="register-form" id="register-form" action="/saveCourseAddManager" modelAttribute="courseAdd">
                    <h2><spring:message code="enterDatas"/></h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="dOTC"/></label>
                            <form:input type="text" path="duration"/>
                        </div>
                        <div class="form-group">
                            <label><spring:message code="dOC"/></label>
                            <form:input type="text" path="start_date" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label ><spring:message code="oTDW"/></label>
                        <form:input type="text" path="days" />
                    </div>
                    <div class="form-group">
                        <label><spring:message code="p"/></label>
                        <form:input path="price"/>
                    </div>
                    <div class="form-group">
                        <label><spring:message code="oTGW"/>:</label>
                        <form:input type="text" path="time"/>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="select"/>:</label>
                            <div class="form-select">
                                <form:select path="language">
                                    <option value=""></option>
                                    <option value="English"><spring:message code="enC"/></option>
                                    <option value="French"><spring:message code="frC"/></option>
                                    <option value="Turkish"><spring:message code="trC"/></option>
                                    <option value="Russian"> <spring:message code="ruC"/></option>
                                </form:select>
                                <form:errors path="language"></form:errors>
                            ${courseLanguageError}
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label><spring:message code="select"/></label>
                            <div class="form-select">
                                <form:select path="level">
                                    <option value="Start">Start</option>
                                    <option value="Elementary">Elementary</option>
                                    <option value="Advanced">Advanced</option>
                                    <option value="Interdemiade">Interdemiade</option>
                                </form:select>
                                <form:errors path="level"></form:errors>
                                    ${courseLevelError}
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-submit">
                        <input type="submit" value="${save}" class="submit" name="submit" id="submit" />
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
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/owl.carousel.css"%>
    <%@include file ="../css/material-design-iconic-font.min.css"%>
    <%@include file ="../css/js/jquery-3.3.1.min.js"%>
    <%@include file ="../css/js/custom.js"%>
    <%@include file ="../css/button.css"%>

</style>
</html>
