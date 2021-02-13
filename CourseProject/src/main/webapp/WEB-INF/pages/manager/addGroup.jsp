<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Добавить группу</title>
</head>

<html>
<body>


<div class="main">
    <div class="container">
        <div class="signup-content">
            <div class="signup-form">
                <form:form method="Post" class="register-form" id="register-form" action="/saveGroupManager"
                           modelAttribute="group">
                    <h2>Add new group</h2>
                    <form:hidden path="id"/>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Number of group :</label>
                            <form:input type="text" path="number_group"/>
                        </div>
                    </div>
                    <form:hidden path="userGroup"/>
                    <form:hidden path="status"/>


                    <div class="form-row">
                        <div class="form-group">
                            <label>Please select teacher of group :</label>
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
                            <label>Please select teacher of gruop :</label>
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
                        <input type="submit" value="Submit Form" class="submit" name="submit" id="submit"/>
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

