<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Топик</title>
</head>

<html>
<body>

<div class="container">
    <table>
        <thead>
        <tr>
            <th>Topics </th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th>Language</th>
            <th>Level</th>
            <th>Rules</th>
            <th>Text</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>French</th>
            <th>Elementary</th>
            <th>Past Simple</th>
            <th>House</th>
        </tr>
        <tr>
            <th>English</th>
            <th>start</th>
            <th>Present Simple</th>
            <th>Animals</th>
        </tr>
        </tbody>
    </table>
    <div class="svg">
        <a class="button" href="/watchAllCoursesManager">
            <svg>
                <rect height="40" width="130" fill="transparent" />
            </svg>
            <span style="font-size: 10pt">Back</span>
        </a>
    </div>

</div>

</body>

<style>
    <%@include file ="../css/button.css"%>
    <%@include file ="../css/data.css"%>
</style>

</html>
