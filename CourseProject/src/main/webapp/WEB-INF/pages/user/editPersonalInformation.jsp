<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="ePA"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="login-box">
        <h2><spring:message code="ePA"/></h2>
        <form:form  method="POST" action="/saveAdmins" modelAttribute="userEdit">

            <form:hidden path="id"/>

            <label class="label-color"><spring:message code="nM"/></label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label class="label-color"><spring:message code="sN"/></label>
            <div class=" user-box">
                <form:input path="surname"/>
            </div>

            <form:hidden path="username"/>
            <form:hidden path="password"/>
            <p>
            <button  style="background-color: #141e30">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="save"/>
            </button>
            </p>
            <p>
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="bK"/>
            </a>  </p>
        </form:form>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')">
    <div class="login-box">
        <h2><spring:message code="ePA"/> </h2>
        <form:form  method="POST" action="/saveUsers" modelAttribute="userEdit">

            <form:hidden path="id"/>
            <label class="label-color"><spring:message code="nM"/></label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label class="label-color"><spring:message code="sN"/></label>
            <div class=" user-box">
                <form:input path="surname"/>
            </div>

            <form:hidden path="username"/>
            <form:hidden path="password"/>
            <p>
            <button  style="background-color: #141e30">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="save"/>
            </button>
            </p>
            <p>
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="bK"/>
            </a>  </p>
        </form:form>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_MANAGER')">
    <div class="login-box">
        <h2><spring:message code="ePA"/></h2>
        <form:form  method="POST" action="/saveManagers" modelAttribute="userEdit">

            <form:hidden path="id"/>

            <label class="label-color"><spring:message code="nM"/></label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label class="label-color"><spring:message code="sN"/></label>
            <div class=" user-box">
                <form:input path="surname"/>
            </div>
            <form:hidden path="username"/>
            <form:hidden path="password"/>
            <p>
            <button  style="background-color: #141e30">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="save"/>
            </button>
            </p>
            <p>
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="bK"/>
            </a>  </p>
        </form:form>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_TEACHER')">
    <div class="login-box">
        <h2><spring:message code="ePA"/></h2>
        <form:form  method="POST" action="/saveTeacherInfo" modelAttribute="userEdit">

            <form:hidden path="id"/>
            <label class="label-color"><spring:message code="nM"/></label>
            <div class="user-box">
                <form:input path="name"/>
            </div>

            <label class="label-color"><spring:message code="sN"/></label>
            <div class=" user-box">
                <form:input path="surname"/>
            </div>

            <form:hidden path="username"/>
            <form:hidden path="password"/>
            <p>
            <button  style="background-color: #141e30">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="save"/>
            </button>
            </p>
            <p>
            <a href="/personalInformationUser">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <spring:message code="bK"/>
            </a>  </p>
        </form:form>
    </div>
</sec:authorize>


</body>
<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/edit.css"%>
</style>
</html>