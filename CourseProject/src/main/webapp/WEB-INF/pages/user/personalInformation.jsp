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

<header>
    <div class="localize">
        <span style="color:#f5f4f4;"><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="big-button"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="big-button"><spring:message code="app.ru"/></a></h4>
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
                <c:if test="${userId != null}">
                    <tbody>

                    <tr>
                        <td>${userId.name}</td>
                        <td>${userId.surname}</td>
                        <td>
                            <form>
                                <a href="/addPersonalInformationUser" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="adPI"/>е</a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="/personalInformationUsers${userId.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="pI"/></a>
                            </form>
                            </p>

                        </td>
                        <td>
                            <form>
                                <a href="/addAddressUser" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);   color: #000000; border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="adAddress"/></a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="/userAddressWatch${userId.id}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);   color: #000000;  border: 1px #f5f4f4 solid; font-size: 25px"><spring:message
                                        code="wAI"/></a>
                            </form>
                            </p>
                        </td>
                    </tr>
                    </tbody>
                </c:if>
                <c:if test="${userId == null}">
                    <td><spring:message code="eC"/></td>
                </c:if>

            </form:form>
        </table>
        <a href="/watchAllCoursesManager" class="big-button"><spring:message code="wAC"/></a>
        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/watchGroupUser" class="big-button"><spring:message code="wWG"/></a>
        <a href="/" class="big-button"><spring:message code="bK"/></a>
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
                <c:if test="${userId != null}">
                    <tbody>

                    <tr>
                        <td>${userId.name}</td>
                        <td>${userId.surname}</td>
                    </tr>
                    </tbody>
                </c:if>
                <c:if test="${userId == null}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>
        </table>

        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/watchJournalManager" class="big-button"><spring:message code="wJ"/></a>
        <a href="/watchGroupTeacher" class="big-button"><spring:message code="wG"/></a>
        <a href="/" class="big-button"><spring:message code="bK"/></a>
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
                    <th><spring:message code="nMU"/></th>
                    <th><spring:message code="sNUS"/></th>
                </tr>
                </thead>
                <c:if test="${userId != null}">

                    <tbody>
                    <tr>
                        <td>${userId.name}</td>
                        <td>${userId.surname}</td>
                    </tr>
                    </tbody>
                </c:if>
                <c:if test="${userId == null}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>
        </table>
        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/menuManager" class="big-button"><spring:message code="mM"/></a>
        <a href="/" class="big-button"><spring:message code="bK"/></a>
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
                <c:if test="${userId != null}">

                    <tbody>
                    <tr>
                        <td>${userId.name}</td>
                        <td>${userId.surname}</td>
                    </tr>
                    </tbody>
                </c:if>
                <c:if test="${userId == null}">
                    <td><spring:message code="eC"/></td>
                </c:if>
            </form:form>
        </table>

        <a href="/editUser" class="big-button"><spring:message code="cPI"/></a>
        <a href="/menuAdmin" class="big-button"><spring:message code="mM"/></a>
        <a href="/" class="big-button"><spring:message code="bK"/></a>
    </div>

</sec:authorize>

</body>
<style>
    <%@include file ="../css/internationalize.css"%>
    <%@include file ="../css/dop.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>


