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


    <table class="container">
        <form:form modelAttribute="userId">
            <thead>
            <tr>
                <th><h1>Персональный аккаунт</h1></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <td>Логин</td>
                <td>Пароль</td>
                <td>Имя</td>
                <td>Фамилия</td>
                <td>Watch Person Info</td>
                <td>Watch Address</td>
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
                    <td>${userId.username}</td>
                    <td>${userId.password}</td>
                    <td>${userId.name}</td>
                    <td>${userId.surname}</td>
                    <td>
                        <form>
                            <a href="${addPerson}" type="submit" style="background-color: #576a91; color: white; border: 1px #f5f4f4 solid; font-size: 10pt">Добавить
                                личные данные</a>
                        </form>
                        <span></span>
                        <p>
                        <form>
                            <a href="${watchPersonInfo}" type="submit" style="background-color: #576a91; color: white; border: 1px #f5f4f4 solid; font-size: 15pt">Personal
                                Info</a>
                        </form>
                        </p>

                    </td>
                    <td>
                        <form>
                            <a href="${addAddress}" type="submit" style="background-color: #576a91; color: white;  border: 1px #f5f4f4 solid; font-size: 10pt">Добавить
                                адрессные данные</a>
                        </form>
                        <span></span>
                        <p>
                        <form>
                            <a href="${watchAddress}" type="submit" style="background-color: #576a91; color: white;  border: 1px #f5f4f4 solid; font-size: 10pt">Посмотреть
                                адрессные данные</a>
                        </form>
                        </p>
                    </td>
                </tr>

            </c:if>
            </tbody>
        </form:form>
    </table>

    <span></span>
    <span></span>
    <span></span>


    <table class="container">
        <thead>
        <tr>
            <th><h1>В данном курсе вы проходите обучение</h1></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Language</td>
            <td>Level</td>
            <td>Price</td>
            <td>Date of start</td>
            <td>Duraction</td>
        </tr>
        <tr>
            <td>English</td>
            <td>start</td>
            <td>900</td>
            <td>02.09</td>
            <td>2</td>
        </tr>

        </tbody>
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
            <span style="font-size: 10pt; width: 235px;">Изменить личные данные</span>
        </a>
        <a class="button" href="/">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 10pt">Back</span>
        </a>
    </div>

</sec:authorize>


<sec:authorize access="hasRole('ROLE_TEACHER')">


    <table class="container">
        <form:form modelAttribute="userId">
            <thead>
            <tr>
                <th><h1>Персональный аккаунт</h1></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Логин</td>
                <td>Пароль</td>
                <td>Имя</td>
                <td>Фамилия</td>
            </tr>
            <tr>
                <td>${userId.username}</td>
                <td>${userId.password}</td>
                <td>${userId.name}</td>
                <td>${userId.surname}</td>
            </tr>
            </tbody>
        </form:form>
    </table>

    <span></span>
    <span></span>
    <span></span>


    <table class="container">
        <thead>
        <tr>
            <th><h1>В данном курсе вы обучаете</h1></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Language</td>
            <td>Level</td>
            <td>Price</td>
            <td>Date of start</td>
            <td>Duraction</td>
        </tr>
        <tr>
            <td>English</td>
            <td>start</td>
            <td>900</td>
            <td>02.09</td>
            <td>2</td>
        </tr>

        </tbody>
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
        <a class="button" href="/">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 10pt">Back</span>
        </a>
    </div>
</sec:authorize>


<sec:authorize access="hasRole('ROLE_MANAGER')">


    <table class="container">
        <form:form modelAttribute="userId">
            <thead>
            <tr>
                <th><h1>Персональный аккаунт</h1></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Логин</td>
                <td>Пароль</td>
                <td>Имя</td>
                <td>Фамилия</td>
            </tr>
            <tr>
                <td>${userId.username}</td>
                <td>${userId.password}</td>
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
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')">


    <table class="container">
        <form:form modelAttribute="userId">
            <thead>
            <tr>
                <th><h1>Персональный аккаунт</h1></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Логин</td>
                <td>Пароль</td>
                <td>Имя</td>
                <td>Фамилия</td>
            </tr>
            <tr>
                <td>${userId.username}</td>
                <td>${userId.password}</td>
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
</sec:authorize>

</body>
<style>
    <%@include file ="../css/personalInformation.css"%>
    <%@include file ="../css/button.css"%>
</style>
</html>


