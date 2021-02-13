<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Персональный аккаунт</title>
</head>

<html>
<body>


<sec:authorize access="hasRole('ROLE_USER')">

    <div class="container">
        <table>
            <form:form modelAttribute="userId">
                <thead>
                <tr>
                    <th>Персональный аккаунт</th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th>Имя</th>
                    <th>Фамилия</th>
                    <th>Watch Person Info</th>
                    <th>Watch Address</th>
                </tr>
                </thead>
                <tbody>

                <c:url var="watchPersonInfo" value="/personalInformationUsers">
                    <c:param name="personalId" value="${userId.id}"/>
                </c:url>
                <c:url var="addPerson" value="/addPersonalInformationUser">
                </c:url>

                <c:url var="watchAddress" value="/userAddressWatch">
                    <c:param name="addressId" value="${userId.id}"/>
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
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000;  border: 1px #f5f4f4 solid; ">Добавить
                                    личные данные</a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="${watchPersonInfo}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2); color: #000000; border: 1px #f5f4f4 solid;">Personal
                                    Info</a>
                            </form>
                            </p>

                        </td>
                        <td>
                            <form>
                                <a href="${addAddress}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);  color: #000000; border: 1px #f5f4f4 solid;">Добавить
                                    адрессные данные</a>
                            </form>
                            <span></span>
                            <p>
                            <form>
                                <a href="${watchAddress}" type="submit"
                                   style="background-color: rgba(255, 255, 255, 0.2);  color: #000000;  border: 1px #f5f4f4 solid;">Посмотреть
                                    адрессные данные</a>
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
                <span style="font-size: 10pt">Посмотреть все курсы</span>
            </a>

            <a class="button" href="/editUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 7pt;">Изменить личные данные</span>
            </a>
            <a class="button" href="/watchGroupUser">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 7pt;">Посмотреть в какой группе учусь</span>
            </a>
            <a class="button" href="/">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Back</span>
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
                    <th><h1>Персональный аккаунт</h1></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Имя</td>
                    <td>Фамилия</td>
                </tr>
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
                <span style="font-size: 10pt; width: 235px;">Изменить личные данные</span>
            </a>
            <a class="button" href="/watchJournal">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Посмотреть журнал</span>
            </a>
            <a class="button" href="/watchGroupTeacher">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Посмотреть группу</span>
            </a>
            <a class="button" href="/">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Back</span>
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
                    <th>Персональный аккаунт</th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th style="width: 50px; height: 50px">Имя</th>
                    <th style="width: 50px; height: 50px">Фамилия</th>
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
                <span style="font-size: 7pt;">Изменить личные данные</span>
            </a>
            <a class="button" href="/menuManager">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Главное меню</span>
            </a>
            <a class="button" href="/">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Back</span>
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
                    <th><h1>Персональный аккаунт</h1></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Имя</td>
                    <td>Фамилия</td>
                </tr>
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
                <span style="font-size: 10pt; width: 235px;">Изменить личные данные</span>
            </a>
            <a class="button" href="/menuAdmin">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Главное меню</span>
            </a>
            <a class="button" href="/">
                <svg>
                    <rect height="40" width="130" fill="transparent"/>
                </svg>
                <span style="font-size: 10pt">Back</span>
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


