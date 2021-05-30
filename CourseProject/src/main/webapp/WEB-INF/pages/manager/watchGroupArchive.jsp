<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wAG"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<div class="container">
    <table>
        <form:form modelAttribute="watchGroupArchive">
            <thead>
            <tr>
                <th><spring:message code="tiTle"/></th>
            </tr>
            </thead>

            <thead>
            <tr>
                <th><spring:message code="nOG"/></th>
                <th><spring:message code="tOG"/></th>
                <th><spring:message code="lOG"/></th>
                <th><spring:message code="laOG"/></th>
                <th><spring:message code="aG"/></th>
                <th><spring:message code="aG"/></th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${watchGroupArchive.size()>0}">
                <c:forEach items="${watchGroupArchive}" var="groups">

                    <tr>
                        <td>${groups.numberGroup}</td>
                        <td>${groups.userTeacher.surname}</td>
                        <c:if test="${groups.courseGroup.language == 'English'}">
                            <td>${english}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.language == 'French'}">
                            <td>${french}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.language == 'Russian'}">
                            <td>${russian}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.language == 'Turkish'}">
                            <td>${turkish}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.level == 'Start'}">
                            <td>${start}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.level == 'Elementary'}">
                            <td>${elementary}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.level == 'Pre-Intermediate'}">
                            <td>${pre_Intermediate}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.level == 'Intermediate'}">
                            <td>${intermediate}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.level == 'Upper_Intermediate'}">
                            <td>${upper_Intermediate}</td>
                        </c:if>
                        <c:if test="${groups.courseGroup.level == 'Advanced'}">
                            <td>${advanced}</td>
                        </c:if>
                        <td>
                            <form>
                                <a href="/watchGroupUsers${groups.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                    <spring:message code="titleStud"/></a>
                            </form>
                        </td>
                        <td>
                            <form>
                                <a href="/editGroupStatus${groups.numberGroup}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                    <spring:message code="eG"/></a>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

            </c:if>
            <c:if test="${watchGroupArchive.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
            </tbody>
        </form:form>
    </table>
    <c:if test="${watchGroupArchive.size() > 0}">
        <div>
            <ul class="hr">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li>
                        <a href="/watchGroupArchive?page=${page}&size=${3}">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <a href="/menuManager" class="big-button"><spring:message code="bK"/></a>
</div>

</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
