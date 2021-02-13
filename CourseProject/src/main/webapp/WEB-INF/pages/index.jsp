<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<title><spring:message code="main.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body, h1, h2, h3, h4, h5, h6 {
        font-family: "Montserrat", sans-serif
    }

    .w3-row-padding img {
        margin-bottom: 12px
    }

    .bgimg {
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        background-image: url('https://townsquare.media/site/98/files/2020/06/RS27922_GettyImages-1011793090-1.jpg?w=1200&h=0&zc=1&s=0&a=t&q=89');
        min-height: 100%;
    }
</style>
<body>
<spring:message code="enterN" var="lName"/>

<!-- Sidebar with image -->
<nav class="w3-sidebar w3-hide-medium w3-hide-small" style="width:40%">
    <div class="bgimg"></div>
</nav>

<!-- Hidden Sidebar (reveals when clicked on menu icon)-->
<nav class="w3-sidebar w3-black w3-animate-right w3-xxlarge" style="display:none;padding-top:150px;right:0;z-index:2"
     id="mySidebar">
    <a href="javascript:void(0)" onclick="closeNav()" class="w3-button w3-black w3-xxxlarge w3-display-topright"
       style="padding:0 12px;">
        <i class="fa fa-remove"></i>
    </a>
    <div class="w3-bar-block w3-center">
        <sec:authorize access="!isAuthenticated()">
            <h4><a href="/login" class="w3-bar-item w3-button w3-text-grey w3-hover-black"><spring:message code="eT"/></a></h4>
            <h4><a href="/registration" class="w3-bar-item w3-button w3-text-grey w3-hover-black"><spring:message code="registrationT"/></a></h4>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <p align="center"><a href="/personalInformationUser" class="w3-bar-item w3-button w3-text-grey w3-hover-black"><spring:message code="pA"/></a></p>
            <h4><a href="/logout" class="w3-bar-item w3-button w3-text-grey w3-hover-black"><spring:message code="lO"/></a></h4>
        </sec:authorize>

        <span><spring:message code="app.title"/>:</span>
        <h4><a href="?lang=en" class="w3-bar-item w3-button w3-text-grey w3-hover-black"><spring:message code="app.en"/></a></h4>
        <h4><a href="?lang=ru" class="w3-bar-item w3-button w3-text-grey w3-hover-black"><spring:message code="app.ru"/></a></h4>
  </div>
</nav>

