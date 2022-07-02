<%-- 
    Document   : AllProduct
    Created on : Nov 6, 2020, 8:58:17 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">



        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

        <link rel="stylesheet" href="AllProduct.css">
        <style>

            .logo{
                position: relative;

                background-color: #6baef1;
            }
            .search{

                display: inline-block;
                background-color: #6baef1;
                top:20px;
                left: 70px;
            }
        </style>

    </head>
    <body>

        <div class="header">
            <div class="container">
                <div class="navbar navbar-expand-lg">
                    <div class="logo col-md-5">
                        <a href="home.jsp"> <img src="images/happylogo.jpg" width="125 px" class="img-thumbnail"></a> 
                        <nav class="navbar search">
                            <form class="form-inline " action="search" method="get">
                                <input class="form-control mr-sm-2" name="search"type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-warning my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </nav>           
                    </div>

                    <nav class=" col-md-7">

                        <ul>
                            <li class="nav-item">
                                <a class="nav-link" href="home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="list?cate_id=null&id=null">Product</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
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
                </div>


                <div class="container">

                <jsp:useBean id="db" class="dal.DAO" />

                <!--               ---------------------- top items-->
                <c:if test="${sessionScope.account != 'admin'}">
                    <h3 class="h3"> Top selling Items  </h3>
                    <div class="row">
                        <c:forEach items="${db.loadTopItem()}" var="p1">
                            <div class="col-md-3 col-sm-6">
                                <div class="product-grid4">
                                    <div class="product-image4">
                                        <a <c:if test="${sessionScope.account != 'admin'}">
                                                href="ProductDetail.jsp?id=${p1.id}&cate_id=${p1.cate_id}" </c:if>
                                            <c:if test="${sessionScope.account == 'admin'}">
                                                href="EditProduct.jsp?id=${p1.id}"
                                            </c:if>
                                            >  
                                            <img class="pic-1" src="${db.getImageProduct(p1.id,1).get(0). getSource()}">
                                            <img class="pic-2" src="${db.getImageProduct(p1.id,2).get(0). getSource()}">
                                        </a>
                                        <ul class="social">
                                            <li><a href="#" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                        <span class="product-new-label">New</span>
                                        <span class="product-discount-label">-${p1.sale}%</span>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a href="#">${p1.name}</a></h3>
                                        <div class="price">
                                            $${p1.price}
                                            <span>$${p1.primaryPrice}</span>
                                        </div>

                                        <c:if test="${sessionScope.account != 'admin'}">
                                            <a class="add-to-cart" <c:if test="${sessionScope.account == 'user'}">href="cart?id=${p1.id}&quantity=1&option=null"</c:if>
                                               <c:if test="${sessionScope.account != 'user'}">href="#"</c:if>
                                               <c:if test="${sessionScope.account != 'user'}"> onclick="notLogin()" </c:if>>ADD TO CART</a>
                                        </c:if>
                                        <c:if test="${sessionScope.account == 'admin'}">
                                            <a class="add-to-cart" href="EditProduct.jsp?id=${p1.id}" >Edit Product</a>
                                        </c:if>   

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <!--                   --------------------------- top item-->
                <h3 class="h3"> Product  </h3>
                <% int i = 0;
                %>
                <c:forEach items="${requestScope.list}" var="p">
                    <%if (i % 4 == 0) { %>
                    <div class="row">
                        <%}%>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid4">
                                <div class="product-image4">
                                    <a <c:if test="${sessionScope.account != 'admin'}">
                                            href="ProductDetail.jsp?id=${p.id}&cate_id=${p.cate_id}" </c:if>
                                        <c:if test="${sessionScope.account == 'admin'}">
                                            href="EditProduct.jsp?id=${p.id}"
                                        </c:if>
                                        >  
                                        <img class="pic-1" src="${db.getImageProduct(p.id,1).get(0). getSource()}">
                                        <img class="pic-2" src="${db.getImageProduct(p.id,2).get(0). getSource()}">
                                    </a>
                                    <ul class="social">
                                        <li><a href="#" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                    <span class="product-new-label">New</span>
                                    <span class="product-discount-label">-${p.sale}%</span>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">${p.name}</a></h3>
                                    <div class="price">
                                        $${p.price}
                                        <span>$${p.primaryPrice}</span>
                                    </div>

                                    <c:if test="${sessionScope.account != 'admin'}">
                                        <a class="add-to-cart" <c:if test="${sessionScope.account == 'user'}">href="cart?id=${p.id}&quantity=1&option=null"</c:if>
                                           <c:if test="${sessionScope.account != 'user'}">href="#"</c:if>
                                           <c:if test="${sessionScope.account != 'user'}"> onclick="notLogin()" </c:if>>ADD TO CART</a>
                                    </c:if>
                                    <c:if test="${sessionScope.account == 'admin'}">
                                        <a class="add-to-cart" href="EditProduct.jsp?id=${p.id}" >Edit Product</a>
                                    </c:if>   

                                </div>
                            </div>
                        </div>
                        <%if (i % 4 == 3) { %>
                    </div>
                    <%}
                        i++;
                    %>
                </c:forEach>

            </div>
            <div class=" container paging">
                <ul>
                    <%
                        int a, b;
                        int size = (Integer) request.getAttribute("size");
                        int numPage = size / 4;
                        if ((numPage * 4) < size) {
                            numPage = numPage + 1;
                        }
                        for (int j = 1; j <= numPage; j++) {
                            a = (j - 1) * 4;
                            b = (j * 4);
                            if (b > size) {
                                b = size;
                            }

                    %>
                    <li class="pagination row"> <a href="list?id=${param.id}&cate_id=${param.cate_id}&start=<%=a%>&end=<%=b%>"><%=j%></a></li> 
                        <%
                            }
                        %>

                </ul>       
            </div>           

        </div>


        <section class="Info">
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
                                    <i class="fab fa-google-play"></i>GooglePlay
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