<%-- 
    Document   : login.jsp
    Created on : Jan 9, 2021, 3:32:53 PM
    Author     : thant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="google-signin-client_id" content="445803574555-a2442rcbct5lc2e665thhcp8hqdps2ls.apps.googleusercontent.com">
        <title>Login - HanaShop</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
        <style>
            html {
                font-family: "Cairo", sans-serif !important;
                -webkit-font-smoothing: antialiased;
            }

            /*			:root {
                                            --input-padding-x: 1.5rem;
                                            --input-padding-y: 0.75rem;
                                    }*/


            .image {
                min-height: 100vh;
            }

            .bg-image {
                background-image: url('http://blog.karachicorner.com/wp-content/uploads/2018/12/colorful_fresh_logo_015.jpg');
                background-size: cover;
                background-position: center;

            }

            .login-heading {
                font-weight: 300;
            }

            .btn-login {
                font-size: 0.9rem;
                letter-spacing: 0.05rem;
                padding: 0.75rem 1rem;
                border-radius: 2rem;
            }

            .form-label-group {
                position: relative;
                margin-bottom: 1rem;
            }

            .form-label-group>input,
            .form-label-group>label {
                /*				padding: var(--input-padding-y) var(--input-padding-x);*/
                border-radius: 2rem;
                height: 47px;
                padding-top: 12px;
                padding-bottom: 12px;

            }

            .form-label-group>label {
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                width: 100%;
                margin-bottom: 0;
                /* Override default `<label>` margin */
                line-height: 1.5;
                color: #495057;
                cursor: text;
                /* Match the input under the label */
                border: 1px solid transparent;
                border-radius: .25rem;
                transition: all .1s ease-in-out;
            }





            .or-container {
                align-items: center;
                color: #ccc;
                display: flex;
                margin: 25px 0
            }

            .line-separator {
                background-color: #ccc;
                flex-grow: 5;
                height: 1px
            }

            .or-label {
                flex-grow: 1;
                margin: 0 15px;
                text-align: center
            }

            #back,
            .back-text {
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                font-size: 30px;
                color: #7dc129;
                text-decoration: none;
            }

            #back,
            .back-text:hover {
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                text-decoration: none;
                color: #7dc129;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid shadow-lg" style="max-width: 60%;margin-top: 100px;border-radius: 10px;">
            <div class="row no-gutter" style="height: 600px;">
                <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
                <div class="col-md-8 col-lg-6">
                    <div class="login d-flex align-items-center py-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-9 col-lg-8 mx-auto" style="padding-top: 100px;">
                                    <h3 class="login-heading mb-4">Welcome back!</h3>
                                    <p style="color: red; text-align: center; font-size: 15px">${sessionScope.Error_Login}</p>
                                    <form action="MainController" method="POST">
                                        <div class="form-label-group">
                                            <input type="text" id="inputEmail" class="form-control" placeholder="Email address" name="userAccount" required autofocus>
                                            <p style="color: red; text-align: center; font-size: 15px">${sessionScope.userID_ERROR}</p>
                                        </div>
                                        <div class="form-label-group">
                                            <input type="password" id="inputPassword" class="form-control"placeholder="Password" name="password" required>
                                            <p style="color: red; text-align: center; font-size: 15px">${sessionScope.password_ERROR}</p>
                                        </div>
                                        <input
                                            class="btn btn-lg btn-success btn-block btn-login text-uppercase font-weight-bold mb-2"
                                            type="submit" name="btnAction" value="Sign In">
                                        <div class="or-container" >
                                            <div class="line-separator"></div>
                                            <div class="or-label"><span style="color: #7dc129;">or</span></div>
                                            <div class="line-separator"></div>
                                        </div>
                                        <div style="display: flex; justify-content: center;">
                                            <div class="g-signin2"  data-onsuccess="onSignIn" data-theme="dark"></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



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
            function onSignIn(googleUser) {
                // Useful data for your client-side scripts:
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    console.log('User signed out.');
                });
                var profile = googleUser.getBasicProfile();
                console.log("ID: " + profile.getId()); // Don't send this directly to your server!
                console.log('Full Name: ' + profile.getName());
                console.log('Given Name: ' + profile.getGivenName());
                console.log('Family Name: ' + profile.getFamilyName());
                console.log("Image URL: " + profile.getImageUrl());
                console.log("Email: " + profile.getEmail());
                window.location.href = 'MainController?btnAction=GmailLogin&UserID=' + profile.getId() + '&email=' + profile.getEmail() + '&fullName=' + profile.getName();

                // The ID token you need to pass to your backend:
                var id_token = googleUser.getAuthResponse().id_token;
                console.log("ID Token: " + id_token);
            }

        </script>
    </body>
</html>