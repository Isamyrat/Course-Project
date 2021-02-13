<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть группу</title>
</head>

<html>
<body>

<div class="container">
    <table>
        <form:form modelAttribute="watchUsersArhiv">
        <thead>
        <tr>
            <th>Watch all groups</th>
        </tr>
        </thead>
            <c:if test="${watchUsersArhiv.size()>0}">
        <thead>
        <tr>
            <th>Number of group</th>
            <th>Teacher of group</th>
            <th>Level of course</th>
            <th>Language of course</th>
            <th>Date of start course</th>
            <th>Status of course</th>
<%--
            <th>Action</th>
--%>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${watchUsersArhiv}" var="groups">

           <%-- <c:url var="watchUsers" value="/watchGroupUsers">
                <c:param name="idGroup" value="${groups.id}"/>
            </c:url>
            <c:url var="editGroup" value="/editGroupManager">
                <c:param name="idGroup" value="${groups.id}"/>
            </c:url>--%>

        <tr>
            <th>${groups.number_group}</th>
            <td>${groups.user_teacher.surname}</td>
            <td>${groups.course_group.level}</td>
            <td>${groups.course_group.language}</td>
            <td>${groups.course_group.start_date}</td>
            <td>${groups.status}</td>
           <%-- <td>
                <form>
                    <a href="${watchUsers}"  type="submit" style="color: white;font-size: 10pt" >
                        Students of this group</a>
                </form>
                <form>
                    <a href="${editGroup}"  type="submit" style="color: white;font-size: 10pt" >
                        Edit this group</a>
                </form>

            </td>--%>
        </tr>
        </c:forEach>
        </tbody>
            </c:if>
        </form:form>
    </table>

    <div class="svg">
      <%--  <a class="button" href="/editGroupManager">
            <svg>
                <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 8pt">Изменить группы</span>
        </a>
        <a class="button" href="/delete">
            <svg>
                <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 8pt">Удалить данные групп</span>
        </a>--%>
        <a class="button" href="/menuManager">
            <svg>
                <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 8pt">Меню</span>
        </a>
    </div>
</div>

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
