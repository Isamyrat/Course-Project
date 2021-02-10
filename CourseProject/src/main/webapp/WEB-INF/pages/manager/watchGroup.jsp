<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <thead>
        <tr>
            <th>Watch group</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th>Number</th>
            <th>Language</th>
            <th>Level</th>
            <th>Price</th>
            <th>Date of start</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>872304</th>
            <td>English</td>
            <td>start</td>
            <td>900</td>
            <td>02.09</td>
        </tr>
        <tr>
            <th>872302</th>
            <td>French</td>
            <td>Elementary</td>
            <td>1000</td>
            <td>10.09</td>
        </tr>
        </tbody>
    </table>

    <div class="svg">
        <a class="button" href="/editGroupManager">
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
        </a>
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
    <%@include file ="../css/data.css"%>
</style>
</html>
