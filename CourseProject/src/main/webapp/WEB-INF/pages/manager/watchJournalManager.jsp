<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wJM"/></title>
</head>
<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<html>
<body>
<sec:authorize access="hasRole('ROLE_MANAGER')">

    <div class="container">
        <table>
            <thead>
            <tr>
                <th><spring:message code="jJJ"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="sOS"/></th>
                <th><spring:message code="aG"/></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Egor</td>
                <td>10</td>
            </tr>
            <tr>

                <td>Aleksey</td>
                <td>9</td>
            </tr>
            </tbody>
        </table>

        <div class="svg">
            <a class="button" href="/editJournalManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"><spring:message code="eJM"/></span>
            </a>
            <a class="button" href="/menuManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"><spring:message code="mAM"/></span>
            </a>
        </div>
    </div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_TEACHER')">
    <div class="container">
        <table>
            <thead>
            <tr>
                <th><spring:message code="jJJ"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="sOS"/></th>
                <th><spring:message code="aG"/></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Egor</td>
                <td>10</td>
            </tr>
            <tr>

                <td>Aleksey</td>
                <td>9</td>
            </tr>
            </tbody>
        </table>

        <div class="svg">
            <a class="button" href="/editJournal">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"><spring:message code="eJM"/></span>
            </a>
            <a class="button" href="/personalInformationUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="bK"/></span>
            </a>
        </div>
    </div>

</sec:authorize>

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
