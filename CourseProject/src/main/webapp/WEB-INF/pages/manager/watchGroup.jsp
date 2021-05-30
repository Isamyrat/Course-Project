<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="titleGroup"/></title>
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
        <form:form modelAttribute="watchGroups">
            <thead>
            <tr>
                <c:if test="${person.role == 'ROLE_MANAGER'}">
                    <th><spring:message code="tiTle"/></th>
                </c:if>
                <c:if test="${person.role == 'ROLE_USER'}">
                    <th><spring:message code="uGroup"/></th>
                </c:if>
                <c:if test="${person.role == 'ROLE_TEACHER'}">
                    <th><spring:message code="tGroup"/></th>
                </c:if>
            </tr>
            </thead>
            <c:if test="${watchGroups.size()>0}">
                <thead>
                <tr>
                    <th><spring:message code="nOG"/></th>
                    <th><spring:message code="lOG"/></th>
                    <th><spring:message code="laOG"/></th>
                    <c:if test="${person.role == 'ROLE_USER'}">
                        <th><spring:message code="tOG"/></th>
                        <th><spring:message code="aCJ"/></th>
                    </c:if>
                    <c:if test="${person.role == 'ROLE_MANAGER'}">
                        <th><spring:message code="tOG"/></th>
                        <th><spring:message code="aG"/></th>
                        <th><spring:message code="aG"/></th>
                        <th><spring:message code="aG"/></th>
                        <th><spring:message code="aG"/></th>
                    </c:if>
                    <c:if test="${person.role == 'ROLE_TEACHER'}">
                        <th><spring:message code="aG"/></th>
                    </c:if>

                </tr>
                </thead>
                <tbody>
                <c:if test="${watchGroups.size()>0}">

                    <c:forEach items="${watchGroups}" var="groups">

                        <tr>
                            <td>${groups.numberGroup}</td>
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
                            <c:if test="${person.role == 'ROLE_TEACHER'}">
                                <td>
                                    <form>
                                        <a href="/watchGroupUsers${groups.id}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px ">
                                            <spring:message code="titleStud"/></a>
                                    </form>
                                </td>
                            </c:if>
                            <c:if test="${person.role == 'ROLE_MANAGER'}">
                                <td>${groups.userTeacher.surname}</td>
                                <td>
                                    <form>
                                        <a href="/watchGroupUsers${groups.id}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="titleStud"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form>
                                        <a href="/editGroupManager${groups.numberGroup}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="eNG"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form>
                                        <a href="/editGroupTeacher${groups.numberGroup}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="eTG"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form>
                                        <a href="/editGroupStatus${groups.numberGroup}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="eG"/></a>
                                    </form>
                                </td>
                            </c:if>
                            <c:if test="${person.role == 'ROLE_USER'}">
                                <td>${groups.userTeacher.surname}</td>
                                <td>
                                    <form>
                                        <a href="/watchJournalGroupUser${groups.numberGroup}/${0}/${7}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;font-size: 20px"><spring:message
                                                code="aCJW"/></a>
                                    </form>

                                </td>
                            </c:if>

                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${watchGroups.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
                </tbody>
            </c:if>
        </form:form>
    </table>

    <c:if test="${person.role == 'ROLE_MANAGER'}">
        <c:if test="${watchGroups.size() > 0}">
            <div>
                <ul class="hr">
                    <c:forEach begin="0" end="${totalPages-1}" var="page">
                        <li>
                            <a href="/watchGroup?page=${page}&size=${3}">${page+1}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <a href="/watchGroupArchive?page=${0}&size=${3}" class="big-button"><spring:message code="wAG"/></a>
        <a href="/watchGroupWaiting?page=${0}&size=${3}" class="big-button"><spring:message code="wAW"/></a>
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
    </c:if>

    <c:if test="${person.role == 'ROLE_USER'}">
        <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
            <c:if test="${pageNumber>0}">
                <a href="/watchGroupUser/${pageNumber-1}/${7}" class="arrow left"
                   style="float: left; padding-left: 100px;  font-size: 60px"><</a>
            </c:if>
            <c:if test="${watchGroups.size()>pageNumber}">
                <a href="/watchGroupUser/${pageNumber+1}/${7}" class="arrow right"
                   style="float: left; padding-left: 160px; font-size: 60px"> > </a>
            </c:if>
        </form>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
    </c:if>

    <c:if test="${person.role == 'ROLE_TEACHER'}">
        <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
            <c:if test="${pageNumber>0}">
                <a href="/watchGroupTeacher/${pageNumber-1}/${7}" class="arrow left"
                   style="float: left; padding-left: 100px;  font-size: 60px"><</a>
            </c:if>
            <c:if test="${watchGroups.size()>pageNumber}">
                <a href="/watchGroupTeacher/${pageNumber+1}/${7}" class="arrow right"
                   style="float: left; padding-left: 160px; font-size: 60px"> > </a>
            </c:if>
        </form>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
    </c:if>
</div>

</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
