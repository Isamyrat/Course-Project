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
<sec:authorize access="hasRole('ROLE_MANAGER')">

    <div class="container">
        <table>
            <form:form modelAttribute="watchGroups">
                <thead>
                <tr>
                    <th><spring:message code="tiTle"/></th>
                </tr>
                </thead>
                <c:if test="${watchGroups.size()>0}">
                    <thead>
                    <tr>
                        <th><spring:message code="nOG"/></th>
                        <th><spring:message code="tOG"/></th>
                        <th><spring:message code="lOG"/></th>
                        <th><spring:message code="laOG"/></th>
                        <th><spring:message code="sG"/></th>
                        <th><spring:message code="aG"/></th>
                        <th><spring:message code="aG"/></th>
                        <th><spring:message code="aG"/></th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${watchGroups.size()>0}">

                        <c:forEach items="${watchGroups}" var="groups">

                            <tr>
                                <td>${groups.number_group}</td>
                                <td>${groups.user_teacher.surname}</td>
                                <td>${groups.course_group.level}</td>
                                <td>${groups.course_group.language}</td>
                                <td>${groups.status}</td>
                                <td>
                                    <form>
                                        <a href="/watchGroupUsers/${groups.id}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="titleStud"/></a>
                                    </form>
                                    <br>
                                    <form>
                                        <a href="/editGroupManager${groups.number_group}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="eNG"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form>
                                        <a href="/editGroupTeacher${groups.number_group}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="eTG"/></a>
                                    </form>
                                </td>
                                <td>
                                    <form>
                                        <a href="/editGroupStatus${groups.number_group}" type="submit"
                                           style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid;font-size: 20px ">
                                            <spring:message code="eG"/></a>
                                    </form>
                                </td>
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
        <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
            <c:if test="${pageNumber>0}">
                <a href="/watchGroup/${pageNumber-1}/${3}" class="arrow left"
                   style="float: left; padding-left: 100px;  font-size: 60px"><</a>
            </c:if>
            <c:if test="${watchGroups.size()>pageNumber}">
                <a href="/watchGroup/${pageNumber+1}/${3}" class="arrow right"
                   style="float: left; padding-left: 160px; font-size: 60px"> > </a>
            </c:if>
        </form>
        <a href="/watchGroupArchive/${0}/${7}" class="big-button"><spring:message code="wAG"/></a>
        <a href="/watchGroupWaiting/${0}/${3}" class="big-button"><spring:message code="wAW"/></a>
        <a href="/menuManager" class="big-button"><spring:message code="mAM"/></a>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')">

    <div class="container">
        <table>
            <form:form modelAttribute="userGroup">
                <thead>
                <tr>
                    <th><spring:message code="uGroup"/></th>
                </tr>
                <thead>
                <tr>
                    <th><spring:message code="nOG"/></th>
                    <th><spring:message code="tOG"/></th>
                    <th><spring:message code="lOG"/></th>
                    <th><spring:message code="laOG"/></th>
                    <th><spring:message code="aCJ"/></th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${userGroup.size()>0}">

                    <c:forEach items="${userGroup}" var="groups">
                        <tr>
                            <td>${groups.number_group}</td>
                            <td>${groups.user_teacher.surname}</td>
                            <td>${groups.course_group.language}</td>
                            <td>${groups.course_group.level}</td>
                            <td>
                                <form>
                                    <a href="/watchJournalGroupUser${groups.number_group}/${0}/${7}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;font-size: 20px"><spring:message
                                            code="aCJW"/></a>
                                </form>

                            </td>
                        </tr>

                    </c:forEach>
                </c:if>
                <c:if test="${userGroup.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
                </tbody>


            </form:form>
        </table>
        <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
            <c:if test="${pageNumber>0}">
                <a href="/watchGroupUser/${pageNumber-1}/${7}" class="arrow left"
                   style="float: left; padding-left: 100px;  font-size: 60px"><</a>
            </c:if>
            <c:if test="${userGroup.size()>pageNumber}">
                <a href="/watchGroupUser/${pageNumber+1}/${7}" class="arrow right"
                   style="float: left; padding-left: 160px; font-size: 60px"> > </a>
            </c:if>
        </form>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
    </div>

</sec:authorize>

<sec:authorize access="hasRole('ROLE_TEACHER')">
    <div class="container">
        <table>
            <form:form modelAttribute="userGroup">
                <thead>
                <tr>
                    <th><spring:message code="tGroup"/></th>
                </tr>
                <thead>
                <tr>
                    <th><spring:message code="nOG"/></th>
                    <th><spring:message code="lOG"/></th>
                    <th><spring:message code="laOG"/></th>
                    <th><spring:message code="aG"/></th>
                </tr>
                </thead>

                <tbody>
                <c:if test="${userGroup.size()>0}">

                <c:forEach items="${userGroup}" var="teacher">
                    <tr>
                        <td>${teacher.number_group}</td>
                        <td>${teacher.course_group.language}</td>
                        <td>${teacher.course_group.level}</td>
                        <td>
                            <form>
                                <a href="/watchGroupUsers${teacher.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px ">
                                    <spring:message code="titleStud"/></a>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </c:if>
                <c:if test="${userGroup.size()<1}">
                    <td><spring:message code="eC"/></td>
                </c:if>
                </tbody>
            </form:form>
        </table>
        <form style="margin: 0; padding: 0;height: 100px; font-size: 50px">
            <c:if test="${pageNumber>0}">
                <a href="/watchGroupTeacher/${pageNumber-1}/${7}" class="arrow left"
                   style="float: left; padding-left: 100px;  font-size: 60px"><</a>
            </c:if>
            <c:if test="${userGroup.size()>pageNumber}">
                <a href="/watchGroupTeacher/${pageNumber+1}/${7}" class="arrow right"
                   style="float: left; padding-left: 160px; font-size: 60px"> > </a>
            </c:if>
        </form>
        <a href="/personalInformationUser" class="big-button"><spring:message code="bK"/></a>
    </div>
</sec:authorize>

</body>

<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
