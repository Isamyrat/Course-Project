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

<html>

<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
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
                        <th><spring:message code="dOG"/></th>
                        <th><spring:message code="sG"/></th>
                        <th><spring:message code="aG"/></th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${watchGroups}" var="groups">

                        <c:url var="editGroup" value="/editGroupManager">
                            <c:param name="idGroup" value="${groups.id}"/>
                        </c:url>

                        <tr>
                            <td>${groups.number_group}</td>
                            <td>${groups.user_teacher.surname}</td>
                            <td>${groups.course_group.level}</td>
                            <td>${groups.course_group.language}</td>
                            <td>${groups.course_group.start_date}</td>
                            <td>${groups.status}</td>
                            <td>
                                <form>
                                    <a href="/watchGroupUsers${groups.id}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">
                                        <spring:message code="titleStud"/></a>
                                </form>
                                <span></span>
                                <br>
                                <form>
                                    <a href="${editGroup}" type="submit"
                                       style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">
                                        <spring:message code="eG"/></a>
                                </form>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
            </form:form>
        </table>

        <div class="svg">
            <a class="button" href="/watchGroupArhiv">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 8pt"><spring:message code="wAG"/></span>
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
                    <th><spring:message code="dOG"/></th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>${userGroup.number_group}</td>
                    <td>${userGroup.user_teacher.surname}</td>
                    <td>${userGroup.course_group.language}</td>
                    <td>${userGroup.course_group.level}</td>
                    <td>${userGroup.course_group.start_date}</td>
                </tr>

                </tbody>
            </form:form>
        </table>
        <div class="svg">
            <a class="button" href="/personalInformationUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="bK"/></span>
            </a>
        </div>
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
                    <th><spring:message code="dOG"/></th>
                    <th><spring:message code="aG"/></th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${userGroup}" var="teacher">
                   <%-- <c:url var="watchUsers" value="/watchGroupUsers">
                        <c:param name="idGroup" value="${teacher.id}"/>
                    </c:url>--%>
                    <tr>
                        <td>${teacher.number_group}</td>
                        <td>${teacher.course_group.language}</td>
                        <td>${teacher.course_group.level}</td>
                        <td>${teacher.course_group.start_date}</td>
                        <td>
                            <form>
                                <a href="/watchGroupUsers${teacher.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">
                                    <spring:message code="titleStud"/></a>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </form:form>
        </table>
        <div class="svg">
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
