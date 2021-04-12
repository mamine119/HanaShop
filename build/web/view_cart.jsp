<%-- 
    Document   : view_cart
    Created on : Jan 13, 2021, 4:03:41 PM
    Author     : thant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
			  integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
		<title>Document</title>
		<style>
			body {
				background-color: #fff8ee;
			}

			.container {
				max-width: 100%;
				background-color: #fff;
				margin: 10px;
				height: 800px;
				max-height: 800px;
				border-radius: 10px;
			}

			.left {
				max-width: 870px;
				height: 760px;
				margin-top: 20px;
				margin-left: 20px;
				margin-bottom: 20px;

			}

			.right {
				width: 100%;
				height: 740px;
				margin-top: 20px;
				margin-left: 20px;
				margin-bottom: 20px;

			}

			.product {
				width: 850px;
				/* height: 170px; */
				margin: 10px;
				border: 2px solid #f2f2f2;
				border-radius: 10px;
			}

			.btn-login {
				font-size: 0.9rem;
				letter-spacing: 0.05rem;
				padding: 0.75rem 1rem;
				border-radius: 2rem;

			}
		</style>
	</head>

	<body>
		<c:if test="${sessionScope.USER.roleID eq 'US'}">
			<div style="position: relative;">
				<a href="MainController?btnAction=Back_cart" style="text-decoration: none;"><i
						style="font-size: 50px; margin-top: 20px; margin-left: 20px; color: #545b62;"
						class="fas fa-chevron-left" onmouseover="bigImg()" onmouseout="normalImg()"></i><span
						style="color: #545b62; font-size: 30px;text-decoration: none;" id="back"></span></a>
			</div>
			<div style="width: 100%;display: flex;justify-content: center;">
				<div class="container shadow-lg">
					<div class="collection">
						<div class="row">
							<div class="col-6 left" style="overflow-y: auto;">
								<p style="color: red;text-align: center;font-size: large">${requestScope.DELETEFAIL}</p>
								<div class="row" style="width: 100%;">
									<jsp:useBean id="listCart" class="duytt.dtos.Cart"></jsp:useBean>
									<jsp:setProperty name="listCart" property="*"></jsp:setProperty>
									<c:set var="listCart" value="${sessionScope.CART}"></c:set>
									<jsp:useBean id="listPro" class="duytt.dtos.Product"></jsp:useBean>
									<jsp:setProperty name="listPro" property="*"></jsp:setProperty>
									<c:forEach items="${listCart.cart.values()}" var="listPro" varStatus="counter">
										<div class="col-12 product">
											<div class="row line-prodcut">
												<div class="col-4">
													<div class="row">
														<div class="col-12">
															<img style="max-height: 120px; margin: 10px;padding-left: 40px;"
																 src="${listPro.image}"
																 alt="">
															<c:url var="delete_product" value="MainController">
																<c:param name="btnAction" value="delete_proCart"></c:param>
																<c:param name="proID" value="${listPro.proID}"></c:param>
															</c:url>
															<input type="hidden" id="txtName[${counter.count}]" value="${listPro.proName}">
															<input type="hidden" id="txtID[${counter.count}]" value="${listPro.proID}">
															<a class="close" data-dismiss="modal" aria-label="Close" 
															   role="button" data-toggle="modal" data-target="#exampleModalCenter" onclick="indexPage(${counter.count})"> <span aria-hidden="true">&times;</span></a>
															<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																<div class="modal-dialog modal-dialog-centered" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLongTitle">HanaShop-Delete Product in CART</h5>
																			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			Do you want to delete <span id="txtdelte" ></span> in your cart?
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
																			<a id="butdelete" onclick="deletepro()" type="button" href="" class="btn btn-primary">Delete</a>
																		</div>
																	</div>
																</div>
															</div>
															<p  style="text-align: center;">${listPro.proName}</p>
														</div>
													</div>
												</div>
												<div class="col-4">
													<div class="row" style="margin-top: 50px;">
														<div class="col-12" style="text-align: center;">
															<h5>Quanity</h5>
															<div style="display: flex; justify-content: center;">
																<div style="margin-top: 10px; margin-right: 10px;">
																	<c:url var="decrement" value="MainController">
																		<c:param name="btnAction" value="reduceQuanity"></c:param>
																		<c:param name="proID" value="${listPro.proID}"></c:param>
																	</c:url>
																	<a type="button" class="btn btn-outline-secondary" href="${decrement}"
																	   onclick="decrementValue()" value="Decrement Value"><i
																			class="fas fa-minus"></i></a>
																</div>
																<div style="margin-top: 10px;">
																	<input style="width: 50px;  display: inline-block;text-align: center;" class="form-control "
																		   type="text" id="number" value="${listPro.quanity}" disabled="true">
																</div>
																<div style="margin-top: 10px; margin-left: 10px;">
																	<c:url var="increment" value="MainController">
																		<c:param name="btnAction" value="increaQuanity"></c:param>
																		<c:param name="proID" value="${listPro.proID}"></c:param>
																	</c:url>
																	<a type="button" class="btn btn-outline-secondary" href="${increment}"
																	   onclick="incrementValue()" value="Increment Value"><i
																			class="fas fa-plus"></i></a>
																</div>										
															</div>
															<c:if test="${listPro.proID eq requestScope.ID}">
																<c:if test="${requestScope.Error ne 0}">
																	<p style="color: red">quanity <= ${requestScope.Error}</p>
																</c:if>
																<c:if test="${requestScope.Error eq 0}">
																	<p style="color: red">Sold out</p>
																</c:if>  
															</c:if>
														</div>
													</div>
												</div>
												<div class="col-4" >
													<div class="row" style="margin-top: 50px;">
														<div class="col-6" style="text-align: center;">
															<h5>Price</h5>
															<p style="font-size: large;padding-top: 15px;"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${listPro.price}" /></p>
														</div>
														<div class="col-6" style="text-align: center;">
															<h5>Amount</h5>
															<p style="font-size: large;padding-top: 15px;"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${listPro.price*listPro.quanity}" /></p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-6 right" >
								<div class="container1" style="height: 740px;">
									<div class="row" style="width: 100%">
										<div class="col">
											<div style="display: flex;margin-top: 20px;justify-content: center;">
												<img style="width: 120px; height: 79px;" src="./Logo.png" alt="">
												<h2 style="margin-top: 17px;">Your Cart</h2>
											</div>
											<div class="table-product" style="margin-top: 20px;max-height: 600px;overflow-y: auto;">
												<table class="table table-striped">
													<thead>
														<tr style="text-align: center;">
															<th scope="col">#</th>
															<th scope="col">Name</th>
															<th scope="col">Quanity</th>
															<th scope="col">Amount</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${listCart.cart.values()}" var="listPro" varStatus="counter">
															<tr>
																<th scope="row">${counter.count}</th>
																<td>${listPro.proName}</td>
																<td style="text-align: center;">${listPro.quanity}</td>
																<td style="text-align: center;"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${listPro.price*listPro.quanity}" /></td>

															</tr>
														</c:forEach>
														<tr class="table-success" style="text-align: center;">
															<td colspan="3">Total</td>
															<td><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${sessionScope.TOTAL}" /></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col" >
											<div style="display: flex;margin-top: 20px;justify-content: center;">
												<h2 style="margin-top: 17px;">Your Information</h2>
											</div>
											<form action="MainController">

												<div>
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">Name</label>
														<div class="col-sm-10">
															<input name="txtName" type="text" class="form-control"  placeholder="Name" value="${sessionScope.USER.fullName}">
															<p style="color: red;text-align: center">${requestScope.TXTNAME}</p>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">Email</label>
														<div class="col-sm-10">
															<input name="txtEmail" type="email" class="form-control"  placeholder="Email" value="${sessionScope.USER.email}">
															<p style="color: red;text-align: center">${requestScope.TXTEMAIL}</p>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">Phone</label>
														<div class="col-sm-10">
															<input name="txtPhone" type="text" class="form-control"  placeholder="Phone" value="${sessionScope.USER.phone}">
															<p style="color: red;text-align: center">${requestScope.TXTPHONE}</p>
														</div>
													</div>
													<div class="form-group row">
														<label  class="col-sm-2 col-form-label">Address</label>
														<div class="col-sm-10">
															<textarea name="txtAddress" class="form-control" id="exampleFormControlTextarea1" rows="5">${sessionScope.USER.address}</textarea>
															<p style="color: red;text-align: center">${requestScope.TXTADDRESS}</p>
														</div>
													</div>
												</div>
												<div style="width: 100%;display: flex;justify-content: center">
													<c:if test="${listCart.cart.size() > 0}">
														<input
															class="btn btn-lg btn-secondary btn-block btn-login text-uppercase font-weight-bold mb-2"
															type="submit" name="btnAction" value="Check Out" style="width: 154px;margin-left: 80px">
													</c:if>
														<p style="text-align: center;font-size: large">${requestScope.SUCCESSFULLY}</p>
												</div>	
											</form>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</c:if>
		<c:if test="${sessionScope.USER.roleID ne 'US'}">
			<div style="background-color: #fff;display: flex;justify-content: center;height: 930px;align-content: center;">
				<div>
					<p style="text-align: center">You must login with authorized permissions</p>
					<a style="margin-left: 30px;" href="MainController?btnAction=Login" class="btn btn-outline-secondary" role="button" aria-pressed="true"><i
							class="far fa-user"></i> Login</a>
				</div>
			</div>
		</c:if>

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
				integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
				integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
				integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		<script>
																		   function bigImg() {
																			   document.getElementById('back').innerHTML = 'Back';

																		   }
																		   function normalImg() {
																			   document.getElementById('back').innerHTML = '';

																		   }
																		   function incrementValue() {
																			   var value = parseInt(document.getElementById('number').value, 10);
																			   value = isNaN(value) ? 0 : value;
																			   value++;
																			   document.getElementById('number').value = value;
																		   }
																		   function decrementValue() {
																			   var value = parseInt(document.getElementById('number').value, 10);
																			   value = isNaN(value) ? 0 : value;
																			   value--;
																			   document.getElementById('number').value = value;
																		   }
																		   var index;
																		   function indexPage(ind)
																		   {
																			   index = ind;
																			   document.getElementById('txtdelte').innerHTML = document.getElementById('txtName[' + ind + ']').value;
																		   }
																		   function deletepro()
																		   {
																			   var id = document.getElementById('txtID[' + index + ']').value;
																			   document.getElementById('butdelete').href = "MainController?btnAction=delete_proCart&proID=" + id;
																		   }
		</script>
	</body>

</html>
