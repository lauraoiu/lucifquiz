<%--
    Document   : shopping
    Created on : Jan 13, 2021, 4:34:01 AM
    Author     : lapl1
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <!-- title -->
    <title>Lucif Quiz - Admin Home - Create New Question</title>

    <!-- favicon -->
    <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <!-- magnific popup -->
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <!-- animate css -->
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- mean menu css -->
    <link rel="stylesheet" href="assets/css/meanmenu.min.css">
    <!-- main style -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- responsive -->
    <link rel="stylesheet" href="assets/css/responsive.css">

</head>

<c:choose>
<c:when test="${not empty requestScope.MESSAGE}">
<body onload="load(); showSnackBar();">
</c:when>
<c:otherwise>
<body onload="load();">
</c:otherwise>
</c:choose>

<!--PreLoader-->
<div class="loader">
    <div class="loader-inner">
        <div class="circle"></div>
    </div>
</div>
<!--PreLoader Ends-->

<!-- header -->
<div class="top-header-area" id="sticker">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 text-center">
                <div class="main-menu-wrap">
                    <!-- logo -->
                    <div class="site-logo">
                        <a href="${pageContext.request.contextPath}">
                            <img src="assets/img/logo.png" alt="">
                        </a>
                    </div>
                    <!-- logo -->

                    <!-- menu start -->
                    <nav class="main-menu">
                        <ul>
                            <li>
                                <div class="account-header">
                                    <a>${sessionScope.AUTH_USER.name}</a>
                                    <ul class="sub-menu">
                                        <li><a href="logout">Log Out</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- menu end -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end header -->

<!-- breadcrumb-section -->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>SE141031</p>
                    <h1>Lucif Quiz</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end breadcrumb section -->

<div class="login-bg" style="width: 760px!important;border-radius: 18px!important;margin: auto!important;">
    <div class="login-content" style="border-radius: 18px!important;border: 2px solid #F28123!important;padding-bottom: 30px!important;">
        <h2 class="title login">Create New Question</h2>
        <form class="login-form" action="create-new-question" method="post">
            <label>
                <input class="question-content" type="text" name="txtQuestionContent" placeholder="Question Content" value="${param.txtQuestionContent}" autocomplete="new-password"/>
            </label>

            <label>
                <input type="text" name="txtAnswer1" placeholder="Answer 1" value="${param.txtAnswer1}" autocomplete="new-password"/>
            </label>

            <label>
                <input type="text" name="txtAnswer2" placeholder="Answer 2" value="${param.txtAnswer2}" autocomplete="new-password"/>
            </label>

            <label>
                <input type="text" name="txtAnswer3" placeholder="Answer 3" value="${param.txtAnswer3}" autocomplete="new-password"/>
            </label>

            <label>
                <input type="text" name="txtAnswer4" placeholder="Answer 4" value="${param.txtAnswer4}" autocomplete="new-password"/>
            </label>

            <div style="display: flex">
                <h3 style="margin-left: 266px; font-size: 18px;color: #a8c6d4">Subject</h3>
                <h3 style="margin-left: 48px; font-size: 18px;color: #a8c6d4">Correct Answer</h3>
            </div>


            <div style="display: flex">
                <select name="txtSubject" size="1" class="combobox" style="margin-left: auto; margin-right: 25px;">
                    <c:forEach var="subject" items="${requestScope.SUBJECT_LIST}">
                        <c:choose>
                            <c:when test="${subject.id == param.txtSubject}">
                                <option selected value="${subject.id}">${subject.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${subject.id}">${subject.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>

                <select name="txtCorrectAnswer" size="1" class="combobox" style="margin-right: auto; margin-left: 25px;">
                    <c:choose>
                        <c:when test="${'Answer 1' == param.txtCorrectAnswer}">
                            <option selected>Answer 1</option>
                        </c:when>
                        <c:otherwise>
                            <option>Answer 1</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${'Answer 2' == param.txtCorrectAnswer}">
                            <option selected>Answer 2</option>
                        </c:when>
                        <c:otherwise>
                            <option>Answer 2</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${'Answer 3' == param.txtCorrectAnswer}">
                            <option selected>Answer 3</option>
                        </c:when>
                        <c:otherwise>
                            <option>Answer 3</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${'Answer 4' == param.txtCorrectAnswer}">
                            <option selected>Answer 4</option>
                        </c:when>
                        <c:otherwise>
                            <option>Answer 4</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>

            <label>
                <button class="btn" type="submit" style="margin-top: 28px!important;">Create Question</button>
            </label>
        </form>
    </div>
</div>

<!-- logo carousel -->
<div class="logo-carousel-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="logo-carousel-inner">
                    <div class="single-logo-item">
                        <img src="assets/img/company-logos/1.png" alt="">
                    </div>
                    <div class="single-logo-item">
                        <img src="assets/img/company-logos/2.png" alt="">
                    </div>
                    <div class="single-logo-item">
                        <img src="assets/img/company-logos/3.png" alt="">
                    </div>
                    <div class="single-logo-item">
                        <img src="assets/img/company-logos/4.png" alt="">
                    </div>
                    <div class="single-logo-item">
                        <img src="assets/img/company-logos/5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end logo carousel -->

<!-- notification -->
<c:if test="${not empty requestScope.MESSAGE}">
    <div id="snackbar">${requestScope.MESSAGE}
        <button onclick="hideSnackBar()" class="hidden-button">Hide</button>
    </div>
</c:if>

<!-- jquery -->
<script src="assets/js/jquery-1.11.3.min.js"></script>
<!-- bootstrap -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- count down -->
<script src="assets/js/jquery.countdown.js"></script>
<!-- isotope -->
<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
<!-- waypoints -->
<script src="assets/js/waypoints.js"></script>
<!-- owl carousel -->
<script src="assets/js/owl.carousel.min.js"></script>
<!-- magnific popup -->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<!-- mean menu -->
<script src="assets/js/jquery.meanmenu.min.js"></script>
<!-- sticker js -->
<script src="assets/js/sticker.js"></script>
<!-- main js -->
<script src="assets/js/main.js"></script>

</body>
<script>
    function savePosition(){
        sessionStorage.setItem("position", window.scrollY);
    }
    window.onbeforeunload = savePosition;

    function load(){
        window.scrollTo(0, parseFloat(sessionStorage.getItem("position")));
    }
</script>
</html>