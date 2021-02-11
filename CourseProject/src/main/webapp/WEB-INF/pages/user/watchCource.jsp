<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть </title>
</head>

<html>
<body>

<div class="container">
    <table>
        <thead>
        <tr>
            <th>В данном курсе вы проходите обучение</th>
        </tr>
        <thead>
        <tr>
            <th>Language</th>
            <th>Level</th>
            <th>Price</th>
            <th>Date of start</th>
            <th>Duraction</th>
        </tr>
        </thead>


        <tbody>
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
        <a class="button" href="/personalInformationUser">
            <svg>
                <rect height="40" width="130" fill="transparent"/>
            </svg>
            <span style="font-size: 10pt">Back</span>
        </a>
    </div>
</div>

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/dop.css"%>
</style>
</html>
