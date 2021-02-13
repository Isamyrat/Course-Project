<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Посмотреть журнал</title>
</head>

<html>
<body>
<div class="container">
    <table>
        <thead>
        <tr>
            <th>Journal</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th>Language</th>
            <th>Level</th>
            <th>Group</th>
            <th>Student</th>
            <th>Point</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>French</td>
            <td>Elementary</td>
            <td>872302</td>
            <td>Egor</td>
            <td>10</td>
        </tr>
        <tr>
            <td>English</td>
            <td>start</td>
            <td>872304</td>
            <td>Aleksey</td>
            <td>9</td>
        </tr>
        </tbody>
    </table>

    <div class="svg">
        <a class="button" href="/editJournalManager">
            <svg>
                <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 8pt">Изменить данные журанала</span>
        </a>
        <a class="button" href="/delete">
            <svg>
                <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 8pt">Удалить данные журнала</span>
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
    <%@include file ="../css/dop.css"%>
</style>
</html>
