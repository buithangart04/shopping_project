<%-- 
    Document   : ProductDetail
    Created on : Nov 7, 2020, 6:17:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>eCommerce Product Detail</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script>
            function myFunction1(source, isLogin) {
                if (isLogin == true) {
                    window.location = source + "?id=" + document.getElementById("abc").value + "&quantity=" + document.getElementById("soluong").value + "&option=null";
                } else {
                    var r = confirm("you not yet Login .Login?");
                    if (r == true) {
                        window.location = "login.jsp";
                    } else {
                        window.location = "#";
                    }
                }
            }
                function sub(x) {
                     document.getElementById("plus").disabled = false;
                    if (document.getElementById("soluong").value == 1) {
                        
                        document.getElementById("sub").disabled = true;
                    } else {
                        
                        var z=1;
                        
                        document.getElementById("soluong").value = parseInt(document.getElementById("soluong").value) - 1;
                    }

                }
                function plus(x) {
                    document.getElementById("sub").disabled = false;
                    if (document.getElementById("soluong").value == x) {
                        document.getElementById("plus").disabled = true;
                    } else {
                       
                          var z=1;
                        document.getElementById("soluong").value = parseInt(document.getElementById("soluong").value) + 1;
                    }

                }

                function myFunction(x) {

                    document.getElementById("pic-1").src = document.getElementById(x + "").src;
                }
                function myFunction2(isLogin) {
                    if (isLogin == true) {
                        window.location = "Bill.jsp?option=null&id=" + document.getElementById("abc").value + "&quantity=" + document.getElementById("soluong").value;
                    } else {
                        var r = confirm("you not yet Login .Login?");
                        if (r == true) {
                            window.location = "login.jsp";
                        } else {
                            window.location = "#";
                        }
                    }
                }
        </script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="ProductDetail.css">

    </head>

    <body style="background-color:  #76b1eb;">

        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <jsp:useBean id="db" class="dal.DAO"/>
                        <c:set var="id" value="${param.id}" />
                        <c:set var="cate_id" value="${param.cate_id}" />
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" >
                                    <img id="pic-1" src="${db.getImageProduct(id,1).get(0).getSource()}"/>
                                </div>

                            </div>
                            <ul class="preview-thumbnail nav nav-tabs">
                                <% int i = 0;%>
                                <c:forEach items="${db.getImageProduct(id,0)}" var="s">
                                    <li class="active"><a><img id="<%=i%>" onclick="myFunction(<%=i%>)" src="${s.source}" /></a></li> 
                                            <% i++;%>
                                        </c:forEach>


                            </ul>

                        </div>
                        <div class="details col-md-6">
                            <c:forEach items="${db.searchProductById(id)}" var="p">
                                <h3 class="product-title">${p.name}</h3>

                                <p class="product-description">Description:${p.description} </p>
                                <h4 class="price">Old Price: <span>$${p.primaryPrice}</span></h4>
                                <h4 class="price">Sale: <span>${p.sale}%</span></h4>
                                <h4 class="price">Price: <span>$${p.price}</span></h4>

                                <label for="soluong"> Number product</label>
                                <%int h = 0;%>
                                <div>
                                    <button  class="btn-quantity" onclick="sub(${p.quantity_remain})" id="sub">-</button>
                                    <input  type="text" id="soluong" value="1"/>
                                    <button  class="btn-quantity" onclick="plus(${p.quantity_remain})" id="plus">+</button>
                                </div>

                                <% h++;%>
                                <h4 class="price">Remain: <span>${p.quantity_remain}</span> Product </h4>
                                <h4 class="price">Sell : <span>${p.quantity_sell}</span> Product </h4>

                                <div class="action">
                                    <button onclick="myFunction1('cart',${(sessionScope.account != 'user')?false:true})" value="${id}" id="abc"class="add-to-cart btn btn-default" >Add to Cart</button>
                                    <button  onclick="myFunction2(${(sessionScope.account != 'user')?false:true})"  class="add-to-cart btn btn-default" >Buy Now</button> 
                                </div>  
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

