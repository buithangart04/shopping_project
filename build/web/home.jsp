<%-- 
    Document   : home
    Created on : Nov 2, 2020, 11:28:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Happy Store</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script><link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="container-fluid content">
            <div class="container ">
  
            
                <div class="navbar navbar-expand-lg">
                    <div class="logo">
                        <a href="home.jsp"> <img src="images/happylogo.jpg" width="125 px" class="img-thumbnail"></a>  
                    </div>
                    <nav>

                        <ul>
                            <li class="nav-item">
                                <a class="nav-link" href="home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="list?cate_id=null&id=null">Product</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#info">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#info">Contact</a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="fasle">
                                    Account
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <% if (session.getAttribute("login") != null) { %>
                                      <a class="dropdown-item" href="viewbill">View Bill</a>
                                      <% if (session.getAttribute("account").equals("user")) { %>        <a class="dropdown-item" href="ChangeAccount.jsp">Change Acount </a> <%}%>
                                       <% if (session.getAttribute("account").equals("admin")) { %>        <a class="dropdown-item" href="AddProduct.jsp">Add Product </a> <%}%>
                                    <a class="dropdown-item" href="logout">Logout</a>  

                                    <%} else { %>
                                    <a class="dropdown-item admin-login"  onclick="adminLogin()">Admin login</a>
                                    <a class="dropdown-item" href="login.jsp">User login</a>

                                    <%}%>

                                </div>
                            </li>


                        </ul>
                                    <a  href="${(sessionScope.account != 'user')?"#":"Cart.jsp"}" <c:if test="${sessionScope.account != 'user'}"> onclick="notLogin()" </c:if>><img id="cart"src="images/cart.png" alt="Cart" width="30px" height="30px"></a> 



                    </nav>

                </div>
                <div class="row1">
                    <div class="col1-2" id="descript">
                        <h1>Cheaper than your thought!</h1>
                        <p>Buy what you don’t have yet or what you really want, which can be mixed with what you already own. Buy only because something excites you, not just for the simple act of shopping</p>
                        <a href="list?cate_id=null&id=null" class="btn">Explore Now &#8594;</a>
                    </div>
                    <div class="col1-2">
                        <img src="images/image1.png" alt="screeen">
                    </div>
                    <!--           -------------------------------------------     loginuserform------------------>
                    <form action="login?account=admin" class="formAdminLogin" id="admin_form" method="post">
                        <div class="form-group">

                            <input name="id" type="text" required class="form-control"  placeholder="Username"/>
                        </div>
                        <div class="form-group">

                            <input name="pass" type="password" required class="form-control"  placeholder="Password"/>
                        </div>
                        <div class="form-check lable">
                            <input class="form-check-input" required type="checkbox" id="gridCheck">
                            <label class="form-check-label" for="gridCheck">
                                I agree with policies
                            </label>
                        </div>
                        <div class="button-form">
                            <button type="submit" class="btn btn-warning">Sign in</button>
                            <button  class="btn btn-warning" onclick="cancelLogin()">Cancel</button>
                        </div>

                    </form>
                    <!--   -------------------------------------------     login userform------------------>
                </div>
            </div>
        </div>
        <section class="danhmuc" >

            <div class="container">
                <h2>Category Product</h2>
                <jsp:useBean id="db" class="dal.DAO" />

                <% int i = 0; %>
                <c:forEach items="${db.loadAllCategory()}" var="c">
                    <%if (i % 4 == 0) { %>
                    <div class="row">
                        <%}%>
                        <div class="col-lg-3">
                            <div class=" product-cate">
                                <a href="list?cate_id=${c.id}&id=null">
                                    <img class="image-Product" src="${c.source}" alt="">
                                </a>
                                <figcaption>${c.name}</figcaption>
                            </div>
                        </div>
                        <%if (i % 4 == 3) { %>
                    </div>
                    <%}
                        i++;
                    %>
                </c:forEach>


            </div>

        </section>
                <section id="info" class="Info">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 cskh">
                        <h6>Customer care</h6>
                        <ul>
                            <li>Help Center</li>
                            <li>Happy Blog</li>
                            <li>Shopping guide</li>
                            <li>Sales guide</li>
                            <li>Payment</li>
                            <li>Shipping</li>
                            <li>Customer care </li>
                            <li>Warranty Policy</li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <div>
                            <h6>Payment</h6>
                            <div class="social-icons">
                                <i class="fab fa-cc-visa"></i>
                                <i class="fab fa-cc-mastercard"></i>
                                <i class="fab fa-cc-jcb"></i>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h6>Follow us </h6>
                        <div class="social-media">
                            <a href="#" class="socialMedia-icons">
                                <i class="fab fa-facebook"></i>FaceBook
                            </a>
                        </div>
                        <div> <a href="#" class="socialMedia-icons">
                                <i class="fab fa-twitter-square"></i>Twitter
                            </a></div>
                        <div> <a href="#" class="socialMedia-icons">
                                <i class="fab fa-google"></i>Google
                            </a></div>
                        <div> <a href="#" class="socialMedia-icons">
                                <i class="fab fa-linkedin-in"></i>Linked in
                            </a></div>

                    </div>

                    <div class="col-lg-3">
                        <h6>Download app</h6>
                        <div class="image-footer"><img src="images/qr.png" alt=""></div>
                        <div>
                            <div> <a href="#" class="socialMedia-icons">
                                    <i class="fab fa-apple"></i> App store
                                </a></div>
                            <div> <a href="#" class="socialMedia-icons">
                                    <i class="fab fa-google-play"></i>Google Play
                                </a></div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <footer>
            <p>Copyright &copy; 2020 by BUI DUC THANG</p>
        </footer>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="homeScript.js"></script>
    </body>
</html>