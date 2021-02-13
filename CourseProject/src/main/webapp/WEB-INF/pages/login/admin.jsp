<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div class="container">
  <table>
    <thead>
    <th>ID</th>
    <th>Login</th>
    <th>Password</th>
    <th>Name</th>
    <th>Surname</th>
    <th>Roles</th>
    <th></th>
    </thead>
    <c:forEach  items="${allUsers}" var="user">
     <%-- <c:url var="updateLink" value="/editManager">
        <c:param name="idUser" value="${user.id}"/>
      </c:url>--%>
      <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.password}</td>
        <td>${user.name}</td>
        <td>${user.surname}</td>
        <td>
          <c:forEach  items="${user.roles}"   var="role">${role.name}; </c:forEach>
        </td>
        <td>
          <form action="${pageContext.request.contextPath}/admin" method="post">
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="action" value="delete"/>
            <button type="submit">Delete</button>
          </form>
         <%-- <a class="button" href="${updateLink}">
            <svg>
              <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 8pt"> Изменить пользователей</span>
          </a>--%>
        </td>

      </tr>
    </c:forEach>
  </table>
  <div class="svg">
   <%-- <a class="button" href="/editManager">
      <svg>
        <rect height="40" width="130" fill="transparent" />
      </svg>
      <span style="font-size: 8pt"> Изменить пользователей</span>
    </a>--%>
    <a class="button" href="/menuAdmin">
      <svg>
        <rect height="40" width="130" fill="transparent" />
      </svg>
      <span style="font-size: 8pt">Меню</span>
    </a>
  </div>

</div>
<span></span>
</body>

<style>
  <%@include file ="../css/dop.css"%>
  <%@include file ="../css/button.css"%>
</style>
</html>