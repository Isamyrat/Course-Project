<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="aJG"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="/addJournalGroup/${userId}/${groupNumber}?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="/addJournalGroup/${userId}/${groupNumber}?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>

<spring:message code="save" var="save"/>
<spring:message code="bK" var="back"/>

<div class="main">
    <div class="container">
        <div class="signup-content">
            <div class="signup-form">
                <form:form method="Post" class="register-form" id="register-form" action="/saveJournalGroupManager"
                           modelAttribute="journalGroup">
                    <h2><spring:message code="enterDatas"/></h2>

                    <form:hidden path="id"/>

                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="aJGA"/></label>
                            <div class="form-select">
                                <form:select path="absent">
                                    <option value=""></option>
                                    <option value="yes">yes</option>
                                    <option value="no">no</option>
                                </form:select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>

                    <form:hidden path="date"/>

                    <div class="form-row">
                        <div class="form-group">
                            <label><spring:message code="aJGP"/></label>
                            <div class="form-select">
                                <form:select path="point">
                                    <option value=""></option>
                                    <option value="10">10</option>
                                    <option value="9">9</option>
                                    <option value="8">8</option>
                                    <option value="7">7</option>
                                    <option value="6">6</option>
                                    <option value="5">5</option>
                                    <option value="4">4</option>
                                    <option value="3">3</option>
                                    <option value="2">2</option>
                                    <option value="1">1</option>
                                </form:select>
                                <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </div>



                    <form:hidden path="journal_user"/>
                    <form:hidden path="group_journals"/>
                    <input type="hidden" name="userId" value="${userId}"/>
                    <input type="hidden" name="groupNumber" value="${groupNumber}"/>

                    <div class="form-submit">
                        <input type="submit" value="${save}" class="submit" name="submit" id="submit"/>
                    </div>

                </form:form>
                <div class="form-submit">
                    <form action="/personalInformationUser">
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
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/owl.carousel.css"%>
    <%@include file ="../css/material-design-iconic-font.min.css"%>
    <%@include file ="../css/js/jquery-3.3.1.min.js"%>
    <%@include file ="../css/js/custom.js"%>

</style>
</html>

