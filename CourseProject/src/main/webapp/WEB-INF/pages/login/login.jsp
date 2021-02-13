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
<spring:message code="eL" var="eLl"/>
<spring:message code="eP" var="ePp"/>

<div class="limiter">

    <div class="container-login100">

        <div class="wrap-login100">

            <div class="login100-form-title">
					<span class="login100-form-title-1">
						<spring:message code="eT"/>
					</span>
            </div>

            <form class="login100-form validate-form" method="POST" action="/login">
                <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                    <span class="label-input100"><spring:message code="lN"/></span>
                    <input class="input100" type="text" name="username" placeholder="${eLl}" autofocus="true">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100"><spring:message code="pW"/></span>
                    <input class="input100"  name="password"  type="password" placeholder="${ePp}">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        <spring:message code="lN"/>
                    </button>
                </div>

                <div class="container-login101-form-btn"  >
                    <a href="/registration" class="login101-form-btn" >
                        <spring:message code="registrationT"/>

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
    <%@include file ="../css/util.css"%>
</style>
</html>
