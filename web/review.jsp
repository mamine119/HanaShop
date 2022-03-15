<%-- 
    Document   : review
    Created on : Mar 8, 2022, 2:34:50 PM
    Author     : HTV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
        <title>Review</title>
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
            table { border: 0; }
            table td { padding: 5px; }
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
                        <div align="center">
                            <h1>Please Review Before Paying</h1>
                            <form action="MainController" method="post">
                                <table>
                                    <tr>
                                        <td colspan="2"><b>Transaction Details:</b></td>
                                        <td>
                                            <input type="hidden" name="paymentId" value="${param.paymentId}" />
                                            <input type="hidden" name="PayerID" value="${param.PayerID}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Description:</td>
                                        <td>${transaction.description}</td>
                                    </tr>
                                    <tr>
                                        <td>Subtotal:</td>
                                        <td>${transaction.amount.details.subtotal} USD</td>
                                    </tr>
                                    <tr>
                                        <td>Shipping:</td>
                                        <td>${transaction.amount.details.shipping} USD</td>
                                    </tr>
                                    <tr>
                                        <td>Tax:</td>
                                        <td>${transaction.amount.details.tax} USD</td>
                                    </tr>
                                    <tr>
                                        <td>Total:</td>
                                        <td>${transaction.amount.total} USD</td>
                                    </tr>
                                    <tr><td><br/></td></tr>
                                    <tr>
                                        <td colspan="2"><b>Payer Information:</b></td>
                                    </tr>
                                    <tr>
                                        <td>First Name:</td>
                                        <td>${payer.firstName}</td>
                                    </tr>
                                    <tr>
                                        <td>Last Name:</td>
                                        <td>${payer.lastName}</td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td>${payer.email}</td>
                                    </tr>
                                    <tr><td><br/></td></tr>
                                    <tr>
                                        <td colspan="2"><b>Shipping Address:</b></td>
                                    </tr>
                                    <tr>
                                        <td>Recipient Name:</td>
                                        <td>${shippingAddress.recipientName}</td>
                                    </tr>
                                    <tr>
                                        <td>Line 1:</td>
                                        <td>${shippingAddress.line1}</td>
                                    </tr>
                                    <tr>
                                        <td>City:</td>
                                        <td>${shippingAddress.city}</td>
                                    </tr>
                                    <tr>
                                        <td>State:</td>
                                        <td>${shippingAddress.state}</td>
                                    </tr>
                                    <tr>
                                        <td>Country Code:</td>
                                        <td>${shippingAddress.countryCode}</td>
                                    </tr>
                                    <tr>
                                        <td>Postal Code:</td>
                                        <td>${shippingAddress.postalCode}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" name="btnAction" value="PayNow" />
                                        </td>
                                    </tr>    
                                </table>
                            </form>
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
