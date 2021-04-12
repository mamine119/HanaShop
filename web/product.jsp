<%-- 
    Document   : product
    Created on : Jan 10, 2021, 3:14:51 PM
    Author     : thant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
			  integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
        <title>Prodcut</title><style>
			* {
				box-sizing: border-box;
			}

			html {
				font-family: "Cairo", sans-serif !important;
				-webkit-font-smoothing: antialiased;
			}

			ul {
				list-style: none;
			}

			li {
				float: left;

			}

			.note {
				margin-left: 10px;
				border-left: 1px solid #7e7e7e;
				padding-left: 10px;
			}

			.header_top {
				background: #f5f5f5;
			}

			.header_top_right__auth {
				vertical-align: middle;
			}

			.nav-item {
				font-weight: bold;
				font-size: 20px;
				margin-right: 50px;
				width: 100px;
			}

			.nav-item:last-child {
				margin-left: 40px;
				margin-right: 120px;
				font-size: medium;
				width: 150px !important;
				color: #46aed9;
			}

			a.fa-shopping-bag {
				position: relative;
				font-size: 2em;
				cursor: pointer;
			}

			span.fa-circle {
				position: absolute;
				font-size: 0.6em;
				top: -2px;
				color: rgb(138, 138, 138);
				right: -12px;
			}

			span.num {
				position: absolute;
				font-size: 0.4em;
				top: 2px;
				color: #fff;
				right: -6px;

			}

			.active,
			.nav-link:hover {
				color: #7dc129 !important;
			}

			.categories_all {
				background: #7dc129;
				position: relative;
				padding: 10px 25px 10px 40px;
				cursor: pointer;
			}

			/*			.dropdown-menu {
							display: block;
							visibility: hidden;
							opacity: 0;
							transform: translateY(100px);
							transition: .5s ease all;
						}
			
						.dropdown-menu.show {
							display: block;
							visibility: visible;
							opacity: 1;
							transform: translateY(0px);
							transition: .5s ease all;
						}
			
						.dropdown-item:hover {
							background-color: #7e7e7e;
							color: #fff;
						}*/

			.categories_all {
				border: 1px solid #fff;
				border-radius: 5px;
				font-size: 20px;
				font-weight: bold;
			}

			.categories ul {
				border: 1px solid #ebebeb;
				padding-left: 40px;
				padding-top: 10px;
				padding-bottom: 12px;
				border-radius: 5px;
			}

			.items-sub-left {
				display: block;
				font-size: larger;
				text-decoration: none;
				width: 100%;
				padding-bottom: 10px;
			}

			.items-sub-left>a {
				text-decoration: none;
				color: #000;
			}

			.items-sub-left>a:hover {
				text-decoration: underline;
			}

			.hero__search {
				overflow: hidden;
				margin-bottom: 30px;
				margin-left: 100px;
			}

			.hero__search__form {
				width: 610px;
				height: 50px;
				border: 1px solid #ebebeb;
				position: relative;
				float: left;
			}

			.hero__search__form form .hero__search__categories {
				width: 30%;
				float: left;
				font-size: 16px;
				color: #1c1c1c;
				font-weight: 700;
				padding-left: 18px;
				padding-top: 11px;
				position: relative;
			}

			.hero__search__form form .hero__search__categories:after {
				position: absolute;
				right: 0;
				top: 14px;
				height: 20px;
				width: 1px;
				background: #000000;
				opacity: 0.1;
				content: "";
			}

			.hero__search__form form .hero__search__categories span {
				position: absolute;
				right: 14px;
				top: 14px;
			}

			.hero__search__form form input {
				width: 70%;
				border: none;
				height: 48px;
				font-size: 16px;
				color: #b2b2b2;
				padding-left: 20px;
			}

			.hero__search__form form input::placeholder {
				color: #b2b2b2;
			}

			.hero__search__form form button {
				position: absolute;
				right: 0;
				top: -1px;
				height: 50px;
			}

			.site-btn {
				font-size: 14px;
				color: #ffffff;
				font-weight: 800;
				text-transform: uppercase;
				display: inline-block;
				padding: 13px 30px 12px;
				background: #7dc129;
				border: none;
			}

			.list-inline>li {
				margin-left: 20px;
				margin-right: 20px;
			}

			.list-inline>li>a {
				color: #000;
				text-decoration: none;
				border-bottom: 3px solid #fff;
			}

			.list-inline>li>a:hover {
				border-bottom: 3px solid #7dc129;
			}

			.icon-product:hover {
				color: #7dc129;
				text-decoration: none;
			}

			.icon-product {
				text-decoration: none;
				color: #7e7e7e;
			}
			.text-name-product {
				text-decoration: none;
				color: #7e7e7e
			}
			.text-name-product:hover{
				color: #7dc129
			}
			#header-fixed { 
				position: fixed; 
				top: 0px; 
				display: none;

			}
		</style>
	</head>
	<body>
		<c:if test="${sessionScope.USER.roleID ne 'AD'}">
			<header>
				<c:if test="${sessionScope.SUCCESS!=null}">
					<div class="alert alert-success alert-dismissible" style="text-align: center">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Hello ${sessionScope.USER.fullName}. WelCome back to HanaShop!</strong> Wish you a happy purchase.
					</div>
				</c:if>
				<div class="header_top" style="margin: 0 auto;">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="header_top_left" style="padding-top: 20px;">
									<ul>
										<li><i class="far fa-envelope"></i> duyttse140971@fpt.edu.vn</li>
										<li class="note">Free Shipping for all Order of $99</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 col-md-6" style="padding-bottom: 16px; text-align: center;">
								<div class="header__top__right">
									<div class="header_top_right_social">
										<ul>
											<li style="padding-top: 4px; color: #7dc129;"><i style="color: #000;"
																							 class="fas fa-phone-alt"></i>
												0989-123-456</li>
											<li style="padding-top: 4px;" class="note">Support 24/7</li>
										</ul>
									</div>
									<div class="header_top_right__auth">
										<c:if test="${sessionScope.USER==null}">
											<a style="margin-left: 30px;" href="MainController?btnAction=Login" class="btn btn-outline-secondary" role="button" aria-pressed="true"><i
													class="far fa-user"></i> Login</a>
											</c:if>
											<c:if test="${sessionScope.USER!=null}">
											<a style="margin-left: 30px;" href="#" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" role="button" aria-pressed="true"><i
													class="far fa-user"></i> ${sessionScope.USER.fullName}</a>



											<div class="dropdown-menu dropdown-menu-right dropdown-default"
												 aria-labelledby="navbarDropdownMenuLink-333">
												<a class="dropdown-item" href="MainController?btnAction=history">History</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="MainController?btnAction=Logout" style="color: rgb(255, 0, 0);">Sign
													out</a>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="header_bottom">
						<nav class="navbar navbar-expand-lg navbar-light bg-light static-top mb-5"
							 style="background-color: #fff !important; height: 83px;">
							<div class="container">
								<a class="navbar-brand" href="#"><img src="./Logo.png" alt="Logo" style="width: 120px;"></a>
								<button class="navbar-toggler" type="button" data-toggle="collapse"
										data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
										aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse" id="navbarResponsive">
									<ul class="navbar-nav ml-auto">
										<li class="nav-item">
											<a class="nav-link" href="MainController?btnAction=Home">HOME

											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link active" href="MainController?btnAction=Search&minPrice=&maxPrice=&cate=All&txtSearch=&index=1">PRODUCT</a>
											<span class="sr-only">(current)</span>
										</li>
										<li class="nav-item" style="margin-left: 20px;">
											<a class="nav-link" href="#">CONTACT</a>
										</li>
										<c:if test="${sessionScope.USER!=null}">
											<li class="nav-item">
												<a class="fas fa-shopping-bag" href="MainController?btnAction=view_cart"
												   style="color: #7dc129; padding-top: 10px;float: left;">
													<span class="fa fa-circle"></span>
													<c:if test="${sessionScope.COUNT != null}">
														<span class="num">${sessionScope.COUNT}</span>
													</c:if>
													<c:if test="${sessionScope.COUNT == null}">
														<span class="num">0</span>
													</c:if>	
												</a>
												<c:if test="${sessionScope.TOTAL != null}">
													<p style="margin-left: 50px !important;margin-top: 16px; color: #000;width: 130px">items: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${sessionScope.TOTAL}" />đ
													</p>
												</c:if>
												<c:if test="${sessionScope.TOTAL == null}">
													<p style="margin-left: 50px !important;margin-top: 16px; color: #000;width: 130px">items:0đ
													</c:if>	

											</li>
										</c:if>
									</ul>

								</div>
							</div>
						</nav>
					</div>
			</header>
			<div class="container" style="margin-bottom: 30px;">
				<div class="row">
					<div class="col-lg-3">
						<div class="categories">
							<div class="categories_all">
								<i class="fa fa-bars"></i>
								<span>All departments</span>
							</div>
							<ul class="item_left" style="display: inline-block;">
								<li class="items-sub-left"><a href="#">Fresh Meat</a></li>
								<li class="items-sub-left"><a href="#">Vegetables</a></li>
								<li class="items-sub-left"><a href="#">Fruit &amp; Nut Gifts</a></li>
								<li class="items-sub-left"><a href="#">Fresh Berries</a></li>
								<li class="items-sub-left"><a href="#">Ocean Foods</a></li>
								<li class="items-sub-left"><a href="#">Fresh Meat</a></li>
								<li class="items-sub-left"><a href="#">Vegetables</a></li>
								<li class="items-sub-left"><a href="#">Fruit &amp; Nut Gifts</a></li>
								<li class="items-sub-left"><a href="#">Fresh Berries</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="hero__search">
							<div class="hero__search__form">
								<form action="#">
									<div class="hero__search__categories">
										All Categories
										<i class="fas fa-chevron-down"></i>
									</div>
									<input type="text" placeholder="What do yo u need?">
									<button type="submit" class="site-btn">SEARCH</button>
								</form>
							</div>
						</div>
						<div class="hero__item set-bg">
							<img src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/rau-an-toan-4kfarm-08122020114741.jpg"
								 alt="Picture" style="width: 95%; margin-left: 7px; margin-bottom: 10px;">
							<img src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/ca-phe-viva-huong-vi-dam-da-05012021204413.jpg"
								 alt="picture" style="width: 96%;">
						</div>
					</div>
				</div>
			</div>
			<div class="product" style="text-align: center;">
				<h2>- We Have ... -</h2>
				<hr style="width: 10%;border-bottom: 5px solid #7dc129;">
			</div>
			<form action="MainController" method="GET"  class="row search-product" style="width: 1903px; display: flex; justify-content: center; margin-bottom: 30px;">
				<div style="width: 133px;text-align: center;margin-right: 15px;">
					<input name="minPrice" style="width: 135px;  display: inline-block;" class="form-control" type="number"
						   value="${sessionScope.MINPRICE}" step="500">
					<p style="color: red">${requestScope.MINPRICEERROR}</p>
				</div>
				<span style="padding-top: 6px;"><i class="fas fa-minus"></i></span>
				<div style="width: 133px;text-align: center; margin-left: 15px;">
					<input name="maxPrice" style="width: 135px; display: inline-block;" class="form-control " type="number" value="${sessionScope.MAXPRICE}"
						   step="500">
					<p style="color: red">${requestScope.MAXPRICEERROR}</p>
				</div>
				<span style="padding-top: 6px; padding-left: 5px;">VNĐ</span>
				<div>
					<jsp:useBean id="listCate" class="duytt.dtos.Category"></jsp:useBean>
					<jsp:setProperty name="listCate" property="*"></jsp:setProperty>
						<select name="cate" style="width: 180px; margin-left: 20px;" id="inputState" class="form-control">
						<c:if test="${sessionScope.CATE == null}">
							<option value="All" selected>All</option>
							<c:forEach items="${sessionScope.LISTCATE}" var="listCate">
								<option value="${listCate.cateID}">${listCate.cateName}</option>
							</c:forEach>
						</c:if>
						<c:if test="${sessionScope.CATE != null}">
							<option value="All">All</option>
							<c:forEach items="${sessionScope.LISTCATE}" var="listCate">
								<c:if test="${sessionScope.CATE eq listCate.cateID}">
									<option value="${listCate.cateID}" selected="true">${listCate.cateName}</option>
								</c:if>
								<c:if test="${sessionScope.CATE ne listCate.cateID}">
									<option value="${listCate.cateID}" selected="true">${listCate.cateName}</option>
								</c:if>
							</c:forEach>
						</c:if>
					</select>
						<p style="color: red">${requestScope.CATEERROR}</p>
				</div>
				<div style="text-align: center;">
					<input style="width: 300px; margin-left: 20px;" class="form-control" type="text" name="txtSearch" value="${sessionScope.TXTSEARCH}"
						   placeholder="Enter Product's name">
					<p style="color: red">${requestScope.SEARCHERROR}</p>
				</div>
				<div>
					<input type="hidden" name="index" value="1">
					<input style="margin-left: 15px;" type="submit" name="btnAction" value="Search" class="btn btn-success">
				</div>
			</form>
			<div style="display: flex; justify-content: center;">
				<div style="width: 1510px;display: flex;flex-wrap: wrap; justify-content: center;"
					 class="product-show">
					<jsp:useBean id="listProdcut" class="duytt.dtos.Product"></jsp:useBean>
					<jsp:setProperty name="listProdcut" property="*"></jsp:setProperty>
					<c:forEach items="${sessionScope.LISTPRODUCT}" var="listProdcut">
						<div class="products"
							 style="border: 1px solid #7dc129;border-radius: 10px ;max-width: 300px; margin: 10px;">
							<div style="text-align: center;">
								<a href="#"><img style="max-width: 300px;max-height: 200px;padding: 5px;"src="${listProdcut.image}"alt=""></a>
								<a class="text-name-product" href="#"><p style="max-width: 250px;padding-left: 15px;padding-right: 10px;height: 80px">${listProdcut.proName}</p></a>
							</div>
							<hr style="width: 80%;border-bottom: 2px solid #7dc129;">
							<p style="text-align: center">Date: ${listProdcut.createDate}</p>
							<p style="text-align: center;font-size: large "><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${listProdcut.price}" /> VNĐ</p>
							<c:if test="${sessionScope.USER.roleID eq 'US'}">
								<div class="row" style="padding: 15px">
									<div class="col-6" style="display: flex; justify-content: center;">
										<a class="icon-product" href=""><i style="font-size: 30px;"class="fas fa-heart"></i><br>Like</a>
									</div>
									<div class="col-6" style="display: flex; justify-content: center;padding-left: 0 !important;">
										<c:url var="cartAdd" value="MainController">
											<c:param name="btnAction" value="Addtocart"></c:param>
											<c:param name="proID" value="${listProdcut.proID}"></c:param>

											<c:param name="minPrice" value="${sessionScope.MINPRICE}"></c:param>
											<c:param name="maxPrice" value="${sessionScope.MAXPRICE}"></c:param>
											<c:param name="cate" value="${sessionScope.CATE}"></c:param>
											<c:param name="txtSearch" value="${sessionScope.TXTSEARCH}"></c:param>
											<c:param name="index" value="${sessionScope.INDEXPAGE}"></c:param>
										</c:url>
										<a class="icon-product" style="text-align: center;" href="${cartAdd}"><i style="font-size: 30px;"
																												 class="fas fa-shopping-basket"></i><br>Add to Cart</a>
									</div>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
			<nav aria-label="..." style="display: flex; justify-content: center; margin-top: 15px;">
				<ul class="pagination pagination-lg">
					<c:if test="${sessionScope.INDEX>=2}">
						<c:forEach begin="1" end="${sessionScope.INDEX}" var="count">
							<c:if test="${count == sessionScope.INDEXPAGE}">
								<li class="page-item active"><a class="page-link" href="MainController?btnAction=Search&minPrice=${sessionScope.MINPRICE}&maxPrice=${sessionScope.MAXPRICE}&cate=${sessionScope.CATE}&txtSearch=${sessionScope.TXTSEARCH}&index=${count}">${count}</a></li>
								</c:if>
								<c:if test="${count != sessionScope.INDEXPAGE}">
								<li class="page-item"><a class="page-link" href="MainController?btnAction=Search&minPrice=${sessionScope.MINPRICE}&maxPrice=${sessionScope.MAXPRICE}&cate=${sessionScope.CATE}&txtSearch=${sessionScope.TXTSEARCH}&index=${count}">${count}</a></li>
								</c:if>
							</c:forEach>
						</c:if>
				</ul>
			</nav>
		</c:if>
		<c:if test="${sessionScope.USER.roleID eq 'AD'}">
			<header>
				<c:if test="${sessionScope.SUCCESS!=null}">
					<div class="alert alert-success alert-dismissible" style="text-align: center">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Hello ${sessionScope.USER.fullName}. WelCome back to HanaShop!</strong> Wish you a happy purchase.
					</div>
				</c:if>
				<div class="header_top" style="margin: 0 auto;">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="header_top_left" style="padding-top: 20px;">
									<ul>
										<li>                   </li>
										<li class="note">                               </li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 col-md-6" style="padding-bottom: 16px; text-align: center;">
								<div class="header__top__right">
									<div class="header_top_right_social">
										<ul>
											<li style="padding-top: 4px; color: #7dc129;"></li>
											<li style="padding-top: 4px;" class="note"></li>
										</ul>
									</div>
									<div class="header_top_right__auth">
										<c:if test="${sessionScope.USER==null}">
											<a style="margin-left: 30px;" href="MainController?btnAction=Login" class="btn btn-outline-secondary" role="button" aria-pressed="true"><i
													class="far fa-user"></i> Login</a>
											</c:if>
											<c:if test="${sessionScope.USER!=null}">
											<a style="margin-left: 30px;" href="#" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" role="button" aria-pressed="true"><i
													class="far fa-user"></i> ${sessionScope.USER.fullName}</a>



											<div class="dropdown-menu dropdown-menu-right dropdown-default"
												 aria-labelledby="navbarDropdownMenuLink-333">


												<a class="dropdown-item" href="MainController?btnAction=Logout" style="color: rgb(255, 0, 0);">Sign
													out</a>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="header_bottom">
						<nav class="navbar navbar-expand-lg navbar-light bg-light static-top mb-5"
							 style="background-color: #fff !important; height: 83px;">
							<div class="container" style="display: flex;justify-content: center;">
								<a class="navbar-brand" href="#"><img src="./Logo.png" alt="Logo" style="width: 120px;"></a>
								<button class="navbar-toggler" type="button" data-toggle="collapse"
										data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
										aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>

							</div>
						</nav>
					</div>
			</header>


			<h2 style="text-align: center;">- Admin Page ... -</h2>
			<hr style="width: 10%;border-bottom: 5px solid #7dc129;">

		</div>

		<form action="MainController" class="row search-product" style="width: 1903px; display: flex; justify-content: center; margin-bottom: 30px;">
			<div style="width: 133px;text-align: center;margin-right: 15px;">
				<input name="minPrice" style="width: 135px;  display: inline-block;" class="form-control" type="number"
					   value="${sessionScope.MINPRICE}" step="500">
				
				<p style="color: red">${requestScope.MINPRICEERROR}</p>
			</div>
			<span style="padding-top: 6px;"><i class="fas fa-minus"></i></span>
			<div style="width: 133px;text-align: center; margin-left: 15px;">
				<input name="maxPrice" style="width: 135px; display: inline-block;" class="form-control " type="number" value="${sessionScope.MAXPRICE}"
					   step="500">
			<p style="color: red">${requestScope.MAXPRICEERROR}</p>
			</div>
			<span style="padding-top: 6px; padding-left: 5px;">VNĐ</span>
			<div>
				<jsp:useBean id="listCateAd" class="duytt.dtos.Category"></jsp:useBean>
				<jsp:setProperty name="listCateAd" property="*"></jsp:setProperty>
					<select name="cate" style="width: 180px; margin-left: 20px;" id="inputState" class="form-control">
					<c:if test="${sessionScope.CATE == null}">
						<option value="All" selected>All</option>
						<c:forEach items="${sessionScope.LISTCATE}" var="listCateAd">
							<option value="${listCateAd.cateID}">${listCateAd.cateName}</option>
						</c:forEach>
					</c:if>
					<c:if test="${sessionScope.CATE != null}">
						<option value="All">All</option>
						<c:forEach items="${sessionScope.LISTCATE}" var="listCateAd">
							<c:if test="${sessionScope.CATE eq listCateAd.cateID}">
								<option value="${listCateAd.cateID}" selected="true">${listCateAd.cateName}</option>
							</c:if>
							<c:if test="${sessionScope.CATE ne listCateAd.cateID}">
								<option value="${listCateAd.cateID}" >${listCateAd.cateName}</option>
							</c:if>

						</c:forEach>
					</c:if>
				</select>
					<p style="color: red">${requestScope.CATEERROR}</p>
			</div>
			<div style="text-align: center;">
				<input style="width: 300px; margin-left: 20px;" class="form-control" type="text" name="txtSearch" value="${sessionScope.TXTSEARCH}"
					   placeholder="Enter Product's name">
				<p style="color: red">${requestScope.SEARCHERROR}</p>
			</div>
			<div>
				<input type="hidden" name="index" value="1">
				<input type="hidden" name="btnAction" value="SearchAd">
				<button style="margin-left: 15px;" type="submit" class="btn btn-success">Search</button>
			</div>
			<div>
				<a style="margin-left: 15px;" href="MainController?btnAction=addProduct" class="btn btn-secondary">Add Product</a>
			</div>
		</form>

		<div style="display: flex; justify-content: center;">

			<div style="width: 100%;" class="product-show">


				<table class="table table-striped" id="table-1" style="width: 100%">
					<thead >
						<tr style="text-align: center;">
							<th style="width: 22px" scope="col">#</th>
							<th style="width: 288px" scope="col">Image</th>
							<th style="width: 61px"scope="col">ProID</th>
							<th style="width: 164px" scope="col">ProName</th>
							<th style="width: 71px" scope="col">Price</th>
							<th style="width: 438px" scope="col">Descript</th>
							<th style="width: 93px" scope="col">CreateDate</th>
							<th style="width: 93px" scope="col">HSD</th>
							<th style="width: 67px" scope="col">Quanity</th>
							<th style="width: 53px" scope="col">Status</th>
							<th style="width: 219px" scope="col">Category</th>
							<th style="width: 70px" scope="col">Update</th>
							<th style="width: 69px" scope="col">
								<input type="button" name="btnAction" value="Remove" data-toggle="modal" data-target="#exampleModalCenter12" class="btn btn-secondary">
								<div class="modal fade" id="exampleModalCenter12" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">REMOVE PRODUCTS</h5>
												<button id="primaryButton1" type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<p>Are you sure to remove products?</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												<form action="MainController">
													<input type="hidden" id="txtremove" name="txtremove" value="">
													<input type="hidden"  name="minPrice" value="${sessionScope.MINPRICE}">
													<input type="hidden"  name="maxPrice" value="${sessionScope.MAXPRICE}">
													<input type="hidden"  name="cate" value="${sessionScope.CATE}">
													<input type="hidden"  name="txtSearch" value="${sessionScope.TXTSEARCH}">
													<input type="hidden"  name="index" value="${sessionScope.INDEXPAGE}">
													<input type="submit" name="btnAction" value="Remove" class="btn btn-secondary">
												</form>
											</div>
										</div>
									</div>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>

						<jsp:useBean id="listProdcutAd" class="duytt.dtos.Product"></jsp:useBean>
						<jsp:setProperty name="listProdcutAd" property="*"></jsp:setProperty>
						<c:forEach items="${sessionScope.LISTPRODUCT}" var="listProdcutAd" varStatus="counter">

							<tr><form action="MainController" method="GET">
							<input type="hidden" name="txtProId" value="${listProdcutAd.proID}">
							<th style="width: 22px" scope="row">${counter.count}</th>
							<td style="width: 286px" class="col-12">
								<img id="url-exactly[${counter.count}]" style="max-width: 253px;max-height: 190px;padding: 5px;cursor: pointer"
									 src="${listProdcutAd.image}"
									 alt="" data-toggle="modal" data-target="#exampleModalCenter" onclick="indexPage(${counter.count})">
								<input name="txtUrlImage" id="url-textEx[${counter.count}]"   data-toggle="modal" data-target="#exampleModalCenter" style="width: 245px; margin-left: 7px; border: none;border-bottom: 1px solid #7e7e7e;background: none !important;cursor: pointer" type="text" value="${listProdcutAd.image}">
								<c:if test="${requestScope.proID eq listProdcutAd.proID}">
									<p style="color: red;text-align: center;">${requestScope.img}</p>
								</c:if>
								<!-- Modal -->
								<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">Url Image</h5>
												<button id="primaryButton" type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span  aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<input id="url-image" style="width: 100%" type="url" value="${listProdcutAd.image}">
												<hr>
												<input type="file" id="i_file" onchange="readURL(this)" value="" accept="image/x-png,image/gif,image/jpeg">
												<br>
												<img id="img-file" src="" width="200" style="max-width: 300px;max-height: 200px;padding: 5px;" />
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												<button type="button" onclick="deletetext()" class="btn btn-success">Reset</button>
												<button id="close-modal" onclick="getCategoryIndex()" type="button" class="btn btn-primary">OK</button>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td style="width: 61px">${listProdcutAd.proID}</td>
							<td style="width: 164px" >
								<input id="hidden-txtProName[${counter.count}]" type="hidden" name="txtProName" value="${listProdcutAd.proName}">
								<p onclick="indexPageName(${counter.count})" id="proName[${counter.count}]" data-toggle="modal" data-target="#exampleModalCenter1" style="border: none;text-align: center; border-bottom: 1px solid #000;background: none !important;cursor: pointer"> ${listProdcutAd.proName}</p>
								<c:if test="${requestScope.proID eq listProdcutAd.proID}">
									<p style="color: red;text-align: center;">${requestScope.proName}</p>
								</c:if>
								<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">proName</h5>
												<button id="closes" type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<textarea class="form-control" rows="5" id="proName-temp"></textarea>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												<button onclick="changeText()" type="button" class="btn btn-success">OK</button>
											</div>
										</div>
									</div>
								</div>
							</td>

							<td style="width: 100px" ><input style="width: 100px" type="number" value="${listProdcutAd.price}" name="txtPrice">
								<c:if test="${requestScope.proID eq listProdcutAd.proID}">
									<p style="color: red;text-align: center;">${requestScope.proPrice}</p>
								</c:if>
							</td>
							<td style="width: 426px;">
								<input id="hidden-txtProDes[${counter.count}]" type="hidden" name="txtProDes" value="${listProdcutAd.descript}">
								<p onclick="indexPageDes(${counter.count})" id="proDes[${counter.count}]" style="cursor: pointer;border: none; border-bottom: 1px solid #000;background: none !important" onclick="indexPage(${counter.count})" data-toggle="modal" data-target="#exampleModalCenter2">${listProdcutAd.descript}</p>
								<c:if test="${requestScope.proID eq listProdcutAd.proID}">
									<p style="color: red;text-align: center;">${requestScope.des}</p>
								</c:if>
								<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">Pro Description</h5>
												<button id="primaryButton2" type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<textarea class="form-control" rows="10" id="proDes-temp"></textarea>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												<button onclick="changeDes()" type="button" class="btn btn-success">Save changes</button>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td style="text-align: center;width: 140px">
								<input style="width: 140px" type="date" disabled="true" value="${listProdcutAd.createDate}">
								<input type="hidden" name="txtCreateDate" value="${listProdcutAd.createDate}">
							</td>
							<td style="text-align: center;width: 140px">
								<input style="width: 140px" type="date" name="txtHsd" value="${listProdcutAd.hsd}">
								<c:if test="${requestScope.proID eq listProdcutAd.proID}">
									<p style="color: red;text-align: center;">${requestScope.hsd}</p>
								</c:if>
							</td>
							<td style="text-align: center; width: 66px">
								<input style="width: 60px;text-align: center" type="number" name="txtQuanity" value="${listProdcutAd.quanity}">
								<c:if test="${requestScope.proID eq listProdcutAd.proID}">
									<p style="color: red;text-align: center;">${requestScope.quanity}</p>
								</c:if>
							</td>
							<td style="text-align: center; width: 53px">
								<c:if test="${listProdcutAd.status}">
									<input name="txtCheckBox" type="checkbox" checked="true">
								</c:if>
								<c:if test="${!listProdcutAd.status}">
									<input name="txtCheckBox"  type="checkbox" >
								</c:if>
							</td>

							<td style="width: 219px">
								<div>
									<select name="cate" style="width: 180px; margin-left: 20px;" id="inputState" class="form-control">
										<c:forEach items="${sessionScope.LISTCATE}" var="listCateAd">
											<c:if test="${listProdcutAd.cateId eq listCateAd.cateID}">
												<option value="${listCateAd.cateID}" selected="true">${listCateAd.cateName}</option>
											</c:if>
												<c:if test="${listProdcutAd.cateId ne listCateAd.cateID}">
												<option value="${listCateAd.cateID}" >${listCateAd.cateName}</option>
											</c:if>
											
										</c:forEach>

									</select>
								</div>
								<c:if test="${requestScope.proID eq listProdcutAd.proID}">
									<p style="color: red;text-align: center;">${requestScope.cate}</p>
								</c:if>
							</td>
							<td style="display: flex; justify-content: center;width: 80px"><input type="submit" style="width: 80px" class="btn btn-secondary" value="Update" name="btnAction"></td>
							<td style="text-align: center;width: 69px">
								<c:if test="${listProdcutAd.status == true}">
									<input id="" onclick="saveCheck(${counter.count})" type="checkbox">
								</c:if>
								<c:if test="${listProdcutAd.status == false}">
									<input id="" disabled="" type="checkbox">
								</c:if>
								<input type="hidden" id="ID[${counter.count}]" value="${listProdcutAd.proID}">
							</td>
						</form>
						</tr>


					</c:forEach>
					</tbody>
				</table>
				<table class="table table-striped" id="header-fixed" style="width: 100%">
					<thead style="background-color: #fff">
						<tr style="text-align: center;">
							<th style="width: 22px" scope="col">#</th>
							<th style="width: 288px" scope="col">Image</th>
							<th style="width: 61px"scope="col">ProID</th>
							<th style="width: 164px" scope="col">ProName</th>
							<th style="width: 100px" scope="col">Price</th>
							<th style="width: 438px" scope="col">Descript</th>
							<th style="width: 140px" scope="col">CreateDate</th>
							<th style="width: 140px" scope="col">HSD</th>
							<th style="width: 67px" scope="col">Quanity</th>
							<th style="width: 53px" scope="col">Status</th>
							<th style="width: 219px" scope="col">Category</th>
							<th style="width: 70px" scope="col">Update</th>
							<th style="width: 69px" scope="col">
								<form action="MainController">
									<input type="hidden" id="txtremove1" name="txtremove" value="">
									<input type="submit" name="btnAction" value="Remove" class="btn btn-secondary">
								</form>
							</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>

		<nav aria-label="..." style="display: flex; justify-content: center; margin-top: 15px;">
			<ul class="pagination pagination-lg">
				<c:if test="${sessionScope.INDEX>=2}">
					<c:forEach begin="1" end="${sessionScope.INDEX}" var="count">
						<c:if test="${count == sessionScope.INDEXPAGE}">
							<li class="page-item active"><a class="page-link" href="MainController?btnAction=SearchAd&minPrice=${sessionScope.MINPRICE}&maxPrice=${sessionScope.MAXPRICE}&cate=${sessionScope.CATE}&txtSearch=${sessionScope.TXTSEARCH}&index=${count}">${count}</a></li>
							</c:if>
							<c:if test="${count != sessionScope.INDEXPAGE}">
							<li class="page-item"><a class="page-link" href="MainController?btnAction=SearchAd&minPrice=${sessionScope.MINPRICE}&maxPrice=${sessionScope.MAXPRICE}&cate=${sessionScope.CATE}&txtSearch=${sessionScope.TXTSEARCH}&index=${count}">${count}</a></li>
							</c:if>
						</c:forEach>
					</c:if>
			</ul>
		</nav>
	</c:if>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
			integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
			integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
	<script>
										var tmp;
										var tableOffset = $("#table-1").offset().top;
										var $fixedHeader = $("#header-fixed");
										$(window).bind("scroll", function () {
											var offset = $(this).scrollTop();
											if (offset >= tableOffset && $fixedHeader.is(":hidden")) {
												$fixedHeader.show();
											} else if (offset < tableOffset) {
												$fixedHeader.hide();
											}
										});
										var index;
										var indexName;
										var indexDes
										function indexPage(e)
										{
											document.getElementById('url-image').value = document.getElementById('url-textEx[' + e + ']').value;
											document.getElementById('i_file').value = null;
											document.getElementById('img-file').src = "";
											index = e;
										}
										function indexPageName(e)
										{
											console.log(e);
											indexName = e;

											document.getElementById('proName-temp').value = document.getElementById('proName[' + e + ']').innerHTML;
//										console.log(document.getElementById('proName-temp').innerHTML = document.getElementById('proName[' + e + ']').innerHTML);;

										}
										function indexPageDes(e)
										{

											indexName = e;

											document.getElementById('proDes-temp').value = document.getElementById('proDes[' + e + ']').innerHTML;
//										console.log(document.getElementById('proName-temp').innerHTML = document.getElementById('proName[' + e + ']').innerHTML);;

										}
										function getCategoryIndex()
										{

											document.getElementById('primaryButton').click();
//															document.getElementById('url-exactly['+document.getElementById('proIndex').value+']').src=tmppath;
//															document.getElementById('url-textEx['+document.getElementById('proIndex').value+']').value=tmppath;
											document.getElementById('url-textEx[' + index + ']').value = document.getElementById('url-image').value;
											document.getElementById('url-exactly[' + index + ']').src = document.getElementById('url-image').value;


										}
										function changeText()
										{
											document.getElementById('closes').click();
											document.getElementById('proName[' + indexName + ']').innerHTML = document.getElementById('proName-temp').value;
											document.getElementById('hidden-txtProName[' + indexName + ']').value = document.getElementById('proName-temp').value;

										}
										function changeDes()
										{
											document.getElementById('primaryButton2').click();
											document.getElementById('proDes[' + indexName + ']').innerHTML = document.getElementById('proDes-temp').value;
											document.getElementById('hidden-txtProDes[' + indexName + ']').value = document.getElementById('proDes-temp').value;

										}
										function deletetext()
										{
											document.getElementById('url-image').value = "";
											document.getElementById('i_file').value = null;
											document.getElementById('img-file').src = "";
										}

//													$('#i_file').change(function (event) {
//														tmppath = URL.createObjectURL(event.target.files[0]);
//
//														$("#img-file").fadeIn("fast").attr('src', URL.createObjectURL(event.target.files[0]));
//														document.getElementById('url-image').value = tmppath;
//													});
										function saveCheck(e)
										{
											var str = document.getElementById('txtremove').value;
											document.getElementById('txtremove').value = str + document.getElementById('ID[' + e + ']').value + ";";
											document.getElementById('txtremove1').value = document.getElementById('txtremove').value;
											console.log(document.getElementById('txtremove').value);
										}

										function readURL(input) {
											if (input.files && input.files[0]) {
												var reader = new FileReader();

												reader.addEventListener(
														"load",
														function () {
															var avatarImg = new Image();
															src = reader.result;
															tmp = src;
															avatarImg.src = src;
															document.getElementById("img-file").src = src;
															document.getElementById('url-image').value = src;

														},
														false
														);

												reader.readAsDataURL(input.files[0]);
											}
										}






	</script>
</body>


</html>
