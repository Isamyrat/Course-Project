<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Персональный аккаунт</title>
</head>

<html>
<header>
    <div style="float: right">
        <h4><a href="?lang=en" style="color: white; font-size: 10px"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" style="color: white"><spring:message code="app.ru"/></a></h4>
    </div>
</header>
<body>

<sec:authorize access="hasRole('ROLE_USER')">

    <div class="container">
        <table>
            <form:form modelAttribute="userId">
                <thead>
                <tr>
                    <th><spring:message code="caption"/></th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th><spring:message code="nMU"/></th>
                    <th><spring:message code="sNUS"/></th>
                    <th><spring:message code="wpI"/></th>
                    <th><spring:message code="wAddr"/></th>
                </tr>
                </thead>
                <tbody>

                <c:url var="addPerson" value="/addPersonalInformationUser">
                </c:url>

                <c:url var="addAddress" value="/addAddressUser">
                </c:url>
                <c:if test="${userId.id.longValue()!=null}">
                    <tr>
                        <td>${userId.name}</td>
                        <td>${userId.surname}</td>
                        <td>
                            <form>
                                <a href="${addPerson}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px"><spring:message code="adPI"/>е</a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="/personalInformationUsers${userId.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid; font-size: 25px"><spring:message code="pI"/></a>
                            </form>
                            </p>

                        </td>
                        <td>
                            <form>
                                <a href="${addAddress}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);   color: #000000; border: 1px #f5f4f4 solid; font-size: 25px"><spring:message code="adAddress"/></a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="/userAddressWatch${userId.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);   color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px"><spring:message code="wAI"/></a>
                            </form>
                            </p>
                        </td>
                    </tr>

                </c:if>
                </tbody>
            </form:form>
        </table>
        <div class="svg">
            <a class="button" href="/watchAllCoursesManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="wAC"/></span>
            </a>

            <a class="button" href="/editUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 7pt;"><spring:message code="cPI"/></span>
            </a>
            <a class="button" href="/watchGroupUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 7pt;"><spring:message code="wWG"/></span>
            </a>
            <a class="button" href="/">
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
            <form:form modelAttribute="userId">
                <thead>
                <tr>
                    <th><spring:message code="caption"/></th>
                </tr>
                </thead>
               <thead>
               <tr>
                   <th><spring:message code="nMU"/></th>
                   <th><spring:message code="sNUS"/></th>
               </tr>
               </thead>

                <tbody>

                <tr>
                    <td>${userId.name}</td>
                    <td>${userId.surname}</td>
                </tr>
                </tbody>
            </form:form>
        </table>


        <div class="svg">
            <a class="button" href="/editUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt; width: 235px;"><spring:message code="cPI"/></span>
            </a>
            <a class="button" href="/watchJournalManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="wJ"/></span>
            </a>
            <a class="button" href="/watchGroupTeacher">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="wG"/></span>
            </a>
            <a class="button" href="/">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="bK"/></span>
            </a>
        </div>
    </div>
</sec:authorize>


<sec:authorize access="hasRole('ROLE_MANAGER')">
    <div class="container">
        <table>
            <form:form modelAttribute="userId">
                <thead>
                <tr>
                    <th><spring:message code="caption"/></th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <<th><spring:message code="nMU"/></th>
                    <th><spring:message code="sNUS"/></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${userId.name}</td>
                    <td>${userId.surname}</td>
                </tr>
                </tbody>
            </form:form>
        </table>

        <div class="svg">
            <a class="button" href="/editUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 7pt;"><spring:message code="cPI"/></span>
            </a>
            <a class="button" href="/menuManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="mM"/></span>
            </a>
            <a class="button" href="/">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="bK"/></span>
            </a>
        </div>
    </div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')">


    <div class="container">
        <table>
            <form:form modelAttribute="userId">
                <thead>
                <tr>
                    <th><spring:message code="caption"/></th>
                </tr>
                </thead>
                <thead>

                <tr>
                    <th><spring:message code="nMU"/></th>
                    <th><spring:message code="sNUS"/></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${userId.name}</td>
                    <td>${userId.surname}</td>
                </tr>
                </tbody>
            </form:form>
        </table>


        <div class="svg">
            <a class="button" href="/editUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt; width: 235px;"><spring:message code="cPI"/></span>
            </a>
            <a class="button" href="/menuAdmin">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt"><spring:message code="mM"/></span>
            </a>
            <a class="button" href="/">
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
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>


