<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>

<div class="limiter">

    <div class="container-login100">

        <div class="wrap-login100">

            <div class="login100-form-title">
					<span class="login100-form-title-1">
                        Log in</span>
            </div>

            <form class="login100-form validate-form" method="POST" action="/login">
                <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                    <span class="label-input100">Login</span>
                    <input class="input100" type="text" name="username" placeholder="Please enter your login:" autofocus="true">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100"  name="password"  type="password" placeholder="Please enter your password:">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Login</button>
                </div>

                <div class="container-login101-form-btn"  >
                    <a href="/registration" class="login101-form-btn" >
                        Registration
                    </a>
                </div>
                <div class="container-login100-form-btn">
                    <sec:authorize access="isAuthenticated()">
                        <h4><a href="/logout">Выйти</a></h4>
                    </sec:authorize>
                </div>

            </form>
        </div>

    </div>
</div>


</body>


<style>
    <%@include file ="../css/main.css"%>
</style>
</html>
