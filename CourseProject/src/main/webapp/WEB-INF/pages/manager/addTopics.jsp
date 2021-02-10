<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Добавить топики</title>
</head>

<html>
<body>

<div class="main">
    <div class="container">
        <div class="signup-content">
            <div>
                <img src="../css/images/signup-img.jpg" alt="">
            </div>
            <div class="signup-form">
                <form:form method="POST" class="register-form" id="register-form" action="/saveTopicManager" modelAttribute="topicAdd" >
                    <h2>Add new topic</h2>
                    <form:hidden path="id"/>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Name of texts:</label>
                            <form:input type="text" path="text"/>

                        </div>

                        <div class="form-group">
                            <label >Rules:</label>
                            <form:input type="text" path="rules"/>
                        </div>
                    </div>
                    <form:hidden path="course_topic"/>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Please select language of course :</label>
                            <div class="form-select">
                                <form:select path="course_topic.language">
                                    <option value=""></option>
                                    <option value="English">English</option>
                                    <option value="French">French</option>
                                    <option value="Turkish">Turkish</option>
                                    <option value="Russian"> Russian</option>
                                </form:select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Please select level of course :</label>
                            <div class="form-select">
                                <form:select path="course_topic.level">
                                    <option value=""></option>
                                    <option value="Start">Start</option>
                                    <option value="Elementary">Elementary</option>
                                    <option value="Advanced">Advanced</option>
                                    <option value="Interdemiade">Interdemiade</option>
                                    ${topicLL}
                                </form:select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-submit">
                        <input type="submit" value="Submit Form" class="submit" name="submit" id="submit" />
                    </div>
                </form:form>

                <div class="form-submit">
                    <form action="/menuManager">
                        <input type="submit" value="Back" class="submit" style="background-color: #ff6801"/>
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
