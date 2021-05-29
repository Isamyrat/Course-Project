<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="wCall"/></title>
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
            <thead>
            <tr>
                <th><spring:message code="tCall"/></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><spring:message code="dR"/></th>
                <th><spring:message code="dCall"/></th>
                <th><spring:message code="laOG"/></th>
                <th><spring:message code="lOG"/></th>
                <c:if test="${person.role == 'ROLE_MANAGER'}">
                        <th><spring:message code="nMU"/></th>
                        <th><spring:message code="sNUS"/></th>
                    <th><spring:message code="aG"/></th>
                </c:if>
            </tr>
            </thead>
            <c:if test="${callBackManager.size()>0}">
                <c:forEach items="${callBackManager}" var="manager">
                    <tr>
                        <c:if test="${manager.status == 'Wait'}">
                            <td>${wait}</td>
                        </c:if>
                        <c:if test="${person.role == 'ROLE_USER'}">
                            <c:if test="${manager.status == 'Approved'}">
                                <td>${approved}</td>
                            </c:if>
                            <c:if test="${manager.status == 'Denied'}">
                                <td>${denied}</td>
                            </c:if>
                        </c:if>
                        <td>${manager.callBackDate}</td>
                        <c:if test="${manager.courseCallBack.language == 'English'}">
                            <td>${english}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.language == 'French'}">
                            <td>${french}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.language == 'Russian'}">
                            <td>${russian}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.language == 'Turkish'}">
                            <td>${turkish}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.level == 'Start'}">
                            <td>${start}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.level == 'Elementary'}">
                            <td>${elementary}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.level == 'Pre-Intermediate'}">
                            <td>${pre_Intermediate}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.level == 'Intermediate'}">
                            <td>${intermediate}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.level == 'Upper_Intermediate'}">
                            <td>${upper_Intermediate}</td>
                        </c:if>
                        <c:if test="${manager.courseCallBack.level == 'Advanced'}">
                            <td>${advanced}</td>
                        </c:if>
                        <c:if test="${person.role == 'ROLE_MANAGER'}">
                            <td>${manager.userCallBack.name}</td>
                            <td>${manager.userCallBack.surname}</td>
                            <td>
                                <form>
                                    <a href="/editCallBack${manager.id}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                        <spring:message code="editStatus"/>
                                    </a>
                                </form>
                            </td>
                        </c:if>

                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${callBackManager.size()<1}">
                <td><spring:message code="eC"/></td>
            </c:if>
        </table>
        <c:if test="${person.role == 'ROLE_MANAGER'}">
            <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
                <c:if test="${pageNumber>0}">
                    <a href="/watchRequestCall/${pageNumber-1}/${7}" class="arrow left"
                       style="float: left; padding-left: 100px;  font-size: 60px"><</a>
                </c:if>
                <c:if test="${callBackManager.size()>pageNumber}">
                    <a href="/watchRequestCall/${pageNumber+1}/${7}" class="arrow right"
                       style="float: left; padding-left: 160px; font-size: 60px"> > </a>
                </c:if>
            </form>
            <a href="/watchRequestCallArchive/${0}/${7}" class="big-button"><spring:message code="wCallArhiv"/></a>

            <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
        </c:if>
        <c:if test="${person.role == 'ROLE_USER'}">
            <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
                <c:if test="${pageNumber>0}">
                    <a href="/watchRequestCallUser/${pageNumber-1}/${7}" class="arrow left"
                       style="float: left; padding-left: 100px;  font-size: 60px"><</a>
                </c:if>
                <c:if test="${callBackManager.size()>pageNumber}">
                    <a href="/watchRequestCallUser/${pageNumber+1}/${7}" class="arrow right"
                       style="float: left; padding-left: 160px; font-size: 60px"> > </a>
                </c:if>
            </form>
            <a href="/watchAllCoursesManager/${0}/${3}" class="big-button"><spring:message code="bK"/></a>
        </c:if>

    </div>
</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>