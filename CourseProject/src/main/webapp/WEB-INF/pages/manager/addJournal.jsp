<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="addJournal"/></title>
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
            <div>
                <img src="../css/images/signup-img.jpg" alt="">
            </div>
            <div class="signup-form">
                <form method="GET" class="register-form" id="register-form" action="/saveCourseManager">
                    <h2><spring:message code="enterDatas"/></h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name"><spring:message code="upsent"/></label>
                            <input type="text" name="name" id="name" required/>
                        </div>
                        <div class="form-group">
                            <label for="father_name"><spring:message code="date"/></label>
                            <input type="text" name="father_name" id="father_name" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Days"><spring:message code="point"/></label>
                        <input type="text" name="Days" id="Days" required/>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="city"><spring:message code="select"/></label>
                            <div class="form-select">
                                <select name="city" id="city">
                                    <option value="">873304</option>
                                    <option value="">874304</option>
                                    <option value="">874404</option>
                                    <option value="">872304</option>
                                </select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-submit">
                        <input type="submit" value="${save}" class="submit" name="submit" id="submit">
                    </div>
                </form>

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
