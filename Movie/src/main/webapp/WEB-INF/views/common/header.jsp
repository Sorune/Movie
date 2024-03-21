<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="kr">

    <head>
    	<link rel="shortcut icon" href="#">
        <meta charset="utf-8">
        <title>Terapia - Physical Therapy Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
		<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

		<!-- owlCarousel -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css"/>

        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/resources/css/style.css" rel="stylesheet">
        <link href="/resources/css/common.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading/resources.</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-fluid position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light bg-white px-4 px-lg-5 py-3 py-lg-0">
                <a href="/home" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fas fa-star-of-life me-3"></i>Watchar Peida</h1>
                    <!-- <img src="/resources/img/sources/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="#" class="nav-item nav-link">영화</a>
                        <a href="#" class="nav-item nav-link">TV</a>
                        <a href="#" class="nav-item nav-link">책</a>
                        <a href="#" class="nav-item nav-link">웹툰</a>
                        <sec:authorize access="!isAuthenticated()">
                        	<a href="/loginAuth" class="nav-item nav-link" id="login">로그인</a>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_MEMBER')">
                        	<div class="nav-item dropdown" id="information">
	                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">회원정보</a>
	                            <div class="dropdown-menu m-0">
	                                <a href="#" class="dropdown-item">Appointment</a>
	                                <a href="#" class="dropdown-item">Features</a>
	                                <a href="#" class="dropdown-item">Our Blog</a>
	                                <a href="#" class="dropdown-item">Our Team</a>
	                                <a href="#" class="dropdown-item">Testimonial</a>
	                               	<form class="dropdown-item" method="post" action="/home">
	                               		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	                               		<button type="submit" class="dropdown-item">LogOut</button>	
	                               	</form>
	                            </div>
	                        </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
	                        <div class="nav-item dropdown" id="admin">
	                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">영화관리</a>
	                            <div class="dropdown-menu m-0">
	                                <a href="#" class="dropdown-item">Appointment</a>
	                                <a href="#" class="dropdown-item">Features</a>
	                                <a href="#" class="dropdown-item">Our Blog</a>
	                                <a href="#" class="dropdown-item">Our Team</a>
	                                <a href="#" class="dropdown-item">Testimonial</a>
	                                <form class="dropdown-item" method="post" action="/home">
		                               		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		                               		<button type="submit" class="dropdown-item">LogOut</button>	
	                               	</form>
	                            </div>
	                        </div>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                        	<a href="/register" class="nav-item nav-link" id="register">회원가입</a>
                        </sec:authorize>
                    </div>
                    <a href="#" class="btn btn-primary rounded-pill text-white py-2 px-4 flex-wrap flex-sm-shrink-0">예매하기</a>
                </div>
            </nav>
        </div>
        <!-- Navbar & Hero End -->