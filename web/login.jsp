<%-- 
    Document   : login
    Created on : Nov 3, 2020, 10:06:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="login.css">
        <title>Document</title>
    </head>
    <body>
        <div class="hero">
            <div id="form-box" class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button class="toggle-btn" onclick="login()">Log In</button>
                    <button class="toggle-btn" onclick="register()">Register</button>
                </div>
                <form action="login?account=user" id="login" class="input-group" method="post">
                    <input name="id" type="text" class="input-field" placeholder="Username" required>
                    <input name="pass" type="text" class="input-field" placeholder="Enter password" required="">
                    <input type="checkbox" required class="check-box"><span>Remember password</span>
                    <button type="submit" class="submit-btn">Login</button>
                </form>
                <form action="register" id="register" class="input-group" method="post">
                    <input name="id" type="text" class="input-field" placeholder="Username" required="">
                    <input name="email" type="email" class="input-field" placeholder="Email" required="">
                    <input name="pass"type="text" class="input-field" placeholder="Enter password" required="">
                    <input name="phone"type="number" class="input-field" placeholder="Phone number" required="">
                    <input name="address" name="id"type="text" class="input-field" placeholder="Address" required="">
                    <input name="dob"type="date" class="input-field" placeholder="Date of birth" required="">
                    <input type="checkbox" class="check-box"><span>I agree to the term & conditions</span>
                    <button type="submit" class="submit-btn">Register</button>
                </form>
            </div>

        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            var b = document.getElementById("form-box");
            function register() {
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
                b.style.height = "650px";
            }
            function login() {
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
                b.style.height = "480px";
            }
        </script>

    </body>
</html>