<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <form method="GET" class="register-form" id="register-form" action="/saveGroupManager">
                    <h2>Add new group</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Number of group :</label>
                            <input type="text" name="name" id="name" required/>
                        </div>
                        <div class="form-group">
                            <label for="name">Number of id student :</label>
                            <input type="text" name="name" id="student" required/>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="state">Please select teacher of gruop :</label>
                            <div class="form-select">
                                <select name="state" id="state">
                                    <option value=""></option>
                                    <option value="uk">Anna-Maria</option>
                                    <option value="uk">Anton Pavlov</option>
                                </select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-submit">
                        <input type="submit" value="Submit Form" class="submit" name="submit" id="submit" />
                    </div>

                </form>
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

