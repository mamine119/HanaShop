<%-- 
    Document   : history
    Created on : Jan 17, 2021, 2:43:08 PM
    Author     : thant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                max-width: 1210px;
                height: 760px;
                margin-top: 20px;
                margin-left: 20px;
                margin-bottom: 20px;

            }

            .right {
                /* max-width: 415px; */
                height: 760px;
                margin-top: 20px;
                margin-left: 20px;
                margin-bottom: 20px;

            }

            .product {
                width: 850px;
                /* height: 170px; */
                margin: 10px;
                /* border: 2px solid #f2f2f2; */
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
        <c:if test="${sessionScope.USER.roleID eq 'AD'}">
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
                            <div class="col-sm-6 left" style="overflow-y: auto;">
                                <div class="row" style="width: 90%;">
                                    <jsp:useBean id="list" class="duytt.dtos.History"></jsp:useBean>
                                    <jsp:setProperty name="list" property="*"></jsp:setProperty>
                                    <c:forEach items="${sessionScope.LISTHIS}" var="list">
                                        <table class="table table-borderless">
                                            <thead>
                                                <tr>
                                            <form action="MainController">
                                                <th class="table-success" style="text-align: center;" colspan="1" scope="col">CUSTOMER: ${list.userName}</th>
                                                <th class="table-success" style="text-align: center;" colspan="1" scope="col">DATE: ${list.date}</th>
                                                <th class="table-success" style="text-align: center;" colspan="2" scope="col">
                                                    <select name="status" style="width: 180px; margin-left: 20px;" id="inputState" class="form-control" value="${param.status}">
                                                        <c:forEach items="${sessionScope.LISTSTATUS}" var="listStatus">
                                                            <c:if test="${list.statusName eq listStatus.statusName}">
                                                                <option value="${listStatus.statusID}" selected="true">${listStatus.statusName}</option>
                                                            </c:if>
                                                            <c:if test="${list.statusName ne listStatus.statusName}">
                                                                <option value="${listStatus.statusID}">${listStatus.statusName}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </th>
                                                <th class="table-success" style="text-align: center;" colspan="1" scope="col">
                                                    <input type="hidden" name="orderId" value="${list.orderID}"> 
                                                    <button type="submit" name="btnAction" value="updateOrder">Update</button>
                                                </th>
                                            </form>
                                            </tr>
                                            </thead>
                                            <c:set var="list1" value="${list.history.keySet()}"></c:set>
                                            <c:forEach items="${list1}" var="key">
                                                <jsp:useBean id="pro" class="duytt.dtos.Product"></jsp:useBean>
                                                <jsp:setProperty name="pro" property="*"></jsp:setProperty>
                                                <c:set var="total" value="${0}"></c:set>
                                                <c:forEach items="${list.history.get(key)}" var="pro">
                                                    <c:set var="total" value="${total + (pro.price*pro.quanity)}"></c:set>
                                                </c:forEach>
                                                <thead>
                                                    <tr >
                                                        <th class="table-primary" style="text-align: center;" colspan="3" scope="col">Order: #${key}</th>
                                                        <th class="table-danger" style="text-align: center;" colspan="2" scope="col"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${total}" />đ</th>
                                                    </tr>
                                                </thead>
                                                <thead>
                                                    <tr style="text-align: center;">
                                                        <th scope="col">#</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Quanity</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${list.history.get(key)}" var="pro" varStatus="counter">
                                                        <tr>
                                                            <th scope="row">${counter.count}</th>
                                                            <td>
                                                                <div class="col-12">
                                                                    <img style="max-height: 120px; margin: 10px;padding-left: 40px;"
                                                                         src="${pro.image}"
                                                                         alt="">
                                                                    <p style="text-align: center;">${pro.proName}</p>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12" style="text-align: center;">
                                                                    <div style="display: flex; justify-content: center;">
                                                                        <div style="margin-top: 80px;">
                                                                            <input
                                                                                style="width: 50px;  display: inline-block;text-align: center;"
                                                                                class="form-control" type="text" id="number" value="${pro.quanity}" disabled>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div style="display: flex;justify-content: center;">
                                                                    <div class="col-12"
                                                                         style="text-align: center;width: 100%; margin-top: 70px;">
                                                                        <p style="font-size: large;padding-top: 15px;"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${pro.price}" />đ</p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div style="display: flex;justify-content: center;">
                                                                    <div class="col-12"
                                                                         style="text-align: center;width: 100%; margin-top: 70px;">
                                                                        <p style="font-size: large;padding-top: 15px;"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${pro.price*pro.quanity}" />đ</p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </c:forEach>
                                        </table>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-sm-4 right">
                                <div style="display: flex;margin-top: 20px;justify-content: center;">
                                    <img style="width: 120px; height: 79px;" src="./Logo.png" alt="">
                                    <h2 style="margin-top: 17px;">Search</h2>
                                </div>
                                <form action="MainController">
                                    <div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Date</label>
                                            <c:if test="${sessionScope.TXTDATE == null || empty sessionScope.TXTDATE}">
                                                <jsp:useBean id="now" class="java.util.Date" />
                                                <fmt:formatDate var="year" value="${now}" pattern="yyyy-MM-dd" />
                                                <input value="${year}" type="date" class="form-control" name="txtDate">
                                            </c:if>
                                            <c:if test="${sessionScope.TXTDATE != null && !empty sessionScope.TXTDATE}">
                                                <input value="${sessionScope.TXTDATE}" type="date" class="form-control" name="txtDate">
                                            </c:if>

                                            <small id="emailHelp" class="form-text text-muted"></small>
                                        </div>
                                    </div>
                                    <div style="display: flex;justify-content: center;">
                                        <input type="hidden" name="btnAction" value="order">
                                        <button style="width: 150px;margin-top: 0px !important;margin-bottom: 0px !important; margin-right: 20px"
                                                class="btn btn-lg btn-secondary btn-block btn-login text-uppercase font-weight-bold mb-2"
                                                type="submit">Search</button>
                                        <a style="width: 150px;margin-top: 0px !important;margin-bottom: 0px !important;margin-left: 20px" class="btn btn-lg btn-secondary btn-block btn-login text-uppercase font-weight-bold mb-2" href="MainController?btnAction=order">ALL</a>
                                    </div>
                                </form>
                            </div>
                        </div>
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

        </script>
    </body>

</html>