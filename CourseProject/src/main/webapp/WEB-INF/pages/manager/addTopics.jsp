<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="addTopic"/></title>
</head>

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
                <form:form method="POST" class="register-form" id="register-form" action="/saveTopicManager" modelAttribute="topicAdd" >
                    <h2><spring:message code="enterDatas"/></h2>

                    <form:hidden path="id"/>

                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="addText"/></label>
                            <form:input type="text" path="text"/>
                        </div>

                        <div class="form-group">
                            <label ><spring:message code="addRules"/></label>
                            <form:input type="text" path="rules"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="select"/></label>
                            <div class="form-select">
                                <form:select path="courseTopic">
                                    <option value=""></option>
                                    <c:forEach items="${courses}" var="course">
                                        <option value="${course.id}">${course.level} - ${course.language}</option>
                                    </c:forEach>
                                </form:select>
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
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/owl.carousel.css"%>
    <%@include file ="../css/js/jquery-3.3.1.min.js"%>
    <%@include file ="../css/js/custom.js"%>
    <%@include file ="../css/internationalize.css"%>
</style>
</html>