<!-- Page Content -->
<div class="w3-main w3-padding-large" style="margin-left:40%">

    <!-- Menu icon to open sidebar -->
    <span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto;right:0;"
          onclick="openNav()"><i class="fa fa-bars"></i></span>

    <!-- Header -->
    <header class="w3-container w3-center" style="padding:128px 16px" id="home">
        <h1 class="w3-jumbo"><b>Language Line</b></h1>
        <p><spring:message code="underTitle"/></p>
    </header>

    <!-- Portfolio Section -->
    <div class="w3-padding-32 w3-content" id="portfolio">
        <h2 class="w3-text-grey"><spring:message code="photosOfGroup"/></h2>
        <hr class="w3-opacity">
        <!-- Grid for photos -->
        <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
                <img src="https://www.policechiefmagazine.org/wp-content/uploads/College-Students-2-1024x683.jpg" style="width:100%">
                <img src="https://debatechamber.com/wp-content/uploads/2017/02/bigstock-A-portrait-of-an-Asian-college-23656664.jpg" style="width:100%">
                <img src="https://kids2uk.ru/img/16463643.jpg" style="width:100%">
                <img src="https://msk.englishchoice.ru/wp-content/uploads/sites/2/2016/03/franshiza-divelang-9.jpg" style="width: 100%">
            </div>

            <div class="w3-half">
                <img src="https://static.tildacdn.com/tild3737-3466-4936-a336-626432333130/5c83ecfb4b2b3.jpg" style="width:100%">
                <img src="https://mulino58.ru/wp-content/uploads/6/c/b/6cb6b11e9d377fff2ad400dc07e91c83.jpg" style="width:100%">
                <img src="https://excelente.travel/upload/iblock/254/2542a31ba2dc9695a82ba7ed96cab7e1.gif" style="width:100%">
                <img src="https://odin.mgimo.ru/images/news3141/IMG_4102.jpg" style="width:100%">
            </div>
            <!-- End photo grid -->
        </div>
        <!-- End Portfolio Section -->
    </div>

    <!-- About Section -->
    <div class="w3-content w3-justify w3-text-grey w3-padding-32" id="about">
        <h2><spring:message code="aboutUs"/></h2>
        <hr class="w3-opacity">
        <p><spring:message code="textAboutUs"/></p>
        <h3 class="w3-padding-16"><spring:message code="mostStudiedLang"/></h3>
        <p class="w3-wide"><spring:message code="englishT"/></p>
        <div class="w3-light-grey">
            <div class="w3-container w3-center w3-padding-small w3-dark-grey" style="width:70%">70%</div>
        </div>
        <p class="w3-wide"><spring:message code="russianT"/></p>
        <div class="w3-light-grey">
            <div class="w3-container w3-center w3-padding-small w3-dark-grey" style="width:20%">20%</div>
        </div>
        <p class="w3-wide"><spring:message code="frenchT"/></p>
        <div class="w3-light-grey">
            <div class="w3-container w3-center w3-padding-small w3-dark-grey" style="width:10%">10%</div>
        </div>
        <br>

        <div class="w3-row w3-center w3-dark-grey w3-padding-16 w3-section">
            <div class="w3-quarter w3-section">
                <span class="w3-xlarge">14+</span><br>
                <spring:message code="partnerT"/>
            </div>
            <div class="w3-quarter w3-section">
                <span class="w3-xlarge">10+</span><br>
                <spring:message code="coursesT"/>
            </div>
            <div class="w3-quarter w3-section">
                <span class="w3-xlarge">1000+</span><br>
                <spring:message code="happyClienT"/>
            </div>
            <div class="w3-quarter w3-section">
                <span class="w3-xlarge">150+</span><br>
                <spring:message code="teacherT"/>
            </div>
        </div>

        <h3 class="w3-padding-24"><spring:message code="reviewsT"/></h3>

        <p><span class="w3-large w3-text-black w3-margin-right"><spring:message code="jakeJ"/></span><spring:message code="businessM"/></p>
        <p><spring:message code="jj"/></p><br>


        <p><span class="w3-large w3-text-black w3-margin-right"><spring:message code="chriF"/></span><spring:message code="studentT"/></p>
        <p><spring:message code="cf"/></p><br>


        <div class="subscribe-box">
            <h2><spring:message code="findS"/></h2>
            <form class="subscribe" action="/watchAllCourcesUser">
                <input type="text" placeholder="${lName}" />
                <button type="submit"> <span><spring:message code="f"/></span></button>
            </form>
        </div>

    </div>

    <!-- Contact Section -->
    <div class="w3-padding-32 w3-content w3-text-grey" id="contact" style="margin-bottom:64px">
        <h2><spring:message code="cU"/></h2>
        <hr class="w3-opacity">

        <div class="w3-section">
            <p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i><spring:message code="mB"/></p>
            <p><i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i> <spring:message code="pH"/>: (+375-25-985-14-54)
                (+375-25-765-16-51) </p>
            <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> <spring:message code="eM"/>: languageline@mail.com</p>
        </div>


    </div>

    <!-- Footer -->
    <footer class="w3-container w3-padding-64 w3-light-grey w3-center w3-opacity w3-xlarge" style="margin:-24px">
        <p class="w3-medium">Powered by <label>Language Line</label></p>
        <!-- End footer -->
    </footer>

    <!-- END PAGE CONTENT -->
</div>
<script>
    // Open and close sidebar
    function openNav() {
        document.getElementById("mySidebar").style.width = "60%";
        document.getElementById("mySidebar").style.display = "block";
    }

    function closeNav() {
        document.getElementById("mySidebar").style.display = "none";
    }
</script>
<style>
    <%@include file ="css/form.css"%>
</style>
</body>
</html>
