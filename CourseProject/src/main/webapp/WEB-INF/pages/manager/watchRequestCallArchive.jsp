<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wCallArhiv"/></title>
</head>

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
    </div>
</header>

<body>
<spring:message code="askRC" var="askRC"/>

<div class="container">
    <table>
        <thead>
        <tr>
            <th><spring:message code="tCall"/></th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th><spring:message code="idT"/></th>
            <th><spring:message code="dR"/></th>
            <th><spring:message code="dCall"/></th>
            <th><spring:message code="nMU"/></th>
            <th><spring:message code="sNUS"/></th>
            <th><spring:message code="laOG"/></th>
            <th><spring:message code="lOG"/></th>
            <th><spring:message code="aG"/></th>

        </tr>
        </thead>
        <c:if test="${watchRequestCallArchive.size()>0}">
            <c:forEach items="${watchRequestCallArchive}" var="archive">
                        <tr>
                            <td>${archive.id}</td>
                            <c:if test="${archive.status == 'Wait'}">
                                <td>${wait}</td>
                            </c:if>
                            <c:if test="${archive.status == 'Approved'}">
                                <td>${approved}</td>
                            </c:if>
                            <c:if test="${archive.status == 'Denied'}">
                                <td>${denied}</td>
                            </c:if>
                            <td>${archive.callBackDate}</td>
                            <td>${archive.userCallBack.name}</td>
                            <td>${archive.userCallBack.surname}</td>
                            <c:if test="${archive.courseCallBack.language == 'English'}">
                                <td>${english}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.language == 'French'}">
                                <td>${french}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.language == 'Russian'}">
                                <td>${russian}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.language == 'Turkish'}">
                                <td>${turkish}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.level == 'Start'}">
                                <td>${start}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.level == 'Elementary'}">
                                <td>${elementary}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.level == 'Pre-Intermediate'}">
                                <td>${pre_Intermediate}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.level == 'Intermediate'}">
                                <td>${intermediate}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.level == 'Upper_Intermediate'}">
                                <td>${upper_Intermediate}</td>
                            </c:if>
                            <c:if test="${archive.courseCallBack.level == 'Advanced'}">
                                <td>${advanced}</td>
                            </c:if>
                            <td>
                                <form action="${pageContext.request.contextPath}/deleteCallBack" method="post">
                                    <input type="hidden" name="callBackId" value="${archive.id}"/>
                                    <input type="hidden" name="action" value="delete"/>
                                    <button type="submit" onclick="if(!(confirm('${askRC}'))) return false"
                                            style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px">
                                        <spring:message code="del"/></button>
                                </form>
                            </td>
                        </tr>
            </c:forEach>
        </c:if>
    </table>
    <c:if test="${watchRequestCallArchive.size() > 0}">
        <div>
            <ul class="hr">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li>
                        <a href="/watchRequestCallArchive?page=${page}&size=${7}">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
</div>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>