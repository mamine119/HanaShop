<%-- 
    Document   : pro_create
    Created on : Jan 19, 2021, 11:04:37 PM
    Author     : thant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
			  integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<title>Document</title>
		<script>

		</script>
	</head>

	<body>
		<c:if test="${sessionScope.USER.roleID eq 'AD'}">
			
		<div style="display: flex;justify-content: center;align-items: center;width: 100%;height: 920px;">
			<div class="shadow-lg" style="padding: 40px;width: 80%;height: 850px;">
				<div style="display: flex;justify-content: center">
					<img style="width: 120px; height: 79px;" src="./Logo.png" alt="">
					<h2 style="margin-top: 17px;">Your Cart</h2>
				</div>
				<div style="margin-top: 20px; padding-bottom: 15px;">
					<form action="MainController" method="GET">
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="inputEmail4">Product ID</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div id="key" class="input-group-text">FN</div>
									</div>
									<input type="text" class="form-control" id="proid">
									<input id="txtProId" type="hidden" name="txtProId" value="">
									
								</div>
								<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.proID}</p>
							</div>
							<div class="form-group col-md-4">
								<label for="inputPassword4">Product Name</label>
								<input class="form-control" type="test" name="txtProName" value="" id="inputPassword4">
								<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.proName}</p>
							</div>
							<div class="form-group col-md-4">
								<label for="inputPassword4">Product Price</label>
								<input type="number" name="txtPrice" value="" class="form-control" id="inputPassword4">
								<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.proPrice}</p>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">Description</label>
							<textarea class="form-control" name="txtDes" id="txtDes" rows="3"></textarea>
							<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.des}</p>
						</div>
						<div class="form-group">
							<label for="inputAddress2">Image</label>
							<input id="imgUrl" name="txtImg" value="" type="url" class="form-control">
							<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.img}</p>
							<input type="file" style="margin-top: 10px;">
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputCity">Create Date</label>
										<input type="hidden" name="txtDate" class="form-control" id="createdate1" value="" >
										<input type="date" class="form-control" id="createdate" value="" disabled="true">
										<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.creDate}</p>
									</div>
									<div class="form-group col-md-6">
										<label for="inputCity">HSD</label>
										<input type="date" name="txtHsd" value="" class="form-control" id="hsd">
										<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.hsd}</p>
									</div>
									<div class="form-group col-md-4">
										<label for="inputState">Category</label>
										<select name="txtCate" id="inputState" class="form-control" onclick="changeFunc()">
											
											
											<c:forEach items="${sessionScope.LISTCATE}" var="listCateAd">
											<c:if test="${listCateAd.cateID eq 'N001'}">
												<option value="${listCateAd.cateID}" selected="true">${listCateAd.cateName}</option>
											</c:if>
												<c:if test="${listCateAd.cateID ne 'N001'}">
												<option value="${listCateAd.cateID}">${listCateAd.cateName}</option>
											</c:if>
												
											</c:forEach>
										</select>
										<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.cate}</p>
									</div>
									<div class="form-group col-md-4">
										<label for="inputZip">Quanity</label>
										<input name="txtQuanity" value="1" type="number" class="form-control" id="inputZip">
										<p style="margin-bottom: 0px;color: red;text-align: center">${requestScope.quanity}</p>
									</div>
									<div class="form-group col-md-4" style="margin-top: 40px;padding-left: 80px;">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="txtCheck" id="gridCheck" checked="true">
											<label class="form-check-label" for="gridCheck">
												Status
											</label>
										</div>
									</div>
									<div style="display: flex;justify-content: center;margin-top: 20px;width: 100%;">
										<input type="submit" class="btn btn-success" value="Add Product" name="btnAction">
									</div>
								</div>
							</div>
							<div class="form-group col-md-4"
								 style="display: flex;justify-content: center;align-items: center;width: 80%; height: 200px; border-left: 5px solid #7dc129; margin-left: 50px;">
								<div style="width: 260px; height: 200px;display: flex;justify-content: center;align-items: center;">
									<img id="img" src="" style="width: 254px; height: 190px;" alt="">
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${sessionScope.USER.roleID ne 'AD'}">
			<div style="background-color: #fff;display: flex;justify-content: center;height: 930px;align-content: center;">
				<div>
					<p style="text-align: center">You must login with authorized permissions</p>
					<a style="margin-left: 30px;" href="MainController?btnAction=Login" class="btn btn-outline-secondary" role="button" aria-pressed="true"><i
													class="far fa-user"></i> Login</a>
				</div>
			</div>
		</c:if>

		<script>
			var date = new Date();
			var day = date.getDate();
			var month = date.getMonth() + 1;
			var year = date.getFullYear();
			if (month < 10)
				month = "0" + month;
			if (day < 10)
				day = "0" + day;
			var today = year + "-" + month + "-" + day;
			document.getElementById('createdate').value = today;
			document.getElementById('createdate1').value = today;


			$(document).ready(function () {
				$('#imgUrl').change(function () {
					document.getElementById('img').src = document.getElementById('imgUrl').value;
					document.getElementById('createdate').value = today;
					document.getElementById('createdate1').value = today;
				});
			});
			
			
			$(document).ready(function () {
				$('#proid').change(function () {
					document.getElementById('txtProId').value = document.getElementById('key').innerHTML + document.getElementById('proid').value;
				});
			});
			function changeFunc() {
				var selectBox = document.getElementById("inputState");
				var selectedValue = selectBox.options[selectBox.selectedIndex].value;
				var rs = selectedValue;
				document.getElementById('key').innerHTML = 'F' + rs[0];
				document.getElementById('txtProId').value = document.getElementById('key').innerHTML + document.getElementById('proid').value;
			}
		</script>


		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
				integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
				integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
				integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
	</body>

</html>